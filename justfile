# https://just.systems

# Setup
set minimum-version := '1.58.0'
set dotenv-load := true

# Env
db_addr := env('DB_ADDR')

# Variables
migrations_path := './cmd/migrate/migrations'

# Aliases
alias du := docker-up
alias ds := docker-stop
alias migcreate := migrate-create
alias migup := migrate-up
alias migdown := migrate-down

# Development commands
[continue]
dev: docker-up && docker-stop
    -@air

docker-up:
    @docker compose up -d

docker-stop:
    @docker compose stop

# Migration commands
migrate-create name:
	@migrate create -seq -ext sql -dir {{migrations_path}} {{name}}

migrate-up:
	@migrate -path={{migrations_path}} -database={{db_addr}} up

migrate-down level='1':
    @migrate -path={{migrations_path}} -database={{db_addr}} down {{level}}