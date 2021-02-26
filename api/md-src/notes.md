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

- $\eta*(q, \epsilon) = \espilon$
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

