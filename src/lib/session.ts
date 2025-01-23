"use server";

import { headers } from "next/headers";
import { auth } from "@/lib/auth";

export async function getSessionFromServer() {
  const sessionHeaders = await headers();
  const session = await auth.api.getSession({
    headers: sessionHeaders,
  });
  return session;
}
