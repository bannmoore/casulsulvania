"use client";

import { Sim, SimImage, SimTrait } from "@/clients/database";
import { useState } from "react";
import Image from "next/image";

type SimTraitWithImageSource = SimTrait & {
  imageSrc: string;
};

interface ViewSimProps {
  sim: Sim;
  simTraits: SimTraitWithImageSource[];
  simImages: SimImage[];
}

export default function ViewSim({ sim, simTraits, simImages }: ViewSimProps) {
  const [currentSimImageUri] = useState(
    simImages.find((image) => image.ageId === sim.ageId)?.imageUri
  );

  return (
    <div className="text-center">
      {currentSimImageUri && (
        <Image
          alt="current image"
          src={currentSimImageUri}
          width={200}
          height={200}
          className="mb-4 rounded-full mx-auto"
        />
      )}

      <h1 className="mt-2 mb-4">
        {sim.firstName} {sim.lastName}
      </h1>

      <div className="inline-flex gap-2">
        {simTraits.map((trait) => (
          <Image
            key={trait.traitId}
            alt="current image"
            src={trait.imageSrc}
            width={60}
            height={60}
            title={trait.traitId}
            className="mb-4 rounded-full inline-block"
          />
        ))}
      </div>
    </div>
  );
}
