import React from "react";
import { Button } from "./button";
import { buttonVariants } from "@/components/ui/button";
import Link from "next/link";

const Navbar = () => {
  return (
    <nav className="nav-container flex items-center justify-between  px-8  h-16  max-w-[88rem] mx-auto shadow-sm">
      <div className="nav-logo text-2xl">
        <h1 className="font-bold">BaiBucks</h1>
      </div>
      <div className="nav-wrapper flex items-center just">
        <div className="nav-links flex items-center justify-between gap-5">
          <a href="#" className="nav-link">
            Home
          </a>
          <a href="#" className="nav-link">
            About
          </a>
          <a href="#" className="nav-link">
            Services
          </a>
          <a href="#" className="nav-link">
            Trending
          </a>
        </div>
      </div>

      <div className="nav-menu flex gap-3">
        <Link
          href="/sign-in"
          className={buttonVariants({ variant: "default" })}
        >
          Login
        </Link>

        <Link href="/sign-up" className={buttonVariants({ variant: "main" })}>
          Sign Up
        </Link>
      </div>
    </nav>
  );
};

export default Navbar;
