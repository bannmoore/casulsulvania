"use client";

import * as d3 from "d3";
import "./family-tree.css";
import { useEffect, useRef } from "react";
import { buildTree, type Node } from "./family-tree";

const child1: Node = {
  name: "Child1",
  id: "2",
  class: "node",
  textClass: "nodeText",
  children: [],
  cWidth: 100,
  cHeight: 100,
  noParent: false,
};

const child2: Node = {
  name: "Child1",
  id: "3",
  class: "node",
  textClass: "nodeText",
  children: [],
  cWidth: 100,
  cHeight: 100,
  noParent: false,
};

const father: Node = {
  name: "Father",
  id: "1",
  class: "node",
  textClass: "nodeText",
  children: [child1, child2],
  cWidth: 100,
  cHeight: 100,
  noParent: true,
};

const allNodes: Node[] = [father, child1, child2];

export default function FamilyTree() {
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const container = d3.select(containerRef.current);
    const tree = buildTree({
      root: father,
      allNodes,
    });

    container.append(tree);
  });

  return <div ref={containerRef}></div>;
}
