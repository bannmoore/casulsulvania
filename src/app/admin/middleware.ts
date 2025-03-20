import { cookies } from "next/headers";
import { NextRequest, NextResponse } from "next/server";

export async function adminMiddleware(request: NextRequest) {
  const token = (await cookies()).get("token")?.value;
  if (!token) {
    return NextResponse.redirect(new URL("/admin/login", request.nextUrl));
  }
}
