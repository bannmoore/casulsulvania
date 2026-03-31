"use client";

import ReactSelect, { MultiValue } from "react-select";
import ClientOnly from "../ClientOnly";

type SelectOption<T extends string> = {
  id: T;
  name: string;
};

export default function MultiSelect<T extends string>({
  name,
  value,
  onChange,
  options,
  placeholder = "Select...",
  isSearchable = false,
  isRequired = false,
  max,
}: {
  name: string;
  value: MultiValue<T>;
  onChange: (newValue: T[]) => void;
  options: SelectOption<T>[];
  placeholder?: string;
  isSearchable?: boolean;
  isRequired?: boolean;
  max?: number;
}) {
  const actualValue = value
    .map((v) => options.find((o) => o.id == v))
    .filter((x) => !!x);

  return (
    <ClientOnly>
      <ReactSelect
        unstyled={true}
        className="react-select-container"
        classNamePrefix="react-select"
        isMulti={true}
        isSearchable={isSearchable}
        required={isRequired}
        placeholder={placeholder}
        name={name}
        value={actualValue}
        onChange={(newValue) => onChange(newValue.map((v) => v.id))}
        getOptionValue={(option) => option.id}
        getOptionLabel={(option) => option.name}
        options={options}
        isOptionDisabled={() => !!max && actualValue.length >= max}
      />
    </ClientOnly>
  );
}
