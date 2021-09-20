# Appunti di reti logiche

## Aritmetica di Boole

Lavorare con l'aritmetica binaria (booleana) ci permette di semplificare molto
il nostro lavoro tramite una logica semplice basata su 2 livelli che modella a
pennello la realizzazione su silicio. Inoltre la sua semplicità permette anche
la realizzazione di strumenti per l'analisi automatica.

Iniziamo a dare le definizioni principali che utilizzeremo per costruire
l'algebra booleana.

Definizione. _Operazione_
: Una operazione $\alpha$ sull'insieme $s = \{ s_1, s_2, \dots\}$ è una funzione
  $S: S \times S \to S$.

Definizione. _Sistema algebrico_
: Combinazione di una o più operazioni.

Definizione. _Algebra Booleana_
: È un sistema algebrico identificato dalla quintupla $(B, +, *, O, I)$ dove:

  1. $B$ è l'insieme di specificazione (carrier)
  2. $+, *$ sono operatori binari che corrispondo rispettivamente a somma e
    prodotto
  3. $O, I$ sono elementi speciali di $B$

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
   \begin{align}
     \text{Somma: } & a*b + \neg a*c + b*c = a*b + \neg a*c \\
     \text{Prodotto: } & (a+b)*(\neg a+c)*(b+c) = (a+b)*(\neg a+c)
   \end{align}
   $$

Definizione. _Principio di dualità_
: Ogni identità deducibile dai postulati dell'algebra di Boole è trasformata in
  un'altra identità se ogni somma è sostituita da un prodotto (e viceversa) e
  ogni elemento identità $O$ è sostituito da un elemento identità $I$.

Definizione. _Espressione Booleana_
: Una espressione booleana $E$ è definita in modo induttivo come parola composta
  da operatori booleani, parentesi costanti e letterali nel modo seguente:

  1. Sia gli elementi di $B$, chiamati costanti, che i letterali $x, y, z$ sono
     espressioni;
  2. Se $E_1$ e $E_2$ sono espressioni booleane anche $(E_1 + E_2)$, $(E_1 * E_2)$,
     $(\neg E_1)$ lo sono;
  3. Non esistono altre espressioni booleane oltre a quelle che possono essere
     generate da un numero finito di applicazione delle due regole precedenti.

Possiamo definire algebra di commutazione una particolare algebra booleana della
seguente forma: $(\{ 0,1\}, +, *, 0, 1)$.

### Funzioni booleane ed espressioni booleane

Definizione _Funzione di commutazione_
: Una funzione di commutazione a $n$ variabili è una funzione: $f: \{0,1\}^n \to
  \{0,1\}$

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

Teorema. _Teorema di espansione di Shannon_
: Sia $f$ una funzione booleana. Per ogni $(x_1, x_2, \dots, x_n) \in B^n$ si
  ha:

  $$
  \begin{align}
    f(x_1, x_2, \dots, x_n) & = \neg x_1 *f(0, x_2, \dots) +
      x_1* f(1, x_2, \dots) = \\
      & = \neg x_2 *f(x_1, 0, \dots) + x_2* f(x_1, 1, \dots) = \dots
  \end{align}
  $$

  Dualmente si ha:

  $$
  \begin{align}
    f(x_1, x_2, \dots, x_n) & = (\neg x_1 + f(1, x_2, \dots)) *
      (x_1 + f(0, x_2, \dots)) = \\
      & = (\neg x_2 + f(x_1, 1, \dots)) * (x_2 + f(x_1, 0, \dots)) = \dots
  \end{align}
  $$

Non è possibile, però, identificare un algoritmo che trasforma espressioni
algebriche in modo da minimizzare i criteri di costo. Quindi non si saprà mai se
si è raggiunta la forma minima!

## Sintesi di reti combinatorie a due livelli

Il nostro obiettivo sarà quello di ridurre la complessità di funzioni booleane
espresse in forma PoS o SoP. Noi ci riferiremo solo alla SoP.

Le nostre ottimizzazioni punteranno a ridurre principalmente il numero di
termini prodotto. In seconda istanza, ridurremo anche il numero di letterali.

Le metodologie di sintesi ottima sono tre:

1. Il metodo delle mappe di Karnaugh
2. Il metodo di Quine-McCluskey
3. Le euristiche per sintesi a due livelli

### Metodo delle mappe di Karnaugh

Un primo metodo per l'identificazione di forme minime a due livelli è applicare
la seguente regola di riduzione:

$$
aZ + \neg aZ = Z
$$

In cui $Z$ è un termine prodotto di $n-1$ variabili. Questo metodo può essere
applicato ad un numero di termini pari a $2^n$ e mantiene inalterato il numero
di livelli. In più le somme di prodotti rimangono tali, al più tali espressioni
possono anche banalizzarsi diventando o semplici prodotti o costanti. Il
problema consiste nell'identificare tutti i termini su cui applicare la
riduzione e tutti i termini che partecipano a più riduzioni contemporaneamente e
replicarli.

Il metodo delle mappe di Karnaugh consente di risolvere direttamente i problemi
del metodo precedente. Esso è un metodo grafico la cui applicazione è semplice
per funzioni con massimo fino a 4 variabili e diventa complesso per 5 o 6
variabili e addirittura inattuabile per più di 6. Una mappa di Karnaugh è uno
schema deducibile dalla rappresentazione geometrica delle configurazioni
binarie. Introduciamo la distanza di Hamming, necessaria all'applicazione del
metodo:

**Distanza di Hamming:** In una rappresentazione binaria, la distanza di Hamming
tra due stati è il numero di bit che variano tra i due stati.

Possiamo vedere la regola di riduzione come l'identificazione di configurazioni
binarie associate ai termini prodotto che sono distanti 1 secondo Hamming. A
tali configurazioni corrispondono coppie di mintermini in cui una sola variabile
è naturale in un mintermine e complementata nell'altro:

> $abc\neg d + a\neg b c\neg d$ può essere vista come due configurazioni:
>
> - $abc\neg d \equiv 1110$
> - $a\neg b c\neg d \equiv 1010$
>
> I mintermini 1110 e 1010 sono ad una distanza di Hamming pari ad 1.

Utilizzando questa impostazione, una funzione binaria a $n$ variabili può essere
rappresentata mediante una rappresentazione geometrica cartesiana in uno spazio
a $n$ dimensioni in cui gli assi sono le variabili della funzione. In questa
rappresentazione possiamo definire gli n-cubi:

Definizione. _N-Cubi_
: Data la rappresentazione cartesiana di una funzione binaria a $n$
  variabili, si dice n-cubo la figura ottenuta collegando i vertici le cui
  configurazioni sono a distanza di Hamming unitaria.

Si può facilmente trasformare una tabella di verità e $n$ variabili in un
n-cubo: basta segnare opportunamente le configurazioni per cui la funzione
assume valore 1 o 0.

La rappresentazione in uno spazio $n$-dimensionale non è maneggevole. Conviene
perciò passare allo sviluppo nel piano degli n-cubi. Al cubo sviluppato nel
piano con $2^n$ vertici si sovrappone una mappa con $2^n$ caselle organizzate
secondo righe e colonne.

> Esempio per un n-cubo bidimensionale:
>
> | b \ a |  0  |  1  |
> | :---: | :-: | :-: |
> | **0** |  0  |  1  |
> | **1** |  1  |  0  |
>
> Esempio per un n-cubo tridimensionale
>
> | c \ ab | 00  | 01  | 11  | 10  |
> | :----: | :-: | :-: | :-: | :-: |
> | **0**  |  1  |  0  |  1  |  0  |
> | **1**  |  0  |  1  |  0  |  1  |
>
> Si noti la disposizione delle variabili: si deve mantenere la distanza di
> Hamming pari a 1 tra colonne adiacenti.

La mappa così realizzata è detta mappa di Karnaugh. Le configurazioni assunte
dalle variabili di ingresso danno origine agli indici di riga e colonna della
mappa. In ogni casella di trascrive il valore assunto dalla funzione quando la
configurazione delle variabili corrisponde a quella della coordinate che
contrassegnano le caselle. Due caselle che condividono un lato di un n-cubo
corrispondo a due configurazioni di variabili adiacenti.

Definizione. *Implicante*
: Un implicante è una funzione $p$ associata ad un termine prodotto di $m$
  letterali con $1 \leq m \leq n$ tale per cui $f \geq p$. Ciò significa che per
  ogni 1 in $p$ ne corrisponde uno in $f$. Un mintermine è un implicante per cui
  $m=n$.

Sostanzialmente gli implicanti sono dei raggruppamenti di 1 di variabili
adiacenti. Affinché esso sia una riduzione, esso deve avere dimensione pari (2,
4 o 8). Esistono 2 tipi di implicanti:

Definizione. _Implicanti primi_
: È un implicante associato ad un termine prodotto a cui corrisponde un
  raggruppamento di dimensione massima.

Definizione. _Implicanti primi essenziali_
: Un implicante primo che copre uno o più 1 non coperti da nessun altro
  implicante.

Definizione. _Copertura_
: Viene detta copertura la scelta del minor numero di implicanti primi ed
  essenziali.

Il metodo consiste nel trovare una copertura con il minor numero di implicati
primi. Per fare ciò, partiamo dall'individuare tutti gli implicanti primi
essenziali. Il seguente teorema ci può aiutare:

Teorema.
: Se una forma minima è composta da solo implicanti primi essenziali essa è
  unica.

In seguito eliminiamo tutti gli implicanti primi coperti da quelli essenziali e
selezioniamo il numero minore di implicanti primi tra gli uni rimasti.

Ad ogni implicante selezionato è associato un termine prodotto. Esso è ottenuto
identificando le variabili che non cambiano mai di valore e riportando ogni
variabile in modo normale se il valore che essa assume è 1 e complementata se
è 0. La riduzione sarà la somma dei termini prodotto associati ai vari
implicanti.

#### Condizioni di indifferenza

La specifica di un progetto spesso contiene delle condizioni di indifferenza
(_don't care_). Le condizioni di indifferenza corrispondono a configurazioni di
ingresso per le quali il valore dell'uscita non è noto e non è neppure di
interesse sapere quanto può valere. Sulla tabella delle verità, o su una mappa
di Karnaugh, il valore specificato della funzione si indica coi simboli `-` o
`x`.

Le condizioni di indifferenza sono dei gradi di libertà nel processo di sintesi.
A esse si può assegnare un valore a seconda di quanto conviene per minimizzare
la funzione. Inoltre essa non deve essere per forza coperta da un implicante. È
importante sottolineare che gli implicanti primi realizzati con sole condizioni
di indifferenza non hanno nessuno scopo. Inoltre un implicante primo non diventa
essenziale quando è l'unico a coprire una data condizione di indifferenza.

### Metodo di Quine-McCluskey

I nostri obiettivi sono analoghi a quelli della sintesi tramite mappe di
Karnaugh. Il metodo di Quine-McCluskey è un metodo di minimizzazione tabellare
facile da tradurre in un algoritmo. Il numero di variabili per cui è applicabile
è teoreticamente illimitato. Il procedimento è simile a quello delle mappe di
Karnaugh: prima si cercano gli implicanti primi e dopo si cerca la copertura
ottima.

Partiamo dai mintermini di funzione. Confrontiamo tutti i termini e
semplifichiamo con la regola di riduzione tutte le coppie che hanno una parte
comune ed una sola variabile differente. I termini semplificati sono marcati e
non sono primi poiché hanno partecipato alla creazione di un implicante con meno
letterali. Successivamente si crea con le riduzioni un nuovo insieme di termini
prodotto da confrontare e si riparte dal confronto. Il processo termina se non
ci sono più possibili riduzioni. I termini prodotto non marcati sono implicanti
primi.

Il numero di confronti può essere ottimizzato: non vale la pena confrontare i
termini che hanno sicuramente diversi per più di un letterale. Costruiamo allora
dei gruppi di mintermini/implicanti contenenti lo stesso numero di 1. Si
comparano tra loro le configurazioni che appartengono a gruppi che differiscono
per un solo 1.

Per cercare la copertura si usa la cosiddetta tabella degli implicanti o tabella
di copertura. Essa è una matrice binaria in cui le righe sono gli implicanti
primi identificati e gli indici colonna sono i mintermini della funzione. Gli
elementi della matrice sono pari a 1 quando l'implicante i-esimo copre il
mintermine j-esimo, altrimenti 0. Si hanno vari criteri di scelta:

1. **Criterio di essenzialità:** se una colonna contiene un solo 1 la riga che
   gli corrisponde è relativa ad un implicante primo essenziale (riga
   essenziale). La riga essenziale e le colonne da essa coperte vengono
   eliminate.
2. **Criterio di dominanza di riga:** quando un certo implicante copre tutti i
   mintermini coperti da un altro implicante esso lo domina. In questo caso la
   riga dell'implicante dominato viene eliminato.
3. **Criterio di dominanza di colonna:** Un mintermine $i$-esimo domina un
   mintermine $j$-esimo quando ogni implicante che copre $j$ copre anche $i$. In
   questo caso il mintermine $i$ è eliminato dalla tabella.

Gli implicanti corrispondenti alle righe eliminate vengono aggiunti all'insieme
di copertura corrispondente alla copertura ottimale. Dopo aver eliminato tutte
le righe eliminabili, la tabella ottenuta è ciclica. La scelta degli ultimi
implicanti da questa richiede l'uso di altri criteri: _Branch and Bound_ o il
metodo di Petrik.
