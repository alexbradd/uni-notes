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

### Nanopore Sequencing (long read)

Nanopore sequencing is a new method for reading longer sequences. It works by
passing a strand of DNA through a microscopic pore one base at a time. For each
pair you apply a voltage and observe the current through te nanopore. Each base
has a different current. So by following current changes we can determine the
sequence.

### Single and paired end sequencing

The DNA fragments inserted between the adapters are usually longer than the
maximum read sequence length. We can either sequence only one end (single-end)
of the fragment or both ends (paired-end). Paired-end sequencing can detect
errors and mutations due to the fact that it reads both strands.

## Genome assembly

### Basics

Genome assembly reconstructs the genome from short sequencing reads, while read
mapping "maps" the reads to a known reference genome. Since sequencing is now
cheap, can we sequence and _de novo_ assemble a large genome with the short
reads of NGS protocols (50-250 bp)?

> The process of puzzling together a complete genome sequence of an organism for
> which "shotgun sequencing" has been performed is referred to as genome
> assembly.

There are two major classes of assembly algorithm: overlap-layout consensus
(OLC) and de Brujin graphs (DBG). OLC was widely used back when sequencing was
performed by low-throughput long-read methods; DBG-based methods have dominated
since the introduction of NGS.

### Modeling sequence data

Let us consider an idealized genome that represents a long random sequence of
four bases that does not contain repeats or other complex structure. Consider a
simple and error free sequencing strategy: single-end, whole-genome sequencing
(WGS). That is, we sample equal length fragments (the reads) with starting points
randomly distributed across the genome. Thus, our "shotgun sequencing" can be
compared to a process that samples bases from all genome positions at random.
The chance that any particular base is sampled in a single read is very low.
However we perform the sampling process a very large number of times.

A nice model for this situation is the Poisson distribution. The Poisson
distribution expresses the probability of a given number of events occurring in a
fixed interval of time/space if these events are independent and identically
distributed.

$$ f(k, \lambda) = P(X = k) = \frac{e^{-\lambda}\lambda^k}{k!} $$

Where $k$ refers to the number of reads that overlap a certain genomic position
(coverage) and $\lambda$ is the mean sequencing depth, the average number of
reads covering each base in the genome.

The number of sequenced bases is $n_b = N \cdot L$ (number of reads times the
read length). Similarly the average coverage depth per base is $\lambda = n_b/G$
with $G$ as the genome size.

#### k-mers and genome length

Lets introduce the concept of k-mers: a k-mer is a short subsequence of $k$
nucleotides. In general there are $L - k + 1$ k-mers in a sequence of length $L$
($L > k$). To know the total number of k-mers in our WGS data, since we have $N$
reads, we can calculate it as such: $n_k = N \cdot (L - k +1)$. The coverage depth
for k-mers is then $d_k = \frac{n_k}{G}$. The ratio between average coverage
depths is then:

$$ \frac{\lambda}{d_k} = \frac{n_b/G}{n_k/G} = \frac{L}{L-k+1} $$

Using k-mers we can estimate the total genome size. The number of k-mers in the
WGS reads can be directly counted. So the mean coverage depth of k-mers can be
estimated from the peak value of the empirical k-mer coverage depth distribution
curve.

But how can we find the k-mer coverage depth distribution? Since we can assume
k-mers to be from unique genome positions in most cases, we can the interpret
the count (number of matches) of a specific k-mer as the coverage depth at that
position. We the plot the distribution over all k-mers and identify the peak as
the mean coverage depth.

With this data in hand we can estimate the genome size to be:

$$ G = \frac{n_k}{d_k} $$

And we can estimate the average base coverage by:

$$ \lambda = \frac{L}{L-k+1} \cdot d_k $$

So if we want to estimate the mean read required such that at least 99% of the
genome is covered once we have

$$
\begin{aligned}
  P(X > 0) &= 1 - e^{-\lambda} = 0.99 \\
  \lambda &= 4.605
\end{aligned}
$$

Thus we need to sequence to an average depth of at least 4.6 to get at lest 99%
of the genome covered at least once.

### Contigs

Now let us consider "contigs": combinations of overlapping reads that represent
continuous sequence. The contigs are assumed to be the best possible
representation of the original DNA sequence. However the actual locations of the
contigs and their orientation to one another are unknown to us.

The initial steps of genome assembly are basically an attempt to find contigs.
The result of assembly is a set of contigs with gaps.

In a genome of length $G$, a read of length $L$ can start anywhere (except at the
ends of the chromosomes, we will ignore this). An approximation for the expected
number of reads starting at a specific genomic location $i$ is
$N_i = N/G$. The probability of reads to start in a given interval is
(assuming Poisson distribution):

$$ P(X > 0) = 1 - P(X = 0) = 1-e^{-\lambda} $$

Now lets consider a nucleotide at position $i$. This nucleotide is in a gap
between contigs if no read starts in the interval $[i-(L-1), i] = [i, i-L+1]$.
This interval has length $L$ and thus the probability that no read starts in
it is $e^{-\lambda}$. We can estimate the number of nucleotides in gaps across
the entire assembly as $G \cdot e^{-\lambda}$. Correspondingly, the number of
nucleotides included in contigs is $G \cdot (1-e^{-\lambda})$. This means that
the fraction of genome which will be covered by contigs depends on the
"sequencing depth" (i.e. how much sequence data we produce and thus what
per-base coverage we have).

How many contigs can we obtain? Each contig has a unique rightmost read $R$. The
probability that a given read is the rightmost read is the same as the
probability that no other read start within that read: if the read starts at
position $i$, this is the probability that no read start within $[i, i+L-1]$,
which is $e^{-\lambda}$. The number of contigs must be equal to the number of
rightmost reads. Since there are a total of $N$ reads, each of which with
probability $e^{-\lambda}$ of being and $R$ read, the expected number of contigs
is:

$$ N \cdot e^{-\lambda} $$

And the expected number of reads per contig is:

$$ \frac{N}{Ne^{-\lambda}} = \frac{1}{e^{-\lambda}} $$

The expected size of a contig can be calculated to be:

$$ \frac{\left(1-e^{-\lambda}\right)G}{Ne^{-\lambda}} $$

How much of an overlap is required to connect two reads in a contig? Let
$\theta$ refer to the minimum portion of $L$ that is required to detect an
overlap. This means that we will combine a group of reads to a contig if they
are connected by overlaps of length grater than $\theta L$.

Let us calculate the number of expected contigs taking into account $\theta$.
We now need to calculate the probability that zero reads start in the leftmost
portion of the interval $[i, i+L-1]$ ($(1-\theta)L$). Similarly to what we did
before, we can calculate the expected number of reads that start in
$(1-\theta)L$ to be $(1-\theta)\lambda=(1-\theta)LN/G$. The expected number of
contigs is then $N$ times the probability that there are no reads starting in
$(1-\theta)L$:

$$ \#\mathit{contigs} = Ne^{-(1-\theta)LN/G} $$

This means that the expected number of contigs depends on the average coverage
and the degree of overlap.

The N50 measure is used to estimate the quality of a genome assembly. To
calculate the N50 index we:

1. Arrange the contigs from largest to smallest;
2. Find the position where the contigs cover 50% of the total genome size;
3. The length of the contig at this position is defined as the N50.

The longer the better the assembly.

### Graph-based genome assembly

Our goal is to find an algorithm that will allow us to take a collection of short
NGS sequence reads and to output a longer string representing the genome.

#### Hamiltonian path based approach

Lets start with a simple genome we sequenced. Lets say we have a function called
`composition_k()` that takes a DNA sequence and returns a set of all k-mers
contained in it. We do not know the original order of the k-mers in the genome.

The challenge is reconstructing the original string with an unordered set of
k-mers. Let us now put each of the k-mers into the nodes of a graph. To connect
the nodes we can search for overlaps between k-mers. We connect the i-th k-mer
with the j-th k-mer if `suffix(k-mer_i) = prefix(k-mer_j)`. We can extract the
original string by walking a path that visits each node exactly once.

A Hamiltonian path is a path in an undirected or directed graph that visits each
vertex exactly once. If this path is a cycle, it is called a Hamiltonian cycle.

Determining whether Hamiltonian graphs/cycles exist in a given graph is a
NP-complete problem.

#### De Brujin graph based approach

Now let us consider the same simple genome and k-mers. However, instead of
labelling the nodes with k-mers, let us label the edges. We will label the nodes
with the $(k-1)$-mers suffixes and prefixes of the edge. Let us now merge
identically labeled nodes in this graph whilst retaining the edges. The
resulting graph is called a de Brujin graph. To reconstruct the original
sequence we need to find a path that visits all edges once.

An Eulerian path is a path that visits each edge exactly once.

Determining whether Eulerian path are present in a given graph can be solve with
efficient algorithms.

Some post-processing we can do to the graph is "compress" it: we can collapse
unambiguous edges.

#### Existence of Eulerian cycles and paths

Do we have a way to check if a graph can have an Eulerian path or cycle? Yes, we
need to look at the degree of each node: the degree of a node is the number of
edges in ad out of it. The two conditions are:

1. When the degree of all vertices is even, the graph is traversable (there is a
   Eulerian cycle). For directed graphs, we need all vertices to have the same
   number of incoming and outgoing edges.
2. When there are exactly two nodes of odd degree, there is a Eulerian path
   starting at one of the odd vertices. In directed graphs we need to have only
   two vertices that have respectively:

   $$
     \begin{aligned}
       \mathit{degree}_{in} - \mathit{degree}_{out} &= 1 \\
       \mathit{degree}_{in} - \mathit{degree}_{out} &= -1
     \end{aligned}
   $$

   All other vertices will need to have the same number of incoming and outgoing
   vertices.

#### Finding Eulerian paths

For undirected graphs, we start at one of the two veritces with odd degree. For
directed graphs we start at the vertex with one more outgoing edge and we will
end at the ne with one more incoming edge. If the graph has a Eulerian cycle,
you can find it with the same algorithm.

We will use Hierholzer's algorithm:

```txt
tpath <= Stack() # temporary
epath <= Stack() # eulerian path starting at epath.top() and ending at
                 # epath.bottom()
v <= chooseSuitableStart()
tpath.push(v)

do
  u <= tpath.top()
  if allOutgoingEdgesVisitedFrom(u) then
    u <= tpath.pop()
    epath.push(u)
  else
    e <= selectRandomOutgoingFrom(u)
    tpath.push(e.end)
    u.outgoingEdges.remove(e);
while (!tpath.empty())
```

### Practical problems

1. How do we choose a value for $k$ in real-life? The answer is "big enough":
   the k-mers should be big enough to be unique in the genome. However, memory
   usage for computation grows $\mathcal{O}(nk)$: for about $3 \times 10^0$
   nucleotides with $k=27$ requires about 20 GB of memory to store the nodes
   alone! Plus, we are completely ignoring the problem of repeating
   patterns/structures.
2. Sequencing errors: there is a high number of erroneous k-mers due to
   sequencing errors, with only few copies each. Therefore we need to remove
   low-frequency k-mers in preprocessing.
3. Repetitive regions.
4. Strand ambiguity: each read, and hence the k-mers, could be from either the
   forward or the reverse strand.

### Sequence alignment

Information is encoded in living cells mostly in the form of "sequences":
DNA/RNA sequences and protein sequences. Biological function largely depends on
the 3D structure of large molecules, but many characteristics and functions can
be inferred from the 1D structure.

#### Strings and alphabets

Lets recall the notions of alphabet and string:

- An alphabet is a finite set of symbols $\Sigma$
- A string over an alphabet $\Sigma$ is any finite sequence of symbols from
  $\Sigma$. The empty string is denoted as $\epsilon$
- A sequence is a set of elements ordered  so that they can be
  labeled/enumerated with positive integers

The DNA/RNA alphabet has 4 letters (the bases), the protein alphabet has a
20-letter alphabet, one letter for each amino acid.

The set of all strings of any length is $\Sigma^\star$ (the Kleene closure).
Strings can be concatenated, reversed etc. A substring $s$ of a string $t$ is a
string so that $t = usv$ such that $u$ and $v$ exists (also empty). A string on
length $n$ has $1+\frac{n(n+1)}{2}$. A string $s = uv$ is said to be a rotation
of $t$ if $t = vu$. The number of rotation of a string is equal to its length.

### Comparisons of biological sequences

We need to define suitable measures of distance or similarity, as well as
efficient algorithms to compute them. The measures should reflect as much as
possible the different ways in which the sequence can be similar or different,
and the processes or factors underlying the similarities and differences:
evolution of sequences, errors in data production (sequencing data), errors made
by the cells during DNA replication.

The hamming distance between two strings of equal length is the number of
positions at which the corresponding symbols are different. It is not a good
measure for dissimilarity, but we can formalize "substitutions" in otherwise
identical sequences.

The edit distance is a way of quantifying how dissimilar two strings of
different lengths are to one another by counting the minimum number of
operations required to transform one string into the other. Different
definitions use differente string operations, we will use the Levenshtein
distance which permits these operations: removal, insertion and substitution of
a character in the string. We can formally define the edit distance (from now on
we use edit distance interchangeably with Levenshtein distance) with recursion
as:

$$
lev(a,b) =
\begin{cases}
  |a| \quad \mathit{if } |b| = 0, \\
  |b| \quad \mathit{if } |a| = 0, \\
  lev(tail(a), tail(b)) \quad \mathit{if } a[0] = b[0], \\
  1 + min
  \begin{cases}
    lev(tail(a), b) \\
    lev(a, tail(b)) \\
    lev(tail(a), tail(b))
  \end{cases}
  \quad \mathit{otherwirse}
\end{cases}
$$

Where:

- $tail(x)$ is the string $x$ without its first character
- $x[n]$ is the n-th character of the string $x$
- In the minimum term:
  - First element corresponds to a deletion/removal of a character from $a$
  - Second element corresponds to an insertion of a character to $a$
  - Third corresponds to a replacement/substitution.

From the mathematical definition, it is evident that calculating the edit
distance implies solving a minimization problem. In theory, the number of
solutions is infinite, however in practice we would not need to test all of them
because any solution with more than $max(|a|, |b|)$ operation can be excluded,
se we could discard partial solutions as soon as we exceed this number of
operations.

Can we exploit the edit distance to fully "align" two sequences with respect to
their similarities and differences? Let's use dynamic programming and find an
algorithm to compute the edit distance between two strings.

1. Denote as $E(a,b)$ the edit distance between two string $a$ and $b$
2. For every string $a$, we have $E(a, \epsilon) = |a|$
3. Let $a=a_1a_2 \ldots a_n$ be a string of length $|a| = n$ and $b=b_1b_2
   \ldots b_m$ a string of length $|b| = m$. We denote the prefixes of length
   $i$ of $a$ and $b$ respectively $a(i)$ and $b(j)$
4. To compute the edit distance $E(a,b)$ between $a$ and $b$, let's first assume
   that for given $i$ and $j$ we (somehow) computed:
   - $E(a(i-1), b(j-1))$
   - $E(a(i), b(j-1))$
   - $E(a(i-1), b(j))$
5. It can be proven that the following is true:

   $$
     E(a(i), b(j)) = min
     \begin{cases}
       1+E(a(i), b(j-1)) \\
       1+E(a(i-1), b(j)) \\
       \begin{cases}
         E(a(i-1), b(j-1)) \quad \text{if } a_i = b \\
         1 + E(a(i-1), b(j-1)) \quad \text{if } a_i \neq b
       \end{cases}
     \end{cases}
   $$

This is a recursive definition: we can initially set $i = n$ and $j= m$. Thus,
to compute $E(a, b)$, we can start with:

$$
  E(a(1), \epsilon) = 1 \quad
  E(\epsilon, b(1)) = 1 \quad
  E(a(1), b(1)) = \begin{cases}
    0 \quad \text{if } a_i = b \\
    1 \quad \text{if } a_i \neq b
  \end{cases}
$$

We can then prepare a matrix with $|a| + 1$ rows and $|b| + 1$ columns, each
row/column labeled with on character from $a$ and $b$ respectively. The first
row/column are labeled with a gap (-). We can use this table, for each $i$ and
$j$, the edit distance for the prefixes $a(i)$ and $b(j)$. Our solution will be
in the $(n;m)$ cell.

To compute what changes are optimal, we need to backtrack from the previous
computation. We start, from $(n, m)$ and we move to the adjacent cells which
has the minimum number of steps. Moving diagonally with no increase of cost
means we have a match, moving diagonally with an increased score means a
mismatch/substitution and lastly moving horizontally/vertically means we have a
gap.

For a more efficient backtracking, we keep track of what choice we mad every
time we fill a cell in the starting computation. Every cell will now have a
number of pointers to the previous cells.

Each step of the computation takes constant time. In the worst case there is no
overlap between the two sequences, meaning the alignment will have a length of
$|a| + |b| = n+m$ symbols. Thus the complexity of backtracking is
$\mathcal{O}(n+m)$ and the overall complexity is dominated by the construction
of the table: $\mathcal{O}(nm)$.

The overall efficiency of this algorithm is $\mathcal{O}(nm)$.
