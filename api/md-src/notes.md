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
  sistema piuttosto che del suo funzionamento. Esempio: "Individua una
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
$L_1 . L_2 = \{ x.y : x \in L_1, y \in L_2 \}$. Nota bene la differenza tra la
stringa vuota e l'insieme vuota: ${\epsilon} . L = L$ ma
$\emptyset . L = \emptyset$.

Altre operazioni che possiamo definire sui linguaggi sono:

- potenze di linguaggi: $$ L^0 = {\epsilon}, L^i = L^{i-1}.L$$
- asterisco: $$L* = \bigcup^{infty}_{n=0} L^n$$
- più: come asterisco ma si esclude $L^0$

Noi utilizzeremo il concetto di linguaggio per definire un in maniera astratta
il concetto di problema informatico. Il nostro primo problema sarà:

$$ x \text{ stringa}, \quad L \text{ linguaggio} \quad x \in L? $$

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
accettazione. Lo stato iniziale viene indicato con una freccia che lo collega
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
   $L = \{a^n b^n : n > 0\}$
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
$\epsilon$-mosse). Le $\epsilon$-mosse, però, possono causare un ciclo. In
questo caso, però, se l'automa entra in questo ciclo esso non progredisce mai e
non completa. Perciò è possibile creare una costruzione equivalente che eviti
queste $\epsilon$-mosse. Analogamente accade per le sequenze di $\epsilon$-mosse
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

$$
  \begin{align}
    \delta&: Q \times I \times \Gamma^k \to Q \times \Gamma^k
      \times {R,L,S}^{k+1} \\
    \eta&: Q \times I \times \Gamma^k \to Q \times \Gamma^k \times {R,L,S}^{k+1}
      \times O \times {R,S}
  \end{align}
$$

Per accomodare questa mossa più complesso, introduciamo la nuova notazione:

$$
i, <A_1, \ldots, A_k>/[o], <A'_1, \ldots, A'_k>, <M_0, \ldots, M_k, [M_{k+1}]>
$$

Dove:

- $i$: carattere letto dal nastro di ingresso
- $<A_1, \ldots, A_k>$: le letture dai vari nastri
- $o$: il carattere scritto sul nastro di uscita
- $<A'_1, \ldots, A'_k>$: le scritture sui vari nastri
- $<M_0, \ldots, M_k, [M_{k+1}]>$: i movimenti effettuati dai vari nastri dove:
  - $M_0$ è il movimento della testina di ingresso
  - $M_{k+1}$ è il movimento della testina di output
    - a differenza delle altre testine la testina di output non può tornare
      indietro

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

Il modello di macchina di Turing è adatto a modellare la computabilità di un
problema, però la sua semplicità la rende anche assai complessa e lenta da
utilizzare per problemi più elaborati.

### Proprietà di chiusura delle macchine di Turing

La famiglia dei linguaggi riconosciuti dalle macchine di Turing è chiusa per
tutte le operazioni viste tranne il complemento. Il principale problema sta nel
fatto che non esistono le macchine di Turing loop-free, come gli automi a pila e
si rischia di generare computazioni infinite. La dimostrazione di questo
risultato verrà vista in seguito nella parte di computabilità del corso.

### Modelli equivalenti della macchina di Turing

Il primo modello equivalente di MT (e anche il più vecchio) è quello della MT a
singolo nastro. Essa ha un unico nastro di memoria infinito sul quale la testina
si può muovere in entrambe le direzioni. Attenzione: non va confusa con la
macchina di Turing con $k=1$ nastri (ad un nastro di memoria). Un altro modello
è quello di una macchina di Turing con un nastro di memoria bidimensionale in
cui la testina si può muovere liberamente nelle 4 direzioni cardinali. Ne
esistono altri, ma essi sono tutti equivalenti tra di loro per quanto riguarda
la capacità espressiva/traduttiva.

Le macchine di Turing possono simulare anche le macchine di von Neumann (modello
astratto di un computer con RAM). La differenza tra le due è l'accesso alla
memoria: sequenziale nel primo e diretto nel secondo. L'impatto non è nella
capacità espressiva ma nella complessità del calcolo. Come detto anche prima,
infatti, le macchine di Turing sono fin troppo semplici e per compiti abbastanza
complessi diventano molto complicate e lente.

## Modelli operazionali non deterministici

I modelli visti fino ad ora sono detti deterministici: in certo stato e con
certi ingressi la mossa eseguita è sempre la stessa. Vediamo le varianti non
deterministiche dei modelli già noti.

### FSA non deterministici

Diciamo che un FSA è non deterministico se esiste $\delta(q, a) = \{q_1, q_2\}$
ossia associati ad uno stato e ad un carattere è associato un insieme di
transizioni. Quindi $\delta: Q \times I \to P(Q)$. Ovviamente la sequenza di
mosse andrà ridefinita:

$$
  \delta*(q, \epsilon) = \{q\} \quad \delta*(q, y.i) =
    \bigcup_{q' \in \delta*(q, y)} \delta(q', i)
$$

Una stringa $x \in L$ appartiene al linguaggio modellato da un NFA (dall'inglese
"nondeterministic finite automata") non deterministico se:

$$\delta*(q_0, x) \cap F \neq \emptyset$$

Ossia c'è almeno una sequenza di mosse che ci porta allo stato finale. Si noti
che gli NFA non sono più potenti della controparte deterministica. Infatti
possiamo sempre trasformare un NFA in un FSA tramite un algoritmo.
Intuitivamente, possiamo trasformare un automa non deterministico in uno
deterministico semplicemente unendo in un singolo stato l'insieme di arrivo
della $\delta$ e mantenendo gli archi. Possiamo anche operare nell'altro senso,
ossia costruire un automa non deterministico a partire da uno deterministico.

### Automi a pila non deterministici

Il non determinismo negli automi a pila è simile a quello degli NFA. L'avevamo
già incontrato quando avevamo parlato delle $\epsilon$-mosse. La nuova funzione
di transizione è:

$$
  \delta: Q \times (I \cup \{\epsilon\}) \times \Gamma \to P_f(Q\times\Gamma*)
$$

L'indice $f$ nell'insieme delle parti sta per "finito". Un NPDA
("nondeterministic push down automata") accetta se esiste una sequenza di mosse
tale che:

$$ c_0 \vdash* <q, \epsilon, \gamma>, q \in F $$

Quindi la relazione $\vdash$ non è più univoca! Una semplice costruzione ci
permette di costruire sempre l'unione di due NPDA e quindi di dimostrare la
chiusura degli NPDA rispetto all'unione. Ciò significa che la classe dei
linguaggi riconosciuti dagli NPDA è più ampia di quella dei PDA e quindi che gli
NPDA sono più potenti rispetto ai PDA. Anche se sono chiusi rispetto
all'unione, essi non sono chiusi rispetto all'intersezione. Di conseguenza non
sono chiusi anche rispetto al complemento (per le leggi di De Morgan). Proviamo
a dimostrare il risultato sopra. Procedendo con le stesse modalità del caso
deterministico, possiamo ottenere una computazione che termina e accetta il
linguaggio complemento. Se però consideriamo il caso:

$$
  \langle q_0, x, z_0 \rangle = c_0 \vdash^\star \{
    \langle q_1, \epsilon, \gamma_1 \rangle,
    \langle q_2, \epsilon, \gamma_2 \rangle \}, q_1 \in F, q_2 \notin F
$$

La stringa $x$ è accettata anche se scambio $F$ con $Q \setminus F$, rendendo
impossibile la costruzione del complemento.

### Macchine di Turing non deterministiche

Come anche nei casi precedenti, la macchina di Turing non deterministica può
assumere diversi stati contemporaneamente. Definiamo la $\delta$:

$$
  \delta : Q \times I \times \Gamma^k \to
    P(Q\times \Gamma^k \times \{ L,S,R \})
$$

Il concetto di configurazione, transizione e sequenza di transizione e
accettazione sono definite come negli altri casi.

Come anche nel caso del NFA le macchine di Turing non deterministiche non sono
più potenti della controparte deterministica. Per dimostrare ciò possiamo
pensare al cosiddetto "albero delle computazioni":

```txt
                              c0
                        ┌─────┼─────┐
                       c11   c12   c13
                 ┌──────┤     │     ├────┬────┐
                c11    c22   !f    ...  f   c23
           ┌─────┤      │                     ├──────┐
          !f    ...    f                     f     !f

f   : stato in cui termina accettando
!f  : stato in cui termina non accettando
... : computazione infinita
```

Quindi per simulare una macchina di Turing non deterministica con una
deterministica ci basterà percorrere l'albero in ampiezza (breadth-first search),
scandendo le varie configurazioni. Appena trovo una configurazione di
accettazione, mi posso fermare.

## Le grammatiche

Gli automi sono un modello riconoscitivo dei linguaggi: essi ricevono una
stringa nel loro ingresso e la elaborano in vari modi. Le grammatiche, invece,
sono un modello generativo: una grammatica produce le stringhe di un linguaggio.
In generale una grammatica o sintassi è un insieme di regole per costruire frasi
di un linguaggio (stringhe). Esso può essere applicato a a qualsiasi nozione di
linguaggio nel senso più lato. In modo simile alle grammatiche dei normali
meccanismi linguistici, una grammatica formale genera le stringhe di un
linguaggio attraverso un processo di riscrittura: le grammatiche descrivono un
oggetto principale come un insieme ordinato di componenti e questa descrizione è
fornita fino ad arrivare al livello di dettaglio desiderato.

### Definizione formale di grammatica

Definiamo formalmente una grammatica:

#### Definizione - grammatica

$$
G= (V_N, V_T, P, S)
$$

- $V_N$: alfabeto o vocabolario non terminale
- $V_T$: alfabeto o vocabolario terminale
- $S \in V_N$ elemento particolare di $V_N$ detto assioma o simbolo iniziale
- $P \subseteq V_N \times (V_T \cup V_N)*$ l'insieme di regole (relazione) di
  riscrittura o produzioni. Per comodità scriveremo $\alpha \to \beta$ al posto
  che $(\alpha, \beta)$

Per comodità indicheremo $V = V_T \cup V_N$

#### Definizione - Relazione di derivazione immediata

Diciamo che $\alpha \implies \beta$ (da $\alpha$ si deriva $\beta$) con
$\alpha \in V+$ e $\beta in V*$ se e solo se:

- $\alpha = \alpha_1 \alpha_2 \alpha_3$
- $\beta = \alpha_1 \beta_2 \alpha_3$
- $\alpha_2 \to \beta_2 \in P$, ossia $\alpha_2$ si riscrive come $\beta_2$ nel
  contesto $(\alpha_1, \alpha_2)$

Della relazione di derivazione immediata possiamo, ovviamente, eseguire al
chiusura riflessiva e transitiva e la indichiamo con $\implies^*$.

#### Definizione - Linguaggio generato da una grammatica

$$
  L(G) =  \{x\in V_T* : S \implies^* x \}
$$

Notiamo che è sempre possibile creare una grammatica che descriva un qualunque
linguaggio, infatti basta porre $P = \{ S \to x : x \in L \}$. Inoltre possiamo
costruire un automa (FSA, PDA o MT) che possa riconosce il linguaggio generato
dalle varie grammatiche. È possibile allora classificare le varie grammatiche in
base alla loro espressività?

### Espressività delle grammatiche

Introduciamo delle classi di grammatiche basate sulla forma delle produzioni.

#### Definizione - Grammatiche non contestuali

Le produzioni hanno la forma $\alpha \to \beta$ dove $|\alpha| = 1$, cioè
$\alpha \in V_N$.

Le grammatiche non contestuali prendono il loro nome dal fatto che la
riscrittura dei $\alpha$ non dipende dal contesto in cui si trova. Esse sono
equivalenti di fatto alla BNF usata per definire la sintassi dei linguaggi di
programmazione.

#### Definizione - Grammatiche regolari

Le produzioni hanno forma $\alpha \to \beta$ dove $|\alpha| = 1$,
$\beta \in V_T . V_N \cup V_T$.

Le grammatiche regolari sono anche non contestuali, ma non viceversa.

#### Definizione - Grammatiche monotone

Le produzioni hanno forma $\alpha \to \beta$ dove $|\alpha| \leq |\beta|$. Per
includere la stringa vuota si ammette $S \ to \epsilon$ ma $\epsilon$ non può
apparire nel membro di destra della produzione.

Le grammatiche regolari sono montone, ma quelle non contestuali non lo sono
poiché non ammesse produzioni del tipo $A \to \epsilon$. Queste produzioni, però
si possono eliminare facilmente creando una grammatica equivalente. I linguaggi
generati dalle grammatiche monotone sono anche detti contestuali e sono definiti
da automi lineari, ossia macchine di Turing con lunghezza del nastro limitata.

Possiamo, quindi, costruire la gerarchia delle grammatiche di Chomsky (dalla più
libera alla meno libera):

1. Grammatiche non ristrette (tipo 0)
2. Grammatiche monotone (tipo 1)
3. Grammatiche non contestuali (tipo 2)
4. Grammatiche regolari (tipo 3)

Con $L_3 \subseteq L_2 \subseteq L_1 \subseteq L_0$. I contenimenti sono, però,
stretti?

### Relazioni tra grammatiche e automi

Come si potrebbe intuire, le grammatiche regolari sono equivalenti agli automi a
stati finiti. Come lo dimostriamo? Dato un automa a stati finiti, possiamo
costruire una grammatica regolare equivalente considerando: $V_n = Q$, $V_T =
I$, $S = q_0$ e per ogni $\delta(q, i)=q'$ posiamo $q \to iq'$; inoltre se $q'
\in F$ aggiungiamo $q \to i$. Con una facile induzione possiamo dimostrare che
$q \implies^* xq'$. La costruzione inversa si esegue in modo analogo: $Q = V_N
\cup \{q_f\}$, $I = V_t$, $q_0 = S$, $F - \{q_f\}$ con $\forall A \to bC \;
\delta(A,b) = C$ e $\forall A \to b \in P \; \delta(A, b) = q_f$. Nota bene: lo
FSA risultante non è deterministico!

Nel caso dei linguaggi non contestuali abbiamo una equivalenza con gli NPDA. La
dimostrazione costituisce il cuore della costruzione di un compilatore.
Intuitivamente, usiamo la pila per simulare le varie produzioni.

Nel caso delle grammatiche non ristrette, esse sono equivalenti alle macchine di
Turing. Costruiamo una macchina di Turing a nastro singolo non deterministica a
partire da una grammatica G. Innanzitutto la la stringa $x$ è posizionata nel
nastro di partenza. Eseguiamo, dopo, un ciclo:

- Il nastro viene scandito alla ricerca di una parte destra $\beta$ di qualche
  produzione $\alpha \to \beta$ di P.
- Quando se ne trova una, non necessariamente la prima, operando una scelta non
  deterministica, essa viene sostituita dalla corrispondente parte sinistra
  $\alpha$ (processo di riduzione).

Per come abbiamo costruito la macchina, sappiamo che:

$$
  \alpha \implies \beta \iff c = <q, Z_0, \alpha> \vdash* <q, Z_o, \beta>
$$

Se e quando il contenuto del nastro diviene l'assioma $S$, la stringa in
ingresso verrà accettata, altrimenti questa particolare sequenza non porta
all'accettazione.

Possiamo anche fare il viceversa, ossia data una MT, generare una grammatica
equivalente. Poiché una grammatica può manipolare solo gli elementi non
terminali della stringa, dobbiamo fare in modo che generi tutte le possibili
stringe del tipo $x \diamond X, x \in V_t*$ con $\diamond$ un separatore, $X$
una copia di $x$ costituita da caratteri non terminali. Il nostro obiettivo è
ottenere una derivazione $x \diamond X \implies* x$ se e solo se $x$ è accettata
dalla MT. Innanzitutto le produzioni che generano la nostra stringa sono
($V_t = \{a,b\}$):

$$
  \begin{aligned}
    S \to SA'A, S \to SB'B, S \to \diamond & \quad
      \text{(genero coppie di simboli)}\\
    AA' \to A'A, BA' \to A'B & \quad \text{(scorro le $A'$ a sx)}\\
    AB' \to B'A, BB' \to B'B & \quad \text{(scorro le $B'$ a sx)}\\
    \diamond A' \to a\diamond, B'\diamond \to b\diamond & \quad
      \text{(quando scorro attraverso $\diamond$ trasformo)}
  \end{aligned}
$$

Ora il primo passo è simulare ogni mossa della macchina di Turing con una
derivazione. Consideriamo il seguente stato:

```txt
┌─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┐
│ƀ│ƀ│ƀ│ƀ│α│B│A│C│β│ƀ│ƀ│ƀ│ƀ│
└─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┘
             ↑
             q
```

La configurazione sopra è rappresentata dalla stringa
$\diamond\alpha BqAC \beta$. Se è definita:

- $\delta(q, A) = <q', A', R>$ aggiungo $qA \to A'q'$ alle produzioni
- $\delta(q, A) = <q', A', S>$ aggiungo $qA \to q'A'$ alle produzioni
- $\delta(q, A) = <q', A', L>$ aggiungo per ogni $B$ nell'alfabeto della MT la
  produzione $BqA \to q'B'A'$

Quindi i due stati che ho provato a disegnare sotto:

```txt
 ┌─┬─┬─┬─┬─┐   ┌─┬─┬─┬─┬─┐
 │α│B│A│C│β│   │α│B│A│C│β│
 └─┴─┴─┴─┴─┘   └─┴─┴─┴─┴─┘
      ↑              ↗
      q      ⊦      q'
```

Sono in relazione se e solo se $\diamond \alpha BqAC\beta \implies
\diamond\alpha BA'q'C\beta$. La costruzione della grammatica va completata
aggiungendo le regole che cancellano tutto ciò che sta a destra del separatore
$\diamond$ (separatore incluso) se e solo se la configurazione della MT è
accettante, ad esempio ($\diamond\alpha Bq_f AC \beta$).

Nel caso delle grammatiche monotone, visto che le produzioni si accorciano se
lette da destra a sinistra, allora usare solamente la memoria usata inizialmente
da $x$. Le grammatiche monotone sono, quindi, equivalenti ad un automa lineare,
ossia una MT con memoria finita.

## I pattern ed espressioni regolari

I pattern e le espressioni regolari (regex) sono due altri modelli utilizzati
per descrivere il linguaggi.

### I pattern

Un sistema di pattern è una tripla $<A, V, p>$ dove $A$ è un alfabeto, $V$ è un
insieme di variabili disgiunto con $A$ e $p$ è una stringa su $A \cup V$ detta
pattern. Il linguaggio generato dal sistema di pattern consiste di tutte le
stringhe su $A$ ottenute da $p$ sostituendo ogni variabile in $p$ con una
stringa su A.

### Le espressioni regolari

Dato un alfabeto $A$ e un insieme di simboli $\{+,\star,(,),.,\emptyset\}$ si
dice espressione regolare su $A$ la stringa
$R \in A \cup \{+,\star,(,),.,\emptyset\}$ che rende vera una delle seguenti
condizioni:

- $R = \emptyset$
- $R \in A$
- $R = S + T$, $R = ST$, $R = S^\star$, $R = S^+$ con $S,T$ espressioni
  regolari su $A$

Una notazione equivalente per indicare $+$ (unione) è il pipe $|$.

Le espressioni regolari seguono la stessa idea dei pattern ma hanno un potere
espressivo diverso. Infatti la famiglia dei linguaggi scrivibili come
espressione regolare non coincide con quella dei sistemi di pattern:

- $L = \{xx:x\in \{0,1\}*\}$ non è un linguaggio regolare, ma possiamo
  descriverla con il pattern $<\{0,1\}, \{x\}, xx>$
- Viceversa il linguaggio denotato da $o^*1^*$ non è un linguaggio
  esprimibile mediante un sistema di pattern

Quindi non c'è contenimento tra le due famiglie, ma hanno dei linguaggi in
comune. Si dice che le due famiglie sono non confrontabili.

Le espressioni regolari possiedono la stessa espressività delle grammatiche
regolari. L'equivalenza è facile da mostrare:

1. Dimostrare che le espressioni regolari denotino grammatiche regolari si
   dimostra: i casi base di espressione regolare denotano
   linguaggi regolari e poiché le regex sono chiuse rispetto alle 3 operazioni
   possibili, tutte le regex denotano grammatiche regolari
2. Dimostrare che le grammatiche regolari corrispondo ad espressioni regolari
   si farà in altri corsi più avanzati. Informalmente, si tratta di convertire
   i vari rami dell'albero delle derivazioni in espressioni regolari.

## Modello dichiarativo: logica

La logica è un elemento fondamentale dell'informatica. Esistono molti linguaggi
logici, ognuno con diversi livelli di espressività e utilizzo. Nell'ambito di
questo corso useremo la logica del primo ordine con due scopi: definizione di
linguaggi e specifica della proprietà dei programmi. La logica, infatti, ci
permetterà di definire i linguaggi specificandone le proprietà e di esprimere
delle condizioni che le nostre computazioni devono rispettare.

Consideriamo il linguaggio $\{a^n b^n : n \geq 0\}$, come possiamo descriverlo
con una formula del primo ordine? Una forma è:

$$
  \forall x (x \in L \iff \exists n (N \geq 0 \land a = a^n . b^n))
$$

Usando i predicati $\in L$, $\geq$ e $=$ e le funzioni di concatenazione ed
elevamento a potenza. Occorrerebbe definire tutti i predicati e le funzioni
utilizzate. Caratterizziamo un altro linguaggio: $L_1 = a^*b^*$. Uno strumento
utile per caratterizzare il linguaggio con la logica è quello di pensare in modo
induttivo. La forma logica corrispondente a $L_1$ è:

$$
  \forall x (x \in L_1 \iff (x = \epsilon) \lor
    \exists y (x = ay \land y \in L_1) \lor \exists y (x = yb \land y \in L_2))
$$

Consideriamo il linguaggio $L_2 = a^* b^* c^*$. Possiamo vederlo come $a^* b^* .
b^* c^*$ dove entrambi questi sotto-linguaggi, chiamiamoli $L_1$ ed $L_3$, hanno
struttura simile a $L_1$. Quindi una stringa appartiene ad $L_2$ se appartiene
ad uno dei due linguaggi oppure se la prima sotto-stringa inizia con 'a' seguita
da un suffisso $y$ composto sia da 'a' e 'b' e la seconda sotto-stringa è
composta da un prefisso $y$ di 'b' e 'c' seguito da una c. Una formula del primo
ordine che caratterizza la seguente è:

$$
  \forall x (x \in L_2 \iff x\in L_1 \lor x \in L_3 \lor
    \exists y (x = ay \land (y \in L_2 \lor y \in L_3)) \lor
    \exists y (x = yc \land (y \in L_2 \lor y \in L_3)))
$$

Si può ridurre questa formula? Certo. Mantenendo la struttura come
concatenazione possiamo scrivere $\forall x (x \in L_2 \iff \exists z \exists y
(y \in L_1 \land z \in L_3 \land x = y.z))$.

Consideriamo l'ulteriore esempio del linguaggio
$L_4 = \{x \in \{a,b\} : \text{ numero di } a \text{ è uguale al numero di } b\}$.
Per indicare "il numero di" introduciamo la funzione di arietà 2 $\#(x,a)$ che
indica il numero di occorrenze del carattere 'a' nella stringa $x$ così
formalmente definita:

$$
\begin{align}
  \forall x \forall y & ((x = \epsilon \implies \#(x,a)=0) \land
    (x = a.y \implies \#(x,a) = \#(y,a)+1) \land (x=b.y \implies \#(x,a) = \#(y,a)))
    \land \\
  \forall x \forall y & ((x = \epsilon \implies \#(x,b)=0) \land
    (x = b.y \implies \#(x,b) = \#(y,b)+1) \land (x=a.y \implies \#(x,b) = \#(y,b)))
\end{align}
$$

Il nostro linguaggio in formula del primo ordine sarà
$\forall x (x \in L_4 \iff \#(x,a)=\#(x,b))$.

### Logica monadica del primo ordine

Consideriamo un frammento di logica del primo ordine che ci permette di
descrivere parole su un alfabeto $I$: la logica monadica del primo ordine o MFO.
La sintassi di questa logica è la seguente:

$$
  \phi := a(x) | x < y | \neg \phi | \phi \land \phi | \forall x (\phi)
$$

Con $a \in I$, cioè introduciamo un predicato unario per ogni singolo
dell'alfabeto, $<$ solita relazione di minore e $\mathbb{N}$ come dominio delle
variabili. Il resto dei predicati che usavamo può essere definito usando solo
gli elementi precedenti:

$$
\begin{align}
  \phi_1 \lor \phi_2 & \triangleq \neg(\neg\phi_1\land\neg\phi_2) \\
  \phi_1 \implies \phi_2 & \triangleq \neq\phi_1\lor\phi_2 \\
  \exists x(\phi) & \triangleq \neg \forall x(\neg\phi) \\
  x = y & \triangleq \neg(x<y) \land \neg(y<x) \\
  x \leq y & \triangleq \neg(y<x)
\end{align}
$$

Possiamo anche definire:

- costante $0$: $x = 0 \triangleq \forall y(\neg(y<x))$
- il predicato per il successore $succ(x,y)$: $succ(x,y) \triangleq x<y \land
  \neg\exists z(x<z \land z<y)$
- le costanti 1,2,3 come i successori di 0,1,2

#### Interpretazione come parola sull'alfabeto

Data una parola $w \in I^+$ ed un simbolo $a\in I$, $a(x)$ è vera se e solo se
l'$x$-esimo simbolo di $w$ è $a$ (il primo simbolo di $w$ ha indice 0). Per
esempio una formula che è vera su tutte e solo le parole il cui primo simbolo
esiste ed è 'a' è: $\exists x(x = 0 \land a(x))$.

Per comodità possiamo definire altre abbreviazioni del tipo $y=x+1$ per indicare
$succ(x,y)$, $y=x+k$ per indicare lo spiazzamento di $k$, $y=x-1$ per indicare
$succ(y,x)$ e analogamente $y=x-k$ e $last(x)$ per indicare l'ultima posizione.

#### Semantica

Siano $w\in I^+$ e $V_1$ l'insieme delle variabili. UN assegnamento è una
funzione $\nu_1 : V_1 \to \{0,1,\ldots,|w|-1\}$ tale che:

- $w \nu_1 \models a(x)$ se e solo se $w = uav$ e $|u| = \nu_1(x)$
- $w \nu_1 \models x < y$ se e solo se $\nu_1(x) < \nu_1(y)$
- $w \nu_1 \models \neg\phi$ se e solo se non $w\nu_1 \models \phi$
- $w \nu_1 \models \phi_1 \land \phi_2$ se e solo se $w,\nu_1 \models \phi_1$ e
  $w,\nu_1 \models \phi_2$
- $w \nu_1 \models a(x)$ se e solo se $w,\nu_1' \models \phi$ per ogni $v_1'$
  con $\nu_1'(y) = \nu_1(y)$, $y \neq x$

Possiamo così definire il linguaggio corrispondente ad una formula $\phi$ come:
$L(\phi) = \{w\in I^+ : \exists \nu_1 w, \nu_1 \models \phi \}$.

#### Proprietà della MFO

- I linguaggi esprimibili tramite MFO sono chiusi rispetto a unione,
  intersezione e complemento.
- In MFO non si può esprimere un particolare linguaggio $L_p$ fatto di tutte e
  sole le parole di lunghezza pari su un alfabeto di una singola lettera. Ciò è
  dovuto alla limitatezza espressiva della MFO: è meno potente degli FSA.
- I linguaggi definiti da MFO non sono chiusi rispetto alla $\star$ di Kleene.
  Infatti se consideriamo il semplicissimo linguaggio $L=a(0) \land a(1) \land
  last(1)$ (composto solo da 'aa'), possiamo scrivere che $L_p = L^*$. Le MFO,
  quindi, esprimo i linguaggi 'star-free'

### Logica monadica del secondo ordine

Per permettere alla logica monadica si avere lo stesso potere espressivo degli
FSA bisogna di permette di quantificare i predicati monadici. Ammettiamo quindi
formule del tipo $\exists X(\phi)$ dove $X$ è una variabile il cui dominio è
l'insieme dei predicati monadici.

In questo caso la semantica prevede anche un secondo assegnamento $\nu_2: V_2
\to \wp([0..w-1])$ con

- $w, \nu_1, \nu_2 \models X(x)$ se solo se $\nu_2(x) \in \nu_2(X)$
- $w, \nu_1, \nu_2 \models \exists X(\phi)$ se e solo se $w, \nu_1, \nu_2'
  \models \phi$ per qualche $\nu_2'$ con $\nu_2'(Y) = \nu_2(Y)$, $Y \neq X$

Possiamo allora descrivere il linguaggio $L_p$ visto precedentemente:

$$
  \exists P(\forall x(\neg P(0) \land (\neg P(x) \iff P(x+1) \land a(x) \land
    (last(x) \implies P(x))))
$$

Dove $P$ indica un insieme di posizioni dispari.

#### Da FSA a MSO

In generale, grazie alle quantificazioni del secondo ordine, per ogni FSA, è
possibile scrivere una formula MSO equivalente.

Innanzitutto ogni predicato monadico quantificato corrisponde a ciascuno stato.
Se nell'automa avviene, mettiamo i vari stati in esclusione mutua. Infine
codifico tutte le transizioni usando $last(x)$ e $\neg last(x)$ per
caratterizzare gli stati finali e non finali rispettivamente.

#### Da MSO a FSA

Si può eseguire anche la trasformazione inversa tramite un processo ben definito
(teorema di Büchi-Elgot-Trakhtenbrot). Noi non la vedremo poiché molto tecnica.
Insieme alla precedente trasformazione possiamo finalmente sancire l'equivalenza
tra FSA e MSO.

### Precondizioni e postcondizioni

Vediamo infine un ultimo uso della logica: quello di caratterizzazione di alcune
condizioni che il nostro programma deve rispettare. Infatti, quando si programma
una funzione è più importante specificare cosa il programma fra invece di come
lo fa. Per specificare il tutto useremo la notazione di Hoare:

$$
\begin{aligned}
  & \{ \mathtt{Precondizione} \} \\
  & \text{Programma } P \\
  & \{ \mathtt{Postcondizione} \}
\end{aligned}
$$

Se valgono le precondizioni, dopo l'esecuzione del programma varranno le
postcondizioni. Le precondizioni e le postcondizioni possono essere definite in
modi diversi nella pratica: linguaggio naturale (commenti), asserzioni e
linguaggi ad-hoc. Noi useremo la logica del primo ordine

Facciamo un esempio. Sia un programma $P$ che implementa la ricerca di un
elemento $x$ in un array ordinato di $n$ elementi. La precondizione sarà che
l'array sia ordinato e la postcondizione che la variabile logica
$\mathtt{found}$ deve essere vera se e solo se l'elemento $x$ esiste nell'array
$a$. Notiamo che non ci interessa che tipo di algoritmo è implementato da $P$.
Usando la notazione di Hoare otteniamo:

$$
\begin{aligned}
  & \{ \forall i (1 \leq i \leq n-1 \implies a[i] \leq a[i+1] \} \\
  & P \\
  & \{ \mathtt{found} \iff \exists i (1 \leq u \leq n \land a[i] = x \}
\end{aligned}
$$

## Teoria della computazione

Automi, grammatiche e altri formalismi possono essere considerati meccanici per
risolvere problemi matematici. Alcuni di questi sono più potenti di altri, ad
esempio le MT riconosco una famiglia di linguaggi che non riconoscibili da PDA.
Inoltre nessun formalismo è più potente delle macchine di Turing. Possiamo,
quindi, chiederci se questi modelli possono catturare l'essenza di un generico
solutore meccanico? Inoltre se un problema è stato formalizzato adeguatamente,
possiamo sempre risolverlo mediante dispositivi meccanici?

### I problemi

Prima di parlare di risolverli, dobbiamo definire bene il concetto di problema.
Molti problemi possono essere formalizzati come riconoscimento di linguaggi o
traduzione: $x \in L$ o $y = \tau(x)$. Con questi due formalismi possiamo
descrivere tutti i problemi con domini numerabili. Infatti tutti gli elementi
di tali domini possono essere messi in corrispondenza biunivoca con gli elementi
di $\mathbb{N}$. Un problema di questo tipo è ridotto al calcolo di una funzione
$f: \mathbb{N} \to \mathbb{N}$. Si può anche dimostrare che riconoscimento e
traduzione possono ridotte l'una all'altra:

- Se ho una macchina che può risolvere tutti i problemi della forma $y = \tau
  (x)$ e voglio usarla per risolvere il problema $x \in L$ è sufficiente
  definire $\tau(x) = 1$ se $x \in L$ e $0$ altrimenti
- Se ho una macchina che può risolvere tutti i problemi della forma $x \in L$,
  posso definire un linguaggio $L_{\tau} = \{ x\diamond y : y = \tau(x) \}$. Per
  una $x$ fissata, posso enumerare tutte le possibili stringhe $y$ sull'alfabeto
  di uscita e per ognuna di esse posso chiedere alla macchina se $x\diamond y
  \in L_{\tau}$.

Tutti i nostri modelli esaminati sono discreti, in accordo con la tecnologia
digitale. La classe dei problemi che possono essere risolti da una MT è
indipendente dall'alfabeto scelto, sempre che ci siano almeno due simboli.
Inoltre data una MT, si può costruire un programma in Java, C o FORTRAN che la
simula e viceversa. Questi linguaggi di programmazione hanno, quindi, la stessa
espressività delle macchine di Turing e vengono detti "Turing completi".

Prima abbiamo detto che le macchine di Turing sono il più potente formalismo di
calcolo automatico. Questa è la cosiddetta tesi di Church. Esso non è un
teorema poiché andrebbe verificato ogni volta che qualcuno inventa un nuovo
modello computazionale. Nonostante ciò è largamente accettato dagli studiosi
come teorema.

### Gli algoritmi

Introduciamo un altro concetto fondamentale per l'informatica: l'algoritmo.
Intuitivamente con un algoritmo intendiamo una procedura per risolvere problemi
mediante un dispositivo di calcolo automatico. Gli algoritmi godono di alcune
proprietà (qui enunciate in modo informale):

1. La sequenza di istruzioni dev'essere finita
2. Qualunque istruzione dev'essere eseguibile mediante un processore meccanico
   per il calcolo
3. Il processore è dotato di memoria per immagazzinare risultati intermedi
4. La computazione è discreta: l'informazione è codificata digitalmente e
   la computazione procede attraverso passi discreti
5. Gli algoritmi sono eseguiti in modo deterministico
6. Non c'è limite sulla quantità di dati in ingresso e in uscita
7. Non c'è limite sulla quantità di memoria richiesta per effettuare una
   computazione
8. Non c'è limite sul numero di passi discreti richiesti per effettuare una
   computazione

A questo punto possiamo riformulare la tesi di Church come: "Ogni algoritmo si
può codificare con un macchina di Turing". Possiamo quindi dire che non esiste
algoritmo che non possa essere risolto da una macchina di Turing. La MT è,
quindi, il più potente calcolatore che avremo mai.

Quali sono però i problemi che possiamo risolvere tramite un algoritmo? Una
risposta un po' banale è: quelli risolvibili dalle macchine di Turing.

### Enumerazione algoritmica

Un insieme $S$ può essere enumerato algoritmicamente se possiamo trovare una
biezione $E$ tra $S$ e $\mathbb{N}$ e può essere calcolata con un algoritmo.

Un risultato importante è che tutte le macchine di Turing possono essere
enumerate algoritmicamente. Per dimostrare ciò bisogna trovare un algoritmo
capace di associare ad ogni MT un intero. Alcune ipotesi aggiunti che ci
semplificano la vita, ma non ledono la generalità sono considerare una MT a
nastro singolo e considerare un alfabeto fissato $A = \{ 0,1,\not{b}\}$.
Consideriamo le MT con solo due stati. Calcoliamo la cardinalità dell'insieme di
tutte le possibili funzioni di transizione. Innanzitutto le funzioni di
transizione avranno forma:

| Stato | $0$    | $1$    | $\not{b}$ |
|-------|--------|--------|-----------|
| $q_0$ | $\bot$ | $\bot$ | $\bot$    |
| $q_1$ | $\bot$ | $\bot$ | $\bot$    |

| Stato | $0$    | $1$           | $\not{b}$ |
|-------|--------|---------------|-----------|
| $q_0$ | $\bot$ | $\bot$        | $\bot$    |
| $q_1$ | $\bot$ | $<q_0, 0, S>$ | $\bot$    |

Consideriamo al segnatura di $\delta$:

$$
  \delta : Q \times A \to Q \times A \times \{R,L,S\} \cup \{\bot\}
$$

In generale, usando il teorema che afferma che il numero di funzioni $f: D \to
R$ è $|R|^{|D|}$. Otteniamo quindi $|Q| = 2, |A|=3 \implies (2*3*3+1)^{(2*3)} =
19^6$. Infine, considerando le 4 possibili scelte di stati finali otteniamo un
massimo di $19^6*2^2$ macchine possibili. Ora possiamo ordinare l'insieme di
macchine così ottenuto secondo un ordinamento arbitrario.

Iterando il procedimento, possiamo sempre ricavare un numero finito di macchine
di Turing a $n$ stati. Quindi possiamo scrivere un algoritmo che le conti e
quindi enumerare algoritmicamente le macchine di Turing.

Il numero $E(M)$ è detto numero di Gödel della macchina $M$ ed indica il suo
indice. $E$ è detta Gödelizzazione.

### Macchina di Turing universale

Chiediamoci ora se le macchine di Turing siano in grado di modellare i
calcolatori programmabili. Per ciò consideriamo la macchina di Turing
universale (UTM). La UTM computa la funzione $g(y,x) = f_y (x)$ dove $f_y$ è la
funzione calcolata dalla macchina di Turing con indice $y$.

Per come l'abbiamo definita, sembrerebbe che la UTM è un altro tipo di automa
rispetto alle MT poiché la prima lavora su $\mathbb{N}^2$ e l'altra su
$\mathbb{N}$. Sappiamo però che $|\mathbb{N}^2| = |\mathbb{N}|$ poiché esiste
una biezione tra i due membri:

$$
  d(x,y) = \frac{(x+y)(x+y+1)}{2} + x
$$

Possiamo così codificare $g(y,x)$ come una $\hat{g}(n) = g(d^{-1}(n))$ con $n =
d(y,x)$ e $<y,x> = d^{-1}(n)$.

Una UTM che calcola $\hat{g}$ è così organizzata:

1. Dato $n$ calcola $d^{-1} = <y,x>$
2. Costruisce la funzione di transizione $M_y$ calcolando $E^{-1}$ e la
   memorizza sul suo nastro
3. In un'altra porzione di nastro memorizza una codifica della configurazione
   di $M_Y$
4. Infine lascia sul nastro $f_y(x)$ se e solo se $M_y$ termina la sua
   computazione su $x$

### Funzioni calcolabili

È possibile calcolare tutte le funzioni da $\mathbb{N}$ a $\mathbb{N}$? La
risposta è purtroppo negativa. Quindi, per la tesi di Church, esistono problemi
non risolvibili tramite algoritmi. Cerchiamo di capire il perché di ciò.
Calcoliamo la cardinalità dell'insieme di funzioni naturali a variabile
naturale. Consideriamo il sottoinsieme di $f: \mathbb{N} \to \{0,1\}$. È
possibile calcolare la cardinalità di questo insieme ed essa è pari a quella di
$\wp{\mathbb{N}}$ ossia $2^{\aleph_0}$ ossia la cardinalità del continuo. Visto
che abbiamo considerato un sottoinsieme, la cardinalità che cerchiamo è
sicuramente maggiore di quella del continuo. Poiché l'insieme di funzioni
calcolabili dalle macchine di Turing è per definizione numerabile ($\aleph_0$)
non abbiamo abbastanza MT per risolvere tutti i problemi possibili.

### Problemi definibili

Per definire un problema ci serve una frase, o stringa, di qualche linguaggio
che li caratterizzi. Quindi ogni linguaggio è un sottoinsieme di $A*$, che è un
insieme numerabile. L'insieme di tutti i problemi che posso definire è quindi
numerabile. Sorge quindi la seguente domanda: tutti i problemi che posso
definire sono risolvibili. L'implicazione inversa è ovviamente vera.

Un famoso problema definibile ma non risolvibile algoritmicamente è lo "Halting
Problem": costruito un programma che, dati dei dati in ingresso, esegue una
computazione che potrebbe terminare, è possibile determinare in anticipo se
terminerà? Formalmente ci chiediamo se esiste una macchina di Turing che data
una funzione $f_y$ calcola la funzione $g(y,x)$ totale tale che $g(y,x) = 1$ se
$f_y(x) \neq \bot$ e $g(y,x)=0$ se $f_y(x) = \bot$. Nota bene: non ci stiamo
chiedendo se è possibile determinare l'arresto di uno specifico programma, ma di
determinare l'arresto in generale.

> Esistono diversi metodi di dimostrazione. Noi useremo quello per
> diagonalizzazione analogo a quello usato da Cantor. Analogamente
> all'enumerazione delle cifre eseguita da Cantor, noi eseguiremo l'enumerazione
> di tutte le funzioni calcolabili da un macchina di Turing:

```txt
     | 1     | 2     | ... |
 ----+-------+-------+-----|
 f1  | f1(1) | f1(2) | ... |
 f2  | f2(1) | f2(2) | ... |
 f3  | f3(1) | f3(2) | ... |
 ... | ...  | ...  | ... |
```

> Ipotizziamo per assurdo che la nostra funzione $g$ sia calcolabile. Da $g$
> definiamo una funzione $h$ tale che $h(x) = 1$ se $g(x,x) = 0$ e $\bot$
> altrimenti. È facile dimostrare che se $g$ è calcolabile lo è anche $h$.
> Definendo così $h$, abbiamo definito una funzione che si pone sulla diagonale
> della nostra tavola delle funzioni e altera i valori $g$. Se $h$ è
> computabile, allora esisterà una MT che la calcola, ossia per qualche $i$ $h =
> f_i$. Provando a calcolare $h(i)$ otteniamo:
>
> - Se $h(i) = f_i(i) = 1$ allora $g(i,i) = 0$ cioè $f_i(i)=\bot$, che è una
>   contraddizione
> - Se $h(i) = f_i(i) = \bot$ allora $g(i,i) = 1$ cioè $f_i(i)\neq\bot$ che è
>   una contraddizione
>
> Siamo arrivati, così, all'assurdo e quindi $g$ non è calcolabile.

Possiamo quindi affermare con fermezza che l'insieme dei problemi decidibili è
strettamente incluso in quello dei problemi descrivibili.

La funzione:

$$
  h'(x) =
  \begin{cases}
    1 \quad f_y(x) = \bot \\
    0 \quad \text{altrimenti}
  \end{cases}
$$

Non è computabile. Essa un caso particolare del "Halting Problem" dove abbiamo
imposto che in $g(y,x)$ sarà $y=x$. Nota bene che $h'$ non è un corollario dello
"Halting Problem" e non deriva da esso. Infatti un caso specifico di un problema
non risolvibile non è detto che sia anche esso non risolvibile, ma potrebbe
diventare risolvibile e viceversa se un problema è risolvibile la sua
generalizzazione non rimane generalmente risolvibile. Se un problema è già non
risolvibile, invece, la sua generalizzazione sarà sempre non risolvibile e se
un problema è risolvibile lo sarà sicuramente anche la sua specializzazione.

Consideriamo un'altra funzione dagli interessanti riscontri pratici:

$$
  k(y) =
  \begin{cases}
    1 & \text{ se } f_y(x) \neq \bot\\
    0 & \text{ altrimenti}\\
  \end{cases}
$$

La funzione $k(y)$ non è computabile. Questo problema presenta un
quantificazione su tutti i possibili dati in ingresso. In qualche caso potremmo
essere in grado di stabilire, per uno specifico valore di $x$, se $f_y(x) \neq
\bot$. Anche se potessimo farlo per ogni singolo valore specifico di x non
saremmo necessariamente in grado di rispondere alla domanda "$f_y$ è un
funzione totale?". Se trovo qualche $x$ tale che $f_y(x) = \bot$ allora posso
dire che $f_y$ non è totale, ma se non lo trovassi? Da un punto di vista
pratico, questo problema è forse ancora più importante di quello dell'arresto.
In questo caso, infatti, ci chiediamo se il programma non termini per qualsiasi
ingresso, invece di chiedercelo solo per uno come nel problema dell'arresto.

> Dimostriamo che la funzione $k$ non è computabile. Ipotizziamo per assurdo che
> sia computabile e per definizione totale. Definiamo allora $g(x) = w$ pari
> all'indice della $x-esima$ MT che calcola una funzione totale. Se $k$ sarà
> computabile e totale allora lo sarà anche $g$. Sia $w_0$ il primo valore tale
> che $k(w_0) = 1$, allora sia $g(0) = w_0$. La funzione $g$ sarà sia totale che
> monotona crescente in quanto $w_{x+1} > w_x$. Sarà una funzione anche $g^{-1}$
> anch'essa strettamente monotona ma non totale in quanto è definita solo se $w$
> è l'indice di una funzione totale. Definiamo allora $h(x) = f_{g(x)}(x) + 1$
> con $f_{g(x)}$ computabile e totale, quindi anche $h$ sarà computabile e
> totale. Pertanto abbiamo $h = f_i$ per qualche $i$. Poiché $h$ è totale, è
> definita $g(i)^{-1}$. Sia allora $g^{-1}(i) = j$, qual è il valore di $j$?
>
> - $h(j) = f_{g(j)}(j) + 1 = f_i (i) + 1$
> - $h = f_i \implies h(j) = f_i (j)$
>
> Siamo così arrivati ad un assurdo, dimostrando la nostra tesi.

### Problema di decisione

Un problema di decisione è una domanda che ah due possibili risposte: vero o
falso. La domanda riguarda un qualche ingresso. Un problema è detto
semidecidibile se esiste una algoritmo che ritorni "vero" se la risposta è
"vero" (può entrare in loop se la risposta è "falso"). Tornando al problema
dell'arresto, possiamo capire se esso è semidecidibile? Sì, infatti possiamo
osservare se la MT si ferma su uno stato di accettazione. Se essa non si ferma,
neanche il nostro algoritmo si fermerà, ma ciò permesso dalla definizione di
semidecidibilità. Ciò si può dimostrare usando un procedimento simile alla
tecnica diagonale.

C'è un gran numero di problemi indecidibili che sono semidecidibili. Notiamo che
il problema semidecidibili descrive la presenza dell'errore e non la sua
assenza! Questo fatto ha un importante implicazione nella verifica di programmi
basata su testing. Secondo Dijkstra, infatti, il testing può dimostrare la
presenza di errori non la loro assenza (asserzione di Dijkstra).

### Insiemi ricorsivi

Concentriamoci sui problemi a risposta binaria. Tutti i problemi di questo tipo
possono essere riformulati come $x \in S$. La funzione caratteristica di un
insieme $S$ $c_S(x) = 1$ se $x \in S$ e $0$ altrimenti. Se $c_S(x)$ è
computabile allora l'insieme $S$ è detto ricorsivo (o decidibile). Un insieme è,
invece, ricorsivamente enumerabile (o semidecidibile) se e solo se:

- $S$ è vuoto
- $S$ è l'immagine di una funzione $g_S$ totale e computabile

#### Teorema - 0.5 + 0.5 = 1

1. Se $S$ è ricorsivo, allora è anche ricorsivamente enumerabile
2. $S$ è ricorsivo se e solo se sia $S$ e il suo complemento $\bar{S} =
   \mathbb{N} \setminus S$ sono ricorsivamente enumerabili.

> 1. Dimostriamo che se è ricorsivo allora è ricorsivamente enumerabile.
>    - Se $S$ è vuoto, allora è ricorsivamente enumerabile per definizione
>    - Se $S$ non è vuoto, sia la sua funzione caratteristica $c_s$. Possiamo
>      allora definire la funzione generatrice $g_S$ ponendola pari a $x$ se
>      $c_S(x) = 1$ e $k$ altrimenti
>    $S$ è ricorsivamente enumerabile.
> 2. Poiché l'unione tra $S$ e il suo complementare è $\mathbb{N}$ e
>    l'intersezione è nulla, possiamo dire che possiamo trovare qualunque $x$
>    naturale in una delle enumerazioni di $S$ o $\bar{S}$. Posso quindi
>    costruire una enumerazione $\{ g_S(0), g_{\bar{S}}(0), g_S(1),
>    g_{\bar{S}}(1), \ldots \}$ e calcolare la la caratteristica di $S$ vedendo
>    se la posizione di $x$ è pari ($x\in S$) o dispari.

Consideriamo l'insieme $S$ tale che:

- $i \in S \implies f_i$ totale
- $f$ totale e computabile $\implies \exists i \in S : f_i -f$

Esso non è nemmeno ricorsivamente enumerabile (si può dimostrare). Questo
significa che non esiste un formalismo semidecidibile che possa definire tutte
le funzioni computabili totali e solo quelle. Possiamo però, sbarazzarci delle
funzioni parziali, estendendole oppure arricchendo $\mathbb{N}$ con un nuovo
simbolo. Questo trucchetto però non funziona perché si può dimostrare che non
esiste una funzione totale e computabile che sia un'estensione della seguente
funzione:

$$
  g(x) =
  \begin{cases}
    f_x(x) + 1 & \text{ se } f_x(x) \neq \bot \\
    \bot & \text{ altrimenti}
  \end{cases}
$$

L'estensione di una funzione quindi no preserva la computabilità. Inoltre
possiamo dimostrare che esistono insiemi che sono semidecidibili senza essere
decidibili. Possiamo costruire quindi un gerarchia di inclusioni strette tra
vari tipi di insiemi:

$$
  \text{Ricorsivi} \subset \text{RE} \subset \wp(\mathbb{N})
$$

!!: **APPUNTI PRESI DIRETTAMENTE IN BELLA COPIA**

## Complessità del calcolo

Calcolare la complessità di una computazione significa calcolare l'efficienza e
il costo in tempo di una computazione. Come lo possiamo misurare? Dobbiamo prima
definire degli strumenti per valutare la complessità e successivamente potremmo
enunciare degli algoritmi e strutture dati notevoli.

Per quantificare l'efficienza di un algoritmo, faremo analisi qualitative su:

1. Tempo di calcolo impiegato
2. Spazio occupato (registri, cache, RAM, disco o nastro)

Si possono fare analisi anche su altri aspetti come i costi di sviluppo, ma noi
non li considereremo.

Per la tesi Church, un problema è calcolabile indipendentemente dallo strumento
usato, purché tale strumento sia Turing completo. Possiamo dire lo stesso per la
complessità? Purtroppo no. Noi considereremo per convenzione quello della
macchina di Turing deterministica.

### Complessità temporale e spaziale

#### Definizione -  Complessità temporale

Data la computazione di $M$ (a $k$ nastri) deterministica, la complessità
temporale è $T_M(x) = r$ se $M$ termina in $c_r$ ($c_i$ le configurazioni). Se
la computazione non termina, allora $T_M(x) = \infty$.

#### Definizione - Complessità spaziale

Data la computazione di $M$ (a $k$ nastri) deterministica, la complessità
spaziale è:

$$
  S_M(x) = \sum_{j=1}^{k} max_{i \in \{0,...,r\}}(|\alpha_{ij}|
$$

Con $\alpha_{ij}$ il contenuto del $j$-esimo nastro alla $i$-esima mossa.

NB: $\forall x \frac{S_M(x)}{k} \leq T_M(x)$

Dobbiamo gestire un po' troppi dettagli considerando solo le definizioni.
Effettuiamo delle semplificazioni: esprimeremo la complessità in base alla
"dimensione" dei dati in ingresso $n$. A causa di questa semplificazione
dobbiamo considerare 3 casi per gestire la variazione di ingressi diversi ma di
stessa lunghezza:

1. Caso pessimo: $T_M(n) = max_{|x|=n} T_M(x)$
2. Caso ottimo: $T_M(n) = min_{|x|=n} T_M(x)$
3. Caso medio: $T_M(n) = \frac{\sum_{|x|=n} T_M(x)}{|I|^n}$

Noi considereremo sempre il caso pessimo in quanto è il più rilevante. Inoltre
l'analisi del caso medio risulta assai più complessa in quanto dovrebbe tenere
conto di ipotesi probabilistiche sulla distribuzione dei dati.

### Comportamento asintotico

I valori esatti delle due complessità per un dato $n$ non sono particolarmente
utili. La prima (e più forte) semplificazione che facciamo è quella di
considerare solo il comportamento asintotico, ossia $n \to \infty$. Per
esprimere il comportamento asintotico abbiamo 3 notazioni:

1. $\mathcal{O}$-grande: limite asintotico superiore
2. $\Omega$-grande: limite asintotico inferiore
3. $\Theta$-grande: limite asintotico sia superiore che inferiore

#### Definizione - $\mathcal{O}$-grande

Data una funzione $g(n)$, $\mathcal{O}(g(n))$ è l'insieme

$$
  \mathcal{O}(g(n)) = \{ f(n) : \exists c>0, n_0>0 \forall n>n_0 0 \leq f(n)
    \leq cg(n)\}
$$

#### Definizione - $\Omega$-grande

Data una funzione $g(n)$, $\Omega(g(n))$ è l'insieme:

$$
  \Omega(g(n)) = \{ f(n) : \exists c>0, n_0>0 \forall n>n_0 0 \leq cg(n)
    \leq f(n)\}
$$

#### Definizione - $\Theta-grande

Data una funzione $g(n)$, $\Theta(g(n))$ è l'insieme:

$$
  \Theta(g(n)) = \{ f(n) : \exists c_1>0, c_2>0, n_0>0 : \forall n>n_0, 0 \leq
    c_1 g(n) \leq f(n) \leq c_2 g(n) \}
$$

#### Proposizione - Proprietà

1. $ g = \mathcal{O}(f) \iff f = \Theta{g}$
2. Le tre relazioni sono transitive e riflessive
3. La $\Theta$ è anche simmetrica, perciò è una relazione di equivalenza

I nostri 3 limiti possono essere definiti anche come limiti:

1. $lim_{n \to \infty} \frac{f}{g} = c \implies f(n) = \Theta(g(n))$
2. $lim_{n \to \infty} \frac{f}{g} = 0 \implies f(n) = \mathcal{O}(g(n))$

### Teoremi di accelerazione lineare

#### Teorema di accelerazione lineare 1

Se $L$ è accettato da una MT $M$ a $k$ nastri in $S_m(n)$, per ogni $c \in
\mathbb{R}^+$ posso costruire una MT $M'$ a $k$ nastri che accetta $L$ con
$S_{M'} < cS_m(n)$.

In pratica, ciò vuol dire comprimere l'alfabeto di $M$ usando un alfabeto più
ricco per $M'$. Scelto un fattore $r$ di compressione tale che $rc > 2$, per
ogni alfabeto $\Gamma_i$ dell'$i$-esimo nastro di $M$ costruisco $\Gamma_i'$ di
$M'$ assegnando un elemento per ogni $s \in \Gamma_i^r$.

#### Teorema di accelerazione lineare 2

Se $L$ è accettato da una MT $M$ a $k$ nastri in $S_m(n)$, posso costruire una
MT $M'$ a 1 nastro (non nastro singolo) che accetta $L$ con $S_{M'}(n) = S_M(n)$

#### Teorema di accelerazione lineare 3

Se $L$ è accettato da una MT $M$ a $k$ nastri in $S_m(n)$, per ogni $c \in
\mathbb{R}^+$ posso costruire una TM $M'$ a 1 nastro che accetta $L$ con
$S_{M'}(n) < cS_M(n)$.

#### Teorema di accelerazione lineare 4

Se $L$ è accettato da una MT $M$ a $k$ nastri in $T_m(n)$, per ogni $c \in
\mathbb{R}^+$ posso costruire una MT $M'$ a $k+1$ nastri che accetta $L$ con
$T_{M'}(n) = \max(n+1, cT_M(n))$.

L'approccio simile alla complessità spaziale: codifichiamo in modo compresso i
simboli dell'alfabeto di $M$. Dobbiamo considerare che la compressione è fatta a
"runtime". Comprimendo $r$ simboli in uno, però, nel caso pessimo possono
servire 3 mosse di $M'$ per emularne $r+1$ di $M$.

Lo schema di dimostrazione usato per dimostrare questi teoremi per le MT vale
anche per il modello di calcolatore di Von Neumann. Possiamo avere quindi avere
speedup lineari arbitrariamente grandi aumentando il parallelismo fisico.
Miglioramenti più che lineari, però, possono essere ottenuti solo cambiando
algoritmo. Concepire algoritmi più efficienti è di gran lunga più efficace che
usare la forza bruta.

### Altri modelli di calcolo e macchina RAM

Per altri tipi di automi abbiamo complessità diverse e alcune volte più facili
da calcolare:

1. FSA: hanno sempre $S_{FSA}(n) = \Theta(1)$ e $T_{FSA} = \Theta(n)$
2. PDA: hanno sempre $S_{PDA}(n) = \mathcal{O}(n)$  e $T_{PDA}(n) = \Theta(n)$
3. MT a nastro singolo: non esiste algoritmo più efficiente di $T_m(n) =
   \Theta(N^2)$ e $S_m(n) = \Theta(n)$. Quindi le MT benché più potenti sono
   molto più lente.

Le macchine di Turing operano con differenze marginali rispetto ad un
calcolatore: un calcolatore è in grado di fare operazioni aritmetiche su tipi a
dimensione finita in tempo costante, mentre la MT richiede di propagare gli
effetti al singolo bit uno per uno. Inoltre un calcolatore opera con un alfabeto
molto vasto ($|I| = 2^w$ con $w$ la lunghezza in bit della parola). La
differenza più importante è che il calcolatore può accedere direttamente ad una
cella di memoria, una MT invece impiega $\Theta(n)$ con $n$ la distanza della
cella dalla testina. Ci conviene, quindi, modificare il nostro modello di
calcolo e avvicinarci ai calcolatori reali.

Introduciamo allora un nuovo modello, ossia quello della macchina RAM, simile ad
uno schema base di un computer:

1. 2 nastri, uno di lettura e uno di scrittura
2. Un program counter tiene traccia a che punto siamo in un programma cablato
   nella macchina
3. L'unità aritmetica esegue le varie operazioni avvedendo a programma e alla
   memoria
4. La memoria è dotata di indirizzamento diretto $N[n]$. La prima cella ($N[0]$)
   è detta accumulatore
5. Ogni cella di memoria contiene un intero arbitrariamente lungo

La macchina RAM usa un set di istruzioni pseudo-assembly:

| Istruzione | Semantica                  |
|------------|----------------------------|
| `LOAD X`   | $N[0] \gets N[X]$          |
| `LOAD= X`  | $N[0] \gets X$             |
| `LOAD* X`  | $N[0] \gets N[N[X]]$       |
| `STORE X`  | $N[X] \gets N[0]$          |
| `STORE* X` | $N[N[X]] \gets N[0]$       |
| `ADD X`    | $N[0] \gets N[0] + N[X]$   |
| `SUB X`    | $N[0] \gets N[0] - N[X]$   |
| `MUL X`    | $N[0] \gets N[0] * N[X]$   |
| `DIV X`    | $N[0] \gets N[0] / N[X]$   |
| `ADD= X`   | $N[0] \gets N[0] + X$      |
| `SUB= X`   | $N[0] \gets N[0] - X$      |
| `MUL= X`   | $N[0] \gets N[0] * X$      |
| `DIV= X`   | $N[0] \gets N[0] / X$      |
| `HALT`     | $-$                        |
| `READ X`   | $N[X] \gets In$            |
| `READ* X`  | $N[N[X]] \gets In$         |
| `WRITE X`  | $Out \gets N[X]$           |
| `WRITE= X` | $Out \gets X$              |
| `WRITE* X` | $Out \gets N[N[X]]$        |
| `JUMP l`   | $PC \gets l$               |
| `JZ l`     | $PC \gets l$ se $N[0] = 0$ |
| `JGZ l`    | $PC \gets l$ se $N[0] > 0$ |
| `JLZ l`    | $PC \gets l$ se $N[0] < 0$ |

### Limiti del criterio di costo

Consideriamo il caso del calcolo di $2^{2^n}$ con una RAM. Uno schema di
implementazione è:

```c
read(n);
x = 2;
for (int i = 0; i < n; i++) x = x * x;
write(x);
```

La complessità temporale dell'implementazione sopra è $T_{RAM} = \Theta(n)$.
Qualcosa non quadra: mi servono $2^n$ bit solo per scrivere il risultato! Il
criterio di costo precedente considera un intero arbitrario di dimensione
costante. L'approssimazione regge fin quando una singola parola della macchina
reale contiene gli interi che maneggiano. Se questo non accade, dobbiamo tener
conto del numero di cifre necessarie per rappresentare un intero, perdendo il
costo costante del salvataggio di interi e delle operazioni elementari di essi.
In questi casi eseguire operazioni su un intero $i$ costa tanto quanto il suo
numero di cifre in base $b$: $\log_b(i) = \Theta(\log(i))$.

Forniamo allora una criterio di costo più realistico: il costo logaritmico. Una
operazione su interi costerà $\log_b(i) = \Theta(\log(i))$ ($b>2$). D'ora in poi
consideriamo la base binaria. Il costo delle varie operazioni aritmetiche hanno
complessità:

- Addizioni/sottrazioni: $\Theta(d = \log_2(i))$
- Moltiplicazioni (metodo scolastico): $\Theta(d^2)$. Possiamo migliorare la
  complessità (a grande discapito della facilità):
  - Primo miglioramento: $\Theta(d^{\log_2(3))) \approx \Theta(d^{1.58})$
  - Secondo miglioramento: $\Theta(d\log(d)\log(\log(d)))$
  - Terzo miglioramento: $\Theta(d\log(d))$
- Divisioni (metodo scolastico): $\Theta(d^2)$
  - Miglioramento: $\Theta(\log^2(d)) \cdot \mathit{costo_mul}$

Le operazioni di `JUMP` e `HALT` hanno costo costante.

Per scegliere tra i due criteri, usiamo queste due regoline:

1. Se la dimensione di ogni singolo elemento in ingresso non varia in modo
   significativo nell'esecuzione dell'algoritmo, usiamo il costo costante
2. Nel caso il cui ci sia un significativo cambio nella dimensione dei singoli
   elemento in ingresso usiamo il costo logaritmico.

### Rapporti tra complessità con diversi modelli di calcolo

Quanto effetto ha sulla complessità cambiare modelli di calcolo? Sotto
ragionevoli ipotesi di criteri di costo, se un problema è risolvibile da una TM
$M$ in $T_M(n)$, allora è risolvibile da un qualsiasi altro modello
Turing-completo in $\pi(T_M)$ dove $\pi(\cdot)$ è un opportuno polinomio.
Questa affermazione è detta "tesi di correlazione lineare"

#### Lemma - Occupazione sul nastro principale

Lo spazio occupato sul nastro principale è $\mathcal{O}(T_{RAM}(n))$.

> Ogni cella della RAM occupa $\log(i_j) + \log(M[i_j])$. Ogni cella della RAM
> viene materializzata solo se la ram effettua una `STORE`. La `STORE` costa
> alla RAM $\log(i_j) + \log(M[i_j])$. Per riempire $r$ celle, la RAM ci mette
> $\sum_{j=1}^r \log(i_j) + \log(M[i_j])$ in tempo: quantità identica allo
> spazio che occupano sul nastro della MT.

#### Teorema - Correlazione polinomiale tra TM e RAM

Data una macchina RAM e una MT, allora $T_{RAM} = \pi(T_M)$, con $\pi(\cdot)$ un
polinomio.

> Usiamo la simulazione. Consideriamo una RAM che simula una MT a k nastri.
> Mappiamo la MT sulla RAM:
>
> - Lo stato della MT corrisponderà alla prima cella di memoria della RAM
> - Useremo una cella di RAM per ogni cella di nastro
> - Suddividiamo la restante RAM in blocchi da k celle
>
> Riempiamo i blocchi con la seguente strategia: nel blocco 0 salviamo la
> posizione delle K testine, mentre nei rimanenti l'n-esimo simbolo di ognuno
> dei k nastri. La RAM ... . Eseguendo i calcoli, scopriamo che l'emulazione
> avrà costo costante per il criterio costante mentre $\Theta(T_M(n)\log(n))$ in
> costo logaritmico.
>
> Emuliamo ora con una TM la RAM (omettiamo le `MUL` e le `DIV` per semplicità.
> Innanzitutto organizziamo così il nastro della MT: ... . Inizialmente il
> nastro è vuoto, salviamo solo le celle in cui è avvenuta una `STORE`. Usiamo
> un ulteriore nastro per contenere $M[0]$ in binario. Usiamo un ultimo nastro
> come stoccaggio temporaneo per quando serve salvare per la prima volta
> $M[i_j]$ ma $M[i_k]$ e $M[i_l]$ sono già state salvate ... . Possiamo ora
> emulare le istruzioni:
>
> - `LOAD x`: cerco $x$ sul nastro principale, copio la porzione accanto nella
>   zona dati di $M[0]$ usando il nastro di supporto
> - `STORE x`: cerco $x$ sul nastro principale: se lo trovo, salvo il valore in
>   $M[0]$, altrimenti creo dello spazio usando il nastro di servizio se
>   necessario e salvo.
> - `ADD x`: cerco $x$, copio $M[x]$ sul nastro di supporto, calcolo la somma
>   scrivendo direttamente in $M[0]$
>
> In generale simulare una mossa della RAM richiede alla MT un numero di mosse
> minore o uguale di $c \cdot(\mathit{lunghezza nastro principale)$. Per il
> lemma di occupazione del nastro principale, la MT impiega al più
> $\Theta(T_{RAM}(n)$ per simulare una mossa della RAM. Se la RAM ha
> complessità $T_{RAM}(n)$, essa effettua al più $T_{RAM}(n)$ mosse. La
> simulazione completa della RAM da parte della MT costa al più
> $\Theta((T_{RAM}(n))^2)$, quindi il legame tra la macchina RAM e la MT è
> polinomiale.

La relazione polinomi tra il tempo di calcolo su $T_{RAM}(n)$ e $T_M(n)$ ci
consente di definire la classe di problemi risolvibili in tempo/spazio
polinomiale (classe $P$). Questo risultato ha portato alla formulazione di una
"tesi di trattabilità": i problemi risolvibili in $P$ sono quelli trattabili. La
classe $P$ comprende anche polinomi con esponenti molto grossi, empiricamente si
è visto che la maggioranza dei problemi polinomiali di interesse ha un grado
accettabile.

## Complessità di algoritmi

Dato un problema, un buon flusso di lavoro è:

1. Concepiamo un algoritmo che lo risolve
2. Ne valutiamo la complessità
3. Se la complessità è soddisfacente, lo implementiamo

Per la correttezza non c'è una soluzione in generale, ciò non nega che però lo
potremo fare in alcuni casi particolari.

Per codificare l'algoritmo abbiamo bisogno di un linguaggio. Noi useremo una
astrazione di un linguaggio imperativo per evitare di concentrarci sui dettagli
implementativi in un particolare linguaggio come il C, lo pseudocodice.

### Sintassi dello pseudocodice

Ogni algoritmo è rappresentato con una procedura (una funzione che modifica i
dati in input, non ritorna nulla).

- Operatori: funziona come in C, come notazione usiamo `<-` per l'assegnamento e
  le solite per i confronti.
- Commenti: solo mono riga, iniziano come in C con `//`
- Controllo: useremo `if-else`
- Strutture: ci sono gli array con la stessa notazione del C e i sotto array con
  la notazione tipo Python: `A[i..j]`. Possiamo creare anche aggregati
  eterogenei tipo `struct`, l'accesso avviene tramite `.`. Diversamente dal C,
  una variabile aggregata è un puntatore alla struttura. Un puntatore non valido
  ha valore `NIL`.
- Passaggi di parametri: i tipi base vengono passati per copia, mentre i tipi
  aggregati per riferimento

Il modello di esecuzione che useremo è la macchina RAM. Una assunzione
fondamentale: un singolo statement di pseudocodice è tradotto in un numero
costante di assembly RAM.

Adotteremo il criterio do costo costante per l'esecuzione dei nostri algoritmi.
La maggioranza di essi che vedremo non ha espansioni significative della
dimensione dei singoli dati. Possiamo in quei casi, considerare dati a
precisione multipla come vettori di cifre. Focalizzeremo la nostra analisi
principalmente sulla complessità temporale degli algoritmi.

### Algoritmi ricorsivi

È possibile incontrare algoritmi la cui complessità non è immediatamente
esprimibile in forma chiusa. Il caso tipico sono algoritmi "divide et impera":
Suddivido il problema in sottoproblemi con dimensione dell'input pari a una
frazione dell'originale, quando il sotto problema ha ingresso sufficientemente
piccolo possiamo risolverlo in tempo costante. Chiamiamo $D(n)$ il costo del
suddividere il problema e con $C(n)$ il costo di computare le soluzioni.
Possiamo quindi esprimere il costo totale $T(n)$ con la seguente equazione di
ricorrenza:

$$
  T(n) =
  \begin{cases}
    \Theta(1) & \quad n < c \\
    D(n) + aT(\frac{n}{b})+C(n) & \quad \text{altrimenti}
  \end{cases}
$$

Con $a,b,c$ costanti:

- $a$ numero di chiamate ricorsive
- $b$ numero di suddivisioni dell'input
- $c$ numero sotto al quale il sottoproblema risulta risolvibile in tempo
  costante

Per risolvere le ricorrenze possiamo adottare 3 tecniche: sostituzione, esame
dell'albero di ricorsione e il teorema dell'esperto ("master theorem"). Usiamo
come caso di studio la ricerca binaria. Analizzando l'algoritmo si può vedere
che: $D(n) = \Theta(1)$, $C(n) = \Theta(1)$ e quindi $T(n) = 2\Theta(1) +
T(n/2)$.

#### Metodo di sostituzione

Il metodo di sostituzione si articola in 3 fasi:

1. Intuire una possibile soluzione
2. Sostituire la presunta soluzione nella ricorrenza
3. Dimostrare per induzione che la presunta soluzione è tale per
   l'equazione/disequazione alle ricorrenze

Nella ricerca binaria ipotizziamo $T(n) = \mathcal{O}(\log(n))$, ossia $T(n) \leq
c\log(n)$. Dobbiamo quindi dimostrare che $T(n) = 2\Theta(1) + T(n/2) \leq
c\log(n)$. Consideriamo vero per ipotesi di induzione $T(n/2) \leq c\log(n/2)$
in quando $n/2 < n$ e sostituiamo:

$$
  T(n) \leq c\log(n) + \Theta(k) = c\log(n) - c\log(2) + \Theta(k) \leq c\log(n)
$$

Cerchiamo ora un limite superiore per $T(n) = 2T(n/2)+n$. Intuiamo
$\mathcal{O}(n\log(n))$, dobbiamo quindi dimostrare che $T(n) \leq c(n\log(n))$.
Supponiamo vero per induzione che $T(n/2) \leq c(n/2\log(n/2))$ e sostituiamo:

$$
  T(n) \leq 2c(n/2\log(n/2)) + n \leq cnlog(n/2)+n =
    cn\log(n) - cn\log(2) + n \leq cn\log(n) + (1-c\log(2))n < cn\log(n)
$$

Per dimostrare il caso base possiamo trovare un $n_0$ per il quale vale la
nostra ipotesi: $n_0 = 3$

Troviamo un limite superiore per $T(n) = 2T(n/2) + 1$. Tentiamo di provare che
$\mathcal{O}(n)$, ossia $T(n) = cn$. Supponiamo vero, sempre per induzione,
$T(n/2) = cn/2$. Sostituiamo ottenendo che $T(n) \leq 2cn/2 + 1 = cn+1$. Non
possiamo trovare un valore che faccia rispettare l'ipotesi: $cn+1 \geq cn$
sempre. In questo caso non siamo riusciti a dimostrare il limite tramite
sostituzione. Attenzione: ciò non implica che $T(n) \neq \mathcal{O}(n)$!
Infatti se prendiamo come ipotesi $T(n) \leq cn-b$ con $b$ costante consente di
dimostrare che $T(n) = \mathcal{O}(n)$.

#### Metodo dell'albero di ricorsione

L'albero di ricorsione fornisce un aiuto per avere una congettura da verificare
con il metodo di sostituzione. È una rappresentazione delle chiamate ricorsive,
indicando per ognuna la complessità. Ogni chiamata costituisce un nodo in un
albero, i chiamati appaiono come figli del chiamante.

#### Teorema dell'esperto

Il teorema dell'esperto è uno strumento per risolvere buona parte delle
equazioni alle ricorrenze. Affinché sia applicabile, la ricorrenza deve avere la
seguente forma:

$$
  T(n) = aT(n/b) + f(n)
$$

Con $a \geq 1$, $b>1$. L'idea di fondo è quella di confrontare $n^{\log_b(a)}$
(effetto delle chiamate ricorsive) con quello di $f(n)$ (costo di ogni singola
chiamata). Le ipotesi sono le seguenti:

1. $a$ deve essere costante e maggiore di 1
2. $f(n)$ deve essere sommata, non sottratta o altro a $at(n/b)$
3. Il legame tra $n^{\log_b(a)}$ e $f(n)$ deve essere polinomiale

Se queste ipotesi sono valide, è possibile ricavare informazioni sulla
complessità a seconda del caso in cui ci si trova:

1. $f(n) = \mathcal{O}(n^{\log_b(a) - \epsilon})$ per un $\epsilon>0$. La
   complessità risultante sarà $T(n) = \Theta(n^{\log_b(a)})$.
2. $f(n) = \mathcal{O}(n^{\log_b(a)}(\log(n))^k)$. La
   complessità risultante sarà $T(n) = \Theta(n^{\log_b(a)}(\log(n))^{k+1})$.
3. $f(n) = \Omega(n^{\log_b(a) + \epsilon})$ per un $\epsilon >0$. Se questo è
   vero, deve anche valere $af(n/b) <cf(n)$ per un  qualche valore di $c<1$. Se
   le ipotesi sono rispettate abbiamo che $T(n) = \Theta(f(n))$.

### Problemi di ordinamento

Tra i problemi che capita più spesso di dover risolvere, l'ordinamento di una
collezione di oggetti è un classico. UN punto chiave dell'utilità
dell'ordinamento è consentire utilizzare una ricerca binaria sulla collezione
ordinata. Analizziamo soluzioni diverse considerando la loro complessità
temporale, spaziale e relative peculiarità.

Diciamo che un ordinamento gode della proprietà di stabilità se non modifica
l'ordine di elementi duplicati.

#### Insertion sort

Il raziocinio dietro all'insertion sort è quella di selezionare un elemento e
reinserirlo nella porzione di vettore già ordinata a giusto posto.

```txt
IntertionSort(A)
  for i <- 1 to A.length - 1
    tmp <- A[i]
    j <- i - 1 // Libero lo slot in j + 1
    while J >= 0 and A[j] > tmp
      A[j + 1] <- A[j]
      j <- j - 1
    A[j + 1] <- tmp
```

Nel caso ottimo abbiamo complessità $\Theta(n)$, in quello pessimo $\Theta(n^2)$
e in generale $O(n^2)$. La complessità spaziale è $\Theta(1)$. È un algoritmo
stabile se usiamo `A[j] > tmp`, non stabile se usiamo `A[j] >= tmp`.

Possiamo stabilire un algoritmo più veloce? Sì. Il limite per qualunque
ordinamento sarà sicuramente $\Omega(n)$, visto che dobbiamo almeno leggere una
volta tutti gli elementi, e $O(n^2)$, poiché abbiamo già visto l'insertion sort.
Astraiamo dalla specifica strategia di ordinamento e contiamo le azioni di
confronto e scambio. Poiché si ottiene un albero binario, avremo tante foglie
quante $n!$ dove $n$ è il numero di elementi. Assumiamo che la struttura sia la
più compatta possibile, ossia che non ci siano confronti ridondanti. Le
lunghezza del più lungo dei percorsi radice-foglia è il numero massimo di
confronti che devo fare per ordinare un vettore. L'altezza dell'albero è
$\log_2(n!) \approx n\log_2(n) - n\log_2(e) + O(\log_2(n))$ (approssimazione di
Sterling). Le complessità migliore ottenibile sarà $O(n\log(n))$

#### Merge sort

Il primo algoritmo con complessità $\Theta(n\log(n))$ è il merge sort. Esso è un
algoritmo di ordinamento con strategia divide et impera con complessità
$\Theta(n\log(n))$ in tutti i casi. Nonostante abbia complessità eccezionale, il
merge sort non è l'ordinamento perfetto perché è un algoritmo che richiede molte
operazioni di memoria e quindi non adatto a tutti i casi.

Suddividiamo il vettore di elementi da ordinare in porzioni più piccole, fin
quando le partizioni non sono ordinabili in $\Theta(1)$, dopodiché riassembliamo
i risultati ottenuti. È importante che riassemblare i risultati non abbia
complessità eccessiva. Analizziamo quindi la complessità di fondere due array
ordinati in un unico array. Consideriamo due slices di un unico array A:
`A[p..q], A[q+1..r]`, è facile dimostrare che sia la complessità temporale che
spaziale sono lineari:

```txt
Merge(a, p, q, r)
  len1 <- q - p +1
  len2 <- r-q
  Alloca(L[1..len1 + 1])
  Alloca(R[1..len2 + 1])
  for i <- 1 to len1 // copia della prima metà
    L[i] <- A[p + i - 1]
  for i <- 1 to len2 // copia della prima metà
    R[i] <- A[q + i]
  L[len1 + 1] <- INFITY // sentinella
  R[len2 + 1] <- INFITY // sentinella
  i <- 1
  j <- 1
  for k <- p to r
    if L[i] <= R[j]
      A[k] <- L[i]
      i <- i + 1
    else
      A[k] <- R[j]
      j <- j + 1 
```

Vediamo allora il merge sort:

```txt
MergeSort(A, p, r)
  if p < r -1
    q <- floor((p+r)/2)
    MergeSort(A, p, q)
    MergeSort(A, q + 1, r)
    Merge(A, p, q, r)
  else // Caso base della ricorsione: ho solo 2 elementi
    if A[p] < A[r]
      tmp <- A[r]
      A[r] <- A[p]
      A[p] <- tmp
```

Il costo sarà $T(n) = 2T(n/2) + \Theta(n)$. Applicando il secondo caso del
master theorem otteniamo $\Theta(n\log(n))$. La stabilità del merge sort dipende
dall'algoritmo di unione: se consideriamo $<=$ allora stabile, instabile se
invece consideriamo $<$.

#### Quicksort

Quicksort è un altro algoritmo divide et impera con ottima complessità. La sua
peculiarità è che l'ordinamento avviene senza uso di spazio ausiliario (in
place). Il quicksort applica il divide et impera ad una slice `A[lo..hi]`:

- Dividi: Scelgo un elemento `A[p]` (pivot) come punto di suddivisione di
  `A[lo..hi]` e sposta gli elementi di `A[lo..hi]` in modo che tutti quelli di
  `A[lo..p-1]` siano minori del pivot
- Impera: Aordina `A[lo..p-1]`, `A[p+1..hi]` con quicksort
- Combina: Nulla in quanto l'algoritmo è eseguito in place

```txt
Quicksort(A, lo, hi)
  if lo < hi
    p <- Partition(A, lo, hi)
    Quicksort(A[lo], A[p-1])
    Quicksort(A[p+1], A[hi])
```

Studiamo ora due metodi di partizione:

```txt
PartionLomuto(A, lo, hi)
  pivot <- A[hi]
  i <- lo - 1
  for j <- lo to hi
    if A[j] <= pivot
      i <- i+1
      Scambia(A[i], A[j])
  Scambia(A[i+1], A[hi])
  return i + 1
  
PartitionHoare(A, lo, hi)
  pivot <- A[lo]
  i <- lo -1
  j <- hi +1
  while true
    do
      i <- i + 1
    while A[i] < pivot
    do
      j <- j - 1
    while A[i] > pivot
    if i < j
      Scambia(A[i], A[j])
    else
      return j
```

La complessità della partizione secondo Lomuto è $\Theta(n)$, come anche quella
di Hoare ma la seconda effettua (in media) $1/3$ degli scambi rispetto alla
prima. La partizione di Hoare ha anche un altro vantaggio: se il vettore è
composto da solo elementi uguali non eseguiamo nessuno scambio.

La complessità del quicksort sarà: $T(n) = T(n/a) + T(n - n/a) + \Theta(n)$ dove
$a$ dipende da quanto bene `Partition()` ha suddiviso il vettore. Il caso
pessimo del quicksort è un vettore diviso in porzioni lunghe $n-1$ e 1. La
ricorrenza diventerebbe $T(n) = T(n-1) + T(1) + \Theta(n)$, che si dimostra
facilmente essere $\Theta(n^2)$. È un caso molto specifico e molto poco
probabile nella vita reale in quanto i vettori sono solitamente ordinati in modo
casuale. Il caso ottimo è un vettore diviso in due porzioni lunghe $n/2$. La
ricorrenza diventa così $T(n) = 2T(n/2) + \Theta(n)$, la stessa del mergesort,
che è $\Omega(n)$. La costante nascosta dal $\Theta$ è $1.39$, più bassa di
quella del mergesort. Nel caso ottimo, quindi, il quicksort è leggermente più
veloce del mergesort.

### Counting sort

Sappiamo che non essere più veloci usando algoritmi di ordinamento per
confronto. C'è un modo di fare meglio ordinando senza confrontare tra elementi?
Sfruttiamo il fatto che se conosciamo il dominio ed è di dimensioni
"ragionevoli": calcolo l'istogramma delle frequenze e ne stampo gli elementi in
ordine. Questa è l'idea del counting sort.

```txt
Counting Sort(A)
  Is[0..k] <- 0
  for i<- 0 to A.length
    Is[A[i]] <- Is[A[i]] + 1
  idxA <- 0
  for i <- 0 to k
    while Is[i] > 0
      A[idxA] <- i
      idxA <- idxA + 1
      Is[i] <- Is[i] - 1
```

La complessità temporale è dominata dal ciclo alle righe 5-8: $O(n+k)$. Se
$k \gg n$ si può vedere che la complessità può essere molto alta.

La versione sopra è instabile. Per renderlo stabile dobbiamo trasformare
l'istogramma in un vettore contenente il conteggio degli elementi con valori
minori o uguali di quello dell'indice del vettore. Calcolato ciò, piazziamo un
elemento calcolando la sua posizione come il valore corrente dell'informazione
cumulativa contenuta nell'istogramma. L'informazione cumulativa è quindi
decrementata.

```txt
CountingSort(A) // versione stabile, out-of-place
  B[0..A.length -1] <- 0
  Is[0..k] <- 0
  for i <- 0 to A.length
    Is[A[i]] <- Is[A[i]] + 1
  sum <- 0
  for i<- 0 to k
    sum <- sum + Is[i]
    Is[i] <- sum
  for i <- A.length - 1 to 0
    idx <- Is[A[i]]
    B[idx - 1] <- A[i]
    Is[A[i]] <- Is[A[i]] - 1
  return B
```

## Strutture dati

Fino ad ora non ci siamo mai preoccupati del modo in cui abbiamo salvato i
nostri dati in memoria. L'unico modo che abbiamo usato sono stati i vettori.
Analizziamo quindi come è possibile rappresentare collezioni di elementi in modo
più organizzato. Queste strutture possono usare etichette opache, chiavi, per
identificare un oggetto. Una struttura supporta diverse operazioni:

- `Search(S, k)`: ...
- `Minimum(S)`: ...
- `Maximum(S)`: ...
- `Successor(S, x.k)`: ...
- `Predecessor(S, x.k)`: ...
- `Insert(S, x)`: ...
- `Delete(S, x)`: ...

### Vettori

Analizziamo ora la complessità dei vettori. Essi sono una struttura compatta in
memoria in cui si accede direttamente ad ogni elemento, data la sua posizione.
L'indice del vettore agisce come chiave a tutti gli effetti.

Se il vettore di lunghezza `n` non è ordinato:

- Ricerca, minimo, massimo e successore sono $O(n)$
- Inserimento e cancellazione costano $O(n)$

Se il vettore è, invece, ordinato:

- Minimo e massimo sono costanti, mentre ricerca e successore $\Theta(\log(n))$
- Inserimento e cancellazione rimangono $O(n)$

Inoltre gli inserimenti in un vettore pieno possono o essere rifiutati, quindi
$O(n)$, oppure causare una riallocazione, quindi $O(N)$.

### Liste

Una lista semplice stocca gli elementi sparsi in memoria: ogni elemento ha un
riferimento al successivo (puntatore). Se la lista di lunghezza `n` non è
ordinata abbiamo:

- Ricerca, minimo, massimo e successore sono $O(n)$
- Inserimento è costante, la cancellazione è $O(n)$ se bisogna cercarlo,
  costante se è fornito un riferimento

Se la lista è, invece, ordinata:

- Uno dei due tra minimo e massimo è $\Theta(1)$, l'altro $\Theta(n)$. Se
  aggiungiamo un puntatore accessorio diventano entrambi costanti
- Ricerca e successore sono $O(n)$
- Inserimento e cancellazione diventano entrambi $O(n)$

### Pile (Stack)

Una pila è una struttura dati LIFO con le seguenti operazioni: `Push(s, e)`,
`Pop(S, e)` e `Empty(S)`. Questa struttura dati può essere usata sia utilizzando
un lista semplice sia un vettore.

Se lo stoccaggio dati è nella lista, le operazioni diventano:

- `Push(S, e)`: costante
- `Pop(S, e)`: costante
- `Empty(S)`: costante (controlla se il successore della testa è `NIL`)

Se utilizziamo un vettore, invece, dobbiamo utilizzare una variabile ausiliaria
(`ToS`, Top Of Stack) per mantenere la complessità costante. Inoltre la push può
avere costo lineare in caso di riallocazione.

Nella pratica, avere dati sparsi in memoria può penalizzare la  performance a
causa delle cache-misses. Può, quindi, valere la pena di usare una stack basata
su un vettore preallocando in modo intelligente.

### Code (Queues)

Una coda è una struttura dati FIFO con le seguenti operazioni: `Enqueue(Q, e)`,
`Dequeue(Q)`, `Empty(Q)`. Come nel caso della pila, è possibile realizzare una
coda sia con una lista che con un vettore.

Se realizziamo una coda con vettore, lo stoccaggio dei dati è effettuato in un
vettore `A`, lungo `l` con indeice del primo elemento `0`. Teniamo traccia della
posizione dove va inserito un nuovo elemento e di quella dell'elemento più
vecchio con due indici `tail` e `head` e del numero di elementi contenuti `n`.
Gli indici verranno incrementati $\mod l$. Le operazioni saranno implementate
così:

- `Enqueue(Q, e)`: se $n < l$, inserisci l'elemento in `A[tail]` e incrementa
  `n` e `tail`, altrimenti segnala l'errore. Abbiamo una complessità costante.
- `Dequeue(Q, e)`: se $n > 0$, restituisci `A[head]` corrente, decrementa `n` e
  incrementa `head`. Abbiamo ancora complessità costante.
- `Empty(Q)`: restituisci `n == 0`. Ovviamente costante.

Per ampliare lo stoccaggio, possiamo creare una nuova coda di dimensione
maggiori e spostare gli elementi uno a uno usando `Enqueue()` e `Dequeue()`.

Se usiamo una lista, lo stoccaggio dei dati è effettuato negli elementi della
lista. Teniamo traccia dell'ultimo elemento della lista (oltre al primo) con un
puntatore `tail`. Possiamo, quindi, mantenere la complessità costante.

### Mazzo (Deque)

Si comporta come un mazzo di carte, di cui ognuna contiene un elemento. È
praticamente una pila in cui è possibile aggiungere sia in testa che in coda:
`PushFront(Q,e)`, `PushBack(Q,e)`, `PopFront(Q)`, `PopBack(Q)` e `Empty(Q)`.
Come pile e code, il mazzo può essere implementato sia con un vettore, sia con
una lista.

Se usiamo un vettore, useremo una strategia analoga a quella usata per le code
implementate con vettore:

- `PushBack()` e `PopFront()` si comportano rispettivamente come `Enqueue()` e
  `Dequeue()`
- `PopBack()`: se `n > 0`, restituisci `A[tail]` corrente, decrementa `n`,
  decrementa `tail`. Complessità costante.
- `PushFront()`: se `n < l`, decrementa `head`, inserisci l'elemento in
  `A[head]`, incrementa `n`. Complessità costante.
- `Empty()`: restituisci `n == 0`. Complessità costante.

Per ampliare lo stoccaggio faremo come per la coda.

Per creare un mazzo con una lista non basta più un lista semplice, singolarmente
concatenata, ma ci serve una doppiamente concatenata. Questo ci permette di
aggiungere e rimuovere in testa e in coda in tempo costante.

- `PushBack()` e `PopFront()` si comportano come `Enqueue()` e `Dequeue()` di
  una coda realizzata con una lista
- `PopBack()`: ...

### Dizionari

I dizionari è una struttura dati astratta che contiene elementi accessibili
direttamente, data la loro chiave. Assumiamo che le chiavi siano numeri
naturali, nel caso che non lo siano è sufficiente considerare la loro
rappresentazione binaria e il corrispondente numero. Le operazioni supportate
sono `Insert()`, `Delete()` e `Search()`. È possibile implementare un dizionario
con diverse strutture dati concrete.

#### Un primo approccio ingenuo

Il primo approccio ingenuo è considerare un insieme di chiavi limitate e
implementare un dizionario come un vettore di puntatori. Le chiavi verranno
usate come indice del vettore. Le operazioni saranno implementate come:

- `Insert()`: `D[e.key] <- e`
- `Delete()`: `D[e.key] <- NIL`
- `Search()`: `return D[e.key]`

La complessità computazionale è costante per tutte le operazioni. La
complessità spaziale, invece, sarà $O(D)$ dove $D$ è il numero di chiavi
possibili. Quindi questa implementazione è molto onerosa per un dominio ampio.

#### Tabelle Hash

Una tabella hash implementa un dizionario con una complessità di memoria pari al
numero di chiavi per cui è effettivamente presente un valore. Quindi il numero
di chiavi può essere arbitrariamente grande. Il tipico approccio è preallocare
spazio per `m` chiavi e riallocare solo quando ci saranno `n > m` chiavi. L'idea
principale è usare come indice della tabella il risultato del calcolo di una
funzione della chiave $h(k): D \to \{0, \ldots, m-1\}$ detta funzione di hash.

Se il calcolo di $h$ è $\Theta(k)$, la tabella di hash ideale ha la stessa
efficienza temporale del dizionario fatto con un vettore di $D$ puntatori.

Idealmente, $h$ dovrebbe mappare ogni chiave su di un distinto elemento del suo
codominio. Ma ciò è impossibile poiché per come li abbiamo definiti $S \gg m$.
Chiamiamo collisione ogniqualvolta dati $k_1$, $k_2$ tali che $k_1 \neq k_2$ ma
$h(k_1) = h(k_2)$. Ci sono due tipologie per la gestione delle collisioni:

- Indirizzamento chiuso (open hashing): Ogni riga della tabella (bucket)
  contiene la testa di una lista al posto del puntatore ad un singolo elemento.
  Nel caso di collisione, l'elemento nuovo viene aggiunto in testa alla lista.
  Per cercare o cancellare un elemento di chiave $k$, è necessario cercare
  nell'intera lista del bucket $h(k)$
- Indirizzamento aperto (closed hashing): In caso di collisione si seleziona
  secondo una regola deterministica un altro bucket (ispezione). Nel caso non si
  trovino bucket vuoti si o può fallire ($\Theta(m)$) oppure riallocare una
  tabella più grande e reinserire tutti gli elementi della vecchia nella nuova
  (re-hashing) ($\Theta(n)$). La procedura di ricerca viene modificata affinché,
  se l'elemento non viene trovato nel suo bucket, essa effettui la stessa
  ispezione. La cancellazione è effettuata inserendo un opportuno valore
  (tombstone) che non corrisponde ad alcuna chiave.

Analizziamo le possibili procedure di ispezione (probing):

- Ispezione lineare: È il metodo più semplice. Dato $h(k, 0) = a$ il bucket dove
  avviene la collisione al primo tentativo, si sceglie $h(k,i) = a + ci$ come
  bucket candidato per l'$i$-esimo inserimento.

  Il problema è che se ci sono molte collisioni su un dato bucket, perggiorerà
  la probabilità di collisione nelle vicinanze. Il fenomeno è detto clustering
  delle collisioni: si formano dei grumi di celle contigue. È possibile avere
  clustering di dimensione logaritmica nella dimensione della tabella
  effettuando il rehashing molto prima che sia piena (circa metà).
- Ispezione quadratica: Usiamo una funzione quadratica $h(k,i) = a + c_1 i + c_2
  i^2 \mod n$. Viene così evitato il clustering intorno ad alcuni elementi, ma
  non è più garantito a priori che la sequenza di ispezioni tocchi tutte le
  celle, rendendo anche qui la necessità di fare rehashing a tabella non piena.
- Doppio hashing: Definiamo $h(k,i) = h_1 + h_2(k)i \mod n$: il passo di
  ispezione dipende dalla chiave. Per essere sicuro di eispzionare tutti i
  bucket, $h_2(k)$ deve essere coprimo con $n$. Quindi se $n = 2^m$ basta fare
  sì che $h_2$ generi solo numeri dispari. Se $m$ è primo, basta fare sì che
  $h_2$ generi un numero minore di $m$.

#### Lemma - tabelle di dimensione a potenza di 2

Se la tabella di hash ha dimensione $2^m$, la funzione $h(k,i) = a + 1/2 i + 1/2
i^2$ genera tutti i valori in $[0; n-1]$.

> Dimostrazione per assurdo. Esistono $ 0<p<q<n-1$ tali che
> $1/2 p + 1/2 p^2 = 1/2 q + 1/2 q^2 \mod n$ quindi $p + p^2 = q + q^2 \mod 2n$.
> Fattorizzando abbiamo $(q-p)(p+q+1) = 0 \mod 2n$. Analizziamo i casi
> possibili:
>
> 1. Se $(q-p) = 0 \mod 2n$ allora $q = p$. Assurdo.
> 2. Se $(p+q+1) = 0 \mod 2n$ allora dati i range possibili $0<p<q<n-1$ la somma
>    è in $[1, 2n-2]$. Assurdo.
> 3. Se $(q-p)(p+q+1) = 0 \mod 2n$, ma entrambi i fattori non sono nulli. Dato
>    che il prodotto è dispari, almeno uno tra i due fattori è dispari. Essendo
>    $n = 2^m$, solo il fattore pari può essere multiplo di $2n$, ma
>    $(q-p) \leq n-1$ e $(p+q+1) \leq 2n-2$. Assurdo.

Per calcolare l'efficienza computazionale, mettiamoci in ipotesi di Hashing
uniforme Semplice (IHUS). Una opportuna scelta di $h$ fa sì che ogni chiave
abbia la stessa probabilità $1/n$ di finire in una qualsiasi delle $n$ celle.
Come possiamo scegliere una opportuna funzione di hash? Dipende dalla
distribuzione delle chiavi da inserire.

Una prima e semplice funzione di hash è $h(k) k \mod n$. Distribuzione di $h(k)$
non è uniforme in $[0;n-1]$. Va evitato se $m = 2^i$ poiché $h(k)$ dipenderà
solo dai bit meno significativi. Non funziona malissimo se $n$ vicino ad una
potenza di 2.

Un altro metodo semplice è considerare $h(k) = \lfloor n(\alpha k -
\lfloor\alpha k\rfloor)\rfloor$ con $\alpha \in \mathbb{R}$ costante. In questo
caso la dimensione della tabella $n$ non è critica, spesso però si prende $2^m$
per effettuare le moltiplicazioni con un semplice shift. Una scelta possibile è
$\alpha$ è $\frac{\sqrt{5}+1}{2}$.

Analizziamo il costo della struttura. Nel caso pessimo tutti gli elementi
collidono dando origine ad una lista (open hashing) o una sequenza di ispezione
(closed hashing) lunga `m` elementi, rendendo le operazioni $O(m)$. Il caso più
importante sarà, però, il caso medio. Chiamiamo $\alpha = n/m$. Sotto l'ipotesi
di IHUS, per l'open hashing abbiamo che:

- La lunghezza media di una lista è il fattore di carico.
- Il tempo medio per cerare una chiave non presente è $\Theta(1 + \alpha)$
- Il tempo medio per cercare una chiave presente è sempre $\Theta(1+\alpha)$
  (risultato del calcolo del valor medio del numero di oggetti aggiunti al
  bucket di $x$ dopo che $x$ è stato inserito)

In pratica, se il fattore di carico non è eccessivo tutte le operazioni sono
$O(1)$. In closed hashing, invece, il tempo per trovare un elemento dipende
anche dalla sequenza di ispezione. Generalizziamo l'ipotesi IHUS dicendo che
tutte le sequenze di ispezione sono equiprobabili. Se consideriamo la variabile
aleatoria $X$ che modella il numero di passi di ispezione fatti senza trovare il
valore desiderato, abbiamo $P(X \geq i) = \alpha^{i-1}$ il cui valor medio su
$i$ è $\frac{1}{1-\alpha}$. Quindi il numero medio di tentativi prima di trovare
un elemento desiderato è ricavato assumendo di trovarlo al $j$-esimo tentativo e
mediando il numero di insuccessi su tutte le $n$ chiavi presenti in tabella,
ottenendo $\frac{1}{\alpha}\log(\frac{1}{1-\alpha}$.

Fino ad ora abbiamo presunto che le collisioni fossero accidentali. Ciò non
toglie che è possibile che un utente conosca la funzione di hash ed inserisce
degli elementi che causano deliberatamente collisioni. Ciò causerebbe accessi
certi in $O(n)$. Per evitare questo problema dobbiamo poter scegliere una
funzione di hash casualmente all'interno di una famiglia di buone funzioni. Si
può dimostrare che $h_{a,b}(k) = ((ak+b)\log p)\mod m$ con $p > m$ primo
distribuisce uniformemente le chiavi nella tabella. È sufficiente scegliere
casualmente i due valori $a,b$.

### Alberi

Una struttura dati versatile è il cosiddetto albero. Ne abbiamo già fatto uso
informalmente. In estrema sintesi, un albero è costituito da un insieme di nodi
e uno di archi che li collegano. Ogni nodo può avere al più un arco entrante, ma
un numero arbitrario di archi uscenti. Vedremo che gli alberi sono una
rappresentazione efficiente per insiemi di dati ordinati.

#### Definizione - Albero

Un albero $A$ è una coppia $(V, E)$ dove $V$ è un insieme di nodi e $E$ un
insieme di archi, ossia coppie ordinate di nodi. Ogni nodo può apparire un'unica
volta come destinazione di un arco, ossia il secondo elemento della coppia. Non
sono possibili cicli.

Chiameremo:

- Radice: L'unico nodo dell'albero privo di un arco entrante.
- Foglia: Un nodo senza archi uscenti
- Padre di un nodo $n$: il nodo da cui l'arco entrante in $n$ ha origine
- Figlio di un nodo $n$: il nodo in cui uno degli archi uscenti da $n$ termina\
- Albero $n$-ario: È un albero nel quale ogni nodo ha al più $n$ figli
- Livello: distanza, in numero di archi, di un nodo dalla radice
- Albero completo: un albero a cui non è possibile aggiungere un nodo con
  livello minore o uguale a quello dei presenti

Ci occuperemo di alberi binari. È utile dare una definizione ricorsiva di
albero:

> Un albero è formato da un nodo radice a cui sono collegati due alberi, il
> sotto-albero e il sotto-albero sinistro. Un albero può essere vuoto.

Le azioni sugli alberi indicizzeranno i nodi con una chiave, un intero
solitamente. Dato un nodo `N`, `N.left` è il riferimento al figlio sinistro
mentre `N.right` il destro, `N.p` è il riferimento al padre e `N.key` la chiave.
Ogni albero `A` avrà un riferimento `A.root` alla radice (`A.p == NIL`).

Un albero può essere materializzato in memoria naturalemnte con una struttura
basata su puntatori. Alternativamente è possibile utilizzare un vettore per
contenere le chiavi. Il secondo metodo è più efficiente se l'albero è completo.
L'array sarà così strutturato:

- La radice dell'albero è stoccata in posizione $0$ del vettore
- Dato un nodo contenuto in posizione $i$ il suo figlio sinistro è in posizione
  $2i+1$, il destro in $2i+2$
- Il padre del nodo stoccato in posizione i si trova in posizione
  $floor(\frac{i-1}{2})$

#### Visita di un albero

Su di un albero è possibile effettuare operazioni di inserimento, ricerca e
cancellazione di nodi come sulle altre struttura dati. L'operazione
caratteristica degli alberi è, però, il cosiddetto attraversamento o visita per
enumerare le chiavi contenute. La definizione naturale degli algoritmi di visita
è ricorsiva. Il fattore discriminante tra le diverse strategie è l'ordine in cui
i nodi vengono visitati.

##### Visita in ordine

Nella visita in ordine si visita prima il sotto-albero sx, quindi la radice e
infine l sotto-albero dx.

```txt
InOrder(T)
  InOrder(T.left)
  Print(T.key)
  InOrder(T.right)
  return
```

La complessità di questa visita è ovviamente $\Theta(n)$.

##### Visita anticipata

Nella visita anticipata si visita prima la radice, quindi il sotto-albero sx e
poi quello dx.

```txt
PreOrder(T)
  Print(T.key)
  InOrder(T.left)
  InOrder(T.right)
  return
```

Come nella visita in ordine, abbiamo $\Theta(n)$.

##### Visita posticipata

Nella visita posticipata si visita il sotto-albero sx, quello dx e infine la
radice

```txt
PostOrder(T)
  InOrder(T.left)
  InOrder(T.right)
  Print(T.key)
  return
```

Come nella visita anticipata abbiamo $\Theta(n)$.

#### Albero binario di ricerca

Uno degli usi più comuni degli alberi binari è utilizzare quelli per cui è
valida una data relazione tra le chiavi. Un albero binario è detto albero
binario di ricerca se per un qualunque suo nodo $x$ valgono:

- Se $y$ è contenuto nel sotto-albero sinistro di $x$, $y.key \leq x.key$
- Se $y$ contenuto nel sotto-albero destro di $x$, $y.key \geq x.key$

Inserimenti e cancellazione devono preservare la proprietà sopra, o invariante.
Cambiare l'invariante del BST rendendo le disuguaglianze strette rende gli
elementi del BST unici. Un a visita in ordine di un BST stampa le chiavi in
ordine.

##### Ricerca

La struttura dei BST li rende naturali candidati per una ricerca efficace degli
elementi per chiave.

```txt
Ricerca(T, x)
  if T = NIL or T.key = x.key
    return T
  if T.key < x.key
    return Ricerca(T.right, x)
  else
    return Ricerca(T.left, x)
```

La complessità è $O(h)$, dove $h$ è l'altezza dell'albero. Nel caso ottimo
(ossia di albero ben bilanciato) la complessità diventa $O\log(n)$. Nel caso
peggiore, la complessità degenera in $O(n)$.

##### Minimo e massimo

```txt
Min(T)
  cur <- T
  while cur.left != NIL
    cur <- cur.left
  return cur
```

```txt
Max(T)
  cur <- T
  while cur.right != NIL
    cur <- cur.left
  return cur
```

Entrambe le funzioni hanno costo $\Theta(h)$.

##### Successore

Il successore di un elemento `x` è l'elemento `y` con la più piccola chiave
`y.key > x.key` presente nel BST. Nel cercarlo sono possibili due casi:

1. Il sotto-albero dx di `x` non è vuoto: il successore è il minimo di quel
   sotto-albero
2. Il sotto-albero dx di `x` è vuoto: il successore è il progenitore più
   prossimo a `x` per cui `x` appare nel suo sotto-albero.

```txt
Successore(x)
  If x.right !+ NIL
    return Min(x.right)
  y <- x.p
  while y !+ IL and y.right = x
    x <- y
    y <- y.p
  return y
```

La complessità sarà $\Theta(h)$

##### Inserimento

L'inserimento di un nuovo elemento deve rispettare la proprietà fondamentale del
BST. Assumiamo che il BST non debba contenere duplicati. L'idea è di cercare
l'elemento che voglio inserire nel BST e inserirlo nel posto dove ho ottenuto
`NIL`.

```txt
Inserisci(T,x)
  pre <- NIL
  cur <- T.root
  while cur != NIL
    pre <- cur
    if x.key < cur.key
      cur <- cur.left
    else
      cur <- cur.right
  x.p <- pre
  if pre = NIL
    T.root <- x
  else if x.key < pre.key
    pre.left <- x
  else
    pre.right <- x
```

La complessità sarà $O(h)$.

##### Cancellazione

La strategia di cancellazione di un elemento da un BST dipende dal numero di
figli dell'elemento in questione:

1. L'elemento non ha figli: è sufficiente eliminarlo dall'albero deallocandolo
   e impostando il puntatore del padre a `NIL`.
2. L'elemento ha un figlio: l'elemento viene sostituito dal figlio nel suo ruolo
   nell'albero.
3. L'elemento ha due figli: copio il valore del suo successore su di esso ed
   elimino il successore. Il successore `s` di un elemento con due figli `x` non
   ha mai il figlio sx `f`: si avrebbe `s.key < f.key < x.key`, ma questo è
   impossibile per definizione di successore.

```txt
...
```

#### Alberi bilanciati

...

Intuitivamente vogliamo che la distanza delle foglie dalla radice sia limitata
superiormente, per tutte le foglie. Una definizione operativa fu data da
Adelson-Velskii e Landis: "un albero è bilanciato se, per ogni nodo, le altezze
dei due sotto-alberi differiscono al più di 1". I due autori proposero, insieme
alla definizione, una modifica ai BST ed ai metodi per accedervi in grado di
tenerli bilanciati (alberi AVL). Vediamo un'ottimizzazione degli alberi AVL che
sacrifica parte del bilanciamento per ottenere modifiche più efficienti: gli
alberi RB.

Un albero RB è un BST i cui nodi sono dotati di un attributo aggiuntivo detto
`red`, e soddisfacente 5 proprietà:

1. Ogni nodo o è `red` o no lo è (`black`)
2. La radice è `black`
3. Le foglie sono `black`
4. I figli di un nodo `red` sono entrambi `black`
5. Per ogni nodo dell'albero, tutti i cammini dai suoi discendenti alle foglie
   contenute nei suoi sotto-alberi hanno lo stesso numero di nodi `black`

Chiamiamo, per comodità, l'altezza dell'albero che conta solo i nodi `black`
(escluso il nodo `x` se è il caso) `black height` ($bh(x)$).

I dati sono mantenuti unicamente nei nodi interni, l;e foglie sono tutte `NIL`.
Per semplicità, tutte le foglie sono fisicamente rappresentate da un singolo
nodo il cui unico riferimento è `T.nil` ...

Le operazioni che non vanno a modificare la struttura dell'albero sono identiche
ai BST. Le operazioni di inserimento e cancellazione hanno necessità di
mantenere le proprietà degli alberi RB. È necessario essere in grado di
ribilanciare l'albero usando solo modifiche locali

##### Teorema - Proprietà di buon bilanciamento

Un albero RB con $n$ nodi interni ha altezza massima $2\log(n+1)$

> ...

##### Rotazione

Per riparare gli sbilanciamenti usiamo l'operazione di rotazione. La rotazione è
una operazione locale a due nodi di un BST che cambia il livello a cui sono
situati due nodi senza violare la proprietà BST.

...

##### Inserimento (RBT)

L'inserimento procede ad inserir il nuovo elemento come se l'albero fosse un
semplice BST salvo:

1. Assegnare il valore dei sottoalberi del nodo a `T.nil` al posto di `NIL` se
   viene inserito come una foglia
2. Assegnare il valore del genitore del nodo a `T.nil` al posto di `NIL` se il
   nodo è inserito come radice
3. Colorare il nodo appena inserito di rosso.

POssono essere violate la proprietà 4 e la 2. Dobbiamo quindi creare una
procedura di riparazione.

...

##### Cancellazione (RBT)

Nel caso di eliminazione di un nodo rosso, si opera come nel caso dei BST salvo
alcune modifiche. Se il nodo eliminato $x$ è nero, dobbiamo riparare l'albero.

1. Il fratello `w` del nodo è rosso

   > Scambio i colori di `w` e `w.p`, LeftRotate(x.p). Ora `x` ha un fratello
   > `w` nero, cadendo nei casi 2, 3, e 4.

2. Il fratello `w` del nodo è nero e $x$ ha entrambi i nipoti neri

   > Coloro `w` di rosso e richiamo `RiparaRBCancella(x.p)`

3. Il fratello del nodo è nero e $x$ ha il nipote sinistro rosso

   > `w` prende il colore del padre, mentre `w.right` diventa nero. Invoco
   > `LeftRotate(w.p)`. Scambio di colore `w` w `w.left`, `RightRotate(w)`.

4. Il fratello del nodo è nero e $x$ ha il nipote destro rosso

  > ...

...(complessità)

#### Mucchi (Heap)

UN mucchio è uno struttura dati ad albero in cui la chiave del nodo padre è
sempre maggiore di quella dei figli (max-heap). Nessuna relazione sussiste tra
le chiavi di due fratelli. Se l'albero è binario, parliamo di heap binarie. Gli
heap trovano usano nell'implementazione di code con priorità o nell'ordinamento
di vettori.

Per tutti gli usi più comuni, è conveniente materializzare lo heap sempre come
struttura dati implicita salvata su array:

- È un albero binario quasi completo, ossia le foglie mancanti sono quelle che
  occupano la parte finale dell'array in cui è stoccato
- Avremo un attributo `A.heapsize` che indica il numero di elementi dello heap e
  `A.length` che contiene la lunghezza dell'array di supporto.

Le operazioni su un max-heap sono: `Max`, `Inserisci`, `Cancella_Max`,
`Costruisci_Max_Heap`, `Max_Heapify`.

##### Code con priorità

Una coda con priorità è un astruttura dati a coda in cui è possibile dare una
priorità numerica agli elementi all'interno. Elementi con priorità maggiore
verranno...

La `Max-heapify(A, n)` riceve un array e una posizione in esso: assume che i due
sottoalberi con radice stoccata in $2n$ e $2n+1$ siamo dei max-heap. La routine
modifica `A` in modo che l'albero radicato in `n` sia un max-heap. `Max-Heapify`
Ci consente di creare un max-heap con il seguente algoritmo:

```txt
Costruisci-Max-Heap(A)
  A.heapsize <- A.length
  for i <- floor(a.length / 2) downto 1
    Max-Heapify(A, i)

Max-Heapify(A,n)
  l <- LEFT(n)
  r <- RIGHT(n)
  if l <= A.heapsize and A[l] > A[n]
    posmax <- l
  else
    posmax <- n
  if r <= A.heapsize and A[r] > A[posmax]
    posmax <- r
  if posmax != n
    Swap(A[n], A[posmax])
    Max-Heapify(A, posmax)
```

Nel caso pessimo `Max-Heapify` ha complessità $\Theta(\log(n))$. La costruzione
di una heap sarà $O(n\log(n))$. È possibile dimostrare che la costruzione può
essere eseguita in tempo lineare.

La cancellazione del massimo (elemento con priorità massima) ha costo
logaritmico ed è fatta così:

```txt
Cancella-Max(A)
  if A.heapsize <l
    return NIL
  max <- A[1]
  A[1] <- A[A.heapsize]
  A.heapsize <- A.heapsize - 1
  Max-Heapify(A, 1)
  return max
```

L'inserimento è l'opposto della cancellazione: aggiunge l'elemento come ultima
foglia e fa scalare l'elemento fino a quando non è minore del padre. Complessità
logaritmica anche in questo caso.

```txt
Inserisci(A, key)
  A.heapsize <- A.heapsize + 1
  A[A.heapsize] <- key
  i <- A.heapsize
  while I > 1 and A[Parent(i)] < A[i]
    Swap(A[Parent(i)], A[i])
    i <- Parent(i)
```

...(limite più preciso)

##### Ordinamento

Ordinare un array in ordine crescente può essere fattto trovando il masimo tra i
suoi elementi e posizionandolo alla fine, quindi riperendo il procedimento sulla
parte disordinata: questo è il `SelectionSort()`. Questo ordinamento è $O(n^2)$.
Cosa cambia se rendiamo l'array un max-heap? Questo approccio si chiama Heapsort.

```txt
HeapSort(A)
  Costruisci_Max_Heap(A)
  for i <- A.length downto 2
    Swap(A[i], A[i])
    A.heapsize <- A.heapsize -1
    Max-Heapify(A,1)
```

Il costo dello heapsort sarà $O(n\log(n))$ nel caso peggiore. Inoltre necessità
solo di $O(1)$, a differenza di mergesort. Nelle implementazioni pratiche, nel
caso medio è sempre più lento di Quicksort: heapsort ha un costo lineare sommato
a $O(n\log(n))$ che viene sempre pagato. Heapsort non è un ordinamento stabile.

### Grafi

Il grafo è la struttura dati più naturale per rappresentare un insieme di
oggetti legati da una generica relazione. La relazione tra oggetti è
rappresentata da un insieme di coppie di oggetti (ordinate o meno).

#### Definizione - Grafo

Il grafo è una coppia $G = (V,E)$ con $V$ un insieme di nodi ed $E$ un insieme
di archi

Un albero è, quindi, un particolare tipo di grafo orientato. Se un grafo ha
$|V|$ nodi, esso ha la più $|V|^2$ archi. Due nodi collegati da un arco si
dicono adiacenti.  Un cammino tra due nodi $v_1, v_2$ è un insieme di archi di
cui il primo ha origine in $v_1$, l'ultimo termina in $v_2$ e ogni nodo compare
almeno una volta come destinazione di un arco che come sorgente. Un grafo è
detto orientato se la coppia di nodi che costituisce un arco è ordinata. Un
grafo orientato viene rappresentato indicando gli archi come frecce che puntano
al secondo nodo della coppia. Un grafo è connesso se esiste un percorso per
coppia di nodi e completo (completamente connesso) se esiste un arco tra ogni
coppia di nodi. Un percorso è un ciclo se il nodo di inizio e fine coincidono e
un grafo privo di cicli è detto aciclico. È facile notare che se un grafo è
completo è anche ciclico.

#### Rappresentazione in memoria

Sono possibili due strategie per rappresentare un grafo: le liste di adiacenza e
la matrice di adiacenza.

La lista di adiacenza è un vettore di liste lungo $|V|$, indicizzato dai nomi
dei nodi. Ogni lista contiene i nodi adiacenti all'indice della sua testa. La
matrice di adiacenza è invece una matrice di valori booleani $|V| \times |V|$,
con righe e colonne indicizzate dai nomi dei nodi. La cella alla riga $i$,
colonna $j$ contiene 1 se l'arco $(v_i, v_j)$ è presente nel gravo e 0
altrimenti.

Le liste di adiacenza consumeranno, in termini di spazio, $\Theta(|V| + |E|)$
mentre la matrice avrà $\Theta(|V|^2)$. Perciò la rappresentazione a liste è più
compatta se il grafo è sparso ovvero se $|E| \ll |V|^2$. La complessità
temporale per:

- determinare se $(v_1, v_2)$ appartiene al grafo: liste $(O|V|)$, matrici
  $O(1)$
- Il numero di archi $o_e$ uscenti da un nodo: liste $\Theta(o_e)$, matrici
  $O(|V|)$

La matrice di adiacenza di un grafo non orientato è simmetrica rispetto alla
diagonale principale, quindi posso stoccare solo metà. Analogamente, per le
liste di adiacenza posso stoccare solo uno dei due archi e raddoppiare il tempo
di ricerca per un nodo adiacente.

#### Operazioni su grafi

Le operazioni sui grafi sono tipicamente di ispezione: visita in ampiezza e il
profondità. Vedremo anche operazioni che vanno a determina le proprietà di un
grafo: trovare le componenti connesse, ordinamento topologico, percorso più
breve tra due nodi e individuare cicli.

##### Visita in ampiezza

La strategia di visita in ampiezza visita tutti i nodi di un grafo a partire da
un nodo sorgente $s$. Vengono visitati tutti i nodi con un cammino tra loro e
$s$ lungo $n$ passi, prima di visita re quelli con un cammino più lungo $n+1$

La visita di un grafo è più problematica ...

Innanzitutto memorizziamo in una coda i nodi ancora da visitare. La coda è
inizializzata con la sola sorgente. Estraiamo un nodo dalla coda e visitiamo i
vicini bianchi, li coloriamo di gridio e calcoliamo la loro distanza e infine li
accodiamo affinché siano visitati a loro volta. Manchiamo quindi il nodo estratto
come nero e riprendiamo estraendo il successivo. La complessità totale sarà
$O(|V| + |E|)$.

Similmente alle visite degli alberi è possibile stampare i nodi in una visita di
un grafo. La visita di in ampiezza di trasforma in un algoritmo di ricerca.
Basta inserire un controllo appena si sta per accodare un nuovo elemento: se è
quello corretto lo si ritorna.

##### Visita in profondità

Diversamente dalla visita in ampiezza, visitiamo prima i nodi adiacenti a quello
dato, poi il nodo stesso. Segue i cammini...

##### Componenti connesse

È detta componente connessa di un grafo $G$ un insieme $S$ di nodi tali per cui
esiste un cammino tra ogni coppia di essi, ma nessuno di essi è connesso a nodi
diversi da $S$. Individuare le componenti connesse in un grafo equivale ad
etichettare i nodi con lo steso valore se appartengono alla stessa componente.

L'idea è sempre quella di usare i colori. Eseguiamo una visita e assegnamo una
etichetta al nodo visitato. La complessità è $O(|V|)$.

##### Ordinamento topologico

Dato un grafo orientato, il predecessore di un nodo $v$ è un nodo $u$ tale per
cui esiste un cammino da $u$ a $v$. Un valore utile da calcolare per un grafo è
il cosiddetto ordinamento topologico. L'ordinamento topologico è una sequenza di
nodi del grafo tale per cui nessun nodo compare prima di un suo predecessore.
L'ordinamento topologico non è unico!

Se un grafo non è connesso, le componenti connesse possono essere ordinate in
qualunque modo l'una rispetto all'altra.

Per calcolare l'ordinamento topologico è possibile riusare la procedura di
visita in profondità. Quando però coloriamo un nodo di nero, lo inseriamo in
testa ad una lista.

##### Percorso più breve

L'algoritmo di Dijkstra trova, dato un grafo orientato e un suo nodo $s$, i
percorsi più brevi da un nodo a qualunque altro. Funziona sia si di un grafo
classico che su di un grafo pesato.

Il principio di funzionamento è il seguente:

1. Inserisco ogni $v \in V / \{s\}$ in un insieme $Q$ dopo aver impostato il suo
   attributo distanza a $\infty$ e il `v.pred` a `NIL`.
2. Inserisco $s$ il $Q$ dopo aver impostato `s.dist <- 0`.
3. Fin quando $Q$ non è vuoto, estratto il nodo $c$ con $dist$ minima e
   controllo per ogni adiacente $a$ se hanno distanza minore di
   `c.dist + peso(c,a)`. Se questo accade imposto `a.pred <- c`,
   `a.dist <- c.dist + peso(c,a)`.

Implementiamo l'algoritmo con l'uso di una coda basata su min-heap dove la
priorità è la distanza. Abbassiamo così la complessità a $O((|E| +
|V|)\log(|V|))$.

##### Individuazione di cicli

Dato un grafo per cui ogni nodo ha un solo successore, determiniamo, dato un
nodo di partenza, se il cammino che parte da ha cicli.

Usiamo due riferimenti `t` ed `l` che spostiamo a ogni passo nel caso di `t`
dal nodo a cui punta al successore (1 passo) mentre nel caso di `l` dal nodo a
cui punta al successore del successore (2 passi). Se esiste un ciclo, essi sono
destinati ad "incontrarsi".

Chiamiamo $C$ la lunghezza del ciclo e $T$ quella della coda (parte prima
del ciclo). Quado `t` ha fettuato $T$ passi, `l` si trova sicuramente nelal
porzione ciclica del grafo...
