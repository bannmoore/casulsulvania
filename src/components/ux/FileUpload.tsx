import React, { useState } from "react";
import Cropper, { Area } from "react-easy-crop";

export default function FileUpload({
  onChange,
  id,
}: {
  onChange: (file: File) => void;
  id: string;
}) {
  const [imageSrc, setImageSrc] = useState<string | null>(null);
  const [crop, setCrop] = useState({ x: 0, y: 0 });
  const [zoom, setZoom] = useState(1);
  const [croppedAreaPixels, setCroppedAreaPixels] = useState<null | {
    width: number;
    height: number;
    x: number;
    y: number;
  }>(null);

  async function onFileChange(event: React.FormEvent<HTMLInputElement>) {
    const file = event.currentTarget.files?.[0];

    if (file) {
      const reader = new FileReader();
      reader.onload = () => {
        setImageSrc(reader.result as string);
      };
      reader.readAsDataURL(file);
    }
  }

  function onCropComplete(
    croppedArea: { x: number; y: number; width: number; height: number },
    croppedAreaPixels: { x: number; y: number; width: number; height: number }
  ) {
    setCroppedAreaPixels(croppedAreaPixels);
  }

  async function handleCrop() {
    if (imageSrc && croppedAreaPixels) {
      const croppedImage = await getCroppedImg(imageSrc, croppedAreaPixels);
      const croppedFile = new File([croppedImage], "cropped-image.png", {
        type: "image/png",
      });
      onChange(croppedFile);
      setImageSrc(null); // Reset the cropper
    }
  }

  return (
    <>
      <label htmlFor={id} role="button">
        Upload Sim Image
      </label>
      <input
        type="file"
        accept="image/png"
        id={id}
        onChange={onFileChange}
        className="hidden"
      />
      {imageSrc && (
        <div className="flex flex-col items-center">
          <div className="relative w-full h-96 bg-gray-800">
            <Cropper
              image={imageSrc}
              crop={crop}
              zoom={zoom}
              aspect={1} // Ensures a square crop
              onCropChange={setCrop}
              onZoomChange={setZoom}
              onCropComplete={onCropComplete}
            />
          </div>
          <div className="flex gap-4 mt-4">
            <button type="button" onClick={handleCrop}>
              Crop and Upload
            </button>
            <button
              type="button"
              onClick={() => setImageSrc(null)}
              className=" bg-gray-500 hover:bg-gray-600"
            >
              Cancel
            </button>
          </div>
        </div>
      )}
    </>
  );
}

async function getCroppedImg(imageSrc: string, crop: Area): Promise<Blob> {
  const image = await createImage(imageSrc);
  const canvas = document.createElement("canvas");
  const ctx = canvas.getContext("2d");

  if (!ctx) {
    throw new Error("Failed to get canvas context");
  }

  canvas.width = crop.width;
  canvas.height = crop.height;

  ctx.drawImage(
    image,
    crop.x,
    crop.y,
    crop.width,
    crop.height,
    0,
    0,
    crop.width,
    crop.height
  );

  return new Promise((resolve) => {
    canvas.toBlob((blob) => {
      if (blob) resolve(blob);
    }, "image/png");
  });
}

function createImage(url: string): Promise<HTMLImageElement> {
  return new Promise((resolve, reject) => {
    const image = new Image();
    image.src = url;
    image.onload = () => resolve(image);
    image.onerror = (error) => reject(error);
  });
}
