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
                c11    c22   !f    ...   f   c23
           ┌─────┤      │                     ├──────┐
          !f    ...     f                     f     !f

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
