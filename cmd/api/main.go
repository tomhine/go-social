package main

import (
	"log"

	"github.com/joho/godotenv"
	"github.com/tomhine/social/internal/env"
)

func main() {
	err := godotenv.Load()

	if err != nil {
		log.Fatal("Failed to load env file.")
	}

	cfg := config{
		addr: env.GetString("ADDR", ":8080"),
	}

	app := &application{
		config: cfg,
	}

	mux := app.mount()

	log.Fatal(app.run(mux))
}