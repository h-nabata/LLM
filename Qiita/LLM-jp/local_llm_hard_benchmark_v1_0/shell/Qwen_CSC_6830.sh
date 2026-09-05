#!/bin/bash


curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-CSC-P01_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Consider the following unit-capacity min-cost flow network. The left vertices are $A,B,C,D$, the right vertices are $W,X,Y,Z$, and there are source and sink vertices $s,t$.\n\nFor every left vertex $u$, the edge $s\\to u$ has capacity $1$ and cost $0$. For every right vertex $v$, the edge $v\\to t$ has capacity $1$ and cost $0$. Between the left and right sides, every edge has capacity $1$, with costs:\n\n|   | W | X | Y | Z |\n|---|---:|---:|---:|---:|\n| A | 8 | 4 | 6 | 3 |\n| B | 4 | 6 | 4 | 8 |\n| C | 4 | 8 | 5 | 0 |\n| D | 6 | 9 | 5 | 0 |\n\nStarting from zero flow, run the successive shortest augmenting path algorithm until the flow value is $4$.\n\nAfter each augmentation, use the standard residual network: if one unit of flow is sent through an edge of cost $c$, its reverse residual edge has capacity $1$ and cost $-c$. In each round, choose a simple $s$-$t$ residual path of minimum total cost. If several such paths have the same minimum cost, choose the one whose sequence of intermediate vertex labels is lexicographically smallest under\n$A<B<C<D<W<X<Y<Z$.\nAugment one unit along the chosen path.\n\nDetermine all four augmenting paths in order, the residual cost of each path at the time it is chosen, the final matching, and the total cost of the final flow.\n\nOutput only a JSON object with no explanation, in the following form:\n\n{\"augmentations\":[{\"path\":[\"s\",\"...\",\"t\"],\"cost\":integer},...],\"matching\":[[\"A\",\"...\"],[\"B\",\"...\"],[\"C\",\"...\"],[\"D\",\"...\"]],\"total_cost\":integer}\n\nList the final matching in the order $A,B,C,D$."
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
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-CSC-P02_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "A database contains three integer items $X,Y,Z$, initially all equal to $0$. Transactions execute under snapshot isolation with the following exact rules.\n\n- A transaction reads the most recent committed versions that existed at its start time, together with its own private writes.\n- A transaction that attempts to commit succeeds if and only if no transaction that committed after its start time wrote any item in its own write set. Otherwise it aborts and none of its writes become visible.\n- Read-only effects do not cause aborts.\n\nThe execution is:\n\n- $T_1$ starts at time $0$, reads $Y$, and stages $X:=Y+1$.\n- $T_2$ also starts at time $0$, reads $X$, and stages $Y:=X+1$.\n- $T_1$ attempts to commit at time $2$.\n- $T_3$ and $T_4$ both start at time $3$, after the commit attempt of $T_1$ and before any later commit attempt.\n- $T_3$ reads $X$ and $Y$, and stages $Z:=X+Y+1$.\n- $T_4$ reads $Z$, and stages $Y:=Z+2$.\n- $T_4$ attempts to commit at time $4$.\n- $T_3$ attempts to commit at time $5$.\n- $T_2$ attempts to commit at time $6$.\n\nAfter determining which transactions commit, construct a multiversion dependency graph using only committed transactions and the following edge rules.\n\n- wr edge: add $T_i\\to T_j$ if $T_j$ reads a version written by $T_i$.\n- ww edge: add $T_i\\to T_j$ if both committed transactions write the same item and the version written by $T_i$ immediately precedes the version written by $T_j$ in commit order.\n- rw edge: add $T_i\\to T_j$ if $T_i$ reads a version of an item and $T_j$ commits, after $T_i$ has started, a different version of that item that was not visible in $T_i$'s snapshot. The commit of $T_j$ need not occur after the commit of $T_i$.\n\nInitial database versions are not considered to have been written by any transaction and therefore do not themselves generate wr edges.\n\nIf more than one edge type exists for the same ordered pair, list each type separately. A committed execution is serializable for this problem if and only if this dependency graph is acyclic.\n\nDetermine the values returned by every read, the committed transactions in commit-time order, the aborted transactions, the final values of $X,Y,Z$, all dependency edges, and whether the committed execution is serializable.\n\nOutput only a JSON object with no explanation:\n\n{\"reads\":{\"T1.Y\":integer,\"T2.X\":integer,\"T3.X\":integer,\"T3.Y\":integer,\"T4.Z\":integer},\"committed\":[\"...\"],\"aborted\":[\"...\"],\"final\":{\"X\":integer,\"Y\":integer,\"Z\":integer},\"edges\":[\"...\"],\"serializable\":true_or_false}\n\nRepresent an edge as \"Ti>Tj:type\", where type is \"wr\", \"ww\", or \"rw\", and list edges lexicographically."
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
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-CSC-P03_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Consider the following control-flow graph with entry block $B0$ and exit block $B6$.\n\nSuccessor lists:\n\n- $B0: B1$\n- $B1: B2,B5$\n- $B2: B3,B4$\n- $B3: B2$\n- $B4: B1,B5$\n- $B5: B6$\n- $B6:$ no successors\n\nFor the three variables $x,y,z$, the block-level USE and DEF sets are:\n\n| Block | USE | DEF |\n|---|---|---|\n| B0 | $\\varnothing$ | $\\{x,y\\}$ |\n| B1 | $\\{x\\}$ | $\\{z\\}$ |\n| B2 | $\\{y,z\\}$ | $\\{y\\}$ |\n| B3 | $\\{x,y\\}$ | $\\{x\\}$ |\n| B4 | $\\{x,z\\}$ | $\\{x,z\\}$ |\n| B5 | $\\{x,y,z\\}$ | $\\{y\\}$ |\n| B6 | $\\{y\\}$ | $\\varnothing$ |\n\nUse the following standard definitions.\n\n- A block dominates itself.\n- $idom(B)$ is the immediate dominator of $B$.\n- $DF(X)$ is the set of blocks $Y$ such that $X$ dominates some predecessor of $Y$, but $X$ does not strictly dominate $Y$.\n- Backward liveness is defined by\n  $LIVEOUT(B)=\\bigcup_{S\\in succ(B)} LIVEIN(S)$\n  and\n  $LIVEIN(B)=USE(B)\\cup(LIVEOUT(B)-DEF(B))$.\n\nFor SSA construction, the original definition blocks are:\n\n- $x$: $B0,B3,B4$\n- $y$: $B0,B2,B5$\n- $z$: $B1,B4$\n\nFor unpruned SSA, place $\\phi$-functions using the standard iterated-dominance-frontier algorithm.\n\nFor pruned SSA, use the same iteration, but place a $\\phi$-function for variable $v$ at block $B$ only if $v\\in LIVEIN(B)$ according to the liveness solution above. A block at which a $\\phi$-function is actually placed is treated as a new definition block for further iteration.\n\nDetermine the immediate dominators, every dominance frontier, every $LIVEIN$ set, and the $\\phi$-placement sets for both unpruned and pruned SSA.\n\nOutput only a JSON object with no explanation:\n\n{\"idom\":{\"B0\":null,\"B1\":\"...\",\"B2\":\"...\",\"B3\":\"...\",\"B4\":\"...\",\"B5\":\"...\",\"B6\":\"...\"},\"df\":{\"B0\":[...],\"B1\":[...],\"B2\":[...],\"B3\":[...],\"B4\":[...],\"B5\":[...],\"B6\":[...]},\"live_in\":{\"B0\":[...],\"B1\":[...],\"B2\":[...],\"B3\":[...],\"B4\":[...],\"B5\":[...],\"B6\":[...]},\"phi_unpruned\":{\"x\":[...],\"y\":[...],\"z\":[...]},\"phi_pruned\":{\"x\":[...],\"y\":[...],\"z\":[...]}}\n\nSort block names and variable names lexicographically inside every array."
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
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-CSC-P04_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Seven infinitely backlogged flows $f_1,\\ldots,f_7$ share five links $L_1,\\ldots,L_5$. Each flow has a fixed route. Link capacities and the flows using each link are:\n\n- $L_1$: capacity $12$; flows $f_1,f_2,f_3$\n- $L_2$: capacity $10$; flows $f_3,f_4,f_5$\n- $L_3$: capacity $8$; flows $f_1,f_4,f_6$\n- $L_4$: capacity $9$; flows $f_2,f_5,f_6,f_7$\n- $L_5$: capacity $7$; flows $f_3,f_7$\n\nAssume fluid rates and no other constraints.\n\nPart 1: Compute the ordinary max-min fair allocation using progressive filling. Start all rates at $0$. Increase every unfrozen flow at the same rate until at least one link saturates. Freeze every unfrozen flow that uses a newly saturated link, keep frozen rates fixed, and continue with the remaining flows.\n\nPart 2: Compute the weighted max-min fair allocation with weights\n\n$w_1=1,\\ w_2=2,\\ w_3=1,\\ w_4=2,\\ w_5=1,\\ w_6=1,\\ w_7=2$.\n\nFor the weighted case, at each progressive-filling stage increase each unfrozen flow $f_i$ by $w_i\\Delta$ while a common parameter $\\Delta$ increases. When a link saturates, freeze every unfrozen flow using that link and continue.\n\nFor each part, determine the final rate of every flow and the sequence of links that become newly saturated. If multiple links become saturated at exactly the same stage, list those link IDs together in one inner array.\n\nAll fractions must be reduced. Represent every rate as a JSON string, using either an integer such as \"3\" or a reduced fraction such as \"23/8\".\n\nOutput only a JSON object with no explanation:\n\n{\"unweighted\":{\"rates\":{\"f1\":\"...\",\"f2\":\"...\",\"f3\":\"...\",\"f4\":\"...\",\"f5\":\"...\",\"f6\":\"...\",\"f7\":\"...\"},\"saturation\":[[\"...\"],...]},\"weighted\":{\"rates\":{\"f1\":\"...\",\"f2\":\"...\",\"f3\":\"...\",\"f4\":\"...\",\"f5\":\"...\",\"f6\":\"...\",\"f7\":\"...\"},\"saturation\":[[\"...\"],...]}}"
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
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-CSC-P05_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Three processes $P_1,P_2,P_3$ communicate over reliable FIFO channels in both directions between every pair of processes. Each process $P_i$ has a local integer counter $c_i$, initially $0$. Sending or receiving an application message increments the local counter by $1$. Sending or receiving a snapshot marker does not change the counter.\n\nThe Chandy-Lamport snapshot algorithm is used according to the following exact rules.\n\n- When the initiator records its local state, it immediately sends a marker on every outgoing channel before performing any later application event. At the same time, it begins recording application messages arriving on each incoming channel. For each incoming channel, it stops recording that channel when the marker on that channel is received. The messages recorded in this interval constitute the recorded state of that incoming channel.\n- When a non-initiating process receives its first marker, it records its local state and treats the channel on which that first marker arrived as empty in the snapshot. It then immediately sends a marker on every outgoing channel before performing any later application event.\n- For every other incoming channel of that non-initiating process, it records all application messages received after recording its local state and before receiving the marker on that channel.\n- Marker messages themselves are never included in recorded channel states.\n\nNo events occur other than those listed below and the marker sends implied by the algorithm. The following is the actual chronological event order:\n\n1. $P_2$ sends application message $m_1$ to $P_1$.\n2. $P_3$ sends application message $m_2$ to $P_1$.\n3. $P_1$ sends application message $m_3$ to $P_3$.\n4. $P_3$ sends application message $m_4$ to $P_2$.\n5. $P_1$ initiates the snapshot, records its local state, and sends its markers.\n6. $P_2$ sends application message $m_5$ to $P_3$.\n7. $P_3$ receives $m_3$.\n8. $P_2$ receives the marker from $P_1$.\n9. $P_3$ receives the marker from $P_1$.\n10. $P_1$ receives $m_1$.\n11. $P_3$ receives $m_5$.\n12. $P_2$ receives $m_4$.\n13. $P_1$ receives $m_2$.\n14. $P_3$ receives the marker from $P_2$.\n15. $P_2$ receives the marker from $P_3$.\n16. $P_1$ receives the marker from $P_2$.\n17. $P_1$ receives the marker from $P_3$.\n\nDetermine the recorded local counter values and the recorded state of every directed channel. For channel states, list application-message IDs in receive order. Also state whether the resulting snapshot is a consistent cut.\n\nOutput only a JSON object with no explanation:\n\n{\"local\":{\"P1\":integer,\"P2\":integer,\"P3\":integer},\"channels\":{\"P1>P2\":[...],\"P1>P3\":[...],\"P2>P1\":[...],\"P2>P3\":[...],\"P3>P1\":[...],\"P3>P2\":[...]},\"consistent\":true_or_false}"
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
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-CSC-P06_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "A machine uses 16-bit virtual byte addresses and a fixed page size of $256$ bytes. Thus the high-order 8 bits form the virtual page number (VPN) and the low-order 8 bits are the page offset.\n\nThe relevant page-table mappings are:\n\n| VPN | PFN |\n|---|---|\n| 0x10 | 0x3 |\n| 0x11 | 0x7 |\n| 0x12 | 0x3 |\n| 0x13 | 0xB |\n| 0x14 | 0x7 |\n| 0x15 | 0xF |\n\nAll listed pages are resident; there are no page faults. Page-table memory accesses are ignored.\n\nThe TLB is fully associative with 4 entries and exact LRU replacement. It is initially empty. Every TLB hit makes the entry MRU; every TLB miss inserts the translated VPN as MRU and evicts the LRU entry if necessary.\n\nThe L1 data cache is physically addressed and has:\n\n- total capacity $128$ bytes,\n- line size $16$ bytes,\n- $4$ sets,\n- $2$ ways per set,\n- exact LRU replacement within each set,\n- write-back and write-allocate.\n\nThe cache is initially empty. Every cache hit makes the line MRU. A write makes the line dirty. On a miss, the referenced physical cache line is loaded as MRU; if a dirty line is evicted, one write-back is counted.\n\nFor a physical byte address $P$:\n\n- physical block number $=\\lfloor P/16\\rfloor$,\n- set index $=(\\text{physical block number})\\bmod 4$,\n- cache tag $=\\lfloor(\\text{physical block number})/4\\rfloor$.\n\nBecause the cache is physically addressed, two different VPNs mapping to the same PFN access the same physical cache lines when their offsets agree.\n\nThe following accesses occur in order:\n\n1. R 0x1000\n2. W 0x1100\n3. R 0x1200\n4. R 0x1030\n5. W 0x1300\n6. R 0x1400\n7. R 0x1500\n8. W 0x1010\n9. R 0x1210\n10. R 0x1130\n11. W 0x1330\n12. R 0x1530\n13. R 0x1030\n14. R 0x1100\n\nFor each access, determine whether the TLB access is a hit or miss and whether the L1 cache access is a hit or miss. Then determine the total number of dirty write-backs, the final TLB contents from LRU to MRU, and the final contents of every cache set from LRU to MRU.\n\nEncode each access result as a two-letter string: the first letter is the TLB result and the second is the cache result, with H = hit and M = miss.\n\nRepresent each final TLB entry by its VPN as a hexadecimal string. Represent each final cache line as [tag,dirty], where tag is an uppercase hexadecimal string such as \"0x1C\" and dirty is 0 or 1.\n\nOutput only a JSON object with no explanation:\n\n{\"accesses\":[\"..\",...],\"writebacks\":integer,\"tlb_lru_to_mru\":[\"...\"],\"sets\":{\"0\":[...],\"1\":[...],\"2\":[...],\"3\":[...]}}"
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
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-CSC-P07_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Consider the following Hindley-Milner type system.\n\nTypes are generated from:\n\n- base types Int and Bool,\n- type variables,\n- product types,\n- function types.\n\nThe language contains integer literal 0, Boolean literal true, variables, function abstraction \"fun x -> e\", application, pairs \"(e1,e2)\", and nonrecursive let-binding \"let x = e1 in e2\".\n\nUse standard Hindley-Milner inference with the following exact conventions:\n\n- Function parameters are monomorphic.\n- At a let-binding, generalize exactly those type variables in the inferred type of the bound expression that are not free in the current typing environment.\n- There is no value restriction.\n- Let-bindings are nonrecursive.\n- There is no subtyping or overloading.\n- Application associates to the left.\n\nFor each expression below, determine whether it is typable. If it is typable, give its principal type. If it is not typable, write \"UNTYPABLE\".\n\nE1:\nlet f = fun x -> x in\nlet g = f f in\n(g 0, g true)\n\nE2:\nfun f ->\n  let g = fun x -> f (x,x) in\n  (g 0, g true)\n\nE3:\nlet compose = fun f -> fun g -> fun x -> f (g x) in\nfun h -> compose h h\n\nE4:\nfun x ->\n  let k = fun y -> x in\n  (k 0, k true)\n\nE5:\nfun x ->\n  let id = fun y -> y in\n  (id x, id id)\n\nUse the following canonical notation for output types:\n\n- Int and Bool for base types;\n- type variables \"'a\", \"'b\", ... in order of first occurrence;\n- product type \"(T1*T2)\";\n- function type \"(T1->T2)\";\n- fully parenthesize every product and function type.\n\nTypes that differ only by renaming type variables are considered the same, but your output must use the canonical variable names specified above.\n\nOutput only a JSON object with no explanation:\n\n{\"E1\":\"...\",\"E2\":\"...\",\"E3\":\"...\",\"E4\":\"...\",\"E5\":\"...\"}"
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
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-CSC-P08_Qwen38.log
{
  "messages": [
    {
      "role": "user",
      "content": "Write a complete Python 3 program for the following problem.\n\nAn undirected graph has vertices $1,\\ldots,n$ and initially has no edges. Then $q$ operations are performed sequentially.\n\nOperations are:\n\n+ u v\n: Add the undirected edge $\\{u,v\\}$. The edge becomes active immediately and remains active until a later removal operation for the same edge.\n\n- u v\n: Remove the currently active edge $\\{u,v\\}$. The edge becomes inactive immediately.\n\n? u v\n: Answer a query using exactly the graph state that exists at this point in the operation sequence.\n\nThe input is guaranteed to satisfy:\n\n- $1\\le n,q\\le200000$;\n- $1\\le u,v\\le n$ and $u\\ne v$;\n- an edge is never added while it is already active;\n- an edge is never removed while it is inactive;\n- there is at most one active copy of any unordered edge.\n\nFor a query \"? u v\", output exactly one of the following:\n\n- DISCONNECTED, if $u$ and $v$ are in different connected components;\n- CONTRADICTION, if $u$ and $v$ are in the same connected component but that component is not bipartite;\n- SAME, if $u$ and $v$ are in the same bipartite connected component and every proper 2-coloring assigns them the same color;\n- DIFFERENT, if $u$ and $v$ are in the same bipartite connected component and every proper 2-coloring assigns them different colors.\n\nIf $u$ and $v$ are disconnected, output DISCONNECTED even if one or both of their separate components are non-bipartite.\n\nResource limits:\n\n- Time limit: 8 seconds.\n- Memory limit: 512 MiB.\n\nThe program must handle the maximum constraints within these limits. Third-party libraries are not allowed.\n\nSample input:\n\n5 13\n+ 1 2\n+ 2 3\n? 1 3\n+ 3 1\n? 1 2\n- 3 1\n? 1 3\n+ 4 5\n? 1 5\n+ 3 4\n? 1 5\n+ 1 5\n? 2 4\n\nSample output:\n\nSAME\nCONTRADICTION\nSAME\nDISCONNECTED\nSAME\nCONTRADICTION\n\nOutput only the complete Python 3 program source code, with no Markdown code fences and no explanation."
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


