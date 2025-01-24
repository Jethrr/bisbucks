"use client";

import React from "react";
import { buttonVariants } from "@/components/ui/button";
import Link from "next/link";
import SignoutButton from "../signout-button";
import { Session } from "@/lib/auth";
import { Menu } from "lucide-react";
import { useState } from "react";
import { DropdownMenuDemo } from "../dropdown-user";

export default function Navbar({ session }: { session: Session | null }) {
  // Get the current pathname

  // Helper function to check if the link is active
  const [isOpen, setIsOpen] = useState(false);

  return (
    <nav className="  sticky top-0 nav-container flex items-center justify-between  px-12 mx-auto h-16  ">
      <div className="nav-logo cursor-pointer flex items-center justify-between gap-5 ">
        <Link href="/">
          <h1 className="font-bold text-xl">Baibucks</h1>
        </Link>

        <div className="nav-wrapper flex items-center text-sm">
          <div className=" hidden nav-links md:flex items-center justify-between gap-5 text-gray-500 ">
            {!session ? (
              <div className="flex items-center gap-5">
                {/* Links for unauthenticated users */}
                <Link href="/about">About</Link>
                <Link href="/contact">Contact</Link>
              </div>
            ) : (
              <div className="flex items-center gap-5">
                {/* Links for authenticated users */}
                <Link href="/dashboard">Dashboard</Link>
                <Link href="/transactions">Transactions</Link>
              </div>
            )}
          </div>
        </div>
      </div>

      {/* Authentication-related links */}
      <div className="nav-menu flex gap-3">
        {!session ? (
          <div className="md:flex items-center gap-3 hidden ">
            <Link
              href="/sign-in"
              className={buttonVariants({ variant: "ghost" })}
            >
              Login
            </Link>
            <Link
              href="/sign-up"
              className={buttonVariants({ variant: "default" })}
            >
              Get Started
            </Link>
          </div>
        ) : (
          <div className="flex items-center gap-3">
            <DropdownMenuDemo />
          </div>
        )}
      </div>
    </nav>
  );
}
