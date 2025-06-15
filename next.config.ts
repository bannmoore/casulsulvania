import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: "standalone",
  images: {
    formats: ["image/avif", "image/webp"],
    remotePatterns: [
      {
        protocol: "https",
        hostname: "casulsulvania-storage.sfo3.digitaloceanspaces.com",
        port: "",
        pathname: "**",
      },
    ],
  },
};

export default nextConfig;
