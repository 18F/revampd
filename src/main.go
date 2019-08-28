package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "<h1>Hello AMPD from Go,</h1>\n<p>You've requested: %s</p>\n", r.URL.Path)
	})

	fmt.Println("Starting hello-ampd.")
	http.ListenAndServe(":"+os.Getenv("PORT"), nil)
}
