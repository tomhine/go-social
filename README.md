# GO Social

A social platform web API written in Go used to learn the language.

## Local Dependencies

When developing this project you'll need to have [golang/migrate](https://github.com/golang-migrate/migrate) installed locally. This package is used to handle all database migrations.

You can optionally install [GNU Make](https://www.gnu.org/software/make/) to use the included Makefile to simplify interacting with the migrate functionality.

## Local Setup

Clone the repo:
```bash
git clone <repo-url>
```

Copy the example `.env` file and fill in your local environment details:
```bash
cp .env.example .env
```

Install dependencies:
```bash
go mod tidy
```

Run the database container:
```bash
docker compose up [-d]
```

> [!NOTE]
> The `-d` command is optional. Use this if you want to run the container in detached mode.

Run the apps migrations, either with make (make sure your `.env` is setup):
```bash
make migrate-up
```

Or with migrate directly:
```bash
migrate -path=<path-to-migration-dir> -database=<database-connection-string> up
```

>[!NOTE]
> You'll need to have [golang/migrate](https://github.com/golang-migrate/migrate) installed locally for this. 

You should now be ready to work on the project.