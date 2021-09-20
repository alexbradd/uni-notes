# Appunti di Ingegneria del Software

## Introduzione

### Cos'è l'ingegneria del software

Possiamo definire ingegneria del software un approccio sistematico allo
sviluppo, alla mesa in opera e alla manutenzione del software, secondo criteri
ingegneristici. Sono dei metodi tecnici e manageriali per prevedere e tenere
sotto controllo i costi per tutto il _lifecycle_ dei prodotti software. Come
tutte le ingegnerie, fornisce metodi una guida per applicare la conoscenza
scientifica allo sviluppo di soluzioni software _cost-effective_ per risolvere
problemi pratici. L'ingegneria del software studia sistemi complessi di grandi
dimensioni nati dal lavoro di gruppo di diversi anni, soggetti a frequenti
modifiche ed esistono in diverse versioni. In breve, si studiano i metodi da
usare perché il processo porti allo sviluppo di prodotti di qualità.

Per software non intendiamo solo l'eseguibile o il codice sorgente, ma tutti gli
artefatti legati ad un particolare prodotto:

- Sorgente e _build environment_ e i test
- Eseguibile
- Documentazione utente e tecnica
- Documenti di progetto

Saper programmare, purtroppo, non basta per essere un buon ingegnere del
software:

- un programmatore sviluppa un programma completo partendo da specifiche fornite
  da altri e lavora individualmente;
- un ingegnere del software analizza i problemi e i domini applicativi, coglie i
  requisiti, sviluppa specifiche progetta componenti _riutilizzabili_ e lavora
  in (e talvolta coordina) un gruppo.

Per progettazione intendiamo la scomposizione di un problema in sotto-problemi
che possono essere risolti indipendentemente con l'obiettivo di governare la
complessità e rendere efficiente il processo.

### Il processo di sviluppo del software

Con la nascita dell'ingegneria del software si è sviluppato un nuovo ciclo di
vita del software detto a cascata che sostituiva quello non strutturato adottato
in precedenza (_code and fix_). Il modello a cascata identifica fasi e attività
predefinite, forza una progressione lineare tra una fase e la successiva
attraverso decisioni _go/no-go_ e non torna sui suoi passi. I passi del modello
a cascata sono i seguenti (Royce, 1970):

1. **Studio di fattibilità:** stabilire se il progetto si debba fare e
   analizzare il rapporto costi-benefici. Esso produce uno "studio di
   fattibilità", un documento che contiene una descrizione preliminare del
   problema con alcuni scenari, le relative soluzioni e i costi e i tempi
   previsti per ogni alternativa
2. **Analisi e specifica dei requisiti:** analizzare il dominio in cui
   l'applicazione si trova, identificarne i requisiti e derivare una specifica
   per il software. Viene prodotto un altro documento: l;analisi e la specifica
   dei requisiti.
3. **Progettazione:** definire l'architettura del software, i vari componenti e
   le loro relazioni. Lo scopo e supportare lo sviluppo concorrente, definendo
   le diverse responsabilità per le diverse parti. Viene prodotto il documento
   "progetto del sistema""
4. **Implementazione e test di unità:** ogni modulo elementare viene
   implementato mediante il prescelto linguaggio di programmazione e viene
   testato _durante_ lo sviluppo.
5. **Integrazione e testi di sistema:** i moduli sono collegati tra di loro e
   viene testata la loro interazione. Il sistema completo viene testato alla
   fine per verificare proprietà complessive.
6. **Messa in opera:** distribuire l'applicazione e gestire le diverse
   istallazioni e configurazioni presso i clienti
7. **Manutenzione:** copre i cambiamenti successivi alla fine del processo di
   sviluppo.

Le correzioni sono necessarie durante l'evoluzione del software, ma il loro
costo aumenta in base a quante decisioni (quanto tardi nella catena) sono state
eseguite. Perciò è meglio anticipare il cambiamento e non subirlo. Il ciclo di
vita a cascata non offre un buon punto di partenza. In soccorso viene il modello
_agile_: si procede in maniera incrementale, per successivi rilanci. Esiste in
diverse forme, le più note _SCRUM_ e _Extreme Programming_.

#### SCRUM

Si parte dal presupposto che la specifica cambi ed evolva. Si utilizzano dei
team di 5/8 persone e lo sviluppo avviene a incrementi di 10/15 giorni. Durante
"sprint" produttivo il software compie tutto il suo ciclo e viene prodotta una
versione completa potenzialmente vendibile dell'applicativo. Successive fasi
raffinano il lavoro prodotto dalle fasi precedenti. Durante uno sprint non
possono avvenire cambiamenti alla specifica del progetto. Perciò la durata degli
sprint è decisa sulla base di quanto a lungo si vuole evitare cambiamenti.

All'interno di ogni team vi sono diversi ruoli:

- **SCRUM Master:** il responsabile del processo;
- **Product Owner:** dialoga con l'esterno (utenti/contrattuario);
- **Team:** il gruppo di circa 7 persone responsabili delle varie fasi di
  sviluppo.

#### Extreme Programming (XP)

Si basa sull'analogia dell'extreme climbing. Ha per obiettivo la risposta ai
requisiti stringenti di ridotto "time to market". Si basa sulla premessa che il
software è impossibile da pre-specificare ed è un po' come guidare: anche se si
ha in mente un piano, occorre un continuo aggiustamento di traiettoria. Come
SCRUM, rivendica la centralità del codice rispetto ad altri artefatti. Integra,
inoltre, il testing nel processo come attività centrale (TDD). Sostiene
l'utilizzo del _pair programming_ (un programmatore scrive e l'altro guarda) e
prevede un _refactoring_ ed un evoluzione continua del codice.

#### DevOps

Una fase critica nello sviluppo è la messa in opera, o deployment. Solitamente
il team si divide in:

1. **Devs:** si concentrano su design, implementazione, manutenzione, testing e
   rilascio del prodotto
2. **Ops:** sono addetti alla messa in produzione; essi installano il prodotto e
   offrono servizi e garanzie di funzionamento e stabilità

Per rendere più efficiente la correzione di errori, la cultura DevOps unisce le
due figure in un'unica figura dove i devs devono indossare i panni degli ops e
viceversa. Ciò significa una integrazione di _continuous testing and monitoring_
con il processo di sviluppo che diventa collaborativo. Ciò permette la creazione
di cicli di sviluppo sempre più corti con cambiamenti piccoli che viene
automaticamente messo in produzione e monitorato, creando un ciclo continuo che
unisce lo sviluppo del software con la monitoraggio del funzionamento.

## Programmazione a oggetti (OOP)

L'idea che ha portato allo sviluppo del paradigma a oggetti è stato il riuso.
Creare piccoli componenti riutilizzabili permette la riduzione dei tempi di
sviluppo, minore manutenzione, maggiore robustezza, affidabilità ed efficienza.
Il riuso, però può causare anche dei problemi:

- Motivi tecnici: i moduli per essere riutilizzabili devono essere adattabili,
  andando a creare un compromesso con il grado di ottimizzazione di ogni
  componente (si ottimizza per il particolare, non per il generale)
- Motivi non tecnici:
  - Paura ad affidarsi al codice scritto da altri
  - Paura di perdere efficienza (compromesso con l'adattabilità)
  - Tendenza a focalizzarsi su progetti di breve durata non ben finanziati
  - Timore di non riuscire a gestire una miriade di componenti diversi

Un sistema, per essere riutilizzabile, deve essere modulare. Un sistema è
modulare se è diviso in parti che hanno una sostanziale autonomia individuale ed
una ridotta interazione con le altre parti. In generale, con il termine "modulo"
intenderemo un fornitore di risorse computazionali: procedure, strutture dati,
tipi ecc. Per un modulo è importante distinguere cosa fa, ossia l'insieme dei
servizi esportati, e come è fatto, ossia le peculiarità interne al modulo.
L'interfaccia di un modulo costituisce il _contratto_ tra il modulo e i suoi
utilizzatori.

### L'incapsulamento e ADT

L'approccio alla modularità tradizionale è quello di scomposizione funzionale
_top-down_: si scompone ricorsivamente la funzionalità principale del sistema da
sviluppare in funzionalità più semplici e si termina quando le funzionalità
individuate sono così semplici da permettere una diretta implementazione. Un
modulo secondo questo è approccio è definito come una procedura/libreria. È un
modo di procedere molto ordinato e logico che però è adatto a progettare
algoritmi ma non sistemi di grosse dimensioni:

1. Spesso un sistema non possiede una singola funzionalità principale
2. Le funzionalità di un programma sono soggette a frequenti cambiamenti
3. Con l'approccio _top-down_ si decidono prematuramente i vincoli tra i diversi
   moduli.

Dove l'approccio tradizionale usava delle procedure che accedevano ad un pool di
dati comune, la scomposizione in oggetti usa due astrazioni: l'incapsulamento e
il tipo di dato astratto (ADT).

Per incapsulamento intendiamo la capacità di ogni dato di esporre un insieme di
operazioni valide, un'interfaccia pubblica immutabile, e mantenere privata la
mutevole implementazione di queste. Definiamo, allora, tipo di dato astratto
(ADT) l'astrazione che classifica i dati in base al loro comportamento e non in
base alla loro rappresentazione fisica. L'interfaccia pubblica sarà l'unico modo
per gli utilizzatori del dato per modificarlo (_information hiding_).

### Concetti di base

#### Oggetto

La OOP si basa, come lascia intendere il nome, sul concetto di oggetto. Per
oggetto intendiamo un'astrazione o, in generale, un'entità con un significato
ben preciso nel dominio applicativo. Nel nostro contesto, un oggetto è
un'istanza di un ADT. Gli oggetti avranno 3 componenti:

1. L'identità: discrimina le diverse istanze dello stesso concetto: due istanze
   possono essere uguali (stessi dati) ma non identici (stesso oggetto);
2. Lo stato: definito da un insieme di attributi mutabili o immutabili;
3. Il comportamento: definito dall'insieme di operazioni o comandi impartibili
   ad un oggetto, chiamati metodi o messaggi.

Un oggetto può essere composto a sua volta da altri oggetti.

#### Incapsulamento

Come visto precedentemente, intendiamo la capacità di definire proprietà
pubbliche (metodi) e private (attributi). Le proprietà private sono visibili e
modificabili solamente attraverso apposite proprietà pubbliche. Dal punto di
vista dell'utilizzatore l'oggetto deve essere una scatola nera utilizzabile solo
attraverso le apposite interfacce.

#### Classe

Una classe è un gruppo di entità identificato da un insieme di caratteristiche
comuni. Una classe è il modello per creare oggetti con stesso comportamento:
ogni oggetto è infatti una istanza di una classe. Ogni classe deve catturare una
e una sola astrazione. Esse consentono la definizione di tipi di dato astratto.

#### Ereditarietà e polimorfismo

Le classi possono essere legate tra di loro da diversi tipi di relazioni:

1. **Ereditarietà**
2. **Aggregazione:** una classe contiene un'altra classe (il volante fa parte
   dell'automobile);
3. **Uso:** una classe chiama metodi di un altro classe (una persona usa una
   macchina).

Tra questi l'ereditarietà è il più importante e caratterizza il paradigma OOP.

Diciamo che una sottoclasse è figlia di una o più superclassi "padre" se è una
specializzazione dell'ultima. Le sottoclassi ereditano tutte le proprietà delle
superclassi e possono modificarle o aggiungerne altre. Il motivo dell'importanza
dell'ereditarietà è la possibilità degli oggetti di compiere polimorfismo, ossia
mutare il proprio tipo. Infatti una variabile ha un tipo statico noto a _compile
time_ che definisce le caratteristiche generali e un tipo dinamico noto solo a
runtime che definisce il tipo specifico dell'oggetto a cui la variabile si
riferisce in un certo istante. Attenzione però: tipo statico e dinamico non sono
slegati! Infatti il tipo dinamico deve essere sempre una specializzazione di
quello statico: una variabile polimorfica può solo specializzarsi, non
generalizzarsi. Ad esempio a priori sapremo che una variabile è di tipo
`Macchina` e ne avrà gli attributi, ma a runtime una variabile di tipo
`Macchina` può contenere sia `MacchinaElettrica` che `MacchinaBenzina` ma non
`Aereo`. Il vero tipo della variabile verrà finalizzato solo all'accesso di una
delle sue proprietà, ad esempio quando viene mandato il messaggio `parti`. Solo
allora si potrà decidere se usare l'implementazione fornita da `Macchina`,
`MacchinaElettrica` o `MacchinaBenzina`. Il polimorfismo implica la necessità di
un lookup dinamico dei metodi e degli attributi da parte del compilatore,
compito che nel paradigma procedurale era delegato al programmatore.
