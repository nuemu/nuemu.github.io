---
layout: post
title:  "TikZが欲しい"
date:   2022-06-08 02:44:50 +0000
tags: 雑記 日記
---

$\KaTeX$はTikZサポートしてないのが辛い。TikZはかなり巨大なパッケージらしいので仕方ないが...[TikzJax](https://tikzjax.com/)はHTTPSで利用するのに課題があるらしいが試験的に埋め込んでみた。

<script type="text/tikz">
\begin{tikzpicture}
  \draw (0,0) circle (1in);
\end{tikzpicture}
</script>

パフォーマンス含めて、図の利用はSVG化するかPDFで貼り付けるかの運用にしたほうが良いのだろう。

scriptタグの前に空行を開けておかないとUnreachableエラーで描画できないことが起きる。Markdownとの干渉だろうか？しかし、このページの例では特に問題ない...
