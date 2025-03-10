"use client";

import * as d3 from "d3";
import "./family-tree.css";
import { useEffect } from "react";
import _ from "lodash";

type Node = {
  name: string;
  id: string;
  class: string;
  textClass: string;
  children: Node[];
  cWidth: number;
  cHeight: number;
  noParent: boolean;
};

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

function elbowFn(d: {
  source: { x: number; y: number };
  target: { x: number; y: number };
}) {
  // if (d.target.data.noParent) {
  //   return "M0,0L0,0";
  // }
  const ny = Math.round(d.target.y + (d.source.y - d.target.y) * 0.5);

  const linedata: [number, number][] = [
    [d.target.x, d.target.y],
    [d.target.x, ny],
    [d.source.x, d.source.y],
  ];

  return d3
    .line()
    .curve(d3.curveStepAfter)
    .x(function (d) {
      return d[0];
    })
    .y(function (d) {
      return d[1];
    })(linedata);
}

function textRendererFn(name: string, textClass: string) {
  let node = "";
  node += "<p ";
  node += 'align="center" ';
  node += 'class="' + textClass + '">\n';
  node += name;
  node += "</p>\n";
  return node;
}

function nodeRendererFn(
  name: string,
  id: string,
  nodeClass: string,
  textClass: string,
  textRenderer: typeof textRendererFn
) {
  let node = "";
  node += "<div ";
  node += 'style="height:100%;width:100%;" ';
  node += 'class="' + nodeClass + '" ';
  node += 'id="node' + id + '">\n';
  node += textRenderer(name, textClass);
  node += "</div>";
  return node;
}

function nodeSizeFn(nodes: Node[], width: number) {
  let maxHeight = 0;
  const tmpSvg = document.createElement("svg");
  document.body.appendChild(tmpSvg);

  _.map(nodes, function (n) {
    const container = document.createElement("div");
    // container.setAttribute("class", n.class);
    container.style.visibility = "hidden";
    // container.style.maxWidth = width + "px";

    const text = nodeRendererFn(
      n.name,
      "temp",
      n.class,
      n.textClass,
      textRendererFn
    );
    container.innerHTML = text;

    tmpSvg.appendChild(container);
    const height = container.offsetHeight;
    tmpSvg.removeChild(container);

    maxHeight = Math.max(maxHeight, height);
    n.cHeight = height;
    n.cWidth = width;
  });
  document.body.removeChild(tmpSvg);

  return [width, maxHeight];
}

function nodeHeightSeperationFn(nodeWidth: number, nodeMaxHeight: number) {
  return nodeMaxHeight + 25;
}

export default function FamilyTree() {
  useEffect(() => {
    const width = 600 + 0 + 0;
    const marginTop = 0;

    const nodeWidth = 80;
    const nodeSize = nodeSizeFn(allNodes, nodeWidth);

    const zoom = d3
      .zoom<SVGSVGElement, unknown>()
      .scaleExtent([0.1, 10])
      .on("zoom", function (event) {
        g.attr("transform", event.transform);
      });

    const svg = d3
      .select("#graph")
      .append("svg")
      .attr("viewBox", [0, 0, 600, 600])
      .call(zoom);

    // create svg group that holds all nodes
    const g = svg.append("g");

    svg.call(
      zoom.transform,
      d3.zoomIdentity.translate(width / 2, marginTop).scale(1)
    );

    // Compute the layout.
    const tree = d3
      .tree<Node>()
      .nodeSize([
        nodeSize[0] * 2,
        nodeHeightSeperationFn(nodeSize[0], nodeSize[1]),
      ]);

    tree.separation(function separation() {
      return 0.6;
    });

    // UPDATE
    const hierarchy = d3.hierarchy(father);
    const treenodes = tree(hierarchy);
    const links = treenodes.links();

    // Create the link lines.
    g.selectAll(".link")
      .data(links)
      .enter()
      // filter links with no parents to prevent empty nodes
      .filter(function (l) {
        return !l.target.data.noParent;
      })
      .append("path")
      .attr("class", "linage")
      .attr("d", elbowFn);

    const nodes = g.selectAll(".node").data(treenodes.descendants()).enter();

    // Create the node rectangles.
    nodes
      .append("foreignObject")
      .attr("x", function (d) {
        console.log("x", d.x, Math.round(d.x - d.data.cWidth / 2) + "px");
        return Math.round(d.x - d.data.cWidth / 2) + "px";
      })
      .attr("y", function (d) {
        console.log("y", d.y, Math.round(d.y - d.data.cHeight / 2) + "px");
        return Math.round(d.y - d.data.cHeight / 2) + "px";
      })
      .attr("width", function (d) {
        return d.data.cWidth + "px";
      })
      .attr("height", function (d) {
        return d.data.cHeight + "px";
      })
      .attr("id", function (d) {
        return d.data.id || "uhoh";
      })
      .html(function (d) {
        return nodeRendererFn(
          d.data.name,
          d.data.id,
          d.data.class,
          d.data.textClass,
          textRendererFn
        );
      });
  });

  return <></>;
}
