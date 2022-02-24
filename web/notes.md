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

Le applicazioni mobili possono essere sviluppate o come applicazioni
client-server (app native) o come applicazioni web (progressive web app).

Una service oriented architecture (SOA) è un'architettura che permette di creare
e pubblicare applicazioni autonome con un'interfaccia standard dette servizi. La
comunicazioni tra servizi avviene tramite un protocollo standard. Gli obiettivi
sono il decoupling tra componenti e layer architetturali per mascherare le
diverse tecnologie. La SOA garantisce scalabilità per applicazioni distribuite
ed eterogenee e flessibilità grazie alla possibilità dell'aggiunta dinamica di
servizi.

Il cloud computing permette l'accesso tramite rete on-demand e conveniente di
risorse computazionali condivise e configurabili.

## HTTP

HTTP è un protocollo a livello applicativo per lo scambio di "ipertesti", ossia
documenti che contengono riferimenti ad altri documenti. Il protocollo
standardizza i nomi delle risorse (URL), le richieste e le risposte. HTTP è
presente il diverse versioni: 0.9, 1.0, 1.1, 2. HTTP definisce diversi concetti:

1. Client: un'applicazione che stabilisce una connessione e manda richieste
2. Server: un'applicazione che accetta connessione e risponde con risposte
3. User Agent: il client che manda una richiesta (browser, editor, web
   crawlers...)
4. Origin server: il server sul quale risiede una risorsa o che la crea
5. Risorsa: un oggetto o servizio identificato da URI

Il browser è un'applicazione che manda richieste HTTP e riceve, interpreta le
risposte e le visualizza. I browser supportano due linguaggi di descrizione
(HTML e CSS) e un linguaggio di programmazione (JavaScript). Inoltre possiedono
un meccanismo di estensioni tramite un'interfaccia a plugin.

Il server HTTP riceve e analizza le richieste HTTP. Inoltre si occupa
dell'accesso alle risorse e dell'invio delle risposte HTTP oltre che ad altre
funzionalità come il controllo degli accessi, esecuzione di programmi
server-side, logging, monitoraggio e amministrazione, hosting virtuale, mapping
URL e connessioni agli application servers. L'application server è un
applicativo il cui compito è quello di facilitare l'esecuzione delle
applicazioni utente lato server.

HTTP è un protocollo stateless (privo di stato): il protocollo governa un
singolo round trip formato tra richiesta-riposta. Nessun dato è conservato tra
due connessioni dello stesso client e/o diversi client. Tutto ciò implica che
HTTP è anche sessionless. L'application server, invece, può essere stateful e
preservare una sessione utente formata da più cicli richiesta-risposta. Esso,
inoltre, non ha limitazioni riguardo all'interattività con altre risorse.

Alcuni altri elementi definiti dalla RFC di HTTP sono:

- Proxy: un intermediario che si comporta come server per un client e
  come client per un server. Questo meccanismo può essere usato per gestire
  l'accesso a delle risorse o per effettuare caching delle risorse.
- Gateway: un server che si comporta come intermediario per qualche server che
  non necessariamente comunica tramite HTTP. A differenza del proxy, il gateway
  riceve richieste come se fosse l'origin server della risorsa richiesta. Perciò
  il client potrebbe non essere a conoscenza del gateway.

I formati di richiesta e risposta sono molto semplici e si basano su:

- un metodo di richiesta (GET e POST in 1.0) con una serie di dati corollari
  detti header e un body.
- una risposta contente uno stato, una serie di dati corollari detti header e un
  body.

La versione più utilizzata è HTTP/1.1. Essa sistema i vari problemi di
ottimizzazione delle risorse di rete della precedente versione e introduce
numerose novità come: tunnel, chunked encoding, connessioni multi richiesta,
negoziazione contenuto, cache management e nuovi metodi (ad esempio PUT,
DELETE).

L'ultima versione, HTTP/2, come aveva fatto anche la 1.1, si occupa
principalmente sull'ottimizzazione dell'uso delle risorse di rete e
l'ottimizzazione dello scambio su TCP-IP.

La sicurezza in HTML è molto base. Le risorse sono organizzate in domain lato
server (detti realm). I realm possono essere protetti. Una richiesta HTTP deve
contenere un header di autorizzazione (credenziali trasmesse in chiaro,
codificate con base64). Se le credenziali sono sbagliate o non ci sono viene
mandata una risposta con codice 401 (Unauthorized) contenente lo header
"authenticate" che istruisce il browser di mostrare il prompt per l'input delle
credenziali. A causa della semplicità del meccanismo la sicurezza è spesso
gestita dall'application server.
