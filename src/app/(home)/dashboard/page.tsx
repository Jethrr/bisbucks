"use client";
import Navbar from "@/components/ui/Navbar";
import { authClient } from "@/lib/auth-client";
import React from "react";

const Feed = () => {
  const { data } = authClient.useSession();

  if (!data) {
    return <div>Loading...</div>;
  }

  return (
    <section className="main-container mx-auto">
      <div className="main-header px-12">
        <h1 className="text-3xl font-bold  ">Hello! {data.user.name} 👋</h1>
      </div>
    </section>
  );
};

export default Feed;
