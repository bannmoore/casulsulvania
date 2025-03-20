import { config } from "@/config";
import { NextResponse } from "next/server";

/**
 * Returns a redirect response for the configured BaseUrl + Path.
 * Avoids the "0.0.0.0" host issue inside a Docker container.
 * Ref: https://github.com/vercel/next.js/issues/54450
 */
export function redirectWithBaseUrl(path: string) {
  return NextResponse.redirect(new URL(path, config.baseUrl), {
    status: 302,
  });
}
