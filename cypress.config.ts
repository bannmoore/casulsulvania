import { defineConfig } from "cypress";
import { Client } from "pg";

const pgConfig = {
  user: "postgres",
  password: "password",
  host: "localhost",
  database: "postgres",
  ssl: false,
  port: 5432,
};

export default defineConfig({
  e2e: {
    setupNodeEvents(on, _config) {
      on("task", {
        // Task allowing direct queries to postgres.
        async queryDb(queryString) {
          const client = new Client(pgConfig);
          await client.connect();
          const res = await client.query(queryString);
          await client.end();
          return res.rows;
        },
      });
    },
    baseUrl: "http://localhost:3000",
  },
});
