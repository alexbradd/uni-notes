# Appunti di "Tecnologie informatiche per il web"

## Architetture

Un'architettura è un mix di risorse hardware, software e di rete. Esse sono
classificate in base a vari fattori come:

- Tipo;
- Funzionalità;
- Risorse hardware utilizzate;
- Tipologia dei collegamenti;
- Insieme di moduli software.

L'architettura più semplice è quella del mainframe: tutto la funzionalità è su
un unico nodo al quale si connettono un insieme di terminali "stupidi" (solo
presentazione). L'architettura mainframe è molto semplice da gestire: basta
gestire un solo terminale (il mainframe) e ciò garantisce consistenza di
software, dati e logica applicativa tra tutti gli utenti. Il principale
svantaggio è la monoliticità del software lato mainframe che è difficilmente
riutilizzabile e non permette evoluzione.

L'architettura client-server è l'evoluzione dell'architettura mainframe: ora il
codice è diviso tra un server, che gestisce i dati e logica applicativa
condivisa, e un client che si occupa della presentazione grafica. Il client
comunica con il server tramite query SQL, mentre il server risponde con i dati.
Il principale svantaggio è la necessità di un "fat client" che gestisce la
presentazione e la logica di business specifica del client. Inoltre il modello
del client è strettamente collegato a quello del server, rendendo difficile la
propagazione di aggiornamenti, oltre che non sfruttare al massimo le connessione
al database. I vantaggi sono l'uso di un linguaggio standard di query (SQL) e la
presenza di numerose ottimizzazioni sia lato server (grazie al DBMS) sia lato
client (cache, pre-fetch...).

Il prossimo passo è stato l'architettura a 3 tier: tra il server e il client
viene aggiunto in intermediario che meglio separa client e server: centralizza
le connessioni al database e maschera il modello dei dati al client permettendo
più scalabilità. Rimane il problema del legame tra il codice di client e del
middle-tier. Il middle-tier comunica con i client tramite diversi metodi: RPC,
orientamento a oggetti (Java RMI) e Message Oriented Middleware (MOM). I MOM
hanno migliorato ulteriormente l'architettura rimuovendo la sincronizzazione
implicata da metodi come RPC: lo scambio di messaggi è asincrono e si basa su un
sistema di domanda/risposta gestiti tramite code.

Sulla base dell'architettura three-tier basata su MOM nasce il web:

- Il client è un browser web che interpreta un linguaggio standard di
  presentazione (HTML) e si occupa solo della presentazione.
- Il client comunica con il middle tier tramite un protocollo standard (HTTP)
  basato su richieste di risorse e risposte contenenti le risorse richieste.
- Il middle-tier fornisce le risorse statiche richieste e genera dinamicamente
  le pagine HTML da fornire al browser in base a query sui dati al database.

Il web ha spazzato qualsiasi architettura precedente grazie al concetto di
cliente universale: un solo client può accedere a qualsiasi applicazione web.

La mancanza di opzioni di interattività di HTML ha portato ad un'evoluzione
della prima architettura web (detta "Pure HTML") detta delle Rich Internet
Application. Le RIA permettono di ridefinire gli eventi interattivi della pagine
tramite codice applicativo (FLASH, JavaScript e AJAX) eseguito dentro il browser.
Adesso si ha un "fat client" che più che essere un semplice interprete ora
fornisce anche una API per definire la logica di presentazione.

Le applicazioni mobili, l'ultima frontiera, possono essere sviluppate o come
applicazioni client-server (app native) o come applicazioni web (progressive web
app).
