"use client";

import { ChangeEvent, FormEvent, useEffect, useState } from "react";
import SingleSelect from "@/components/ux/SingleSelect";
import {
  Age,
  AgeId,
  Aspiration,
  AspirationId,
  CareerBranch,
  CareerBranchId,
  LifeState,
  LifeStateId,
  RelationshipType,
  Sim,
  SimAspiration,
  SimCareerBranch,
  SimImage,
  SimRelationship,
  SimTrait,
  Trait,
  TraitId,
} from "@/clients/database";
import { deleteSim, updateSim } from "./actions";
import MultiSelect from "@/components/ux/MultiSelect";
import FileUpload from "@/components/ux/FileUpload";
import Image from "next/image";
import RelationshipField from "./RelationshipField";

export default function AddSimForm({
  ages,
  lifeStates,
  careerBranches,
  relationshipTypes,
  sims,
  infantTraits,
  toddlerTraits,
  childTraits,
  teenTraits,
  adultTraits,
  childAspirations,
  teenAspirations,
  adultAspirations,
  sim,
  simAspirations,
  simTraits,
  simCareerBranches,
  simImages,
  simRelationships,
}: {
  ages: Age[];
  lifeStates: LifeState[];
  careerBranches: CareerBranch[];
  relationshipTypes: RelationshipType[];
  sims: Sim[];
  infantTraits: Trait[];
  toddlerTraits: Trait[];
  childTraits: Trait[];
  teenTraits: Trait[];
  adultTraits: Trait[];
  childAspirations: Aspiration[];
  teenAspirations: Aspiration[];
  adultAspirations: Aspiration[];
  sim: Sim;
  simAspirations: SimAspiration[];
  simTraits: SimTrait[];
  simCareerBranches: SimCareerBranch[];
  simImages: SimImage[];
  simRelationships: SimRelationship[];
}) {
  const [currentSimImageUri] = useState(
    simImages.find((image) => image.ageId === sim.ageId)?.imageUri
  );
  const [imageFile, setImageFile] = useState<File>();
  const [imagePreview, setImagePreview] = useState<string>();

  const [firstName, setFirstName] = useState(sim.firstName);
  const [lastName, setLastName] = useState(sim.lastName);
  const [ageId, setAgeId] = useState<AgeId | undefined>(sim.ageId);
  const [lifeStateId, setLifeStateId] = useState<LifeStateId | undefined>(
    sim.lifeStateId
  );
  const [parent1Id, setParent1Id] = useState<string | undefined>(
    sim.parent1Id ?? undefined
  );
  const [parent2Id, setParent2Id] = useState<string | undefined>(
    sim.parent2Id ?? undefined
  );
  const [lifeStory, setLifeStory] = useState(sim.lifeStory);

  const [isDeceased, setIsDeceased] = useState(sim.isDeceased);
  const [isUnplayed, setIsAbstract] = useState(sim.isUnplayed);

  /* traits */

  const [infantTraitId, setInfantTraitId] = useState<TraitId | undefined>(
    simTraits.find((trait) => trait.ageId === "infant")?.traitId
  );
  const [toddlerTraitId, setToddlerTraitId] = useState<TraitId | undefined>(
    simTraits.find((trait) => trait.ageId === "toddler")?.traitId
  );
  const [childTraitId, setChildTraitId] = useState<TraitId | undefined>(
    simTraits.find((trait) => trait.ageId === "child")?.traitId
  );
  const [teenTraitId, setTeenTraitId] = useState<TraitId | undefined>(
    simTraits.find((trait) => trait.ageId === "teen")?.traitId
  );
  const [adultTraitId, setAdultTraitId] = useState<TraitId | undefined>(
    simTraits.find((trait) => trait.ageId === "young_adult")?.traitId
  );

  /* aspirations */

  const [childAspirationId, setChildAspirationId] = useState<
    AspirationId | undefined
  >(
    simAspirations.find((aspiration) => aspiration.ageId === "child")
      ?.aspirationId
  );

  const [teenAspirationId, setTeenAspirationId] = useState<
    AspirationId | undefined
  >(
    simAspirations.find((aspiration) => aspiration.ageId === "teen")
      ?.aspirationId
  );

  const [adultAspirationIds, setAdultAspirationIds] = useState<AspirationId[]>(
    simAspirations
      .filter((aspiration) => aspiration.ageId === "young_adult")
      .map((aspiration) => aspiration.aspirationId)
  );

  /* career branches */
  const [careerBranchIds, setCareerBranchIds] = useState<CareerBranchId[]>(
    simCareerBranches.map(({ careerBranchId }) => careerBranchId)
  );

  /* relationships */
  const [relationships, setRelationships] = useState<SimRelationship[]>(
    simRelationships.map(
      ({ sourceSimId, targetSimId, relationshipTypeId }) => ({
        sourceSimId: sim.id,
        targetSimId: sourceSimId === sim.id ? targetSimId : sourceSimId,
        relationshipTypeId,
      })
    )
  );

  /* form state */

  const [isSuccessful, setIsSuccessful] = useState(false);
  const [error, setError] = useState("");
  const [isLoading, setLoading] = useState(false);

  useEffect(() => {
    return () => {
      if (imagePreview) {
        URL.revokeObjectURL(imagePreview);
      }
    };
  }, [imagePreview]);

  function handleImageChange(file: File) {
    if (imagePreview) {
      URL.revokeObjectURL(imagePreview);
    }

    setImageFile(file);
    setImagePreview(URL.createObjectURL(file));
  }

  async function handleSubmit(event: FormEvent) {
    event.preventDefault();

    setLoading(true);
    setIsSuccessful(false);
    setError("");

    // TODO
    if (!ageId || !lifeStateId) {
      return;
    }

    await updateSim(sim.id, {
      imageFile,
      firstName,
      lastName,
      ageId,
      parent1Id,
      parent2Id,
      lifeStory,
      lifeStateId,
      isDeceased,
      isUnplayed,
      aspirations: new Array<
        { ageId: AgeId; aspirationId: AspirationId } | undefined
      >(
        childAspirationId && {
          ageId: "child",
          aspirationId: childAspirationId,
        },
        teenAspirationId && {
          ageId: "teen",
          aspirationId: teenAspirationId,
        },
        ...adultAspirationIds.map((aspirationId) => ({
          ageId: "young_adult" as AgeId,
          aspirationId: aspirationId,
        }))
      ).filter((x) => !!x),
      traits: new Array<{ ageId: AgeId; traitId: TraitId } | undefined>(
        infantTraitId && { ageId: "infant", traitId: infantTraitId },
        toddlerTraitId && { ageId: "toddler", traitId: toddlerTraitId },
        childTraitId && { ageId: "child", traitId: childTraitId },
        teenTraitId && { ageId: "teen", traitId: teenTraitId },
        adultTraitId && { ageId: "young_adult", traitId: adultTraitId }
      ).filter((x) => !!x),
      careerBranches: careerBranchIds,
      relationships: relationships,
    })
      .then(() => setIsSuccessful(true))
      .catch((err) => {
        // https://kentcdodds.com/blog/get-a-catch-block-error-message-with-typescript
        let message = "Unknown Error";
        if (err instanceof Error) message = err.message;

        setLoading(false);
        setError(message);
      })
      .finally(() => setLoading(false));
  }

  async function handleDelete() {
    await deleteSim(sim.id);
  }

  return (
    <>
      <h2 className="mb-2">Basic Info</h2>

      {isSuccessful && (
        <div className="alert alert-success mb-4">Updated successfully.</div>
      )}
      {error && <div className="alert alert-error mb-4">{error}</div>}

      {currentSimImageUri && !imagePreview && (
        <Image
          alt="current image"
          src={currentSimImageUri}
          width={100}
          height={100}
          className="mx-auto mb-4"
        />
      )}

      {imagePreview && (
        <Image
          alt="preview image"
          src={imagePreview}
          width={100}
          height={100}
          className="mx-auto mb-4"
        />
      )}

      <form onSubmit={handleSubmit}>
        <div className="text-center mb-4">
          <FileUpload onChange={handleImageChange} id="imageFile" />
        </div>

        <div className="flex gap-2 mb-4">
          <input
            type="text"
            id="first_name"
            required
            placeholder="First"
            value={firstName}
            onChange={(event: ChangeEvent<HTMLInputElement>) =>
              setFirstName(event.currentTarget.value)
            }
            className="flex-1"
            data-1p-ignore
          />
          <input
            type="text"
            id="last_name"
            required
            placeholder="Last"
            value={lastName}
            onChange={(event: ChangeEvent<HTMLInputElement>) =>
              setLastName(event.currentTarget.value)
            }
            className="flex-1"
            data-1p-ignore
          />
        </div>

        <div className="mb-4">
          <SingleSelect
            name="age"
            value={ageId}
            onChange={(newValue) => setAgeId(newValue)}
            options={ages}
            placeholder="Choose age"
            isRequired={true}
          />
        </div>

        <div className="mb-4">
          <SingleSelect
            name="lifeState"
            value={lifeStateId}
            onChange={(newValue) => setLifeStateId(newValue)}
            options={lifeStates}
            placeholder="Choose life state"
            isRequired={true}
          />
        </div>

        <div className="flex gap-2 mb-4">
          <div className="flex-1">
            <SingleSelect
              name="parent1Id"
              value={parent1Id}
              onChange={(newValue) => setParent1Id(newValue)}
              options={sims}
              placeholder="Choose first parent"
              isSearchable={true}
            />
          </div>

          <div className="flex-1">
            <SingleSelect
              name="parent2Id"
              value={parent2Id}
              onChange={(newValue) => setParent2Id(newValue)}
              options={sims}
              placeholder="Choose second parent"
              isSearchable={true}
            />
          </div>
        </div>

        <div className="flex gap-4 mb-4">
          <label className="checkbox">
            <input
              type="checkbox"
              checked={isDeceased}
              onChange={(event: ChangeEvent<HTMLInputElement>) =>
                setIsDeceased(event.currentTarget.checked)
              }
            />
            <span>Deceased</span>
          </label>

          <label className="checkbox">
            <input
              type="checkbox"
              checked={isUnplayed}
              onChange={(event: ChangeEvent<HTMLInputElement>) =>
                setIsAbstract(event.currentTarget.checked)
              }
            />
            <span>Unplayed</span>
          </label>
        </div>

        <h2 className="mb-2">Life Stages</h2>

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
          <MultiSelect
            name="adultAspiration"
            value={adultAspirationIds}
            onChange={(newValue) => setAdultAspirationIds(newValue)}
            options={adultAspirations}
            placeholder="Choose adult aspirations"
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

        <div className="mb-4">
          <div>Relationships</div>

          <RelationshipField
            simId={sim.id}
            value={relationships}
            onChange={setRelationships}
            sims={sims}
            relationshipTypes={relationshipTypes}
          />
        </div>

        <div className="mb-4">
          <label htmlFor="life_story">Life Story</label>
          <textarea
            id="life_story"
            name="life_story"
            rows={10}
            value={lifeStory ?? ""}
            onChange={(event) => setLifeStory(event.target.value)}
          />
        </div>

        <div className="flex justify-between">
          <button type="submit" disabled={isLoading}>
            Save
          </button>

          <button type="button" disabled={isLoading} onClick={handleDelete}>
            Delete
          </button>
        </div>
      </form>
    </>
  );
}
