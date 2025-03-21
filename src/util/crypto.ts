import crypto from "node:crypto";

export function generateOtp() {
  return crypto
    .randomBytes(120)
    .toString("base64")
    .replaceAll("+", "-")
    .replaceAll("/", "_");
}

export function generateAccessToken(email: string) {
  const token = crypto.randomBytes(120).toString("utf8");

  const buffer = Buffer.from(`token:${token}:${email}`, "utf8");

  return buffer.toString("base64");
}
