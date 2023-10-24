package main

import (
	"bufio"
	"database/sql"
	"encoding/csv"
	"encoding/json"
	"fmt"
	"io"
	"log"
	"os"
	"strings"
	"sync"

	_ "github.com/denisenkom/go-mssqldb"
)

type Renaming struct {
	Name     string `json:"name"`
	FileFrom string `json:"file_from"`
}

var db *sql.DB
var logFile *os.File

func getRenames(file io.Reader) (renaming map[string]map[string]Renaming, err error) {
	data, err := io.ReadAll(bufio.NewReader(file))
	if err != nil {
		return
	}

	err = json.Unmarshal(data, &renaming)
	if err != nil {
		return
	}

	return
}

func dumpToDB(tableName string, columns []string, data map[string]string) (err error) {
	var values = []string{}
	for _, column := range columns {
		values = append(values, data[column])
	}

	tx, err := db.Begin()
	if err != nil {
		log.Fatal(err)
	}
	defer tx.Rollback()

	// if tableName in ["Application.Application", "PreviousApplication.PreviousApplication"]:
	// SET IDENTITY_INSERT tableName ON
	identityTables := []string{"Application.Application",
		"Previous_Application.Previous_Application", "Previous_Application.Reject",
		"Credit_Bureau.Credit_Bureau_Application"}
	contains := strings.Contains(strings.Join(identityTables, ","), tableName)

	if contains {
		_, err = tx.Exec(fmt.Sprintf("SET IDENTITY_INSERT %s ON", tableName))
		if err != nil {
			log.Fatal(err)
		}
	}

	stmt, err := tx.Prepare(fmt.Sprintf("INSERT INTO %s (%s) VALUES (%s)",
		tableName, strings.Join(columns, ","), strings.Repeat("?,", len(columns)-1)+"?"))
	if err != nil {
		log.Fatal(err)
	}
	defer stmt.Close()

	var args []interface{}
	for _, v := range values {
		args = append(args, v)
	}

	stmt.Exec(args...)
	// Ignore error because it's probably a foreign key constraint violation

	if contains {
		_, err = tx.Exec(fmt.Sprintf("SET IDENTITY_INSERT %s OFF", tableName))
		if err != nil {
			log.Fatal(err)
		}
	}

	err = tx.Commit()
	if err != nil {
		log.Fatal(err)
	}

	return
}

func process(tableName string, labels map[string]Renaming, wg *sync.WaitGroup) {
	defer wg.Done()
	fmt.Printf("Processing %s...\n", tableName)

	// Create necessary data structures
	var toRead = map[string][]string{}
	var references = map[string]string{}
	var columns = []string{}

	// Fill data structures
	for oldLabel, label := range labels {
		toRead[label.FileFrom] = append(toRead[label.FileFrom], oldLabel)
		references[oldLabel] = label.Name
		columns = append(columns, label.Name)
	}

	// Create a channel for tasks to be processed by the worker pool
	tasks := make(chan map[string]string, 300) // Adjust the buffer size as needed

	var workersWg sync.WaitGroup
	for i := 0; i < WORKERS; i++ {
		workersWg.Add(1)
		go worker(tableName, columns, tasks, &workersWg)
	}

	for fileFrom := range toRead {
		file, err := os.Open(DATA_DIR + fileFrom)
		if err != nil {
			log.Fatal(err)
		}
		defer file.Close()

		reader := csv.NewReader(bufio.NewReader(file))
		labels, err := reader.Read()
		if err != nil {
			return
		}

		for {
			var data = map[string]string{}

			record, err := reader.Read()
			if err == io.EOF {
				break
			}
			if err != nil {
				log.Fatal(err)
			}

			for i, label := range labels {
				if _, ok := references[label]; ok {
					data[references[label]] = record[i]
				}
			}

			// Send data to be processed by a worker
			tasks <- data
		}
	}

	// Close the tasks channel to signal workers to exit when all tasks are processed
	close(tasks)

	// Wait for all worker goroutines to finish
	workersWg.Wait()

	fmt.Printf("%s OK!\n", tableName)
}

func worker(tableName string, columns []string, tasks <-chan map[string]string, workersWg *sync.WaitGroup) {
	defer workersWg.Done()

	for data := range tasks {
		// Insert data into the database
		err := dumpToDB(tableName, columns, data)
		if err != nil {
			dataStr := []string{}
			for _, v := range data {
				dataStr = append(dataStr, v)
			}
			log.Fatal("Error inserting data into table: " + tableName + "\n" +
				"Columns: " + strings.Join(columns, ",") + "\n" +
				"Data: " + strings.Join(dataStr, ",") + "\n" +
				"Error: " + err.Error())
		}
	}
}

var (
	DATA_DIR      = "../dataset/data/"
	RENAMING_FILE = "./renaming.json"

	DB_SERVER   = "localhost"
	DB_PORT     = 1433
	DB_USER     = "sa"
	DB_PASS     = "89RkHe-ipPCQTjx7x.*9"
	DB_DATABASE = "HomeCredit"

	WORKERS = 200
)

func main() {
	var err error
	db, err = sql.Open("mssql", fmt.Sprintf("server=%s;user id=%s;password=%s;port=%d;database=%s;",
		DB_SERVER, DB_USER, DB_PASS, DB_PORT, DB_DATABASE))
	if err != nil {
		return
	}
	defer db.Close()

	file, err := os.Open(RENAMING_FILE)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	renaming, err := getRenames(file)
	if err != nil {
		log.Fatal(err)
	}

	var wg sync.WaitGroup

	wg.Add(1)
	process("Application.Application", renaming["Application.Application"], &wg)
	delete(renaming, "Application.Application")

	wg.Add(1)
	process("Client.Client", renaming["Client.Client"], &wg)
	delete(renaming, "Client.Client")

	WORKERS = 100

	wg.Add(1)
	go process("Previous_Application.Previous_Application", renaming["Previous_Application.Previous_Application"], &wg)
	delete(renaming, "Previous_Application.Previous_Application")

	wg.Add(1)
	go process("Credit_Bureau.Credit_Bureau_Application", renaming["Credit_Bureau.Credit_Bureau_Application"], &wg)
	delete(renaming, "Credit_Bureau.Credit_Bureau_Application")

	wg.Wait()

	WORKERS = 200

	wg.Add(1)
	process("Credit_Bureau.Credit_Bureau_Balance", renaming["Credit_Bureau.Credit_Bureau_Balance"], &wg)
	delete(renaming, "Credit_Bureau.Credit_Bureau_Balance")

	wg.Wait()

	WORKERS = 100

	wg.Add(1)
	go process("Application.Balance", renaming["Application.Balance"], &wg)
	delete(renaming, "Application.Balance")

	wg.Add(1)
	go process("Previous_Application.Installment_Payment", renaming["Previous_Application.Installment_Payment"], &wg)
	delete(renaming, "Previous_Application.Installment_Payment")

	wg.Wait()

	WORKERS = 200

	wg.Add(1)
	process("Previous_Application.Credit_Card_Balance", renaming["Previous_Application.Credit_Card_Balance"], &wg)
	delete(renaming, "Previous_Application.Credit_Card_Balance")

	wg.Add(1)
	process("Previous_Application.Previous_Application_Date", renaming["Previous_Application.Previous_Application_Date"], &wg)
	delete(renaming, "Previous_Application.Previous_Application_Date")

	WORKERS = 20

	for tableName, labels := range renaming {
		wg.Add(1)
		go process(tableName, labels, &wg)
	}

	wg.Wait()
}
