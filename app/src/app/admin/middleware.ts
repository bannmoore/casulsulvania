import { redirectWithBaseUrl } from "@/util/next";
import { cookies } from "next/headers";
import { NextRequest } from "next/server";

export async function adminMiddleware(_request: NextRequest) {
  const token = (await cookies()).get("token")?.value;
  if (!token) {
    return redirectWithBaseUrl("/admin/login");
  }
}
