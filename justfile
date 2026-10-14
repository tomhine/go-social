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
alias db := tablepro

# Start all development processes
[group('dev')]
[continue]
dev: docker-up && docker-stop
    -@air

# Start the project docker containers
[group('dev')]
docker-up:
    @docker compose up -d

# Stop the project docker containers
[group('dev')]
docker-stop:
    @docker compose stop

# Open the postgres database in TablePro
[group('dev')]
tablepro:
    open -b com.TablePro "{{db_addr}}"

# Create a new migration
[group('migrate')]
migrate-create name:
	@migrate create -seq -ext sql -dir {{migrations_path}} {{name}}

# Run any pending up migrations
[group('migrate')]
migrate-up:
	@migrate -path={{migrations_path}} -database={{db_addr}} up

# Run the down migrations
[group('migrate')]
migrate-down level='1':
    @migrate -path={{migrations_path}} -database={{db_addr}} down {{level}}