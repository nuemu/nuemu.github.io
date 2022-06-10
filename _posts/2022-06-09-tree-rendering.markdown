---
layout: post
title:  "木構造を描きたい"
date:   2022-06-09 0:00:03 +0000
tags: 歴史 茶
---

### 標準のリスト
- 茶
  - 不発酵茶
    - 蒸し製
      - 煎茶
        - 普通煎茶
        - 深蒸し煎茶
      - 玉露
      - かぶせ茶
      - 玉緑茶
      - 碾茶
        - 抹茶
      - 番茶
      - (再加工茶)
        - 焙じ茶
        - 玄米茶
    - 釜炒り製
      - 玉緑茶
  - 半発酵茶
    - 包種茶
    - 烏龍茶
  - 発酵茶
    - 紅茶
  - 後発酵茶
    - 漬物茶
    - 中国黒茶

体裁を合わせにくい。MarkdownだとCSS効かせるのも面倒。

### D3の分類木

<div id="app"></div>

<script type="module">

import * as d3 from "https://cdn.skypack.dev/d3@7";
const DATA = {
  name: "茶",
  children: [
    {
      name: "不発酵茶",
      children: [
        {
          name: "蒸し製",
          children: [
            {
              name: "煎茶",
              children: [
                {
                  name: "普通煎茶",
                },
                {
                  name: "深蒸し煎茶",
                },
              ]
            },
            {
              name: "玉露",
            },
            {
              name: "かぶせ茶",
              children: [],
            },
            {
              name: "玉緑茶",
              children: [],
            },
            {
              name: "碾茶",
              children: [
                {
                  name: "抹茶",
                }
              ],
            },
            {
              name: "番茶",
              children: [],
            },
            {
              name: "(再加工茶)",
              children: [
                {
                  name: "焙じ茶"
                },
                {
                  name: "玄米茶"
                }
              ],
            },
          ]
        },
        {
          name: "釜炒り製",
          children: [
            {
              name: "玉緑茶"
            }
          ]
        },
      ]
    },
    {
      name: "半発酵茶",
      children: [
        {
          children: [
            {
              name: "包種茶"
            },
            {
              name: "烏龍茶"
            }
          ]
        }
      ]
    },
    {
      name: "発酵茶",
      children: [
        {
          children: [
            {
              name: "紅茶"
            }
          ]
        }
      ]
    },
    {
      name: "後発酵茶",
      children: [
        {
          children: [
            {
              name: "漬物茶"
            },
            {
              name: "中国黒茶"
            }
          ]
        }
      ]
    }
  ]
}

const width = window.innerWidth;
const height = window.innerWidth;

const tree = (data) => {
  const root = d3.hierarchy(data);
  root.dx = 20;
  root.dy = width / (root.height + 1);
  return d3.tree().nodeSize([root.dx, root.dy])(root);
};

const root = tree(DATA);

const svg = d3.create("svg").attr("viewBox", [0, -height/4, width, height]);

const g = svg
  .append("g")
  .attr("font-family", "sans-serif")
  .attr("font-size", 12)
  .attr("transform", `translate(${root.dx * 2}, ${root.dy})`);

const link = g
  .append("g")
  .attr("fill", "none")
  .attr("stroke", "#555")
  .attr("stroke-opacity", 0.4)
  .attr("stroke-width", 1.5)
  .selectAll("path")
  .data(root.links())
  .join("path")
  .attr(
    "d",
    d3
      .linkHorizontal()
      .x((d) => d.y)
      .y((d) => d.x)
  );

const node = g
  .append("g")
  .attr("stroke-linejoin", "round")
  .attr("stroke-width", 3)
  .selectAll("g")
  .data(root.descendants())
  .join("g")
  .attr("transform", (d) => `translate(${d.y}, ${d.x})`)
  .on("click", (e, d) => clicked(d));

node
  .append("text")
  .attr("x", 0)
  .attr("dy", "0.31em")
  .attr("text-anchor", "end")
  .text((d) => d.data.name)
  .clone(true)
  .lower()
  .attr("stroke", "white");

document.getElementById("app").append(svg.node());

const clicked = (d) => {
  const paths = d3.selectAll("path");
  const ancestors = d.ancestors();
  console.log(paths);
  paths.style("stroke", "#555").style("stroke-opacity", 0.4);

  paths
    .filter((n) => {
      return ancestors.includes(n.target);
    })
    .style("stroke", "red")
    .style("stroke-opacity", 1);
};


</script>

色々調整はできるが、それゆえの面倒臭さを否めない。また、描画が遅い。

### TikZ

<div style="display: flex; justify-content: center;">
<p></p>
<script type="text/tikz">
\begin{tikzpicture}[
  level 1/.style={sibling distance=30mm},
  level 2/.style={sibling distance=10mm}
]
\node {Tea} [grow=right]
  child { node {Unfermented tea}
    child { node {} }
    child { node {} }
  }
  child { node {Semi-fermented tea}
    child { node {} }
  }
  child { node {Fermented tea}
    child { node {} }
  }
  child { node {Post-fermented tea}
    child { node {} }
    child { node {} }
  };
\end{tikzpicture}
</script>
</div>

調整は可能だが、有望ではないので適当に。英語なのは、日本語を混ぜ込めないため。TikZの仕様なのか、SVGの仕様なのか不明。文字コード変換で対応出来るとしても、tikz内でjsのコード無視されるので対応は厳しそう。生物の系統樹とかを書く分にはいいかもしれない。