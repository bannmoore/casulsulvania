import { config } from "@/config";
import { S3 } from "@aws-sdk/client-s3";

class StorageClient {
  private _s3Client: S3;
  private _endpoint: string;
  private _bucketName: string;

  constructor({
    bucketName,
    endpoint,
    accessKeyId,
    secretKey,
  }: {
    bucketName: string;
    endpoint: string;
    accessKeyId: string;
    secretKey: string;
  }) {
    this._bucketName = bucketName;
    this._endpoint = endpoint;
    this._s3Client = new S3({
      forcePathStyle: false,
      endpoint: `https://${endpoint}`,
      region: "us-east-1", // Ref: https://docs.digitalocean.com/products/spaces/how-to/use-aws-sdks/
      credentials: {
        accessKeyId: accessKeyId,
        secretAccessKey: secretKey,
      },
    });
  }

  async uploadSimImage(file: File, filename: string): Promise<string> {
    const arrayBuffer = await file.arrayBuffer();
    const fileContent = Buffer.from(arrayBuffer);

    const path = `sims/${filename}`;
    const pathWithEnv = config.env === "development" ? `DEV-${path}` : path;

    return new Promise((resolve, reject) =>
      this._s3Client.putObject(
        {
          Bucket: this._bucketName,
          Key: pathWithEnv,
          Body: fileContent,
          ACL: "public-read",
        },
        (err, _data) => {
          if (err) {
            console.error(err);
            reject(err);
          }

          resolve(
            `https://${this._bucketName}.${this._endpoint}/${pathWithEnv}`
          );
        }
      )
    );
  }
}

const storage = Object.freeze(
  new StorageClient({
    bucketName: config.doSpacesBucketName,
    endpoint: config.doSpacesEndpoint,
    accessKeyId: config.doSpacesAccessKeyId,
    secretKey: config.doSpacesSecretKey,
  })
);

export default storage;
