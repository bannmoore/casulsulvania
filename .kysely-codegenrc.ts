const config = {
  camelCase: true,
  dateParser: "timestamp",
  defaultSchemas: ["public"],
  dialect: "postgres",
  domains: true,
  envFile: ".env.local",
  excludePattern: "goose*",
  includePattern: null,
  logLevel: "warn",
  numericParser: "string",
  outFile: "./src/db.d.ts",
  partitions: false,
  print: false,
  runtimeEnums: false,
  singularize: false,
};

export default config;
