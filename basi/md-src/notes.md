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
: Diremo cardinalità di una relazione il numero di istanze che contiene

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
tabelle avviene tramite i valori che appaiono nelle istanze. I modelli
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
4. Vincoli generici sulle istanze.

#### Vincoli di chiave

Iniziamo con il definire il concetto di chiave. Intuitivamente, possiamo vedere
la chiave come un insieme di attributi che identifica in modo univoco le varie
istanze di una relazione. Più precisamente:

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
