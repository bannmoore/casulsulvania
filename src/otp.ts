import crypto from "node:crypto";

export function generateOtp() {
  return crypto.randomBytes(120).toString("hex");
}
