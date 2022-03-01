# Bioinformatics notes

## Biological background

### DNA and RNA

DNA (deoxyribonuclic acid) is composed of 2 strands intertwined with each other
forming a double helix. Each strand has a sugar-phosphate backbone and is a
polymer of groups called nucletides. A nucleotide is made of a phosphate group,
a pentose sugar (Deoxyribose or Ribose) and a base. Each nucleotide is linked to
the previous by a covalent bond between the phosphate group on the 5' carbon and
the hydroxyl group on the 3' carbon of the next nucleotide. There are 4 types of
bases: Adenine, Cytosine, Guanine, Thymine. Each base can have 1 ring
(pyrimidine) or 2 rings (purines). The two strands are held together by hydrogen
bonds between complementary bases: A-T, G-C.

RNA differs from DNA by being single stranded and having Ribose as opposed to
Deoxyribose in its nucleotides. Moreover in RNA Thymine is replaced with Uracil.
Being single stranded doesn't imply that base pairing doesn't happen: bases can
pair intra-molecularly and generate complex shapes.

Each strand has two ends: a 3' end (an hydroxyl group) and 5' end (a phosphate
group). The two strands run in opposite directions and are complementary. This
means that we can reconstruct the other strand by knowing one of the strands.
Each strand is read from the 5' end to the 3'.

Genetic material is compacted into chromosomes. Bacteria don't have chromosomes,
they have only one circular DNA molecule. Each species can have a
different numbers of chromosomes. Humans have 46 chromosomes.

Every living organism is encoded by one or more DNA molecules that are
continuously read and interpreted by each cell. The central dogma (now proven
wrong but generally it works) mandates that information that determines a
protein's structure contained in DNA is transcribed to RNA and the RNA is
translated into proteins.

### Proteins

Proteins are chains of amino acids (polypeptides). An amino acid is composed of
an amino group, an R group and a carboxyl group. Amino acids are linked together
by the peptide bond between the hydrogen of carboxyl group and the amino group.
Each protein start with the amino group and ends with and the carboxyl group.

Proteins tend to form different structures classified in primary (the amino acid
chain), secondary (alpha helix and beta sheet), tertiary (three dimensional
structure) and quaternary structures.

Proteins are involved in most tasks essential for life: structural, receptors,
signalers enzymes and transcription factors.

#### Protein synthesis

Synthesis starts with transcription: one strand of DNA is copied into a reverse
complementary RNA molecule (in prokaryotes mRNA, in eukaryotes pre-mRNA). DNA is
transcribed by an enzyme: RNA polymerase. Transcription is aided by
transcription factors bound on the promoter of the gene (transcription start
site) or to a distante enhancer. In eukaryotes, the transcribed RNA is often
spliced, before it is exported from the nucleus to the cytoplasm: introns are
spliced out while exons remain to form mature mRNA. A 5'-cap and e 3' poly-A
tail are often added to stabilize the molecule.

mRNA transcripts are translated into proteins by ribosomes. Each amino acids
corresponds to triplet of bases (codon) and are transported by tRNA that exposes
the complementary triplet of bases of te codon. The first codon is always AUG,
while coding stops with either UAA, UAG or UGA.

### Viruses

Viruses are organisms at the "edge of life". They need to exploit the host cell
for replication. The genetic material may be DNA or RNA, single stranded or
double stranded, linear or circular. Some viruses integrate genetic material
into the host genome.

The virus envelope/capsule may contain additional viral proteins.

### Cellular signaling and metabolic processes

An environmental signal binds to a receptor on the cell's surface. The receptor
then stimulates a behaviour in the cell by the synthesis of some proteins.

We can divide metabolic processes into two categories:

1. Catabolic: breaking down of components;
2. Anabolic: synthesis of new components.

We will avoid specifics as it can get absurdly complicated.

### Sanger Sequencing (low throughput)

Developed by Fred Sanger, it's a really precise method with low throughput for
sequencing DNA. It is based on sequencing by synthesis: start from single
stranded DNA, reconstruct the reverse strand and check which bases you have to
add to reconstruct it. The ingredients needed are:

1. single stranded DNA template
2. DNA primer
3. DNA polymerase
4. normal deoxynuclotide-triphosphate (dNTPs)
5. chain terminating dideoxynuclotide-triphosphate (ddNTPs) marked with
   fluorescence.

We can make 4 experiments, one for each base: we add ddNTPs to the mixture and
we observe how many sequences end with that specific nucleotide. We can then
order strands by length (filtering) and observe the ending strand (separating by
terminating base). At the end we can read in reverse the experiment results and
generate the sequence.

### Illumina Sequencing (high throughput)

Illumina sequencing is most suited to shorter sequences and is divided in four
basic steps:

1. DNA & library preparation: make random DNA fragments and append adapters
   - Fragment the genomic DNA
   - Repair ends and add an A overhang
   - Ligate adapters to DNA fragments
   - Select ligated DNA
2. Chip/flowcell preparation: attach fragments to surface and amplify
3. Sequence: massively parallel DNA sequencing
4. Analyze.

### Nanopore sequencing (long read)

Nanopore sequencing is a new method for reading longer sequences. It works by
passing a strand of DNA through a microscopic pore one base at a time. For each
pair you apply a voltage and observe the current through te nanopore. Each base
has a different current. So by following current changes we can determine the
sequence.
