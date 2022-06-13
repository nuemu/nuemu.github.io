---
layout: post
title:  "Wilhelm Schickardの機械(Draft)"
date:   2022-06-09 0:00:02 +0000
tags: IT考古学
---

参考：[Wilhelm Schickard(1592~1635)とその機械について](https://history-computer.com/wilhelm-schickard-and-the-rotating-clock-complete-history/)

### Schickardの機械
オリジナルの計算機自体は既に失われているが、Keplerとの書簡のやり取りから推測されたものが復元されている。機能としては、加減算を完全に自動的に行い、乗除も部分的には自動的に行うことができたとされる。

以下の内容は、[参考記事](https://history-computer.com/wilhelm-schickard-and-the-rotating-clock-complete-history/#:~:text=Let%E2%80%99s%20examine%20the%20structure%20and%20the%20functioning%20of%20the%20device%2C%20designed%20by%20Schickard%20and%20produced%20by%20Pfister.%20The%20Calculating%20Clock%20is%20composed%20of%203%20main%20parts%3A)の部分意訳である。

>機械は３つのパーツから成り立つ。
>1. 乗算部
>2. 計算過程の記録部
>3. (十進数表記)６桁の加算器
>
>乗算部は６つの内接するネイピアの骨から成り立っている。(下記画像参照)
> ![](https://history-computer.com/MechanicalCalculators/images/SchickardMachineNapierRoads.jpg)

訳注：[ネイピアの骨](https://ja.wikipedia.org/wiki/%E3%83%8D%E3%82%A4%E3%83%94%E3%82%A2%E3%81%AE%E9%AA%A8)は、九九表を記した棒の集まりで、九九を覚えずとも、足し算だけで複数桁$\times$一桁の掛け算が行えるように工夫したもの。

例えば、４の段の棒は、次のようになっている。
<div style="display: flex; justify-content: center;">
<p></p>
<script type="text/tikz">
\begin{tikzpicture}
  \foreach \x in {4}
  {
    \node(\x) at (0.5, 9.5) {\x};
  }
  \foreach \y in {1, 2, 3, 4, 5, 6, 7, 8, 9}
  {
    \node(\y) at (-0.5, 9.5-\y) {\y};
  }
  \foreach \y in {0, 1, 2, 3, 4, 5, 6, 7, 8}
  {
    \draw (0, \y) -> (1, \y);
    \draw (1, \y) -> (1, \y+1);
    \draw (1, \y+1) -> (0, \y+1);
    \draw (0, \y+1) -> (0, \y);
  }
  \foreach \y in {0, 1, 2, 3, 4, 5, 6, 7, 8}
  {
    \foreach \x in {0, 1}
    {
      \draw (\x, \y) -> (\x, \y+1);
    }
  }
  \foreach \y in {0, 1, 2, 3, 4, 5, 6, 7, 8}
  {
    \foreach \x in {0}
    {
      \draw (\x, \y) -> (\x+1, \y+1);
    }
  }

  \foreach \y in {1, 2, 3, 4, 5, 6, 7, 8, 9}
  {
    \pgfmathsetmacro\result{\y * 4 / 10}
    \node(\y) at (0.25, 9.75-\y) {\pgfmathprintnumber[precision=2]{\result}};
  }
\end{tikzpicture}
</script>
</div>
<p></p>

<div style="display: flex; justify-content: center;">
<p></p>
<script type="text/tikz">
\begin{tikzpicture}
  \foreach \x in {1, 2, 3, 4, 5, 6, 7, 8}
  {
    \node(\x) at (\x-0.5, 9.5) {\x};
  }
  \foreach \y in {1, 2, 3, 4, 5, 6, 7, 8, 9}
  {
    \node(\y) at (-0.5, 9.5-\y) {\y};
  }
  \foreach \y in {0, 1, 2, 3, 4, 5, 6, 7, 8}
  {
    \draw (0, \y) -> (8, \y);
    \draw (8, \y) -> (8, \y+1);
    \draw (8, \y+1) -> (0, \y+1);
    \draw (0, \y+1) -> (0, \y);
  }
  \foreach \y in {0, 1, 2, 3, 4, 5, 6, 7, 8}
  {
    \foreach \x in {0, 1, 2, 3, 4, 5, 6, 7}
    {
      \draw (\x, \y) -> (\x, \y+1);
    }
  }
  \foreach \y in {0, 1, 2, 3, 4, 5, 6, 7, 8}
  {
    \foreach \x in {0, 1, 2, 3, 4, 5, 6, 7}
    {
      \draw (\x, \y) -> (\x+1, \y+1);
    }
  }
\end{tikzpicture}
</script>
</div>
<p></p>

残念なことに、その独創的な発明は、生存中あまり知られることなかったようだ。