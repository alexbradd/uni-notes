# Appunti di "Basi di dati"

## Database Management System (DBMS)

Definire una rappresentazione delle informazioni equivale a modellare la realtà.
Un sistema informativo contiene informazioni sotto forma di dati, ossia un
insieme di simboli memorizzati. Un sistema informativo deve organizzare le
informazioni che contiene e può scegliere 2 approcci:

1. Considerare i dati come un elemento centrale e sviluppare attorno i vari
   applicativi;
2. Basarsi prima sui processi e poi sui dati che devono essere adoperati.

I sistemi salvano i dati in una base di dati (database), ossia una risorsa
integrata unica condivisa dai vari applicativi del sistema. Perciò è
fondamentale che una base di dati sia capace di gestire la concorrenza e il
controllo (non tutte le applicazioni hanno il permesso di vedere tutti i dati)
degli accessi.

Chiamiamo Database Management System, o DBMS, i vari sistemi di gestione delle
basi di dati. Per usare un DBMS dobbiamo prima di tutto definire lo schema, o
rappresentazione, della base di dati. Lo schema è diviso in tre livelli:

1. **Logico:** descrizione della base di dati nella sua interezza;
2. **Esterno:** descrizione dei dati accessibili dall'applicativo;
3. **Fisico:** descrizione delle strutture dati usate per rappresentare i dati.

Noi ci concentreremo solo sul livello logico. Grazie al modello a 3 livelli
possiamo ottenere indipendenza fisica, in quanto le strutture dati sottostanti
vengono completamente astratte, e logica, in quanto i vari schemi esterni sono
indipendenti tra di loro.

I DBMS utilizzano 2 linguaggi per operare sui dati:

1. **DDL (Data Definition Language):** utilizzato per definire nuovi dati
   all'interno della base (comandi tipo `CREATE`, `DROP` e `ALTER`)
2. **DML (Data Manipulation Language):** utilizzato per manipolare o interrogare
   (effettuare _query_) la base (comandi tipo `SELECT`, `INSERT`, `UPDATE` e
   `DELETE`)

## Il modello relazionale

I database usano diversi modelli logici per organizzare i dati. Uno dei
possibili modelli, ed il più usato oggi, è il modello relazionale.

Il modello relazionale è stato inventato dall'informatico britannico E. Codd
negli anni '70. È stato messo sul mercato dalla Oracle negli anni '80 e
raggiunse successo commerciale nel 1985. A differenza dei due modelli
precedenti, quello reticolare basato su grafo con archi e nodi e quello
gerarchico della rivale IBM basato su strutture ad albero, il modello
relazionale si basa sul concetto di relazione.

### Struttura del modello relazionale

Definizione. _Relazione_
: Una relazione $R$ su un insieme di domini $D_1, \dots, D_n$ è formata da due
  parti: una intestazione e un corpo.

  1. Intestazione: formata da un insieme fissato e senza ordine di attributi.
     Ogni attributo è descritto dalla coppia $\langle \mathit{nome\_attributo},
     \mathit{nome\_dominio} \rangle$ e corrisponde a esattamente uno solo dei
     domini $D_i$. Il nome di ciascun attributo deve essere distinto, i domini
     in sé non devono essere distinti però.
  2. Corpo: formato da un insieme di tuple disordinate. Ogni tupla è
     un insieme unico di coppie $\langle \mathit{nome\_attributo},
     \mathit{valore} \rangle$, una per ogni attributo dell'intestazione, dove
     $\mathit{valore}$ è un elemento del relativo dominio.

Definizione. _Grado di una relazione_
: Diremo grado di una relazione il numero di attributi che contiene.

Definizione. _Cardinalità di una relazione_
: Diremo cardinalità di una relazione il numero di tuple contenuto nel corpo

Più informalmente una relazione può essere vista come una tabella dove
l'intestazione corrisponde agli attributi e le varie righe alle tuple.

| ID  | Nome              | Età | Corso         |
|:---:|:-----------------:|:---:|:-------------:|
| 123 | Mario Rossi       | 19  | Informatica 1 |
| 456 | Francesca Sgarbi  | 21  | Fisica 3      |
| 789 | Leonardo Bianconi | 21  | Elettronica   |

Per questo motivo confonderemo il termine "relazione" con "tabella". Una
notazione utile che utilizzeremo è la seguente: sia $t$ una tupla, $t[X] =
\mathit{valore}$ indica indica il valore che la tupla assume per l'insieme di
attributi $X$.

Solitamente una singola relazione non è sufficiente  non è sufficiente a
organizzare tutti i dati relativi ad una applicazione. Perciò i database sono
solitamente formati da diverse relazioni che contengono valori comuni. Il
modello relazionale viene detto _value-based_ poiché i riferimenti tra le varie
tabelle avviene tramite i valori che appaiono nelle tuple. I modelli
precedenti rappresentavano queste relazioni tramite dei puntatori e venivano
chiamati _pointer-based_. Rispetto ai sistemi _pointer-based_, il modello
relazionale possiede numerosi vantaggi tra cui:

1. La rappresentazione logica non fa alcun riferimento a quella fisica rendendo
   le tabelle indipendenti dalla loro rappresentazione;
2. Vengono rappresentati solo i dati rilevanti agli applicativi;
3. Poiché tutta l'informazione è contenuta nei valori, è relativamente semplice
   trasferire i dati da un contesto all'altro.

Per rappresentare valori inesistenti o sconosciuti, arricchiamo ogni dominio
delle relazioni del database con il valore `null`.

Ricapitoliamo le definizioni del modello relazionale distinguendo gli schemi,
rappresentazione logica simile alle classi in OOP, dalle istanze,
materializzazione degli schemi simile agli oggetti in OOP.

Definizione. _Schema di una relazione_
: Definiremo schema di una relazione un simbolo, chiamato nome della relazione,
  ed un insieme di attributi $X$. Il tutto viene solitamente indicato con
  $R(X)$. Il nome della relazione deve essere univoco.

Definizione. _Schema di un database_
: Definiremo schema di un database l'insieme di schemi di relazioni.

  $$\mathbf{R} = \{R_1(X_1), \dots, R_n(X_n) \}$$

Definizione. _Istanza di una relazione (relazione)_
: Un'istanza di una relazione con schema $R(X)$ è un insieme $r$ di tuple su
  $X$.

Definizione. _Istanza di un database (database)_
: Un'istanza di un database con schema $\mathbf{R} = \{R_1(X_1), \dots, R_n(X_n)
  \}$ è un set di relazioni $\mathbf{r} = \{r_1, \dots, r_n\}$ dove ogni $r_i$,
  $1 \leq i \leq n$, è una relazione con schema $R_i(X_i)$.

La normalità di una relazione è una proprietà che affronteremo in dettagli più
avanti. Per ora limitiamoci a definire la prima forma normale poiché noi
lavoreremo con tabelle che soddisfano questa forma.

Definizione. _Relazione in prima forma normale_
: Una relazione si dice in prima forma normale se ogni tupla contiene solo
  elementi atomici.

### Vincoli di integrità

La struttura del modello relazione ci permette di organizzare le informazioni di
interesse per le nostre applicazioni. In molti casi, però, non è vero che ogni
insieme di tuple che rispetta lo schema rappresenta informazioni corrette. In un
database, è necessario che l'informazione sia sempre corretta. Perciò è stato
introdotto il concetto di vincolo. Ogni vincolo è un predicato che associa un
valore booleano ad ogni istanza. Un database è considerato corretto, o legale,
se rispetta tutti i vincoli specificati. Esistono diversi tipi di vincoli:

1. Vincoli sui valori nulli: presenza di campi necessari;
2. Vincoli di integrità referenziale;
3. Vincoli di chiave;
4. Vincoli generici sulle tuple.

#### Vincoli di chiave

Iniziamo con il definire il concetto di chiave. Intuitivamente, possiamo vedere
la chiave come un insieme di attributi che identifica in modo univoco le varie
tuple di una relazione. Più precisamente:

Definizione. _Superchiave_
: Un insieme di attributi $K$ è detto superchiave di un relazione $R$ se $R$ non
  contiene due tuple distinte tali che $t_1[K] = t_2[K]$.

Definizione. _Chiave_
: Un insieme di attributi $K$ è detto chiave per una relazione $R$ se esso è la
  superchiave minima.

Teorema.
: Ogni relazione $R$ possiede sempre almeno una chiave.

Il teorema sopra garantisce il fatto che si potrà sempre accedere a tutti i
valori di una relazione legale in modo disambiguo. In più, permette l'effettiva
realizzazione dei riferimenti tra più tabelle che stanno alla base del modello
_value-based_.

Poiché possono esistere più di una chiave per relazione, solitamente viene
definita una chiave primaria (indicata sottolineandone gli attributi). Valori
nulli per le chiavi primarie sono vietati mentre generalmente sono permessi per
le altre. Inoltre, la maggior parte dei riferimenti tra relazioni usa le chiavi
primarie.

## Linguaggi di interrogazione

I linguaggi di interrogazione, come abbiamo visto, ci permettono di accedere ai
dati all'interno della base di dati. Esistono due tipi di linguaggi di
interrogazione:

1. Linguaggi formali: algebra relazionale, calcolo relazionale, datalog
2. Linguaggi _commerciali_: SQL

### Algebra relazionale

Proposta inizialmente da Codd, è un linguaggio formale funzionale per formulare
query (interrogazioni). È basato su 5 operazioni fondamentali: selezione,
proiezione, unione, differenza e prodotto cartesiano.

Definizione. _Relazioni compatibili_
: Due relazioni si dicono compatibili se sono dello stesso grado e (nei sistemi)
  i domini sono ordinatamente dello stesso tipo (anche il nome deve combaciare).

Definizione. _Selezione_
: Indicata $\sigma_\mathit{predicato} R$, la selezione restituisce una nuova
  tabella senza nome con schema identico alla tabella di partenza e istanza le
  tuple che soddisfano il predicato di selezione.

Definizione. _Proiezione_
: Indicata $\Pi_{a_i \ldots} R$, la proiezione restituisce una tabella senza
  nome con schema contenente solo gli attributi specificati e istanza la
  restrizione delle tuple sugli attributi selezionati. Formalmente la proiezione
  elimina eventuali duplicati che si vanno a formare, in SQL invece è su
  richiesta.

Definizione. _Unione_
: Indicata $R_1 \cup R_2$, l'unione è definita solo tra relazioni compatibili e
  restituisce una tabella priva di nome con schema invariato e istanza l'unione
  delle istanze dei due operandi.

Definizione. _Differenza_
: Indicata $R_1 \setminus R_2$, la differenza è definita solo tra relazioni
  compatibili e restituisce una tabella priva di nome con schema invariato e
  istanza la differenza delle tuple delle due relazioni.

Definizione. _Prodotto cartesiano_
: Indicato $R \times S$, il prodotto cartesiano restituisce una tabella priva di
  nome con schema l'unione degli schemi degli operandi e istanza tutte le
  possibili coppie di tuple degli operandi. Per rendere non ambigui gli
  attributi con lo stesso nome, si può prefissare il nome della relazione, ad
  esempio $R.a_1$ e $S.a_1$.

Sono permessi anche i seguenti operatori non algebrici per rendere le
espressioni algebriche più leggibili:

1. Assegnamento $=$ o $\gets$: definisce una etichetta ad una selezione
2. Ridenominazione $\rho_{a_1 \gets a_2} R$: permette di modificare i nome degli
   attributi.

Le operazioni sono associate a sinistra e la precedenza è analoga a quella
dell'algebra elementare.

#### Operazioni derivate

Le operazioni derivate sono definite in base alle operazioni fondamentali. Esse
sono abbreviazioni di operazioni molto comuni. Ne vederemo tre: intersezione,
join (con le sue varianti) e divisione.

Definizione. _Intersezione_
: Indicata $R_1 \cap R_2$, equivale a:

  $$R \setminus (R \setminus S)$$

  L'intersezione è definita solo tra relazioni compatibili.

Definizione. _Join_
: Indicato $R \underset{\mathit{predicato}}{\Join} S$, equivale a:

  $$\sigma_{predicato} (R \times S)$$

  Esso restituisce una tabella priva di nome con schema pari alla concatenazione
  degli schemi di $R$ e $S$ e istanza pari all'insieme ottenuto concatenando le
  tuple di $R$ e $S$ che soddisfano il predicato.

Definizione. _Equi-Join_
: È un caso particolare di join, dove il predicato ammette solo confronti di
  uguaglianza.

Definizione. _Join naturale_
: Equivale ad un equi-join di tutti gli attributi omonimi. Nella notazione, si
  omette il predicato e nel risultato si eliminano le colonne ripetute.

Definizione. _Semi-join_
: Indicato con $R \underset{\mathit{predicato}}{\ltimes} S$, equivale a

  $$\Pi_{R.\star} (R \underset{\mathit{predicato}}{\ltimes} S)$$

Definizione. _Semi-join naturale_
: Indicato $R \ltimes S$, equivale a:

  $$\Pi_{R.\star} (R \Join S)$$

Definizione. _Divisione_
: Indicato $R \div S$, equivale a

  $$
    \Pi_{R \setminus S} R \setminus \Pi_{R \setminus S}
      ((\Pi_{R \setminus S} R \times S) \setminus S)
  $$

  Con lo schema di $S$ contenuto in quello di $R$. Seleziona le tuple di $R$ che
  contengono tutte le tuple di $S$

Il join ha la stessa precedenza del prodotto cartesiano.

#### Ottimizzazione delle organizzazioni

Possiamo ridurre le espressioni applicando alcune semplificazioni. Un modo utile
per visualizzare le espressioni e le relative semplificazioni è visualizzare il
tutto come un albero delle operazioni (vedi LEA).

1. **Eliminazione dei prodotti cartesiani:** Possiamo sostituire un prodotto
   cartesiano seguito da selezione con join.
2. **Push della selezione rispetto al join:** Possiamo trasformare $\sigma_p (R
   \Join_q S)$ in $(\sigma_p R) \Join_q S$. Questa semplificazione si può fare
   se e solo se il predicato della selezione coinvolge solo attributi di $R$ (o
   analogamente di $S$).
3. **Push della proiezione rispetto al join:** Analogo al precedente,
   trasformiamo $\Pi_L (R \Join_q S)$ in $\Pi_L (\Pi_{LR \cup JR} R \Join_q
   \Pi_{LS \cup JS} S)$ dove $LR$ e $LS$ sono gli attributi di $R$ ed $S$
   rispettivamente e $JR$ e $JS$ gli attributi di $R$ ed $S$ rispettivamente
   coinvolti nel join.
4. **Idempotenza della selezione:** $\sigma_{p \land q} R = \sigma_p (\sigma_q
   R)$ Unendo questa regola con il push della selezione rispetto al join,
   possiamo rimuovere la restrizione sugli attributi.
5. **Idempotenza della proiezione:** $\Pi_L R = \Pi_L \Pi_{L'} R$ con $L
   \subseteq L'$
6. **Push della selezione rispetto all'unione:** $\sigma_p (R \cup S) = \sigma_p
   R \cup \sigma_p S$
7. **Push della selezione rispetto alla differenza:** $\sigma_p (R \setminus S)
   = \sigma_p R \setminus \sigma_p S$
8. **Push della proiezione con l'unione:** $\Pi_L (R \cup S) = \Pi_L R \cup
   \Pi_L S$. Attenzione: la proiezioni non commuta con le altre operazioni
   insiemistiche!
9. **Distributività della join rispetto all'unione**

### Calcolo relazionale

È una famiglia di linguaggi formali dichiarativi per formulare interrogazioni.
I due tipi principali sono il calcolo relazionale delle tuple (TRC) e il calcolo
relazionale dei domini (DRC). A sua volta il TRC può avere dichiarazioni di
range o tuple arbitrarie. Noi vedremo il TRC con tuple arbitrarie.

Le interrogazioni sono così strutturate: $\{t|p(t)\}$ con $t$ le tuple per le
quali è vera $p(t)$. La formula $p(t)$ è costituita tramite atomi:

- $t \in r$
- $t[A] \textit{ COMP } k$
- $t_1[A_1] \textit{ COMP } t_2[A_2]$

Dove per $\mathit{COMP}$ intendiamo un connettivo logico. Valgono le solite
equivalenze relative alle espressioni booleane.

Esistono delle formule, tipo $\{t|t\notin r\}$ producono un risultato infinito.
Riduciamo perciò il calcolo relazionale ai domini attivi

Definizione. _Restrizione ai domini attivi_
: Le tupe che soddisfano una formula possono essere composte solamente da valori
  che compaiono esplicitamente nella formula o in tuple di relazioni menzionate
  nella formula.

Il calcolo relazione è equivalente all'algebra. Infatti è possibile tradurre
tutte le operazioni fondamentali dalla prima al calcolo relazionale.

1. Selezione: $\sigma_{A=1} r \equiv \{t|\exists t_1 \in r (t_1[A] = 1) \land
   t = t_1\}$
2. Proiezione: $\Pi_{AC} r \equiv \{t | \exists t_1 \in r (t[A,C] = t_1[A,C])\}$
3. Prodotto cartesiano: $r(A,B,C) \times s(D,E,F) = \{t|\exists t_1 \in r, t_2
   \in s (t[A,B,C] = t_1[A,B,C]) \land t[D,E,F]=t_2[D,E,F]\}$
4. Unione: $r \cup s = \{t | (\exists t_1 \in r (t=t1) \lor (\exists t_2 \in s
   (t=t_2)))\}$
5. Differenza: $r \setminus s = \{t | (\exists t_1 \in r (t=t1) \land
   \neg (\exists t_2 \in s (t=t_2)))\}$

L'algebra relazione e la TRC hanno delle limitazioni sul tipo di interrogazioni
che possiamo fare:

1. Possiamo solo estrarre valori già esistenti, non calcolarne di nuovi;
2. Interrogazioni inerentemente ricorsive come la chiusura transitiva.

### Datalog

Da "Prolog per basi di dati". È un linguaggio di programmazione logica
dichiarativo basato su regole e fatti.

#### Sintassi

Il datalog si basa sulla definizione di fatti di base (o _ground facts_) che
corrispondono alle tuple delle nostre tabelle.

```datalog
genitore(a, b)
genitore(b, c)
```

Il significato delle espressioni sopra è "a è genitore di b" e "b è genitore di
c" rispettivamente.

Le regole, invece, definiscono come nuovi fatti verranno dedotti dai fatti base.
La seguente espressione definisce 2 regole con il seguente significato:

```datalog
antenato(X,Y) :- genitore(X,Y)
antenato(X,Y) :- genitore(X,Z), antenato(Z, Y)
```

1. `X` è un antenato di `Y` se `X` è genitore di `Y`
2. `X` è un antenato di `Y` se `X` è genitore di un `Z` e questo `Z` è antenato
   di `Y`

Ogni regola è divisa in due parti: la testa (o LHS) e il corpo (o RHS). Una
regola si può generalmente interpretare così:

1. LHS è vero se RHS è verol
2. THS è vero se, per ogni letterale di RHS, tutte le sue variabili sono
   unificabili, ovvero sostituibili , con valori costanti che rendono vero il
   letterale.

Nella definizione di regole si possono usare operatori di confronto e funzioni
aritmetiche.

> Consideriamo il fatto: `padre(X,Y) :- Persona(X, _, 'M'), genitori(X,Y)`. Esso
> è traducibile in algebra relazione con: $\mathit{padre} = \Pi_{1,5} \sigma_3
> (\mathit{persona} \Join_{1=1} \mathit{genitori})$.

Le query, o _goals_, sono così definite:

```datalog
?- antenato(a, X)
```

E considerando i precedenti fatti e regole ritornerebbe `b, c`.

#### Valutazione delle query

La valutazione parte da dei fatti "conosciuti" pari ai fatti del programma. Si
procede enumerando ogni singola regola: se ogni atomo nel corpo della regola è
nell'insieme dei fatti conosciuti, allora la testa viene aggiunta nella lista
dei fatti noti. Il processo è ripetuto finché non si possono generare nuovi
fatti.

L'insieme dei fatti di base è detto database estensionale, mentre l'insieme dei
predicati appartenenti al corpo delle regole è detto database intensionale.

La valutazione di una query consiste nel cercare una tupla sull'intera base di
dati e una sostituzione che unifichi le variabili. Le query che non contengono
variabili restituiscono `true` o `false`.

#### Il potere espressivo del datalog

Il datalog senza negazione permette di rappresentare gli operatori di selezione,
proiezione, prodotto cartesiano e unione dell'algebra:

- **Selezione, Proiezione e prodotto cartesiano:** vedi precedente esempio
- **Unione:** scriveremo più regole con la stessa testa.

Per rappresentare la differenza serve la negazione:

```datalog
p(X,Y) :- r(X,Y), -s(X,Y)
```

La negazione, però, è un'operazione delicata in quanto può generale regole
infinite. Per metteremo la negazione con la seguenti restrizioni:

1. Tutte le variabili di un letterale negato devono comparire anche in
   un letterale positivo del corpo della regola.
2. Non ci devono essere cicli di dipendenza tra letterali negati.

Abbiamo quindi raggiunto un livello di espressività almeno pari all'algebra
relazionale. Il datalog, permette un livello di espressività ancora maggiore in
quanto permette query ricorsive.

```datalog
antenato(X,Y) :- genitore(X,Y)
antenato(X,Y) :- antenato(X,Z), genitore(Z,Y)
```
