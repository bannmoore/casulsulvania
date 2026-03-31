# Casulsulvania

## Quickstart

TBD

## Cypress tests

These tests require the following user to be inserted into the database:

```sql
INSERT INTO users (email, is_test_user)
VALUES ('hello@bannmoore.dev', TRUE);
```

To run the tests:

```sh
npm run cy:run
```

