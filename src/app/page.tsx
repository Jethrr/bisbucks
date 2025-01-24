"use client";
import React from "react";
import Image from "next/image";
import { AnimatedTooltip } from "@/components/ui/animated-tooltip";
import { Coffee } from "lucide-react";
import { Button } from "@/components/ui/button";
import { ContainerScroll } from "@/components/ui/container-scroll-animation";
const people = [
  {
    id: 1,
    name: "Jether Omictin",
    designation: "Software Engineer",
    image: "/images/Profile.jpg",
  },
];

export default function Home() {
  return (
    <div className="">
      <section className="container mx-auto px-8 text-center flex-col items-center justify-center h-5/6 max-w-[88rem]">
        <div className="top-div mt-24 text-center flex-col items-center justify-center">
          <div className="sub-2 flex items-center justify-center gap-3">
            <h1 className="text-gray-500 text-sm hover:border-b-1border-gray-500">
              Hello, guys! Buy me a coffee.
            </h1>
            <button className=" cursor-pointer rounded-full p-2 shadow-2xl hover:bg-gray-100 border">
              <Coffee className="w-5 " />
            </button>
          </div>
          {/* <AnimatedTooltip items={people} /> */}
          <h1 className="font-bold text-6xl">Personalized Budget Tracker</h1>
          <div className="flex items-center justify-center gap-3 py-3">
            <p className="text-gray-500 text-lg">
              A personalized budget tracker app designed for simplicity and
              customization.
            </p>
            <button className="bg-slate-800  no-underline group cursor-pointer relative shadow-2xl shadow-zinc-900 rounded-full p-px text-xs font-semibold leading-6  text-white inline-block">
              <span className="absolute inset-0 overflow-hidden rounded-full">
                <span className="absolute inset-0 rounded-full bg-[image:radial-gradient(75%_100%_at_50%_0%,rgba(56,189,248,0.6)_0%,rgba(56,189,248,0)_75%)] opacity-0 transition-opacity duration-500 group-hover:opacity-100" />
              </span>
              <div className="relative flex space-x-2 items-center z-10 rounded-full bg-zinc-950 py-0.5 px-4 ring-1 ring-white/10 ">
                <span>Check on Github</span>
                <svg
                  fill="none"
                  height="16"
                  viewBox="0 0 24 24"
                  width="16"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    d="M10.75 8.75L14.25 12L10.75 15.25"
                    stroke="currentColor"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth="1.5"
                  />
                </svg>
              </div>
              <span className="absolute -bottom-0 left-[1.125rem] h-px w-[calc(100%-2.25rem)] bg-gradient-to-r from-emerald-400/0 via-emerald-400/90 to-emerald-400/0 transition-opacity duration-500 group-hover:opacity-40" />
            </button>
          </div>
        </div>
        <div className="container-scroll">
          <ContainerScroll titleComponent={<></>}>
            <Image
              src={`/linear.webp`}
              alt="hero"
              height={720}
              width={1400}
              className="mx-auto rounded-2xl object-cover h-full object-left-top"
              draggable={false}
            />
          </ContainerScroll>
        </div>
      </section>
    </div>
  );
}
