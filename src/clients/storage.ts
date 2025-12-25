import { config } from "@/config";
import { S3 } from "@aws-sdk/client-s3";
import { TraitId } from "./db";

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

  getTraitImage(id: TraitId) {
    return `https://${
      this._bucketName
    }.sfo3.digitaloceanspaces.com/${this._getPathWithEnv("traits")}/${id}.webp`;
  }

  async uploadSimImage(file: File, filename: string): Promise<string> {
    const arrayBuffer = await file.arrayBuffer();
    const fileContent = Buffer.from(arrayBuffer);

    const path = `sims/${filename}`;
    const pathWithEnv = this._getPathWithEnv(path);

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

  async deleteSimImage(uri: string) {
    const key = uri.replace(
      `https://${this._bucketName}.${this._endpoint}/`,
      ""
    );

    this._s3Client.deleteObject({
      Bucket: this._bucketName,
      Key: key,
    });
  }

  private _getPathWithEnv(path: string) {
    return config.env === "development" ? `DEV-${path}` : path;
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
