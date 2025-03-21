import { CamelCasePlugin, Kysely, PostgresDialect, Selectable } from "kysely";
import {
  Ages,
  Aspirations,
  AspirationId,
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
  AgeId,
  TraitId,
  AspirationCategory,
  LifeStateId,
  CareerBranchId,
} from "./db";
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
} from "./db";
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

  /* users */

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

  /* otps */

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

  /* sessions */

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

  /* sims */

  async getAllSims(): Promise<Sim[]> {
    return this._db.selectFrom("sims").selectAll().execute();
  }

  async getSimById(id: string): Promise<Sim | undefined> {
    return this._db
      .selectFrom("sims")
      .selectAll()
      .where("id", "=", id)
      .executeTakeFirst();
  }

  async insertSim(insertData: {
    firstName: string;
    lastName: string;
    ageId: AgeId;
    lifeStateId: LifeStateId;
    parent1Id: string | null;
    parent2Id: string | null;
  }): Promise<void> {
    await this._db.insertInto("sims").values(insertData).execute();
  }

  async updateSim(
    id: string,
    updateData: Partial<Unsaved<Sim>>
  ): Promise<void> {
    await this._db
      .updateTable("sims")
      .set({
        ...updateData,
        updatedAt: new Date(),
      })
      .where("id", "=", id)
      .execute();
  }

  /* sims_aspirations */

  async getSimAspirations(simId: string): Promise<SimAspiration[]> {
    return this._db
      .selectFrom("simsAspirations")
      .selectAll()
      .where("simId", "=", simId)
      .execute();
  }

  async clearSimAspirations(simId: string): Promise<void> {
    await this._db
      .deleteFrom("simsAspirations")
      .where("simId", "=", simId)
      .execute();
  }

  async insertSimAspirations(
    simId: string,
    aspirations: { aspirationId: AspirationId; ageId: AgeId }[]
  ): Promise<void> {
    if (!aspirations.length) {
      return;
    }

    await this._db
      .insertInto("simsAspirations")
      .values(
        aspirations.map(({ aspirationId, ageId }) => ({
          simId,
          aspirationId,
          ageId,
          isComplete: false,
        }))
      )
      .execute();
  }

  /* sims_traits */

  async getSimTraits(simId: string): Promise<SimTrait[]> {
    return this._db
      .selectFrom("simsTraits")
      .selectAll()
      .where("simId", "=", simId)
      .execute();
  }

  async clearSimTraits(simId: string): Promise<void> {
    await this._db
      .deleteFrom("simsTraits")
      .where("simId", "=", simId)
      .execute();
  }

  async insertSimTraits(
    simId: string,
    traits: { traitId: TraitId; ageId: AgeId }[]
  ): Promise<void> {
    if (!traits.length) {
      return;
    }

    await this._db
      .insertInto("simsTraits")
      .values(
        traits.map(({ traitId, ageId }) => ({
          simId,
          traitId,
          ageId,
        }))
      )
      .execute();
  }

  /* sims_career_branches */

  async getSimCareerBranches(simId: string): Promise<SimCareerBranch[]> {
    return this._db
      .selectFrom("simsCareerBranches")
      .selectAll()
      .where("simId", "=", simId)
      .execute();
  }

  async clearSimCareerBranches(simId: string): Promise<void> {
    await this._db
      .deleteFrom("simsCareerBranches")
      .where("simId", "=", simId)
      .execute();
  }

  async insertSimCareerBranches(
    simId: string,
    careerBranches: CareerBranchId[]
  ): Promise<void> {
    if (!careerBranches.length) {
      return;
    }

    await this._db
      .insertInto("simsCareerBranches")
      .values(
        careerBranches.map((careerBranchId) => ({
          simId,
          careerBranchId,
        }))
      )
      .execute();
  }

  /* data */

  async getAges(): Promise<Age[]> {
    return this._db.selectFrom("ages").selectAll().execute();
  }

  async getLifeStates(): Promise<LifeState[]> {
    return this._db.selectFrom("lifeStates").selectAll().execute();
  }

  async getAspirations(age: AgeId): Promise<Aspiration[]> {
    return (
      this._db
        .selectFrom("aspirations")
        .selectAll()
        // @ts-expect-error: https://github.com/kysely-org/kysely/pull/612
        .where((eb) => eb(eb.val(age), "=", eb.fn.any("aspirations.ages")))
        .orderBy("name asc")
        .execute()
    );
  }

  async getAspirationsByCategory(
    category: AspirationCategory
  ): Promise<Aspiration[]> {
    return this._db
      .selectFrom("aspirations")
      .selectAll()
      .where("category", "=", category)
      .orderBy("name asc")
      .execute();
  }

  async getTraits(age: AgeId): Promise<Trait[]> {
    return (
      this._db
        .selectFrom("traits")
        .selectAll()
        // @ts-expect-error: https://github.com/kysely-org/kysely/pull/612
        .where((eb) => eb(eb.val(age), "=", eb.fn.any("traits.ages")))
        .orderBy("name asc")
        .execute()
    );
  }

  async getCareerBranches(): Promise<CareerBranch[]> {
    return this._db.selectFrom("careerBranches").selectAll().execute();
  }
}

const database = Object.freeze(
  new DatabaseClient({
    connectionString: config.databaseUrl,
    cert: config.databaseCert,
  })
);

export default database;
