/**
 * Logic adapted from https://github.com/ErikGartner/dTree
 */

import * as d3 from "d3";

export type Node = {
  name: string;
  id: string;
  class: string;
  textClass: string;
  children: Node[];
  cWidth: number;
  cHeight: number;
  noParent: boolean;
};

type Config = {
  containerWidth: number;
  containerHeight: number;
  nodeWidth: number;
};

function drawLine(d: {
  source: { x: number; y: number };
  target: { x: number; y: number };
}) {
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

function drawNode(
  name: string,
  id: string,
  nodeClass: string,
  textClass: string
) {
  return `
  <div style="height:100%;width:100%;" class="${nodeClass}" id="node${id}">
    <p class="${textClass}" align="center">
      ${name}
    </p>
  </div>
  `;
}

function drawLines({
  g,
  data,
}: {
  g: d3.Selection<SVGGElement, unknown, null, undefined>;
  data: d3.HierarchyPointLink<Node>[];
}) {
  g.selectAll(".link")
    .data(data)
    .enter()
    .filter(function (l) {
      return !l.target.data.noParent;
    })
    .append("path")
    .attr("class", "linage")
    .attr("d", drawLine);
}

function drawNodes({
  g,
  data,
}: {
  g: d3.Selection<SVGGElement, unknown, null, undefined>;
  data: d3.HierarchyPointNode<Node>[];
}) {
  g.selectAll(".node")
    .data(data)
    .enter()
    .append("foreignObject")
    .attr("x", function (d) {
      return Math.round(d.x - d.data.cWidth / 2) + "px";
    })
    .attr("y", function (d) {
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
      return drawNode(d.data.name, d.data.id, d.data.class, d.data.textClass);
    });
}

function calculateDimensions(nodes: Node[], width: number) {
  let maxHeight = 0;
  const tmpSvg = document.createElement("svg");
  document.body.appendChild(tmpSvg);

  nodes.forEach(function (n) {
    const container = document.createElement("div");
    container.style.visibility = "hidden";

    const text = drawNode(n.name, "temp", n.class, n.textClass);
    container.innerHTML = text;

    tmpSvg.appendChild(container);
    const height = container.offsetHeight;
    tmpSvg.removeChild(container);

    maxHeight = Math.max(maxHeight, height);
    n.cHeight = height;
    n.cWidth = width;
  });
  document.body.removeChild(tmpSvg);

  return {
    width: width,
    height: maxHeight,
  };
}

function buildD3Containers(config: Config) {
  // Ref: https://stackoverflow.com/questions/44472945/d3-js-and-typescript-compilation-error
  // Ref: https://www.reddit.com/r/d3js/comments/11wf89a/how_to_make_a_call_with_selected_object_instead/
  const container = d3.create("div") as unknown as d3.Selection<
    HTMLDivElement,
    unknown,
    null,
    undefined
  >;

  const svg = container.append("svg").attr("viewBox", [0, 0, 600, 600]);
  const g = svg.append("g");

  const zoom = d3
    .zoom<SVGSVGElement, unknown>()
    .scaleExtent([0.1, 10])
    .on("zoom", function (event) {
      g.attr("transform", event.transform);
    });

  svg
    .call(zoom)
    .call(
      zoom.transform,
      d3.zoomIdentity.translate(config.containerWidth / 2, 25).scale(1)
    );

  return {
    container,
    svg,
    g,
  };
}

function buildD3Tree({
  width,
  height,
  root,
}: {
  width: number;
  height: number;
  root: Node;
}) {
  const tree = d3.tree<Node>().nodeSize([width * 2, height + 25]);

  tree.separation(function separation() {
    return 0.6;
  });

  return tree(d3.hierarchy(root));
}

const defaultConfig = {
  containerWidth: 600,
  containerHeight: 600,
  nodeWidth: 80,
};

export function buildTree({
  root,
  allNodes,
  options = {},
}: {
  root: Node;
  allNodes: Node[];
  options?: Partial<Config>;
}) {
  const config: Config = Object.assign(defaultConfig, options, {});
  const dimensions = calculateDimensions(allNodes, config.nodeWidth);

  const { container, g } = buildD3Containers(config);

  const treeNodes = buildD3Tree({
    root,
    width: dimensions.width,
    height: dimensions.height,
  });

  drawLines({ g, data: treeNodes.links() });
  drawNodes({ g, data: treeNodes.descendants() });

  return () => container.node();
}
