import { MetadataRoute } from "next";

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: "Casulsulvania",
    short_name: "Casulsulvania",
    description: "",
    start_url: "/",
    display: "standalone",
    icons: [
      {
        src: "/android-icon192.png",
        sizes: "192x192",
        type: "image/png",
      },
      {
        src: "/android-icon512.png",
        sizes: "512x512",
        type: "image/png",
      },
    ],
  };
}
