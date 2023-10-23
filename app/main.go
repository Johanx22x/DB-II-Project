package main

import (
    "io"
    "net/http"
    "github.com/gorilla/mux"
)

var (
    dir = http.Dir("./frontend/dist")
)

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

func main() {
    r := mux.NewRouter()

    r.HandleFunc("/favicon.ico", func(w http.ResponseWriter, r *http.Request) {
        http.ServeFile(w, r, "./frontend/dist/favicon.ico")
    })

    r.PathPrefix("/static/").Handler(http.StripPrefix("/static/", http.FileServer(http.Dir("./frontend/dist/static"))))

    r.PathPrefix("/").HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        serveFile(w, r, &dir, "index.html")
    })

    http.Handle("/", r)
    http.ListenAndServe(":8080", nil)
}
