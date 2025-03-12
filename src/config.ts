export const config = {
  baseUrl: process.env.BASE_URL || "",
  databaseUrl: process.env.DATABASE_URL || "",
  databaseCert: process.env.DATABASE_CERT || "",
  env: process.env.NODE_ENV || "dev",
  postmarkApikey: process.env.POSTMARK_APIKEY || "",
};
