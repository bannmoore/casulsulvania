import React from "react";

export default function FileUpload({
  onChange,
  id,
}: {
  onChange: (file: File) => void;
  id: string;
}) {
  function onFileChange(event: React.FormEvent<HTMLInputElement>) {
    const file = event.currentTarget.files?.[0];

    if (file) {
      onChange(file);
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
    </>
  );
}
