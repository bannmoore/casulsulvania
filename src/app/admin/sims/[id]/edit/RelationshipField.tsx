"use client";

import { RelationshipType, Sim, SimRelationship } from "@/clients/database";
import { RelationshipTypeId } from "@/clients/db";
import SingleSelect from "@/components/ux/SingleSelect";
import { useState } from "react";

interface RelationshipFieldProps {
  simId: string;
  value: SimRelationship[];
  onChange: (newValue: SimRelationship[]) => void;
  sims: Sim[];
  relationshipTypes: RelationshipType[];
}

export default function RelationshipField({
  simId,
  value,
  onChange,
  sims,
  relationshipTypes,
}: RelationshipFieldProps) {
  function onAdd(rel: SimRelationship) {
    onChange([...value.concat([rel])]);
  }

  function onRemove(rel: SimRelationship) {
    onChange([...value.filter((r) => r.targetSimId === rel.targetSimId)]);
  }

  return (
    <div>
      {value.map((rel) => (
        <div className="mb-2" key={rel.targetSimId}>
          <RelationshipRow
            relationship={rel}
            sims={sims}
            relationshipTypes={relationshipTypes}
            onRemove={onRemove}
          />
        </div>
      ))}

      <div className="mb-4">
        <RelationshipForm
          simId={simId}
          sims={sims}
          relationshipTypes={relationshipTypes}
          onAdd={onAdd}
        />
      </div>
    </div>
  );
}

function RelationshipRow({
  relationship,
  sims,
  relationshipTypes,
  onRemove,
}: {
  relationship: SimRelationship;
  sims: Sim[];
  relationshipTypes: RelationshipType[];
  onRemove: (rel: SimRelationship) => void;
}) {
  const sim = sims.find((s) => s.id === relationship.targetSimId);
  const relationshipType = relationshipTypes.find(
    (r) => r.id === relationship.relationshipTypeId
  );

  if (!sim || !relationshipType) {
    return null;
  }

  return (
    <div className="flex justify-between items-center">
      <div>
        <span className="mr-4">
          {sim.firstName} {sim.lastName}
        </span>
        {relationshipType.name}
      </div>
      <button onClick={() => onRemove(relationship)}>Delete</button>
    </div>
  );
}

function RelationshipForm({
  simId,
  sims,
  relationshipTypes,
  onAdd,
}: {
  simId: string;
  sims: Sim[];
  relationshipTypes: RelationshipType[];
  onAdd: (rel: SimRelationship) => void;
}) {
  const [targetId, setTargetId] = useState<string | undefined>();
  const [relationshipTypeId, setRelationshipTypeId] = useState<
    RelationshipTypeId | undefined
  >();

  function handleAdd() {
    if (!targetId || !relationshipTypeId) {
      return;
    }

    onAdd({
      sourceSimId: simId,
      targetSimId: targetId,
      relationshipTypeId,
    });
  }

  return (
    <div className="flex justify-between items-center">
      <div className="flex">
        <SingleSelect
          name="relationship-targetId"
          value={targetId}
          onChange={setTargetId}
          options={sims}
          placeholder="Choose sim"
          isSearchable={true}
        />

        <SingleSelect
          name="relationship-type"
          value={relationshipTypeId}
          onChange={setRelationshipTypeId}
          options={relationshipTypes}
          placeholder="Relationship type"
          isSearchable={false}
        />
      </div>

      <button onClick={handleAdd}>Add</button>
    </div>
  );
}
