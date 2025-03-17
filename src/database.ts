import { CamelCasePlugin, Kysely, PostgresDialect, Selectable } from "kysely";
import {
  Ages,
  Aspirations,
  CareerBranches,
  DB,
  LifeStates,
  Otps,
  Products,
  Sessions,
  Sims,
  SimsAspirations,
  SimsCareerBranches,
  SimsTraits,
  Traits,
  Users,
} from "kysely-codegen";
import { Pool } from "pg";
import { parse } from "pg-connection-string";
import { config } from "@/config";

export type {
  AgeId,
  AspirationId,
  CareerBranchId,
  LifeStateId,
  ProductId,
  ProductType,
  TraitId,
} from "kysely-codegen";
export type Age = Selectable<Ages>;
export type Aspiration = Selectable<Aspirations>;
export type CareerBranch = Selectable<CareerBranches>;
export type LifeState = Selectable<LifeStates>;
export type Otp = Selectable<Otps>;
export type Product = Selectable<Products>;
export type Session = Selectable<Sessions>;
export type Sim = Selectable<Sims>;
export type SimAspiration = Selectable<SimsAspirations>;
export type SimCareerBranch = Selectable<SimsCareerBranches>;
export type SimTrait = Selectable<SimsTraits>;
export type Trait = Selectable<Traits>;
export type User = Selectable<Users>;

type Unsaved<T> = Omit<T, "id" | "createdAt" | "updatedAt">;
type UnsavedSim = Omit<Unsaved<Sim>, "name">;

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
      // Needed because we're using kysely-codgen configuration: "camelCase: true"
      plugins: [new CamelCasePlugin()],
    });
  }

  async getCurrentUser(token: string): Promise<User | undefined> {
    return this._db
      .selectFrom("users")
      .innerJoin("sessions", "sessions.userId", "users.id")
      .where("sessions.token", "=", token)
      .selectAll()
      .executeTakeFirst();
  }

  async getUserByEmail(email: string): Promise<User | undefined> {
    return this._db
      .selectFrom("users")
      .selectAll()
      .where("email", "=", email)
      .executeTakeFirst();
  }

  async getOtp(email: string): Promise<Otp | undefined> {
    return this._db
      .selectFrom("otps")
      .selectAll()
      .where((eb) => eb("email", "=", email).and("expiresAt", ">", new Date()))
      .executeTakeFirst();
  }

  async insertOtp({ otp, email, expiresAt }: Unsaved<Otp>): Promise<void> {
    await this._db
      .insertInto("otps")
      .values({
        otp,
        email,
        expiresAt,
      })
      .execute();
  }

  async deleteOtp(otp: string): Promise<void> {
    await this._db.deleteFrom("otps").where("otp", "=", otp).execute();
  }

  async getUserFromOtp(otp: string): Promise<User | undefined> {
    return this._db
      .selectFrom("otps")
      .innerJoin("users", "users.email", "otps.email")
      .selectAll("users")
      .where((eb) => eb("otp", "=", otp).and("expiresAt", ">", new Date()))
      .executeTakeFirst();
  }

  async upsertSession({ userId, token, expiresAt }: Unsaved<Session>) {
    return this._db
      .insertInto("sessions")
      .values({
        userId,
        token,
        expiresAt,
      })
      .executeTakeFirstOrThrow();
  }

  async deleteSession(token: string): Promise<void> {
    await this._db.deleteFrom("sessions").where("token", "=", token).execute();
  }

  async getSimById(id: string): Promise<Sim | undefined> {
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
    parent1Id,
    parent2Id,
    lifeState,
  }: UnsavedSim): Promise<void> {
    await this._db
      .insertInto("sims")
      .values({
        firstName,
        lastName,
        age,
        parent1Id,
        parent2Id,
        lifeState,
      })
      .execute();
  }

  async updateSim(
    id: string,
    { firstName, lastName, age }: UnsavedSim
  ): Promise<void> {
    await this._db
      .updateTable("sims")
      .set({
        firstName,
        lastName,
        age,
      })
      .where("id", "=", id)
      .execute();
  }

  async getAges(): Promise<Age[]> {
    return this._db.selectFrom("ages").selectAll().execute();
  }

  async getLifeStates(): Promise<LifeState[]> {
    return this._db.selectFrom("lifeStates").selectAll().execute();
  }

  async getAspirations(): Promise<Aspiration[]> {
    return this._db.selectFrom("aspirations").selectAll().execute();
  }

  async getTraits(): Promise<Trait[]> {
    return this._db.selectFrom("traits").selectAll().execute();
  }

  async getCareerBranches(): Promise<CareerBranch[]> {
    return this._db.selectFrom("careerBranches").selectAll().execute();
  }

  async getAllSims(): Promise<Sim[]> {
    return this._db.selectFrom("sims").selectAll().execute();
  }
}

const database = Object.freeze(
  new DatabaseClient({
    connectionString: config.databaseUrl,
    cert: config.databaseCert,
  })
);

export default database;
