"use client";

import React from "react";
import { buttonVariants } from "@/components/ui/button";
import Link from "next/link";
import SignoutButton from "../signout-button";
import { Session } from "@/lib/auth";

export default function Navbar({ session }: { session: Session | null }) {
  // Get the current pathname

  // Helper function to check if the link is active

  return (
    <nav className="nav-container flex items-center justify-between px-8 h-16 max-w-[88rem] mx-auto shadow-sm">
      <div className="nav-logo cursor-pointer flex items-center justify-between gap-5">
        <Link href="">
          <h1 className="font-bold text-2xl">BaiBucks</h1>
        </Link>

        <div className="nav-wrapper flex items-center">
          <div className="nav-links flex items-center justify-between gap-5">
            {!session ? (
              <>
                {/* Links for unauthenticated users */}
                <Link href="/about">About</Link>
                <Link href="/contact">Contact</Link>
              </>
            ) : (
              <>
                {/* Links for authenticated users */}
                <Link href="/dashboard">Dashboard</Link>
                <Link href="/transactions">Transactions</Link>
              </>
            )}
          </div>
        </div>
      </div>

      {/* Authentication-related links */}
      <div className="nav-menu flex gap-3">
        {!session ? (
          <>
            <Link
              href="/sign-in"
              className={buttonVariants({ variant: "default" })}
            >
              Login
            </Link>
            <Link
              href="/sign-up"
              className={buttonVariants({ variant: "main" })}
            >
              Sign Up
            </Link>
          </>
        ) : (
          <>
            <SignoutButton />
          </>
        )}
      </div>
    </nav>
  );
}
