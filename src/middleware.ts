import { NextRequest, NextResponse } from "next/server";
import { adminMiddleware } from "./app/admin/middleware";

export default async function middleware(request: NextRequest) {
  if (request.nextUrl.pathname.startsWith("/admin")) {
    return adminMiddleware(request);
  }

  return NextResponse.next();
}

export const config = {
  matcher: [
    /*
     * Match all request paths except for the ones starting with:
     * - login or auth
     * - _next/static (static files)
     * - _next/image (image optimization files)
     * - favicon.ico, sitemap.xml, robots.txt (metadata files)
     */
    "/((?!admin/login|_next/static|_next/image|favicon.ico).*)",
  ],
};
