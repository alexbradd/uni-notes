# Appunti di algoritmi e principi dell'informatica

## I modelli

I modelli sono fondamentali nell'ingegneria. I modelli sono talvolta fisici e
spesso sono modelli formali, ossia oggetti matematici che fungono da
rappresentazioni astratte di entità reali complesse. Un modello è adeguato se i
risultati ottenuti riflettono le proprietà che ci interessano del sistema
fisico entro i limiti della nostra approssimazione.

Le fasi dell'ingegneria del software ricalcano quelli della modellizzazione di
un problema:

- Analisi dei requisiti - specifica
- Progetto - architettura del software
- Implementazione - scrittura del codice.

I modelli dell'informatica si basano principalmente sulla
matematica discreta.

I sistemi informatici hanno 2 requisiti fondamentali:

1. Generalità: adatti ad un contesto ampio di utilizzi
2. Flessibilità: possibilità di adattare un modello esistente a nuove esigenze

Dividiamo i modelli in due tipi:

- Modelli operazionali: basati sul concetto di stato e di meccanismi per la sua
  evoluzione. Esempio: "Calcola il minimo e mettilo al primo posto"
- Modelli descrittivi: tesi a formulare le proprietà desiderato o temute del
  sistema piuttosto che del suo funzionamento.  Esempio: "Individua una
  permutazione della sequenza data che $\forall i a[i] \leq a[i+1]$"

Le differenze tra questi due tipi di modellizzazione non sono spesso molto ben
definite.

## I linguaggi

Il meta-modello fondamentale che useremo sarà il linguaggio. Il termine
linguaggio è un termine che conosciamo già ed è utilizzabile a diversi ambiti
diversi come la linguistica, l'informatica, la grafica e la musica.

### Gli elementi di un linguaggio

Il primo elemento formale di un linguaggio è l'alfabeto o vocabolario. In
matematica essi sono sinonimi anche se in italiano naturale non lo sono.

#### Definizione - Alfabeto

Si dice alfabeto un insieme finito $A$ di simboli base.

Una volta definito il concetto di alfabeto possiamo definire la stringa.

#### Definizione - Stringa

Si dice stringa una sequenza ordinata e finita di elementi dell'alfabeto $A$.

Naturalmente possiamo definire la lunghezza della stringa $|a|$ come il numero
di caratteri all'interno. Indichiamo come stringa nulla
$\epsilon : |\epsilon| = 0$. Con la notazione $A*$ intendiamo l'insieme di tutte
le stringhe scrivibili con un certo alfabeto.

Sulle stringhe definiamo l'operazione di concatenazione $.$. La concatenazione e
associativa e non commutativa. Definita questa operazione, possiamo allora
definire il monoide libero $<A*, .>$ con elemento neutro $\epsilon$.

Possiamo finalmente definire il linguaggio.

#### Definizione - Linguaggio

Chiamiamo un linguaggio un insieme $L$ tale che: $L \subseteq A*$.

Notiamo che $L$ può essere anche infinito. Poiché $L$ è un insieme, allora tutte
le operazioni insiemistiche sono ben definite. Inoltre è anche definibile la
concatenazione tra due linguaggi diversi:
$L_1 . L_2 = \{ x.y | x \in L_1, y \in L_2 \}$. Nota bene la differenza tra la
stringa vuota e l'insieme vuota: ${\epsilon} . L = L$ ma
$\emptyset . L = \emptyset$.

Altre operazioni che possiamo definire sui linguaggi sono:

- potenze di linguaggi: $$ L^0 = {\epsilon}, L^i = L^{i-1}.L$$
- asterisco: $$L* = \bigcup^{infty}_{n=0} L^n$$
- più: come asterisco ma si esclude $L^0$

Noi utilizzeremo il concetto di linguaggio per definire un in maniera astratta
il concetto di problema informatico. Il nostro primo problema sarà:

$$ x \text{stringa; } L \text{linguaggio; } x \in L? $$

Questo problema può modellizzare una grande varietà di problemi diversi come:

- "Il programma è sintatticamente corretto?"
- "Un programma è corretto?"
- "Il sonoro di un film è ben sincronizzato con il video?"
- "$x = Det(A)$"

È tutto questione di trovare un linguaggio adatto. Un altro problema che
affronteremo è quello della traduzione $y = \tau(x)$ con $\tau$ una traduzione,
ossia una funzione da una linguaggio $L_1$ ad un altro linguaggio $L_2$.

## Modelli operazionali

Iniziamo con il modello operazionale più semplici: gli automi a stati finiti

### Automi a stati finiti

Essi sono un insieme finito di stati. Ogni elemento è un diverso stato del
sistema. Il passaggio da uno stato all'altro è causato da delle transizioni di
stato. In una rappresentazione grafica, i vari stati sono rappresentati come
delle bolle, le transizioni di stato sono delle frecce che si muovono da una di
queste bolle ad un altra.

Formalizziamo il concetto.

#### Definizione - Automa a stato finito

Un automa a stato finito è una terna $(Q, I, \delta)$ composta da:

- un insieme finito di stati $Q$
- un insieme finito di ingressi (alfabeto): $I$
- Una funzione di transizione (parziale): $\delta: I \times I \to I$

Una funzione parziale, in questo contesto, significa che non deve collegare
tutti gli stati con una freccia.

Un automa a stato finito possiede uno stato iniziale ed una sequenza di mosse
che parte da questo stato iniziale e si conclude su uno stato finale dopo che ha
processato l'ingresso del sistema. Lo stato finale viene detto anche stato di
accettazione.  Lo stato iniziale viene indicato con una freccia che lo collega
all'esterno, lo stato finale con una doppia bolla.

### Automi - automi come riconoscitori di linguaggi

Intuitivamente, possiamo usare l'automa a stato finito come riconoscitore di
linguaggio fornendogli in ingresso una stringa, se dopo aver letto ogni lettera
esso finisce sullo stato di accettazione allora la nostra stringa appartiene al
linguaggio. Formalizziamo il tutto.

#### Definizione - Sequenza di mosse

Dato un automa a stato finito $(Q, I, \delta)$, la sequenza di mosse è data da:

$$ \delta*: Q \times I* \to Q $$

Definita così induttivamente a partire da $\delta$:

- $\delta*(q, \epsilon) = q$
- $\delta*(q, y.i) = \delta(\delta*(q,y), i), \quad y \in I*, i \in I$

Possiamo vedere $\delta*$ come una iterazione su una stringa della funzione di
transizione $\delta$.

Dato uno stato iniziale $q_0$ e stati finali $F \subseteq Q$, possiamo
finalmente formalmente esprimere l'automa a stato finito accettore del
linguaggio come:

$$ x \in L \iff \delta*(q_0, x) \in F $$

### Automi - automi come traduttori tra linguaggi

Aggiungiamo ai nostri automi il concetto di "transizione con uscita"

#### Definizione - Transizione con uscita

Chiamiamo $i/w$ transizione di stato con uscita una transizione di stato che ad
ogni transizione di stato, causata da un carattere $i$ viene fornito il
carattere $w$ come uscita.

Se la stringa viene accettata dall'automa del stato finito, la stringa in
entrata è corretta e la sua traduzione corrisponde all'output.

Formalizziamo l'automa a stato finito traduttore.

#### Definizione - automa a stato finito traduttore

Sia $T = <Q, I, \delta, q_0, F, O, \eta>$ con $<Q, I, \delta, q_0, F>$ un automa
a stato finito riconoscitore e:

- $O$ alfabeto di uscita
- $\eta: Q \times I \to O*$ funzione di traduzione

Possiamo definire induttivamente l'iterazione di $\eta$ come:

- $\eta*(q, \epsilon) = \epsilon$
- $\eta*(q, y.i) = \eta*(q,y).\eta(\delta*(q,y), i)$

Finalmente possiamo enunciare la traduzione come:

$$ \tau(x) = \eta*(q_0, x) \iff \delta*(q_0, x) \in F $$

### Analisi del modello a stati finiti

Gli automi a stati finiti sono un modello molto semplice ed intuitivo, applicato
a molti settori. Per la loro semplicità che prezzo siamo costretti a pagare?

Enunciamo la prima principale proprietà degli automi a stati finiti: il
comportamento ciclico: possiamo sempre scrivere un automa a stato finito che
accetta un linguaggio finito e l'automa corrispondente non contiene cicli.
Questo è rappresentato dal 'Pumping lemma'.

#### Lemma - Pumping lemma

Dati un automa a stati finiti $<Q, I, \delta, q_0, F>$, $x$ stringa, $L$
linguaggio, se $x \in L$ e $|x| > |Q|$ allora esistono
$q \in Q$ e $y,w,z \in I+$ tali che:

- $x = y.w.z$
- $\delta*(q,w) = q$
- $\forall n \geq 0, y.w^n.z \in L$

Dal Pumping lemma derivano molte proprietà degli automi:

1. Il linguaggio non è vuoto se e solo se
   $\exists x \in L \iff \exists y \in L |y| < |Q|$
   - Questo implica che il numero massimo di passi per arrivare allo stato finale
     è $|Q|-1$
2. Il linguaggio è infinito se e solo se $\exists x \in L |Q| \leq |x| < 2|Q|$
   - Implica che la lunghezza massima di un ciclo è $|Q|$
3. Non esiste un automa a stati finiti che accetti linguaggi del tipo
   $L = \{a^n b^n | n > 0\}$
   - Il linguaggio sopra non è un caso limitato, esso modella un caso
     particolare delle strutture a parentesi, utilizzate ad esempio nei
     linguaggi di programmazione. Ciò è dovuto al fatto che gli automi a stato
     finito possiedono una memoria finita pari il numero di stati. Il problema
     descritto sopra non si riesce risolvere con un automa a memoria finita
     poiché non si riesce a contare e garantire l'uguaglianza tra il numero di
     $a$ e $b$. Un linguaggio dove il numero di $a$ e $b$ non è rilevante,
     come ci si aspetta, è modellabile con un automa a stato finito.

### Analisi della proprietà di chiusura degli FSA

La chiusura rispetto ad un'operazione di un insieme è una proprietà che ci
assicura che $a \in A, b \in A \implies a * b \in A$. La chiusura, inoltre, deve
essere l'insieme più piccolo tra i possibili che rispettano tale proprietà

Definiamo $\mathbf{L}$ una famiglia di linguaggi. Una famiglia di linguaggi è
chiusa rispetto ad una operazione $*$ se $L_1*L_2$ appartiene alla stessa
famiglia di linguaggi di $L_1$ ed $L_2$. Abbiamo visto che la famiglia di
linguaggi riconosciuti dagli FSA corrisponde a quella dei linguaggi regolari
($\mathbf{REG}$). La famiglia dei linguaggi regolari è chiusa rispetto a tutte
le operazioni insiemistiche, alla concatenazione, alla star di Kleene e
praticamente tutte le altre viste.

Proviamo a costruire l'intersezione di due automi. Il risultato sarà un automa
che accetta solo stringhe che entrambi gli automi di partenza accettano.
Formalmente possiamo scriverlo così:

$$
\begin{gathered}
  \begin{aligned}
    A^1 &= <Q^1, I, \delta^1, q_0^1, F^1> \\
    A^2 &= <Q^2, I, \delta^2, q_0^2, F^2> \\
  \end{aligned} \\
  \Downarrow \\
  <A^1, A^2> = <Q^1 \times Q^2, I, \delta, <q_0^1, q_0^2>, F^1 \times F^2>
    \text{ con } \delta(<q^1, q^2>, i) = <\delta(q^1, i), \delta(q^2, i)> \\
  L(<A^1, A^2>) = L(A^1) \cap L(A^2)
\end{gathered}
$$

<!-- Immagine di un automa intersezione -->

Il risultato sopra si può dimostrare con una induzione. Come facciamo per
l'unione invece? Dobbiamo costruire un automa che accetti stringhe che almeno
uno dei due automi accetta. Facciamo un procedimento simile al precedente:

$$
<Q^1 \times Q^2, I, \delta, <q_0^1, q_0^2>, F^1 \times Q^2 \cup Q^1 \times F^2>
$$

C'è, però, un problema: non si può fare se l'automa non è completo. Bisogna
quindi, prima di fare l'unione, completare entrambi gli automi.

Discutiamo infine il complemento di un automa: l'automa complemento ha tutti gli
stati che erano di accettazione resi di non accettazione e viceversa
($\neg F = Q \setminus F$). Come anche per l'unione, il giochino sopra funziona
solo per automi completi.

### Automa a stati finiti con pila

Arricchiamo i nostri FSA, aggiungendo un organo di memoria strutturato come una
pila (stack) potenzialmente illimitata. L'automa opera sulla pila con le 2
operazioni fondamentali per le stack: push e pop. La mossa dell'automa a pila è
sommariamente strutturata in:

1. Legge un simbolo dall'input (nastro di ingresso) (può anche non leggere)
2. Legge un simbolo dalla pila (pop)
3. Cambio di stato
4. Sposta di una posizione il puntatore dell'input (la testina)
5. Sostituisce al simbolo $A$ letto dalla pila una stringa una stringa $\alpha$
   di simboli (anche nulla) (push)
6. Se è un traduttore scrive una stringa (anche nulla) sul nastro di uscita

Indicheremo convenzionalmente il fondo della pila con $Z_0$.

La stringa in ingresso viene riconosciuta se l'automa la scandisce completamente
e termina su uno stato di accettazione. Lo stato della pila non è rilevante. Se
l'automa è traduttore, allora se accetta la stringa l'output corrisponde alla
stringa tradotta, altrimenti viene detta indefinita: ($\tau(x) = \perp$).

Le transizioni di stato sono più ricche di quelle degli FSA in quanto bisogna
anche descrivere la gestione della pila. Nel diagramma di stato si usa la
seguente notazione: $ a, A / B..., c$ dove:

- $a$ è il carattere letto dall'input
- $A$ è il carattere letto dalla pila tramite la pop
- $B...$ sono i caratteri inseriti sulla pila dalla push
- $c$ il carattere scritto in uscita

Nel caso in cui l'automa non legge niente da input (vedi il punto 1 della mossa)
diciamo che l'automa ha effettuato una $\epsilon$-mossa e la indichiamo con
$\epsilon$ come carattere letto. Anche nel caso in cui l'automa non inserisce
nulla sulla pila lo indichiamo con $\epsilon$. Nota bene: un automa deve sempre
leggere un carattere dalla pila!

Formalizziamo ora la definizione:

#### Definizione - automa a pila

$$<Q, I, \Gamma, \delta, q_0, Z_0, F, [O, \eta]>$$

Dove:

- $<Q, I, q_0, F, [O]>$ come in un FSA
- $\Gamma$ alfabeto di pila
- $Z_0$ simbolo iniziale di pila
- $\delta: Q \times (I \cup \epsilon) \times \Gamma \to Q \times \Gamma*$
  - $\delta$ è per forza parziale
- $\eta: Q \times (I \cup \epsilon) \times \Gamma \to O*$
  - $\eta$ è definita dove anche $\delta$ è definita

Definiamo anche la configurazione, ossia la generalizzazione di stato:

#### Definizione - configurazione

$$c = <q, x, \gamma, [z]>$$

Dove:

- $q$ è lo stato dell'organo di controllo
- $x$ è la stringa ancora da leggere nel nastro di ingresso
- $\gamma$ stringa dei caratteri in pila (alto-destra, basso-sinistra)
- $z$ stringa già scritta nel nastro di uscita

Tra le varie configurazioni vi è una relazione di transizione indicata con
$\vdash$. Quindi otteniamo che:

$$
c = <q, x, \gamma, [z]> \vdash c' = <q', x', \gamma', [z']>
$$

Notiamo il perché della parzialità di $\delta$:

$$
\forall q, A, \delta(q, \epsilon, A) \neq \perp \implies
  \forall i \delta(q,i,A) = \perp
$$

Ciò significa che per qualsiasi stato non devono esserci sia una
$\epsilon$-mossa sia una mossa normale, sennò cadremo in non determinismo perché
l'automa dovrebbe effettuare una decisione.

Indichiamo con $\vdash*$ la chiusura transitiva e riflessiva di $\vdash$. Essa
non è altro che la nostra vecchia sequenza di mosse. Definiamo formalmente
accettazione [traduzione] di una stringa $x \in L, [z\tau(x)]$ come:

$$
c_0= <q_0, x, Z_0, [\epsilon]> \vdash* c_f = <q, \epsilon, \gamma, [z]>
$$

Nota: D'ora in poi indicheremo con $A*$ la chiusura transitiva e riflessiva di
$A$ e con $A+$ la sola chiusura transitiva.

### Automi a pila - proprietà

Come anche per gli FSA, è facile trovare un linguaggio non riconosciuto dagli
automi a pila: $L = \{ a^n b^n c^n \}$ non è più riconoscibile da un automa a
pila. Questo è dovuto al fatto che la pila è una memoria distruttiva: per
leggerla occorre distruggerla! Ciò si dimostra tramite un'estensione del Pumping
Lemma.

Prendiamo due linguaggi: $\{a^nb^n\}$ e $\{a^nb^2n\}$. Entrambi i linguaggi sono
riconoscibili da automi a pila, ma si può dimostrare che la loro unione non lo
è. Questo risultato ci dice che la famiglia dei linguaggi riconosciuti dagli
automi a pila ($\mathbf{LP}$) non è chiusa rispetto all'unione. Per un motivo
analogo si può anche dimostrare la non chiusura rispetto all'intersezione.

Riguardo invece al complemento? Come negli FSA, l'idea è la stessa: scambiamo
gli stati di accettazione con quelli di non accettazione. Anche qui $\delta$ va
completata cercando di evitare il non determinismo (attenzione alle
$\epsilon$-mosse). Le $\espilon$-mosse, però, possono causare un ciclo. In
questo caso, però, se l'automa entra in questo ciclo esso non progredisce mai e
non completa. Perciò è possibile creare una costruzione equivalente che eviti
queste $\espilon$-mosse. Analogamente accade per le sequenze di $\epsilon$-mosse
a fine scansione con alcuni stati di accettazione. Anche qui può essere
costruita una apposita costruzione che forza l'automa a decidere l'accettazione
solo alla fine di una sequenza di $\epsilon$-mosse.

### Macchine di Turing

L'ultimo automa che tratteremo sarà la macchina di Turing. Partiamo dalla
versione a $k$-nastri, un po' più semplice di quella originaria.

Come dice il nome, la macchina di Turing a $k$-nastri è analoga a un automa a
stati finiti al qual e aggiungiamo $k$ nastri di memoria. Le testine dei nastri
possono muoversi in ambo le direzioni arbitrariamente. Come anche per gli altri
automi avremo i soliti stati e alfabeti. Per convenzione storica, i nastri sono
rappresentati da sequenze infinite di celle invece che da stringhe finite. Però
esiste un simbolo speciale "blank" (rappresentato da uno spazio vuoto, $\_$ o
$\not{b}$) e si assume che ogni nastro contenga solo un numero finito di celle
non contenenti blank. Come nel caso degli automi a pila indichiamo l'inizio del
nastro con $Z_0$.

La Mossa della macchina di Turing è simile a quella dell'automa a pila:

- Lettura:
  - Legge il carattere in corrispondenza della testina del nastro di ingresso
  - Legge i $k$ caratteri in corrispondenza dei nastri
  - Stato dell'organo di controllo
- Scrittura:
  - Cambiamento di stato
  - Riscrittura di una carattere al posto di quello letto su ogni nastro di
    memoria
  - Eventuale scrittura di un carattere sul nastro di uscita
  - Spostamento delle testine di una posizione

Le nuove funzioni di transizione e output saranno le seguenti:

$$\beign{align}
\delta&: Q \times I \times \Gamma^k \to Q \times \Gamma^k \times {R,L,S}^{k+1} \\
\eta&: Q \times I \times \Gamma^k \to Q \times \Gamma^k \times {R,L,S}^{k+1}
  \times O \times {R,S}
\end{align}$$

Per accomodare questa mossa più complesso, introduciamo la nuova notazione:

$$
i, <A_1, \ldots, A_k>/[o], <A'_1, \ldots, A'_k>, <M_0, \ldots, M_k, [M_{k+1}]>
$$

Dove:

- $i$: carattere letto dal nastro di ingresso
- $<A_1, \ldots, A_k>$: le letture dai vari nastri
- $o$: il carattere scritto sul nastro di uscita
- $<A'_1, \ldots, A'_k>$: le scritture sui vari nastri
- $<M_1, \ldots, M_k>$: i movimenti effettuati dai vari nastri dove:
  - $M_0$ è il movimento della testina di ingresso
  - $M_{k+1}$ è il movimento della testina di output

Lo stato iniziale di una macchina di Turing è come ce lo immagineremmo: $Z_0$
seguito da blank nei nastri, uscita tutta blank, testine in posizione 0 per ogni
nastro, organo di controllo nello stato iniziale e stringa iniziale scritta sul
nastro iniziale a partire dalla posizione 0 seguita da blank. Lo stato di
terminazione, invece, è diverso da quello visto fino ad ora:

- Gli stati di accettazione sono sempre $F \subseteq Q$
- Per convenzione la $\delta (\eta)$ non è definita a partire dagli stati
  finali: $\forall q \in F \delta(q, \ldots) = \perp (\eta (q, \ldots) = \perp)$
- La macchina si ferma in uno stato $q$ quando $\delta(q, \ldots) = \perp$
- La stringa in ingresso è accettata se e solo se dopo un numero finito di
  transizioni la macchina si ferma in uno stato di accettazione
