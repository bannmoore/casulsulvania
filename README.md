# Casulsulvania DB

## Dependencies

- [Docker Desktop](https://docs.docker.com/desktop/)
- [Goose](https://github.com/pressly/goose)

Also requires the `casulsulvania` and `casulsulvania-infra` repos.

## Setup

```sh
brew bundle
```

## Commands

Run database: See the `casulsulvania-infra` project.

Run migrations:

```sh
./bin/migrate up
```

Create migration:

```sh
./bin/migrate create new_migration_name sql
```