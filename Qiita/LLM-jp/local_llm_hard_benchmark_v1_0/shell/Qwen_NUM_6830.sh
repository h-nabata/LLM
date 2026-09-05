#!/bin/bash


curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-NUM-P01_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "For a positive integer $a$, let $d(a)$ denote the number of digits in its decimal representation. For two positive integers $x$ and $y$, define the integer obtained by concatenating the decimal representations of $x$ and $y$ in that order by\n\n$$\nC(x,y)=x10^{d(y)}+y.\n$$\n\nAll integers are written in their usual decimal representation without leading zeros.\n\n(1) Let $k\\ge 1$. Suppose that $x$ and $y$ are both positive $k$-digit integers. Determine, as a function of $k$, the number of ordered pairs $(x,y)$ satisfying\n\n$$\nxy\\mid C(x,y).\n$$\n\nFor example,\n\n$$\nC(17,34)=1734=3\\cdot17\\cdot34,\n$$\n\nand\n\n$$\nC(143,143)=143143=7\\cdot143\\cdot143.\n$$\n\n(2) Now allow $x$ and $y$ to have different numbers of digits. For positive integers $x$ and $y$ satisfying\n\n$$\nxy\\mid C(x,y),\n$$\n\ndetermine all possible positive integer values of\n\n$$\n\\frac{C(x,y)}{xy}.\n$$\n\nFor example,\n\n$$\nC(3,15)=315=7\\cdot3\\cdot15,\n$$\n\nso $7$ is one possible value."
    }
  ],
  "reasoning_effort": "low",
  "thinking_budget_tokens": 24576,
  "temperature": 1.0,
  "top_p": 0.95,
  "top_k": 20,
  "min_p": 0.0,
  "presence_penalty": 0.0,
  "repeat_penalty": 1.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-NUM-P02_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Find all quadruples $(x,y,z,w)\\in\\mathbb{C}^4$ satisfying\n\n$$\n\\begin{cases}\n\\dfrac{2x}{1-x^2}=y,\\\\[5pt]\n\\dfrac{2y}{1-y^2}=z,\\\\[5pt]\n\\dfrac{2z}{1-z^2}=w,\\\\[5pt]\n\\dfrac{2w}{1-w^2}=x.\n\\end{cases}\n$$"
    }
  ],
  "reasoning_effort": "low",
  "thinking_budget_tokens": 24576,
  "temperature": 1.0,
  "top_p": 0.95,
  "top_k": 20,
  "min_p": 0.0,
  "presence_penalty": 0.0,
  "repeat_penalty": 1.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-NUM-P03_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Let $n$ be an integer with $n\\ge 2$, and let $m$ be a positive integer with $m<n!$. Prove that there exist a positive integer $k<n$ and distinct positive divisors $d_1,\\ldots,d_k$ of $n!$ such that\n\n$$\nd_1+\\cdots+d_k=m.\n$$"
    }
  ],
  "reasoning_effort": "low",
  "thinking_budget_tokens": 24576,
  "temperature": 1.0,
  "top_p": 0.95,
  "top_k": 20,
  "min_p": 0.0,
  "presence_penalty": 0.0,
  "repeat_penalty": 1.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-NUM-P04_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Find all positive integers $m$, $n$ such that $$m^3+5^n=7^m.$$"
    }
  ],
  "reasoning_effort": "low",
  "thinking_budget_tokens": 24576,
  "temperature": 1.0,
  "top_p": 0.95,
  "top_k": 20,
  "min_p": 0.0,
  "presence_penalty": 0.0,
  "repeat_penalty": 1.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-NUM-P05_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Let $a$ and $b$ be positive integers, and consider the following inequality:\n\n$$\n\\left|\\frac{a}{b}-\\sqrt{7}\\right|<\\frac{2}{b^4}. \\tag{A}\n$$\n\nYou may use the facts that $2.645<\\sqrt{7}<2.646$ and that $\\sqrt{7}$ is irrational.\n\n(1) Suppose that positive integers $a$ and $b$ satisfy inequality $(\\mathrm{A})$ and $b\\ge 2$. Prove that\n\n$$\n\\left|\\frac{a}{b}+\\sqrt{7}\\right|<6.\n$$\n\n(2) Find all pairs of positive integers $(a,b)$ satisfying inequality $(\\mathrm{A})$ with $b\\ge 2$."
    }
  ],
  "reasoning_effort": "low",
  "thinking_budget_tokens": 24576,
  "temperature": 1.0,
  "top_p": 0.95,
  "top_k": 20,
  "min_p": 0.0,
  "presence_penalty": 0.0,
  "repeat_penalty": 1.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-NUM-P06_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Find all pairs of positive integers $(x,y)$ such that\n\n$$\nx^3+y^3=x^2+42xy+y^2.\n$$"
    }
  ],
  "reasoning_effort": "low",
  "thinking_budget_tokens": 24576,
  "temperature": 1.0,
  "top_p": 0.95,
  "top_k": 20,
  "min_p": 0.0,
  "presence_penalty": 0.0,
  "repeat_penalty": 1.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-NUM-P07_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Find all pairs of integers $a,b$ such that\n\n$$\n\\frac{a^2+1}{2b^2-3}=\\frac{a-1}{2b-1}.\n$$"
    }
  ],
  "reasoning_effort": "low",
  "thinking_budget_tokens": 24576,
  "temperature": 1.0,
  "top_p": 0.95,
  "top_k": 20,
  "min_p": 0.0,
  "presence_penalty": 0.0,
  "repeat_penalty": 1.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-NUM-P08_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Determine all triples $(a,b,c)$ of real numbers satisfying\n\n$$\na+\\frac{4}{b}=b+\\frac{4}{c}=c+\\frac{4}{a}.\n$$"
    }
  ],
  "reasoning_effort": "low",
  "thinking_budget_tokens": 24576,
  "temperature": 1.0,
  "top_p": 0.95,
  "top_k": 20,
  "min_p": 0.0,
  "presence_penalty": 0.0,
  "repeat_penalty": 1.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON




