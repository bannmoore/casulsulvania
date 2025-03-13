import { Kysely, PostgresDialect } from "kysely";
import { AgeId, DB } from "kysely-codegen";
import { Pool } from "pg";
import { parse } from "pg-connection-string";
import { config } from "@/config";

class DatabaseClient {
  private _db: Kysely<DB>;

  constructor({
    connectionString,
    cert,
  }: {
    connectionString: string;
    cert: string;
  }) {
    const dbConfig = parse(connectionString);
    this._db = new Kysely<DB>({
      dialect: new PostgresDialect({
        pool: new Pool({
          // I'd like to use connectionString directly, but there seems to be an
          // underlying issue in node-postgres that prevents it from playing
          // nice with ssl certs:
          // https://github.com/brianc/node-postgres/pull/2709
          database: dbConfig.database || "",
          host: dbConfig.host || "",
          user: dbConfig.user,
          password: dbConfig.password,
          port: Number(dbConfig.port || "5432"),
          ssl: dbConfig.ssl
            ? {
                rejectUnauthorized: true,
                ca: cert,
              }
            : undefined,
        }),
      }),
    });
  }

  async getUserByEmail(email: string) {
    return this._db
      .selectFrom("users")
      .selectAll()
      .where("email", "=", email)
      .executeTakeFirst();
  }

  async getOtp(email: string) {
    return this._db
      .selectFrom("otps")
      .selectAll()
      .where((eb) => eb("email", "=", email).and("expiresAt", ">", new Date()))
      .executeTakeFirst();
  }

  async insertOtp({
    otp,
    email,
    expiresAt,
  }: {
    otp: string;
    email: string;
    expiresAt: Date;
  }) {
    await this._db
      .insertInto("otps")
      .values({
        otp,
        email,
        expiresAt,
      })
      .execute();
  }

  async getSims() {
    return this._db.selectFrom("sims").selectAll().execute();
  }

  async getSimById(id: string) {
    return this._db
      .selectFrom("sims")
      .selectAll()
      .where("id", "=", id)
      .executeTakeFirst();
  }

  async insertSim({
    firstName,
    lastName,
    age,
  }: {
    firstName: string;
    lastName: string;
    age: AgeId;
  }) {
    this._db
      .insertInto("sims")
      .values({
        firstName,
        lastName,
        age: age,
      })
      .execute();
  }

  async updateSim({
    id,
    firstName,
    lastName,
  }: {
    id: string;
    firstName: string;
    lastName: string;
  }) {
    this._db
      .updateTable("sims")
      .set({
        firstName,
        lastName,
      })
      .where("id", "=", id)
      .execute();
  }
}

const database = Object.freeze(
  new DatabaseClient({
    connectionString: config.databaseUrl,
    cert: config.databaseCert,
  })
);

export default database;
