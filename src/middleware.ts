import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export function middleware(req: NextRequest) {
  const session = req.cookies.get("better-auth.session_token");

  if (!session) {
    return NextResponse.redirect(new URL("/sign-in", req.url));
  }

  return NextResponse.next();
}

// Define protected routes
export const config = {
  matcher: ["/feed/:path*"], // Add your protected routes here
};
