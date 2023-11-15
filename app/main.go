package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"io"
	"net/http"

	_ "github.com/denisenkom/go-mssqldb"
	"github.com/gorilla/mux"
)

var (
	db *sql.DB

	dir = http.Dir("./frontend/dist")

	DB_SERVER   = "localhost"
	DB_PORT     = 1433
	DB_USER     = "sa"
	DB_PASS     = "89RkHe-ipPCQTjx7x.*9"
	DB_DATABASE = "HomeCredit"
)

type FirstComponentRow struct {
	Weekday string `json:"weekday"`
	Consult int    `json:"consult"`
}

type SecondComponentRow struct {
	JobType          string `json:"job_type"`
	ApplicationCount int    `json:"application_count"`
}

type ThirdComponentRow struct {
	Gender           string `json:"gender"`
	ApplicationCount int    `json:"application_count"`
}

type FourthComponentRow struct {
	GoodsType        string `json:"goods_type"`
	ApplicationCount int    `json:"application_count"`
}

type FifthComponentRow struct {
	FamilyStatus     string `json:"family_status"`
	ApplicationCount int    `json:"application_count"`
}

func serveFile(w http.ResponseWriter, r *http.Request, dir *http.Dir, name string) {
	file, err := dir.Open(name)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	data, err := io.ReadAll(file)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	w.Write(data)
}

func serveFirstComponentData(w http.ResponseWriter, r *http.Request) {
	tx, err := db.BeginTx(r.Context(), nil)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer tx.Commit()

	stmt, err := tx.PrepareContext(r.Context(), `SELECT AD.weekday, SUM(CASE WHEN CB.status = @p1 THEN 1 ELSE 0 END) AS consult
        FROM Application.Application A JOIN Application.Application_Date AD ON A.id
        = AD.application_id LEFT JOIN Credit_Bureau.Credit_Bureau_Application CB ON
        A.id = CB.application_id GROUP BY AD.weekday`)
	if err != nil {
		tx.Rollback()
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer stmt.Close()

	// @p1 can be 'Active' or 'Closed'
	value := r.URL.Query().Get("status")
	if value == "" {
		tx.Rollback()
		http.Error(w, "status is required", http.StatusBadRequest)
		return
	}

	rows, err := tx.StmtContext(r.Context(), stmt).QueryContext(r.Context(), value)
	if err != nil {
		tx.Rollback()
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var data []FirstComponentRow

	for rows.Next() {
		var row FirstComponentRow
		if err := rows.Scan(&row.Weekday, &row.Consult); err != nil {
			tx.Rollback()
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		data = append(data, row)
	}

	json.NewEncoder(w).Encode(data)
}

func serveSecondComponentData(w http.ResponseWriter, r *http.Request) {
	tx, err := db.BeginTx(r.Context(), nil)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer tx.Commit()

	stmt, err := tx.PrepareContext(r.Context(), `SELECT J.type AS JobType,
		COUNT(A.id) AS ApplicationCount FROM Application.Application A JOIN
		Client.Job J ON A.id = J.client_id LEFT JOIN
		Credit_Bureau.Credit_Bureau_Application CB ON A.id = CB.application_id
		WHERE CB.status IS NOT NULL AND CB.status = @p1 GROUP BY J.type`)
	if err != nil {
		tx.Rollback()
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer stmt.Close()

	// @p1 can be 'Active' or 'Closed'
	value := r.URL.Query().Get("status")
	if value == "" {
		tx.Rollback()
		http.Error(w, "status is required", http.StatusBadRequest)
		return
	}

	rows, err := tx.StmtContext(r.Context(), stmt).QueryContext(r.Context(), value)
	if err != nil {
		tx.Rollback()
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var data []SecondComponentRow

	for rows.Next() {
		var row SecondComponentRow
		if err := rows.Scan(&row.JobType, &row.ApplicationCount); err != nil {
			tx.Rollback()
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		data = append(data, row)
	}

	json.NewEncoder(w).Encode(data)
}

func serveThirdComponentData(w http.ResponseWriter, r *http.Request) {
	tx, err := db.BeginTx(r.Context(), nil)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer tx.Commit()

	stmt, err := tx.PrepareContext(r.Context(), `SELECT C.gender, COUNT(A.id) AS
		ApplicationCount FROM Application.Application A JOIN Client.Client C ON A.id
		= C.application_id LEFT JOIN Credit_Bureau.Credit_Bureau_Application CB ON
		A.id = CB.application_id LEFT JOIN Previous_Application.Previous_Application
		PA ON A.id = PA.application_id GROUP BY C.gender`)
	if err != nil {
		tx.Rollback()
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer stmt.Close()

	rows, err := tx.StmtContext(r.Context(), stmt).QueryContext(r.Context(), nil)
	if err != nil {
		tx.Rollback()
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var data []ThirdComponentRow

	for rows.Next() {
		var row ThirdComponentRow
		if err := rows.Scan(&row.Gender, &row.ApplicationCount); err != nil {
			tx.Rollback()
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		data = append(data, row)
	}

	json.NewEncoder(w).Encode(data)
}

func serveFourthComponentData(w http.ResponseWriter, r *http.Request) {
	tx, err := db.BeginTx(r.Context(), nil)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer tx.Commit()

	stmt, err := tx.PrepareContext(r.Context(), `SELECT AD.weekday, COUNT(A.id)
		AS ApplicationCount FROM Application.Application A JOIN
		Application.Application_Date AD ON A.id = AD.application_id LEFT JOIN
		Previous_Application.Previous_Application PA ON A.id = PA.application_id
		LEFT JOIN Credit_Bureau.Credit_Bureau_Application CBA ON CBA.id =
		PA.application_id WHERE A.type = @p1 GROUP BY AD.weekday`)
	if err != nil {
		tx.Rollback()
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer stmt.Close()

	value := r.URL.Query().Get("type")
	if value == "" {
		tx.Rollback()
		http.Error(w, "type is required", http.StatusBadRequest)
		return
	}

	rows, err := tx.StmtContext(r.Context(), stmt).QueryContext(r.Context(), value)
	if err != nil {
		tx.Rollback()
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var data []FourthComponentRow

	for rows.Next() {
		var row FourthComponentRow
		if err := rows.Scan(&row.GoodsType, &row.ApplicationCount); err != nil {
			tx.Rollback()
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		data = append(data, row)
	}

	json.NewEncoder(w).Encode(data)
}

func serveFifthComponentData(w http.ResponseWriter, r *http.Request) {
	tx, err := db.BeginTx(r.Context(), nil)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer tx.Commit()

	stmt, err := tx.PrepareContext(r.Context(), `SELECT F.status AS
		FamilyStatus, COUNT(A.id) AS ApplicationCount FROM
		Application.Application A JOIN Client.Family F ON A.id = F.client_id
		JOIN Previous_Application.Previous_Application P ON A.id =
		P.application_id WHERE P.type = @p1 GROUP BY F.status`)
	if err != nil {
		tx.Rollback()
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer stmt.Close()

	value := r.URL.Query().Get("type")
	if value == "" {
		tx.Rollback()
		http.Error(w, "type is required", http.StatusBadRequest)
		return
	}

	rows, err := tx.StmtContext(r.Context(), stmt).QueryContext(r.Context(), value)
	if err != nil {
		tx.Rollback()
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var data []FifthComponentRow

	for rows.Next() {
		var row FifthComponentRow
		if err := rows.Scan(&row.FamilyStatus, &row.ApplicationCount); err != nil {
			tx.Rollback()
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		data = append(data, row)
	}

	json.NewEncoder(w).Encode(data)
}

func main() {
	var err error
	db, err = sql.Open("sqlserver", fmt.Sprintf("server=%s;user id=%s;password=%s;port=%d;database=%s;",
		DB_SERVER, DB_USER, DB_PASS, DB_PORT, DB_DATABASE))
	if err != nil {
		panic(err)
	}
	defer db.Close()

	r := mux.NewRouter()

	// API endpoint
	r.HandleFunc("/api/first-component", serveFirstComponentData)
	r.HandleFunc("/api/second-component", serveSecondComponentData)
	r.HandleFunc("/api/third-component", serveThirdComponentData)
	r.HandleFunc("/api/fourth-component", serveFourthComponentData)
	r.HandleFunc("/api/fifth-component", serveFifthComponentData)

	r.HandleFunc("/favicon.ico", func(w http.ResponseWriter, r *http.Request) {
		http.ServeFile(w, r, "./frontend/dist/favicon.ico")
	})

	r.PathPrefix("/static/").Handler(http.StripPrefix("/static/", http.FileServer(http.Dir("./frontend/dist/static"))))

	r.PathPrefix("/").HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		serveFile(w, r, &dir, "index.html")
	})

	http.ListenAndServe(":8080", r)
}
