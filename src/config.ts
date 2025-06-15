export const config = {
  baseUrl: process.env.BASE_URL || "",
  databaseUrl: process.env.DATABASE_URL || "",
  databaseCert: process.env.DATABASE_CERT || "",
  env: process.env.NODE_ENV || "dev",
  postmarkApikey: process.env.POSTMARK_APIKEY || "",
  doSpacesBucketName: process.env.DO_SPACES_BUCKET_NAME || "",
  doSpacesEndpoint: process.env.DO_SPACES_ENDPOINT || "",
  doSpacesAccessKeyId: process.env.DO_SPACES_ACCESS_KEY_ID || "",
  doSpacesSecretKey: process.env.DO_SPACES_SECRET_KEY || "",
};
