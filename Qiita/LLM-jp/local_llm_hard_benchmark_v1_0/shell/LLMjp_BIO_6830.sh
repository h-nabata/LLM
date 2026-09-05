#!/bin/bash

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-BIO-P01_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "A mammalian gene X is induced by ligand L. Two cis-regulatory elements are suspected to contribute independently to the response: an enhancer E and a sequence U in the 3' untranslated region. A transcription factor A binds E, whereas an RNA-binding protein B binds U.\n\nNascent RNA was measured with an intronic probe and is assumed to be proportional to the transcription rate. Mature mRNA abundance and mRNA half-life were measured independently. For this problem, treat all measurements as steady-state measurements and assume that the first-order degradation approximation is valid.\n\nThe untreated wild-type condition is normalized to 1.0.\n\n| Condition | Nascent RNA (fold) | mRNA half-life, $t_{1/2}$ (min) | Mature mRNA (fold) |\n| --- | ---: | ---: | ---: |\n| WT, no L | 1.0 | 30 | 1.0 |\n| WT + L | 8.0 | 120 | 32 |\n| $aE$ + L | 2.0 | 120 | 8.0 |\n| $U^*$ + L | 8.0 | 30 | 8.0 |\n| $aE U^*$ + L | 2.0 | 30 | 2.0 |\n| A depleted + L | 1.2 | 118 | 4.7 |\n| B depleted + L | 7.8 | 32 | 8.3 |\n\nHere, $U^*$ is a mutation that prevents B from binding U but does not alter the coding sequence, polyadenylation site, or transcription termination.\n\nAssume that mature mRNA abundance satisfies\n\n$M \\propto k_{\\mathrm{syn}}/k_{\\mathrm{deg}}$\n\nand that\n\n$k_{\\mathrm{deg}} = \\ln(2)/t_{1/2}$.\n\nAnswer all of the following.\n\n1. Derive an expression for the expected fold change in steady-state mature mRNA relative to untreated WT in terms of the measured nascent-RNA fold change and $t_{1/2}$. Verify quantitatively that the first five rows are mutually consistent with the model.\n\n2. Based only on these data, infer the primary roles of E, U, factor A, and factor B. Distinguish effects on transcription from effects on mRNA degradation.\n\n3. Assume that depletion of A and depletion of B act independently and that simultaneous depletion gives the transcription rate observed with A depletion and the mRNA half-life observed with B depletion. Predict the mature-mRNA fold change after simultaneous depletion of A and B in the presence of L.\n\n4. A researcher measures only mature mRNA and observes an eightfold induction by L in an unknown mutant. Explain why this observation alone cannot distinguish between an approximately eightfold increase in transcription and a smaller transcriptional increase combined with increased mRNA stability. Name one experimental measurement that would distinguish the two mechanisms and explain what it measures.\n\nGive quantitative reasoning where appropriate and explicitly separate conclusions directly supported by the data from assumptions used in the calculation."
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
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-BIO-P02_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "A eukaryotic gene contains six exons. Its normal translation termination codon is located in exon 6. For this problem, use the following simplified rule for nonsense-mediated mRNA decay (NMD):\n\nA translation termination codon triggers NMD if it lies more than 50 nucleotides upstream of at least one exon-exon junction remaining in the mature mRNA.\n\nAssume that exon-junction complexes are deposited normally, transcription rates are identical among all constructs, translation initiation rates are identical unless explicitly stated otherwise, and no other RNA-surveillance pathway is relevant.\n\nThe following constructs were analyzed.\n\nWT: the normal termination codon in exon 6.\n\nConstruct A: a premature termination codon, PTC, is introduced in exon 4, 90 nucleotides upstream of the exon 4-exon 5 junction.\n\nConstruct B: the same PTC as in A is present, but exon 5 is skipped. In the resulting mature RNA, the PTC lies 35 nucleotides upstream of the exon 4-exon 6 junction. Exon skipping does not otherwise alter RNA stability.\n\nConstruct C: a PTC is introduced in exon 6, 80 nucleotides upstream of the normal termination codon. There is no exon-exon junction downstream of this PTC.\n\nConstruct D: identical to construct A, but UPF1 is strongly depleted.\n\nMeasured mRNA half-lives are:\n\n| Construct | $t_{1/2}$ (min) |\n| --- | ---: |\n| WT | 180 |\n| A | 24 |\n| B | 165 |\n| C | 170 |\n| D | 155 |\n\nAnswer all of the following.\n\n1. For each of A, B, and C, predict whether the transcript should be an NMD substrate according to the rule given above. Explain how alternative splicing changes the NMD status of B relative to A.\n\n2. Assuming equal transcription rates and first-order degradation, calculate the expected steady-state mRNA abundance of A, B, C, and D relative to WT. Use $M \\propto t_{1/2}$ under the stated assumptions.\n\n3. Explain why depletion of UPF1 strongly stabilizes construct A. Then predict what should happen to the abundance of the truncated protein encoded by A after UPF1 depletion, assuming that the truncated polypeptide itself is stable.\n\n4. A short treatment with a translation-elongation inhibitor is applied immediately before an RNA-decay experiment. Predict the qualitative effect on the measured decay of construct A and explain why NMD is translation-dependent.\n\n5. Finally, consider a mutant cell in which exon-junction-complex deposition is abolished but transcription, splicing, nuclear export, and translation are otherwise normal. Predict qualitatively the mRNA abundance and truncated-protein production from construct A. State clearly which part of your answer follows from the simplified NMD rule and which part requires the additional assumptions given in the problem."
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
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-BIO-P03_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "Consider a bacterial biosynthetic operon regulated by transcription attenuation in its leader region. Transcription from the promoter itself occurs at the same rate under all conditions in this problem, so only attenuation needs to be considered.\n\nThe leader RNA contains four consecutive sequence regions, designated 1, 2, 3, and 4. The following mutually exclusive RNA structures can form:\n\n- region 1 can pair with region 2;\n- region 2 can pair with region 3;\n- region 3 can pair with region 4.\n\nThe 3-4 structure is an intrinsic transcription terminator. The 2-3 structure is an antiterminator and prevents formation of the 3-4 terminator.\n\nA short leader peptide is translated while the leader RNA is being transcribed. Region 1 contains two adjacent tryptophan codons. Assume the following behavior.\n\nWhen charged $tRNA^{Trp}$ is abundant, the ribosome rapidly translates through the tryptophan codons and occupies region 2 when region 3 becomes available.\n\nWhen charged $tRNA^{Trp}$ is scarce, the ribosome stalls at the tryptophan codons in region 1, leaving region 2 available to pair with region 3.\n\nAll other charged tRNAs are abundant unless stated otherwise.\n\nFor each genotype below, predict whether transcription of the downstream structural genes will be predominantly HIGH or LOW under both high-tryptophan and low-tryptophan conditions.\n\nGenotypes:\n\nA. WT.\n\nB. The start codon of the leader peptide is destroyed, so no ribosome initiates translation of the leader.\n\nC. The two tryptophan codons are replaced by phenylalanine codons. Charged $tRNA^{Phe}$ remains abundant even under low-tryptophan conditions.\n\nD. Region 4 is mutated so that the 3-4 terminator cannot form, while all other pairings remain possible.\n\nE. Region 2 is mutated specifically so that 2-3 pairing cannot occur, while 1-2 and 3-4 pairing remain possible.\n\nAnswer all of the following.\n\n1. Construct a table giving HIGH or LOW downstream transcription for genotypes A-E under high and low tryptophan.\n\n2. For each genotype, explain the ribosome position and the RNA secondary structure that determine the result.\n\n3. Explain why genotype B is not expected to behave like a permanently starved cell, even though no ribosome can translate through the tryptophan codons.\n\n4. Suppose the intracellular tryptophan concentration is high but the enzyme that charges $tRNA^{Trp}$ is partially inhibited, causing charged $tRNA^{Trp}$ to become limiting. Predict the response of the WT attenuator and explain whether the attenuator senses free tryptophan directly or instead senses the translation status associated with charged $tRNA^{Trp}$.\n\nYour answer must distinguish promoter activity from attenuation-mediated transcriptional readthrough."
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
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-BIO-P04_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "A 420-amino-acid eukaryotic membrane protein is synthesized in the presence of sealed rough-ER microsomes.\n\nThe protein contains:\n\n- a cleavable N-terminal signal peptide at residues 1-25;\n- a hydrophobic segment H1 at residues 180-202;\n- a hydrophobic segment H2 at residues 300-322;\n- potential N-linked glycosylation sequons centered at residues 90, 250, and 350.\n\nFor this problem, assume that N-linked glycosylation occurs only when a sequon is exposed to the ER lumen during translocation, that the microsomal membrane is impermeable to externally added protease, and that protease completely digests any sufficiently exposed cytosolic polypeptide.\n\nThe following results are obtained.\n\nFor WT protein:\n\n- the N-terminal signal peptide is cleaved;\n- the sequons at residues 90 and 350 are glycosylated;\n- the sequon at residue 250 is not glycosylated;\n- treatment of intact microsomes with protease removes most of the segment between H1 and H2, but protected fragments containing residue 90 and residue 350 remain;\n- addition of detergent together with protease causes complete digestion.\n\nA second construct lacks H2 but is otherwise unchanged. In this construct:\n\n- residue 90 remains glycosylated;\n- residues 250 and 350 are not glycosylated;\n- essentially all residues C-terminal to H1 are protease-sensitive in intact microsomes.\n\nAnswer all of the following.\n\n1. Infer the membrane topology of WT protein after cleavage of the signal peptide. State whether each of the following regions is lumenal, transmembrane, or cytosolic: residues 26-179, H1, residues 203-299, H2, and residues 323-420.\n\n2. Identify which internal hydrophobic segment acts as a stop-transfer sequence and which acts as a start-transfer sequence. Explain how the glycosylation results support your assignment.\n\n3. Explain why the sequon at residue 250 is not glycosylated even though the protein enters the ER and contains an intact glycosylation consensus sequence.\n\n4. Predict the location of the C terminus and the glycosylation state of residue 350 when H2 is deleted. Explain why these predictions agree with the protease-protection result.\n\n5. How many membrane-spanning segments are present in the mature WT protein after signal-peptide cleavage? Explain why the cleaved N-terminal signal peptide should not be counted as a membrane-spanning segment of the mature protein.\n\nYour reasoning must use both the glycosylation data and the protease-protection data; an answer based only on hydrophobic-sequence positions is insufficient."
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
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-BIO-P05_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "Three genes, A/a, B/b, and C/c, are located on the same chromosome. A female heterozygous for all three loci has the parental haplotypes $ABC/abc$ and is testcrossed to an $abc/abc$ individual.\n\nThe resulting offspring are classified according to the gamete produced by the heterozygous parent. However, genotype-dependent viability selection occurs after fertilization.\n\nOffspring that are homozygous recessive at both locus A and locus C, i.e. $a/a;c/c$, survive to the time of scoring with probability $1/2$, whereas all other offspring survive with probability 1.\n\nAssume that viability depends only on this joint A-C genotype and is otherwise independent of genotype and meiotic recombination.\n\nThe observed numbers of surviving offspring are:\n\n| Gamete from heterozygous parent | Observed survivors |\n| --- | ---: |\n| $ABC$ | 344 |\n| $abc$ | 170 |\n| $Abc$ | 80 |\n| $aBC$ | 80 |\n| $ABc$ | 70 |\n| $abC$ | 70 |\n| $AbC$ | 8 |\n| $aBc$ | 4 |\n\nAnswer all of the following.\n\n1. Determine which gamete classes produce offspring subject to the viability penalty. Correct the observed survivor counts to estimate the numbers of zygotes originally produced in all eight classes, and confirm the corrected total.\n\n2. Using the corrected counts, identify the two parental classes and the two double-crossover classes. Determine the gene order.\n\n3. Calculate the recombination fraction and map distance for each of the two adjacent intervals. Express the map distances in centimorgans.\n\n4. Calculate the recombination fraction between the two outer genes directly from the corrected offspring classes. Explain why this recombination fraction is not equal to the sum of the two adjacent map distances.\n\n5. Under the assumption that crossovers in the two adjacent intervals occur independently, calculate the expected number of double-crossover progeny from the corrected data. From the observed corrected number of double crossovers, calculate the coefficient of coincidence and interference, using\n\n$\\text{coefficient of coincidence}=\\frac{\\text{observed DCO}}{\\text{expected DCO}}$\n\nand\n\n$\\text{interference}=1-\\text{coefficient of coincidence}$.\n\n6. Now deliberately ignore viability selection and repeat the linkage calculations using the observed survivor counts directly. Calculate the apparent recombination fractions for the two adjacent intervals and for the two outer genes. Also calculate the apparent coefficient of coincidence and interference.\n\n7. Compare the corrected and uncorrected results quantitatively. Explain why genotype-dependent viability selection distorts the linkage estimates in this experiment. Your explanation should identify which reciprocal classes are affected unequally and why post-fertilization selection can be mistaken for an altered meiotic recombination pattern.\n\nShow all calculations."
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
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-BIO-P06_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "Consider an idealized vertebrate neural-tube system in which Sonic Hedgehog, Shh, specifies ventral neural progenitor identities through Smoothened, Smo, and Gli-dependent transcription.\n\nFor this problem, assume the causal signaling pathway is to be inferred from the experimental data rather than simply assumed. Also assume that no secondary signaling pathway from neighboring cells affects the stated cell fates.\n\nThree mutually exclusive progenitor states are monitored:\n\nPax7-positive: dorsal-like state.\n\nOlig2-positive: intermediate ventral state.\n\nNkx2.2-positive: strongly ventral state.\n\nThe following results are obtained after 24 h:\n\n| Condition | Final predominant state |\n| --- | --- |\n| WT, no Shh | Pax7-positive |\n| WT, 2 nM Shh for 24 h | Olig2-positive |\n| WT, 10 nM Shh for 24 h | Nkx2.2-positive |\n| WT, 10 nM Shh for 4 h, then washout for 20 h | Olig2-positive |\n| WT, 10 nM Shh for 12 h, then washout for 12 h | Nkx2.2-positive |\n| $Smo^{-/-}$, 10 nM Shh for 24 h | Pax7-positive |\n| $Smo^{-/-}$, no Shh, constitutively active GliA induced for 12 h | Nkx2.2-positive |\n| WT, Smo agonist for 24 h plus dominant-negative Gli that blocks Gli-dependent transcription | Pax7-positive |\n\nAnswer all of the following.\n\n1. Use the genetic and pharmacological perturbations to infer the causal order among Shh, Smo, and Gli-dependent transcription. Identify which observations provide the relevant epistasis evidence.\n\n2. Explain why a model in which cell fate depends only on the instantaneous Shh concentration is insufficient. Also explain why a model in which cell fate depends only on exposure duration, irrespective of concentration, is insufficient.\n\n3. Based on the data, formulate the simplest qualitative model that accounts for both Shh concentration and duration of signaling in specifying Olig2-positive versus Nkx2.2-positive states. You do not need to propose a detailed molecular mechanism.\n\n4. Consider a small $Smo^{-/-}$ clone surrounded by WT cells in a region continuously exposed to 10 nM extracellular Shh. Under the assumptions of this problem, predict the predominant fate of the mutant clone and explain whether the defect is cell-autonomous with respect to Shh signal transduction.\n\n5. Now suppose constitutively active GliA is induced in that $Smo^{-/-}$ clone for only 4 h. Can the final fate of the clone be uniquely predicted from the data provided? Answer either yes or no and justify your answer. Do not assume that 4 h of GliA activity is equivalent to 4 h of 10 nM Shh unless the data establish that equivalence.\n\n6. A student concludes that the 10 nM Shh, 12 h experiment proves that extracellular Shh concentration alone irreversibly specifies the Nkx2.2-positive fate. Identify the logical error in this conclusion.\n\nDistinguish conclusions that are directly supported by the experiments from mechanistic interpretations that remain underdetermined."
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
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-BIO-P07_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "An idealized renal physiology experiment is performed in a healthy adult. The following quantities are measured during a steady-state urine collection.\n\nUrine flow rate:\n\n$V = 1.00\\ \\mathrm{mL/min}$\n\nFor any substance X, clearance is defined as\n\n$C_X = U_X V/P_X$,\n\nwhere $U_X$ is the urine concentration and $P_X$ is the plasma concentration.\n\nThe measurements are:\n\n| Substance | Plasma concentration $P_X$ | Urine concentration $U_X$ |\n| --- | ---: | ---: |\n| Inulin | $0.25\\ \\mathrm{mg/mL}$ | $30.0\\ \\mathrm{mg/mL}$ |\n| PAH | $0.020\\ \\mathrm{mg/mL}$ | $10.8\\ \\mathrm{mg/mL}$ |\n| Glucose | $3.00\\ \\mathrm{mg/mL}$ | $60.0\\ \\mathrm{mg/mL}$ |\n\nAssume:\n\n- inulin is freely filtered and is neither reabsorbed nor secreted;\n- PAH is filtered and secreted, and its renal extraction ratio is $E_{\\mathrm{PAH}}=0.90$;\n- hematocrit is $0.40$;\n- glucose is freely filtered;\n- at the stated plasma glucose concentration, glucose reabsorption has reached its transport maximum;\n- ignore nephron heterogeneity and transport splay.\n\nAnswer all of the following.\n\n1. Calculate the glomerular filtration rate, GFR, from the inulin clearance.\n\n2. Calculate the effective renal plasma flow from PAH clearance. Then correct for the PAH extraction ratio to obtain the true renal plasma flow.\n\n3. Calculate renal blood flow from the true renal plasma flow and hematocrit.\n\n4. Calculate the filtration fraction using the true renal plasma flow.\n\n5. Calculate the filtered load, urinary excretion rate, and tubular reabsorption rate of glucose. From these values, determine the glucose transport maximum, $T_m$, under the assumptions of the problem.\n\n6. A drug reduces the glucose $T_m$ to $180\\ \\mathrm{mg/min}$ without changing GFR, plasma glucose concentration, or urine flow rate. Under the idealized no-splay assumption, calculate the new urinary glucose excretion rate and urine glucose concentration.\n\n7. Explain mechanistically why PAH clearance can substantially exceed GFR, whereas inulin clearance equals GFR. Also explain why PAH clearance must be corrected when the extraction ratio is less than 1.\n\nShow all calculations with units."
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
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-BIO-P08_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "Consider two neurons that differ only in their intracellular chloride concentration. Ignore bicarbonate permeability and treat all conductances as ohmic.\n\nAt $37^\\circ\\mathrm{C}$, use\n\n$E_{Cl}=-61.5\\log_{10}\\left(\\frac{[Cl^-]_{\\mathrm{out}}}{[Cl^-]_{\\mathrm{in}}}\\right)\\ \\mathrm{mV}$.\n\nThe extracellular chloride concentration is\n\n$[Cl^-]_{\\mathrm{out}}=120\\ \\mathrm{mM}$.\n\nThe two neurons are:\n\nNeuron I: $[Cl^-]_{\\mathrm{in}}=30\\ \\mathrm{mM}$.\n\nNeuron M: $[Cl^-]_{\\mathrm{in}}=6\\ \\mathrm{mM}$.\n\nAssume fixed potassium and sodium reversal potentials\n\n$E_K=-90\\ \\mathrm{mV}$\n\nand\n\n$E_{Na}=+60\\ \\mathrm{mV}$.\n\nBefore GABA is applied, the membrane conductances are\n\n$g_K=20\\ \\mathrm{nS}$,\n\n$g_{Na}=2\\ \\mathrm{nS}$,\n\nand\n\n$g_{Cl}=3\\ \\mathrm{nS}$.\n\nApproximate the steady membrane potential by\n\n$V_m=\\frac{g_KE_K+g_{Na}E_{Na}+g_{Cl}E_{Cl}}{g_K+g_{Na}+g_{Cl}}$.\n\nActivation of GABA_A receptors adds a chloride conductance of $20\\ \\mathrm{nS}$, so that total $g_{Cl}$ becomes $23\\ \\mathrm{nS}$. Assume an action-potential threshold of $-60\\ \\mathrm{mV}$.\n\nAnswer all of the following.\n\n1. Calculate $E_{Cl}$ for neuron I and neuron M.\n\n2. Calculate the resting $V_m$ of each neuron before GABA application.\n\n3. Calculate the new steady $V_m$ of each neuron during strong GABA_A-receptor activation.\n\n4. Under the assumptions of this model, determine whether GABA is depolarizing or hyperpolarizing in each neuron and whether GABA alone is predicted to move the membrane potential beyond the stated action-potential threshold.\n\n5. For each neuron, determine the net direction of chloride-ion movement immediately after GABA_A channels open at the pre-GABA resting potential. Explain your answer in terms of the relationship between $V_m$ and $E_{Cl}$.\n\n6. In many developing neurons, expression of chloride transporters changes so that intracellular chloride decreases with maturation. Explain how such a change can convert GABA_A-receptor signaling from depolarizing to hyperpolarizing without changing the ion selectivity of the GABA_A receptor itself.\n\n7. Suppose a mature neuron undergoes strong inhibition of a chloride-exporting transporter and its intracellular chloride concentration gradually approaches $30\\ \\mathrm{mM}$ while all other parameters remain unchanged. Predict the qualitative change in the effect of GABA and explain why this is a change in the chloride electrochemical gradient rather than a change in receptor identity.\n\nRound membrane potentials to approximately $0.1\\ \\mathrm{mV}$ where appropriate."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON



