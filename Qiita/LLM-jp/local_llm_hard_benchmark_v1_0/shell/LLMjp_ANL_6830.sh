#!/bin/bash


curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-ANL-P01_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Let $f:\\mathbb{R}\\to\\mathbb{R}$ be defined by\n\n$$\nf(x)=\\int_x^{x+1}\\log(4t^2+1)\\,dt,\n$$\n\nwhere $\\log$ denotes the natural logarithm.\n\nAnswer the following questions.\n\n(1) Determine all real values of $x$ at which $f(x)$ has a local extremum. Classify each extremum as a local maximum or local minimum, and determine the corresponding value of $f(x)$.\n\n(2) Evaluate the limit\n\n$$\n\\lim_{x\\to\\infty} x\\left(f(x)-f(x-1)\\right).\n$$"
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-ANL-P02_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Answer the following problems.\n\n(1) Let $a$ be one of the vertices of a regular octahedron. At time $0$, an ant is at vertex $a$. Every second, the ant moves to one of the four vertices adjacent to its current vertex, choosing each with equal probability. For a nonnegative integer $t$, find, as a function of $t$, the probability that the ant is at vertex $a$ after $t$ seconds.\n\n(2) Let $a$ be one of the vertices of a regular icosahedron. At time $0$, an ant is at vertex $a$. Every second, the ant moves to one of the five vertices adjacent to its current vertex, choosing each with equal probability. For a nonnegative integer $t$, find, as a function of $t$, the probability that the ant is at vertex $a$ after $t$ seconds."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-ANL-P03_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "In three-dimensional coordinate space, let $A(1,0,0)$, $B(0,1,0)$, $C(0,0,1)$, and let $D$ be the midpoint of the line segment $AC$.\n\nFind the volume of the solid obtained by rotating the triangle $ABD$, including its boundary and interior, through one full revolution about the $x$-axis."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-ANL-P04_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Let $ABC$ be an acute triangle with orthocenter $H$ and circumcircle $k$. Let $S$ be the intersection point of the tangents to $k$ at points $A$ and $B$, let $M$ be the midpoint of $AB$, and let $H'$ be the reflection of $H$ with respect to $AB$. Let $P$ be the intersection point of the line $MH$ with the circumcircle $k$ such that $H$ lies between $M$ and $P$. Prove that the points $S$, $H'$, and $P$ are collinear."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-ANL-P05_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "In the plane, determine the minimum possible side length of an equilateral triangle satisfying the following condition:\n\n(*) There exists a square of side length $1$ such that all four of its vertices lie either inside the equilateral triangle or on its boundary."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-ANL-P06_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Let $ABC$ be a triangle with circumcircle $O$, and let $D$ be a point on the ray $BA$. Let $E$ and $F$ be points on $O$ such that $DE$ and $DF$ are tangent to $O$, and let $EF$ intersect $AC$ at $T\\ne C$. Let $P\\ne B,C$ be a point on the arc $BC$ not containing $A$, and let $DP$ meet $O$ again at $Q\\ne P$. Let $X\\ne Q$ be the intersection of $BQ$ and $DT$, and let $PT$ meet $O$ again at $Y\\ne P$. Prove that $C$, $X$, and $Y$ are collinear."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-ANL-P07_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Determine the range of real numbers $k$ for which the equation\n\n$$\n6\\int_0^2\\left|x^2-a\\right|\\,dx=a^2-2a+k\n$$\n\nhas exactly four real solutions $a$."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-ANL-P08_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Let $N\\ge 4$ be an integer. Determine all values of $N$ for which there exists a simple orthogonal $N$-gon whose consecutive side lengths, in cyclic order, are\n\n$$\n1,2,3,\\ldots,N.\n$$\n\nHere, a simple orthogonal polygon means a non-self-intersecting polygon in which every side is horizontal or vertical and every pair of consecutive sides is perpendicular."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON




