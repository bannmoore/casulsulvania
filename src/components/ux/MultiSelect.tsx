"use client";

import ReactSelect, { MultiValue } from "react-select";
import ClientOnly from "../ClientOnly";

type Option<T extends string> = {
  id: T;
  name: string;
};

export default function MultiSelect<T extends string>({
  name,
  value,
  onChange,
  options,
  isSearchable = false,
  isRequired = false,
}: {
  name: string;
  value: Option<T> | null;
  onChange: (newValue: MultiValue<Option<T>>) => void;
  options: Option<T>[];
  isSearchable?: boolean;
  isRequired?: boolean;
}) {
  return (
    <ClientOnly>
      <ReactSelect
        unstyled={true}
        className="react-select-container"
        classNamePrefix="react-select"
        isMulti={true}
        isSearchable={isSearchable}
        required={isRequired}
        name={name}
        value={value}
        onChange={onChange}
        getOptionValue={(option) => option.id}
        getOptionLabel={(option) => option.name}
        options={options}
      />
    </ClientOnly>
  );
}
