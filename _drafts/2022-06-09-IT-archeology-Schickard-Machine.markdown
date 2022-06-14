---
layout: post
title:  "Wilhelm Schickardの機械"
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

<details>
<summary>
  訳注：<a href="https://ja.wikipedia.org/wiki/%E3%83%8D%E3%82%A4%E3%83%94%E3%82%A2%E3%81%AE%E9%AA%A8">ネイピアの骨</a>は、九九表を記した棒の集まりで、九九を覚えずとも、足し算だけで複数桁$\times$一桁の掛け算が行えるように工夫したもの。
</summary>
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
    \pgfmathsetmacro\result{floor(\y * 4 / 10)}
    \node(\y) at (0.25, 9.75-\y) {\pgfmathprintnumber[precision=2]{\result}};
  }
  \foreach \y in {1, 2, 3, 4, 5, 6, 7, 8, 9}
  {
    \pgfmathsetmacro\result{\y * 4 - floor(\y * 4 / 10) * 10}
    \node(\y) at (0.75, 9.25-\y) {\pgfmathprintnumber[precision=2]{\result}};
  }
\end{tikzpicture}
</script>
</div>
<p></p>
掛け算結果の1の位と10の位を斜め棒で分けている。試しに、$456\times 7$を計算してみる。下のように$456$の棒を並べる。
<div style="display: flex; justify-content: center;">
<p></p>
<script type="text/tikz">
\begin{tikzpicture}
  \def\xarray{0, 1, 2}
  \def\yarray{0, 1, 2, 3, 4, 5, 6, 7, 8}
  \foreach \x in \xarray
  {
    \pgfmathsetmacro\sum{\x+4}
    \node(\x) at (\x+0.5, 9.5) {\pgfmathprintnumber{\sum}};
  }
  \foreach \y in \yarray
  {
    \pgfmathsetmacro\sum{\y+1}
    \node(\y) at (-0.5, 8.5-\y) {\pgfmathprintnumber{\sum}};
  }
  \foreach \y in \yarray
  {
    \draw (0, \y) -> (3, \y);
    \draw (3, \y) -> (3, \y+1);
    \draw (3, \y+1) -> (0, \y+1);
    \draw (0, \y+1) -> (0, \y);
  }
  \foreach \y in \yarray
  {
    \foreach \x in \xarray
    {
      \draw (\x, \y) -> (\x, \y+1);
    }
  }
  \foreach \y in \yarray
  {
    \foreach \x in \xarray
    {
      \draw (\x, \y) -> (\x+1, \y+1);
    }
  }
  \foreach \x in \xarray
  {
    \foreach \y in \yarray
    {
      \pgfmathsetmacro\result{floor((\y+1) * (\x+4) / 10)}
      \node(\y+1) at (\x+0.25, 8.75-\y) {\pgfmathprintnumber[precision=2]{\result}};
      \pgfmathsetmacro\result{(\y+1) * (\x+4) - floor((\y+1) * (\x+4) / 10) * 10}
      \node(\y+1) at (\x+0.75, 8.25-\y) {\pgfmathprintnumber[precision=2]{\result}};
    }
  }
\end{tikzpicture}
</script>
</div>
<p></p>
$7$の行を抜き出せば
<div style="display: flex; justify-content: center;">
<p></p>
<script type="text/tikz">
\begin{tikzpicture}
  \def\xarray{0, 1, 2}
  \def\yarray{0}
  \foreach \x in \xarray
  {
    \pgfmathsetmacro\sum{\x+4}
    \node(\x) at (\x+0.5, 1.5) {\pgfmathprintnumber{\sum}};
  }
  \foreach \y in \yarray
  {
    \pgfmathsetmacro\sum{\y+7}
    \node(\y) at (-0.5, 0.5-\y) {\pgfmathprintnumber{\sum}};
  }
  \foreach \y in \yarray
  {
    \draw (0, \y) -> (3, \y);
    \draw (3, \y) -> (3, \y+1);
    \draw (3, \y+1) -> (0, \y+1);
    \draw (0, \y+1) -> (0, \y);
  }
  \foreach \y in \yarray
  {
    \foreach \x in \xarray
    {
      \draw (\x, \y) -> (\x, \y+1);
    }
  }
  \foreach \y in \yarray
  {
    \foreach \x in \xarray
    {
      \draw (\x, \y) -> (\x+1, \y+1);
    }
  }
  \foreach \x in \xarray
  {
    \foreach \y in \yarray
    {
      \pgfmathsetmacro\result{floor((\y+7) * (\x+4) / 10)}
      \node(\y+1) at (\x+0.25, 0.75-\y) {\pgfmathprintnumber[precision=2]{\result}};
      \pgfmathsetmacro\result{(\y+7) * (\x+4) - floor((\y+7) * (\x+4) / 10) * 10}
      \node(\y+1) at (\x+0.75, 0.25-\y) {\pgfmathprintnumber[precision=2]{\result}};
    }
  }
\end{tikzpicture}
</script>
</div>
<p></p>
斜線で区切られた数字通しを足し合わせて
<div style="display: flex; justify-content: center;">
<p></p>
<script type="text/tikz">
\begin{tikzpicture}
  \def\xarray{0, 1, 2}
  \def\yarray{0}
  \foreach \x in \xarray
  {
    \pgfmathsetmacro\sum{\x+4}
    \node(\x) at (\x+0.5, 1.5) {\pgfmathprintnumber{\sum}};
  }
  \foreach \y in \yarray
  {
    \pgfmathsetmacro\sum{\y+7}
    \node(\y) at (-0.5, 0.5-\y) {\pgfmathprintnumber{\sum}};
  }
  \foreach \y in \yarray
  {
    \draw (0, \y) -> (3, \y);
    \draw (3, \y) -> (3, \y+1);
    \draw (3, \y+1) -> (0, \y+1);
    \draw (0, \y+1) -> (0, \y);
  }
  \foreach \y in \yarray
  {
    \foreach \x in \xarray
    {
      \draw (\x, \y) -> (\x, \y+1);
    }
  }
  \foreach \y in \yarray
  {
    \foreach \x in \xarray
    {
      \draw (\x, \y) -> (\x+1, \y+1);
    }
  }
  \foreach \x in \xarray
  {
    \foreach \y in \yarray
    {
      \pgfmathsetmacro\result{floor((\y+7) * (\x+4) / 10)}
      \node(\y+1) at (\x+0.25, 0.75-\y) {\pgfmathprintnumber[precision=2]{\result}};
      \pgfmathsetmacro\result{(\y+7) * (\x+4) - floor((\y+7) * (\x+4) / 10) * 10}
      \node(\y+1) at (\x+0.75, 0.25-\y) {\pgfmathprintnumber[precision=2]{\result}};
    }
  }
  \draw[->] (-1+0.5, -0.125) -> (-1+0, -0.625);
  \node(1) at (-1-0.25, -1) {2};
  \draw[->] (0.5, -0.125) -> (0, -0.625);
  \node(1) at (-0.25, -1) {11};
  \draw[->] (1+0.5, -0.125) -> (1+0, -0.625);
  \node(1) at (1-0.25, -1) {9};
  \draw[->] (2+0.5, -0.125) -> (2+0, -0.625);
  \node(1) at (2-0.25, -1) {2};
\end{tikzpicture}
</script>
</div>
<p></p>
10の位を繰り上げれば、$456\times 7=3192$として$1*n$桁の掛け算を足し算のみで計算できる。要するに、我々の筆算の表記を変えただけでなので、$m\times n$桁も各桁をずらしながら同じように計算した後足し合わせれば良い。
</details>

<p></p>

>乗算したい数値の各桁に対応するネイピアの骨が前面にくるように上部のノブを回す。
>前面は、1~9に対応する9枚の左右に稼働する窓付きプレートで覆われており、掛けたい数値のプレートを動かしながら、窓を覗くことで結果を確認することができるようになっている。


>記録部(下記画像)は下部に付属しており、6つのノブとそれぞれに対応する小窓でできている。位上がりには対応しておらず、計算部とも連携していない。
>
>![mechanism for recording](https://history-computer.com/MechanicalCalculators/images/SchickardMachineRecordingDevice.jpg)

>加算部は

残念なことに、その独創的な発明は、生存中あまり知られることなかったようだ。