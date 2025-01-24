import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
  images: {
    remotePatterns: [
      {
        protocol: "https",
        hostname: "www.shutterstock.com",
        port: "",
        pathname: "/image-vector/**", // Matches paths under "/image-vector/"
      },
    ],
  },
};

export default nextConfig;
