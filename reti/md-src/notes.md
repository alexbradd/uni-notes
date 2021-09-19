# Appunti di reti logiche

## Aritmetica di Boole

Lavorare con l'aritmetica binaria (booleana) ci permette di semplificare molto
il nostro lavoro tramite una logica semplice basata su 2 livelli che modella a
pennello la realizzazione su silicio. Inoltre la sua semplicità permette anche
la realizzazione di strumenti per l'analisi automatica.

Iniziamo a dare le definizioni principali che utilizzeremo per costruire
l'algebra booleana.

**Operazione:** Una operazione $\alpha$ sull'insieme $s = \{ s_1, s_2, \dots\}$
è una funzione $S: S \times S \to S$.

**Sistema algebrico:** Combinazione di una o più operazioni.

**Algebra Booleana:** È un sistema algebrico identificato dalla quintupla
$(B, +, *, O, I)$ dove:

- $B$ è l'insieme di specificazione (carrier)
- $+, *$ sono operatori binari che corrispondo rispettivamente a somma e
  prodotto
- $O, I$ sono elementi speciali di $B$

Le proprietà delle due operazioni sono dedotte da assiomi:

- $+$ e $*$ sono commutative per ogni $x, y \in B$
- La somma è distributiva rispetto al prodotto ed il prodotto è distributivo
  rispetto alla somma per ogni $x, y, z \in B$
- $O$ è l'elemento neutro rispetto a $+$ e $I$ quello rispetto a $*$
- Ogni elemento $x \in B$ ammette un elemento $x'$ complemento di $x$ tale che
  $(x+x') = I$ e $(x + x') = O$. Questo elemento è unico, perciò possiamo
  definire $\neg x := x'$ (operazione complemento).

L'ordine delle operazioni viste è il consueto. Inoltre godono delle già viste
proprietà (vedasi ACSO e LEA):

1. Associativa

2. Distributiva

3. Idempotenza

4. Elemento neutro

5. Assorbimento

6. Involuzione

7. De Morgan

8. Consenso

   $$
   \begin{aligned}
   \text{Somma: } & a*b + \neg a*c + b*c = a*b + \neg a*c \\
   \text{Prodotto: } & (a+b)*(\neg a+c)*(b+c) = (a+b)*(\neg a+c)
   \end{aligned}
   $$

**Principio di dualità:** ogni identità deducibile dai postulati dell'algebra di
Boole è trasformata in un'altra identità se ogni somma è sostituita da un
prodotto (e viceversa) e ogni elemento identità $O$ è sostituito da un elemento
identità $I$.

**Espressione Booleana:** Una espressione booleana $E$ è definita in modo
induttivo come parola composta da operatori booleani, parentesi costanti e
letterali nel modo seguente:

- Sia gli elementi di $B$, chiamati costanti, che i letterali $x, y, z$ sono
  espressioni;
- Se $E_1$ e $E_2$ sono espressioni booleane anche $(E_1 + E_2)$, $(E_1 * E_2)$,
  $(\neg E_1)$ lo sono;
- Non esistono altre espressioni booleane oltre a quelle che possono essere
  generate da un numero finito di applicazione delle due regole precedenti.

Possiamo definire algebra di commutazione una particolare algebra booleana della
seguente forma: $(\{ 0,1\}, +, *, 0, 1)$.

### Funzioni booleane ed espressioni booleane

**Funzione di commutazione:** Una funzione di commutazione a $n$ variabili è una
funzione: $f: \{0,1\}^n \to \{0,1\}$

Le funzioni di commutazioni hanno una comoda rappresentazioni in forma tabellare
(tabella di verità). Una funzione booleana di $n$ variabili può essere espressa
da una espressione booleana con $n$ variabili.

Le proprietà dell'algebra possono essere utilizzate per manipolare
un'espressione booleana ed ottenerne una equivalente. Due espressione sono
equivalenti se sono riconducibili alla stessa funzione booleana.

Data una funzione booleana spesso il problema è proprio definire un'espressione
booleana soddisfacente. Inoltre, poiché esistono diverse rappresentazioni
equivalenti bisogna anche definire una metrica che stabilisca la qualità della
rappresentazione. Si osservi che la metrica è caratterizzata da un valore atteso
e da una varianza, quindi due soluzioni a costo simile (e.g. $\pm 20\%$) sono da
considerarsi equivalenti.

Data una funzione booleana la soluzione iniziale al problema di determinare una
corrispondente espressione booleana è usare le forme canoniche. Le due forme
canoniche sono `sum of products` e `products of sum` (vedasi ACSO e LEA).
Entrambe le forme canoniche sono un'applicazione del teorema di espansione di
Shannon:

**Teorema di espansione di Shannon:** Sia $f$ una funzione booleana. Per ogni
$(x_1, x_2, \dots, x_n) \in B^n$ si ha:

$$
\begin{aligned}
  f(x_1, x_2, \dots, x_n) & = \neg x_1 *f(0, x_2, \dots) +
    x_1* f(1, x_2, \dots) = \\
    & = \neg x_2 *f(x_1, 0, \dots) + x_2* f(x_1, 1, \dots) = \dots
\end{aligned}
$$

Dualmente si ha:

$$
\begin{aligned}
  f(x_1, x_2, \dots, x_n) & = (\neg x_1 + f(1, x_2, \dots)) *
    (x_1 + f(0, x_2, \dots)) = \\
    & = (\neg x_2 + f(x_1, 1, \dots)) * (x_2 + f(x_1, 0, \dots)) = \dots
\end{aligned}
$$

Non è possibile, però, identificare un algoritmo che trasforma espressioni
algebriche in modo da minimizzare i criteri di costo. Quindi non si saprà mai se
si è raggiunta la forma minima!
