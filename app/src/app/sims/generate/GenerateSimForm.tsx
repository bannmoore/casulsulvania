"use client";

import { useState } from "react";
import SingleSelect from "@/components/ux/SingleSelect";
import {
  Age,
  Aspiration,
  AspirationId,
  CareerBranch,
  CareerBranchId,
  LifeState,
  Sim,
  Trait,
  TraitConflict,
  TraitId,
} from "@/clients/database";
import MultiSelect from "@/components/ux/MultiSelect";
import { getRandomIndex } from "@/util/random";

export default function GenerateSimForm({
  careerBranches,
  infantTraits,
  toddlerTraits,
  childTraits,
  teenTraits,
  adultTraits,
  childAspirations,
  teenAspirations,
  adultAspirations,
  traitConflicts,
}: {
  ages: Age[];
  lifeStates: LifeState[];
  careerBranches: CareerBranch[];
  sims: Sim[];
  infantTraits: Trait[];
  toddlerTraits: Trait[];
  childTraits: Trait[];
  teenTraits: Trait[];
  adultTraits: Trait[];
  childAspirations: Aspiration[];
  teenAspirations: Aspiration[];
  adultAspirations: Aspiration[];
  traitConflicts: TraitConflict[];
}) {
  /* traits */
  const [invalidTraits, setInvalidTraits] = useState<Trait[]>([]);
  const [infantTraitId, setInfantTraitId] = useState<TraitId>();
  const [toddlerTraitId, setToddlerTraitId] = useState<TraitId>();
  const [childTraitId, setChildTraitId] = useState<TraitId>();
  const [teenTraitId, setTeenTraitId] = useState<TraitId>();
  const [adultTraitId, setAdultTraitId] = useState<TraitId>();

  /* aspirations */
  const [childAspirationId, setChildAspirationId] = useState<AspirationId>();
  const [teenAspirationId, setTeenAspirationId] = useState<AspirationId>();
  const [adultAspirationId, setAdultAspirationId] = useState<AspirationId>();

  /* career branches */
  const [careerBranchIds, setCareerBranchIds] = useState<CareerBranchId[]>([]);

  /* form state */
  function getRandomElement<T>(array: T[]): T {
    return array[getRandomIndex(array.length)];
  }

  function generateRandomSim() {
    if (!childTraits.length || !teenTraits.length || !adultTraits.length) {
      console.error("Missing trait data.");
      return;
    }

    // Reset form state
    setInvalidTraits([]);
    setChildAspirationId(undefined);
    setTeenAspirationId(undefined);
    setAdultAspirationId(undefined);
    setCareerBranchIds([]);

    // Generate random traits based on age
    if (infantTraits.length > 0)
      setInfantTraitId(getRandomElement(infantTraits).id);
    if (toddlerTraits.length > 0)
      setToddlerTraitId(getRandomElement(toddlerTraits).id);

    // Generate valid combination of child->adult traits
    let invalidTraitIds: TraitId[] = [];

    const childTrait = getRandomElement(childTraits);
    setChildTraitId(childTrait.id);
    invalidTraitIds = invalidTraitIds.concat(
      traitConflicts
        .filter((tc) => tc.traitId === childTrait.id)
        .map((tc) => tc.conflictTraitId)
    );

    const validTeenTraits = teenTraits.filter(
      (t) => t.id !== childTrait.id && !invalidTraitIds.includes(t.id)
    );
    const teenTrait = getRandomElement(validTeenTraits);
    setTeenTraitId(teenTrait.id);
    invalidTraitIds = invalidTraitIds.concat(
      traitConflicts
        .filter((tc) => tc.traitId === teenTrait.id)
        .map((tc) => tc.conflictTraitId)
    );

    const validAdultTraits = adultTraits.filter(
      (t) =>
        t.id !== childTrait.id &&
        t.id !== teenTrait.id &&
        !invalidTraitIds.includes(t.id)
    );
    const adultTrait = getRandomElement(validAdultTraits);
    setAdultTraitId(adultTrait.id);
    invalidTraitIds = invalidTraitIds.concat(
      traitConflicts
        .filter((tc) => tc.traitId === adultTrait.id)
        .map((tc) => tc.conflictTraitId)
    );
    setInvalidTraits(
      invalidTraitIds
        .map((id) => adultTraits.find((t) => t.id === id))
        .filter((x) => !!x)
    );

    // Generate random aspirations
    if (childAspirations.length > 0)
      setChildAspirationId(getRandomElement(childAspirations).id);
    if (teenAspirations.length > 0)
      setTeenAspirationId(getRandomElement(teenAspirations).id);
    if (adultAspirations.length > 0)
      setAdultAspirationId(getRandomElement(adultAspirations).id);

    // Generate random career branch
    const shuffledCareers = [...careerBranches].sort(() => Math.random() - 0.5);
    setCareerBranchIds(shuffledCareers.slice(0, 1).map((cb) => cb.id));
  }

  return (
    <>
      <div className="mb-4">
        <button
          type="button"
          onClick={generateRandomSim}
          className="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded"
        >
          Randomize!
        </button>
      </div>

      <form onSubmit={() => {}}>
        {/* INFANT */}
        <h3 className="mb-4">Infant</h3>
        <div className="mb-4">
          <SingleSelect
            name="infantTrait"
            value={infantTraitId}
            onChange={(newValue) => setInfantTraitId(newValue)}
            options={infantTraits}
            placeholder="Choose infant trait"
            isSearchable={true}
          />
        </div>

        {/* TODDLER */}
        <h3 className="mb-4">Toddler</h3>
        <div className="mb-4">
          <SingleSelect
            name="toddlerTrait"
            value={toddlerTraitId}
            onChange={(newValue) => setToddlerTraitId(newValue)}
            options={toddlerTraits}
            placeholder="Choose toddler trait"
            isSearchable={true}
          />
        </div>

        {/* Child */}
        <h3 className="mb-4">Child</h3>
        <div className="mb-4">
          <SingleSelect
            name="childTrait"
            value={childTraitId}
            onChange={(newValue) => setChildTraitId(newValue)}
            options={childTraits}
            placeholder="Choose child trait"
            isSearchable={true}
          />
        </div>
        <div className="mb-4">
          <SingleSelect
            name="childAspiration"
            value={childAspirationId}
            onChange={(newValue) => setChildAspirationId(newValue)}
            options={childAspirations}
            placeholder="Choose child aspiration"
            isSearchable={true}
          />
        </div>

        {/* Teen */}
        <h3 className="mb-4">Teen</h3>
        <div className="mb-4">
          <SingleSelect
            name="teenTrait"
            value={teenTraitId}
            onChange={(newValue) => setTeenTraitId(newValue)}
            options={teenTraits}
            placeholder="Choose teen trait"
            isSearchable={true}
          />
        </div>
        <div className="mb-4">
          <SingleSelect
            name="teenAspiration"
            value={teenAspirationId}
            onChange={(newValue) => setTeenAspirationId(newValue)}
            options={teenAspirations}
            placeholder="Choose teen aspiration"
            isSearchable={true}
          />
        </div>

        {/* Adult */}
        <h3 className="mb-4">Adult</h3>
        <div className="mb-4">
          <SingleSelect
            name="adultTrait"
            value={adultTraitId}
            onChange={(newValue) => setAdultTraitId(newValue)}
            options={adultTraits}
            placeholder="Choose adult trait"
            isSearchable={true}
          />
        </div>
        <div className="mb-4">
          <SingleSelect
            name="adultAspiration"
            value={adultAspirationId}
            onChange={(newValue) => setAdultAspirationId(newValue)}
            options={adultAspirations}
            placeholder="Choose adult aspiration"
            isSearchable={true}
          />
        </div>

        <div className="mb-4">
          <MultiSelect
            name="careerBranches"
            value={careerBranchIds}
            onChange={(newValue) => setCareerBranchIds(newValue)}
            options={careerBranches}
            placeholder="Choose careers"
            isSearchable={true}
          />
        </div>

        {!!invalidTraits.length && (
          <>
            <h2>Conflicting Traits</h2>
            {invalidTraits.map((t) => (
              <div key={t.id}>{t.name}</div>
            ))}
          </>
        )}
      </form>
    </>
  );
}
