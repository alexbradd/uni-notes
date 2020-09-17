# Appunti FCI

## Storia di internet

### Storia

Leonard Kleinrock è stato il primo a spedire un pacchetto alla UCLA. Lo scopo
di internet era di creare una rete dove era possibile distribuire tra vari computer
le risorse. Il primo esperimento è stato di fare un login da un computer della
UCLA a uno della SRI, ma è fallito: dei tre caratteri (LOG) sono stati inviati
solo i primi 2 (LO). La prima rete è stata ARPAnet.

Negli anni '70 nasce il primo protocollo di internet (NCP) e il primo programma
di e-mail. La prima rete wireless è stata la ALOHAnet. Nel '76 nasce Ethernet.
Nel '82 nasce la base dell'internet moderno: SMTP, TCP/IP, DNS. Nascono nuove
reti nazionali.Le prime applicazioni furono telnet (remote login), e-mail, FTP.

Negli anni '90 ARPAnet viene dismessa. Tim Berners-Lee inventa il Web moderno al
CERN. Nasce il primo browser (Mosaic, diventato Netscape e poi Mozilla) e
l'internet viene commercializzato e diventa com'è oggi.

### Commento di Kleinrock sulla rete

Il problema principale della rete è che è stata concepita per essere utilizzata
da piattaforme fidate. Con l'adozione di massa, la sicurezza è diventata un
problema e aggiungerla a questo punto è difficile.

L'internet ha, però, ha un grande potenziale in quanto permette lo sviluppo
di applicazioni che non sono state concepite al momento della sua creazione:
si pensi ai contenuti multimediali, appstore e tutti i servizi moderni.

Il prossimo passo di internet è diventare trasparente, "come la corrente
elettrica". Ciò si potrà raggiungere con l'avvento dell'IoT.

## Internet oggi

Il traffico aumenta ogni anno. La maggior parte del traffico odierno è
multimediale. Il numero di utenti è altissimo. Viene utilizzato principalmente
IPv4. IPv6 è meno diffuso e non sarà scopo del corso. La maggior parte della
capacità della rete è fornita da cavi sottomarini (le dorsali).

La rete oggi è molto densa: per andare da un punto all'altro basta attraversare
solo pochi nodi. In totale i nodi sono più di un miliardo.

## Programma del corso

Ha un approccio TOP-DOWN: si parte dalle architetture e si arriva ai metodi di
trasmissione dei bit:

1. Introduzione e architetture
2. Sistemi di comunicazione
3. Modelli funzionali
4. Livello fisico
5. Protocolli applicativi
6. Il livello di trasporto (UDP, TCP)
7. Networking (IP, DHCP, DNS, ICMP)
8. Inoltro e instradamento in internet (Routing)
9. Reti locali e livello di linea (Reti locali, bridge/switch, Ethernet, WIFI)

### Laboratorio

1. Sniffer di rete
2. Ping, traceroute, Dig, strumenti browser (chrome)
3. Protocolli applicativi
4. Programmi socket (python)
5. Configurazione e simulazione di rete (PT)
6. Attività sperimentali su reti wireless

## Cos'è internet

1. Architettura fisica fatta di componenti
2. Un'architettura di rete
3. Servizio di comunicazione che ci permette di trasferire informazione
   tramite un protocollo di comunicazione

### Componenti fisici

- Sono i terminali di rete (host)
- Canali di comunicazioni (link) (fibre ottiche e simili)
- Router o nodi di rete
- Altri nodi

#### Gli host

Gli host sono i nostri pc, dei server o delle macchine virtuali. Anche telefoni,
smartwatch e IoT sono host. Gli host sono in grado di ricevere o mandare
informazioni per le loro applicazioni

#### I link

Possono essere di natura fisica diversa: fibre ottiche, doppini telefonici,
antenne radio e cavi coassiali.  
La differenza principale tra i vari link è la tecnologia usata per trasmettere
i dati e la velocità di trasmissione dei suddetti (rate, misorato in Kb/s ecc...)

#### Nodi di rete

I router sono unità che smistano informazione suddivisa in pacchetti: sequenze
finite di bit.

Oltre ai router esistono altri tipi di nodi che svolgo compiti di collegamento:

- i switch
- gli access point wifi

### Architettura fisica

#### Accesso a internet

Per accesso si intende la tecnologia che consentono alla nostra rete locale di
collegarsi al resto di internet. Prima, però, si passa per la rete dell'ISP.

Per accedere alla rete dell'ISP ci sono molte tecnologie diverse:

- Dialup (modem analogico)
  - Fino a 56KB/s
  - Accesso diretto tramite circuito telefonico
  - Trasmissione segnale in banda fonica
- ADSL (asymmetric digital subscriber line)
  - Sempre basata sul doppino telefonico, ma non passa per la rete telefonica
    permettendo velocità più alte. Poiché condivide l'accesso (doppino) con il
    telefono, esiste un meccanismo di splitting tra il segnale del modem e
    quello telefonico (nella centrale telefonica)
  - L'unico limite in velocità è il mezzo fisico stesso
- Fibra ottica
  - Sta sostituendo il doppino
  - Ci sono diversi tipi di collegamento:
    - Fino a casa
    - fino a edificio: il pezzo fino all'utilizzatore è in doppino
    - fino quartiere: il pezzo fino all'utilizzatore è in doppino
- Rete cellulare (reti radio)
  - Dipende dal mezzo
  - Sono sistemi molto più complessi

#### Reti di reti

Internet è un puzzle di reti interconnesse tramite diverse tecnologie. La
tecnologia di internet più essere usata per interconnettere reti di tipo diverso:

- le diverse porzioni di rete sono composte da tecnologie diverse e possono essere
  anche "sottoreti" (reti locali che gestiscono autonomamente i propri nodi e link)
- I link sono di vario tipo

La rete mondiale è composta da tanti reti degli ISP indipendenti che si accordano
per collegarle insieme.

##### Eterogeneità

Una classifica di reti è in base alla dimensione:

- LAN: Local Area Network. Impiegate in aree limitate
- MAN: Metropolitan Area Network. Interconnettono LAN  e hanno estensioni di
  decine di chilometri
- WAN: Wide Area Netwrok. Ampiezza a piacere, anche globale.

Di solito le LAN sono delle CN: reti terminali che permettono l'accesso ai
consumatori. Le CN si collegano attraverso un POP (Point of Presence) alla
rete dell'ISP.

Gli ISP si connettono agli atri grazie ad altri ISP che offrono
collegamenti a lunga distanza (Backbone Service Provider)tramite un POP. Gli ISP
si collegano tra di loro anche tramite le NAP (Neurtal Access Point). I NAP
prendono il nome di Internet Exchange Point.

```txt
CN -- | POP - ISP | -- | POP - BSP - POP | -- | ISP -- POP | -- CN
        |                  |          |
       NAP ----------------|          CN
        |
     | ISP - POP | -- CN
```

### Servizi di comunicazione e Protocolli

- Infrastruttura di comunicazione: Consente la creazione di applicazioni
  distribuite
- Servizio di comunicazione: Le modalità con cui sono trasferite le informazione
  con delle determinate regole
- Protocollo di comunicazione: Regole con le quali l'informazione viene costruita
  e trasferita

#### Servizio di comunicazione

E' un servizio di trasporto delle informazioni tra processi. Il servizio prende
una parte di memoria e la trasferisce in un'altra parte di memoria nel processo
remoto (lato server). Le regole con cui si scrive e si leggono le informazioni
fanno parte del servizio di comunicazione. I tipi di servizi sono diversi adatti
a diversi tipi di messaggi con diversi gradi di affidabilità.

I meccanismi vengono chiamati Socket.

#### Protocolli di comunicazione

I protocolli permettono di impacchettare l'informazione in modo che il server
capisca la nostra richiesta e la esegua correttamente. Esempio:

- Il client "saluta" il server, server risponde facendo capire che è pronto
- Il client richiede un risorsa, il server gliela invia

##### Esempio: Posta elettronica

- Quando ci colleghiamo il server si presenta
- Il client risponde indicando il suo nome
- Il server riconosce il client ed è pronto per gestire le email
- Il client specifica mittente e mail
- Il server risponde indicando che è tutto in regola
- Il client indica il ricevitore
- Il server risponde indicando che è tutto in regola
- Il client chiede di poter inserire il messaggio
- Il server concede il permesso specificando il terminatore
- Il client inserisce il messaggio
- Il server accetta il messaggio e lo spedisce
- Il client chiude la comunicazione

```txt
S: 220 hamburger.edu
C: HELO cerpes.fr
S: 250 Hello crepes.fr, pleased to meet you
C: MAIL FROM: <alice@crepes.fr>
S: 250 alice@crepes.fr... Sender ok
C: RCPT TO: <bob@hamburger.edu>
S: 250 bob@hamburger.edu... Recipient ok
C: DATA
S: 354 Enter mail, end with "." on a line by itself
C: Bla bla bla
C: Bla bla Bla
C: .
S: 250 Message accepted for delivery
C: QUIT
S: 221 hamburger.edu closing connection
```

Nota: assomiglia molto al linguaggio umano. I protocolli sono convenzioni.

##### Modelli

- Modello client/server: Il client fanno richieste, i server rispondono
  I client chiedono un servizio e il server lo fornisce.
  - E' una comunicazione asimmetrica
- P2P: Tutti comunicano senza distinzione di ruoli.
  - I tipi di messaggi sono di diverso tipi

## Come funziona la rete

### Commutazione di circuito

Funzionamento della vecchie rete telefonica: viene allocata una risorsa che
connette fisicamente i due terminali per l'intera comunicazione.

Come funziona:

- Tramite una richiesta il client chiede alla rete di comunicare con un altro
  nodo
- Viene creato un canale di comunicazione con l'altro terminale e viene aperto
- Alla fine della chiamata viene rilasciato il circuiti per uso da altre telefonate

Le risorse di rete sono suddivise in "pezzi". Ciascun pezzo viene allocato a vari
collegamenti. Le risorse rimangono inattive se non utilizzate.  
La banda è quindi divisa in pezzi: divisione di frequenza o di tempo.

#### Nodo: Commutatore di circuito

Il commutatore connette un canale in ingresso con uno in uscita.

### Commutazione di pacchetto

I collegamenti non sono suddivisi come nella commutazione di circuito, ma bensì
si forma un rete di diversi router collegati tra loro.

Ciascun router ha al suo interno una tabella di instradamento che gli permette di
scegliere il prossimo nodo in base alla destinazione dell'informazione.

#### I pacchetti

L'informazione viene divisa in pacchetti. Il pacchetto viaggia in rete in modo
autonomo (simile al servizio postale). Il pacchetto è identificato da un header
che specifica la sua destinazione (simile alla busta di una lettera).

```txt
Pacchetto:
| header | Pacchetto ... |
```

Tutti i pacchetti condividono le risorse di rete e utilizza il canale trasmissivo
solo per il tempo necessario alla trasmissione.

#### I nodi di rete: packet switch/router

I pacchetti vengono smistati in 3 passaggi

- I pacchetti arrivano in modo asincrono da diversi ingressi. Man mano che
  arrivano vengono memorizzati in una coda di entrata dal router per essere
  processati.
- Il router guarda la tabella e decide dove trasferire il pacchetto.
- In uscita possono esserci dei conflitti temporali tra pacchetti: due pacchetti
  si avviano verso l'uscita contemporaneamente. Si forma, quindi, una coda di uscita
  per ogni canale.

Il router deve prima ricevere tutto il pacchetto prima di poter elaborarlo
e spedirlo in uscita (store and forward).

L'ordine con cui i pacchetti vengono inviati rispecchia quello di arrivo (se
viene usato un meccanismo FIFO e un'elaborazione semplice). Ciò viene chiamato
multiplazione statistica.

### Confronto tra pacchetti e circuiti

Esempio:

- Collegamento di 1MB/s di N utenti. Ciascun utente genera 100 KB/s quando è
  attivo (attivo 10% del tempo).
  - Commutazione a circuito: possono essere serviti massimo 10 utenti
    (1 MB/s / 100 KB/s = 10)
  - Commutazione di pacchetto: Con 35 utenti, la probabilità di averne più di 10
    è inferiore allo 0,0004.
- Collegamento di 2048 MB/s di 25 utenti. Ciascun utente chiede risorse di 50 KB
  ogni 62.5s in media.
  - Commutazione a circuito: 1 canale a 64 KB/s per utente, ritardo di
    trasferimento pagina di 6.25s (400 KB / 64 KB/s = 6,25s)
  - Commutazione a pacchetto: Ritardo di trasferimento medio di 0.22s
    (teoria delle code)

La commutazione di circuito permette:

- di servire molti più utenti con pochi errori, ma dobbiamo accettare la
  probabilità che qualcosa potrebbe andare storto (troppi pacchetti che non
  vengono smistati in tempo).
- di servire gli utenti più in fretta.

Internet è costruito sulla commutazione a pacchetti. Ciò, però, causa il
problema delle code: ritardo e perdita di pacchetti. Esistono dei protocolli
per gestire i pacchetti e la perdita dei suddetti.

### Altri tipi di commutazione di pacchetto

#### Datagram

Utilizzata da internet. In ciascun pacchetto viene indicata solo l'indirizzo di
destinazione. Ciascun pacchetto viene gestito indipendentemente dagli altri,
anche se fanno parte della stessa informazione.

Il meccanismo datagram è stato il primo ed è il più semplice e più utilizzato,
specialmente nella rete periferica.

#### Circuito virtuale

I nodi identificano i pacchetti di un flusso informativo sulla base di un
identificativo di circuito virtuale (CVI o label). Nella tabella di instradamento
ci sono solo i label dei vari circuiti virtuali.

I circuiti virtuali vanno creati in fase di setup. I pacchetti seguono, quindi,
lo stesso percorso in quanto identificati dallo stesso label.

Il circuito virtuale permette di ridurre notevolmente la dimensione della tabella
di instradamento del router a patto che il numero di circuiti non sia troppo
elevato.

Nel cuore della rete viene usato questo approccio in quanto più efficiente quando
le tabelle di instradamento diventano troppo lunghe.

## Velocità di trasmissione (rate, R)

La velocità con il quale l'informazione viene trasmessa sulla linea. Si misura
in bit/s (bps). Esistono multipli (basati sulle potenze di 10): kbps, Mbps...

Sono usati anche i byte/s (Bps = 8bps). Esistono anche di questi i multipli
(kBps, MBps).

Noi useremo la variante basta sui bit.

### Cosa significa

La velocità di trasmissione di un bit è uguale all'inverso del suo tempo di
trasmissione (ricavabile dalla semplice formula della velocità).

## Tempo di trasmissione (T)

Il tempo tra la trasmissione del primo e quella dell'ultimo bit. Legata alla
velocità di trasmissione: $T = L / R$, dove L è il numero di bit.

## Ritardo di propagazione (latency)

Il tempo $\tau$ affinché un impulso trasmesso da un trasmettitore raggiunga un
altro. Essa dipende dalla distanza (D) e dalla velocità di propagazione v
(prossima a quella della luce): $\tau = D / v$.

## Tempo di attraversamento del canale

Tempo fra la trasmissione del primo bit e la ricezione dell'ultimo:
$T_{tot} = T + \tau$

## Store and forward e cut-through

Nello store-and-forward, il pacchetto deve essere prima ricevuto nella sua
interezza ($T_{tot} = T + \tau$).

La tecnica cut-through viene usato per reti più piccole e permette di ridurre
i tempi salvando solo l'header del pacchetto, processare quello e poi fare un
passthrough dell'area dati:

```txt
| H | DATA... |
\         \
      | H | DATA... |
```

L'architettura cut-through presenta problemi se la velocità del canale in uscita
è più lenta di quello in entrata o viceversa.

## Architettura semplificata di un nodo

Architettura general-purpose di un nodo:

- CPU: elabora le informazioni
- Memoria
- Bus: permette lo scambio di informazioni tra CPU, periferiche e memoria
- NIC (Network interface card): sono porte d'ingresso e/o di uscita.

Esistono architetture specifiche con hardware dedicato. Queste architetture sono
basate su delle tabelle (match table )che ci permetto di effettuare in hardware
il processo. Una switch matrix permette di collegare l'input con la coda di
output.

### Il tempo di elaborazione

Tra l'istante di ricezione e quello di invio avviene il processo
dell'informazione (lookup e instradamento). Nei sistemi fatti bene, questo tempo
e approssimabile a 0. Esistono però, casi in cui questo non è trascurabile. Noi
lo assumeremo sempre trascurabile.

### Ritardo di accodamento

Se la linea di uscita è occupata, allora occorre aspettare in coda.

```txt
| A  | B  |
     \    \
     | A'      | B'      |
          |----| <- Attesa
```

Nel calcolare l'intervallo complessivo di trasmissione bisogna contare il fatto
che la ricezione di un pacchetto possa avvenire in contemporanea alla trasmissione
di quello precedente. Fai attenzione però: interfacce indipendenti hanno code
distinte e lavorano in parallelo.

#### Multiplazione statistica e packet-loss

Il ritardo di accodamento dipende dalla multiplazione statistica dovuta
all'arrivo asincrono dei pacchetti alle code di uscita. Tutto ciò possono
essere caratterizzato da grandezze statistiche.

Quando il rate di arrivo è maggiore al rate di uscita, la coda di uscita
verrà saturata e i pacchetti che arrivano dopo la saturazione vengono persi. I
pacchetti persi possono essere ritrasmessi a seconda del livello/protocollo
che gestisce l'evento di perdita.

Il ritardo di accodamento medio è basato su dei risultati della teoria delle
code. Dati:

- R la velocità del link
- L la lunghezza del pacchetto
- $\lambda$ la frequenza di arrivo dei pacchetti
- $\mu$ la frequenza di trasmissione dei pacchetti pari a $\mu = R / L$

L'intensità del traffico è:

$$\frac{L\lambda}{R}$$

Se:

- l'intensità di traffico tende a 0, il ritardo è piccolo
- se l'intensità di traffico tende a 1, il ritardo tende a $\infty$

Si può dimostrare che in alcune condizioni (code infinite) si ha che il ritardo
medio di accodamento è:

$$T_a = \frac{1}{\mu - \lambda} - \frac{1}{\mu}$$

## Il servizio di comunicazione

Dati due entità remote, quando parliamo di servizio di comunicazione intendiamo
il fornitore del servizio di trasporto dell'informazione.

Il colloquio tra due entità non corrisponde con il servizio di comunicazione:
il colloquio è il contenuto, il servizio di comunicazione è ciò che sposta il
contenuto.

IL servizio di comunicazione gestisce lo scambio di informazione fra due entità.
E' in generale un servizio di trasporto di unità informative.

### Regole di accesso (primitive di servizio)

Il servizio di comunicazione può essere descritto mediate delle "chiamate a
servizio" dette primitive di servizio. Esse servono a descrivere, a richiederlo
e a ricevere informazioni su di esso.

Le primitive sono caratterizzate da parametri tra cui:

- informazione da trasferire
- indicazione del destinatario
- caratteristiche del servizio richiesto
- ...

Le primitive di servizio dell'interfaccia socket sono discusse a laboratorio.

### Caratteristiche

#### Modalità a connessione

- Instaurazione della connessione
- Trasferimento
- Rilascio della connessione

Richiede una fase preliminare (instaurazione della connessione).

#### Modalità senza connessione

- Si trasferisce direttamente l'informazione

## Protocollo di comunicazione

Un protocollo è l'insieme delle regole che gestiscono il colloquio tra entità:

- formato dei messaggi
- informazioni di servizio
- algoritmi di trasferimento
- ...

Quando due entità colloquiano tra di loro sono entità di pari livello.

### Cosa viene scambiato

L'oggetto dello scambio di informazioni sono le PDU (Packet Data Units). Le
PDU possono contenere sia tutte le informazioni di servizio (header) e i dai veri
e propri (data).

I dati di solito non sono legati alle regole del protocollo. I dati quindi vengono
da un livello superiore.

## Livelli di comunicazione

Due entità che colloquiano tra di loro possono offrire questo servizio di
comunicazione a entità terze. Queste entità terze sono dette di livello
superiore.

Proprio perché i dati nel PDU possono essere forniti da un'entità di livello
superiore essi sono detti che provengono da un livello superiore.

Le entità di un livello, quindi, comunicano con le loro pari per offrire un
servizio di comunicazione alle entità di livello superiore. Nel fare ciò usano
il servizio di comunicazione offerto da altre entità di livello inferiore. Ciò
quindi permette di creare una gerarchia di livelli tra le vari entità.

Il servizio di comunicazione offerto dal livello superiore è pi ricco e
complesso grazie alle funzioni implementate dal livello inferiore.

I sistemi di comunicazione, quindi, vengono articolati a livelli: dal primo che
offre solo il trasporto di bit ad un livello dove sono definiti servizi
complessi. Internet è diviso principalmente in 5 livelli:

- L'applicazione crea un PDU di livello 5 che viene passato al servizio di
  comunicazione (livello 4);
- Il livello 4 vede questa PDU come un'unica entità alla quale aggiunge il suo
  header e lo manda al livello 3;
- Il livello 3 incapsula con il suo header i dati ricevuti;
- Il livello 2 incapsula con il suo header i dati ricevuti;
- Il livello 1 incapsula con il suo header i dati ricevuti e lo spedisce lungo
  la linea

- L'informazione arriva al primo livello del ricevente. Usa le informazioni del
  header di primo livello e le scarta passando i dati al livello 2;
- Il livello 2 usa le informazioni del header e le scarta passando i dati al
  livello 3;
- Il livello 3 usa le informazioni del header e le scarta passando i dati al
  livello 4;
- Il livello 4 usa le informazioni del header e le scarta passando i dati al
  livello 5;
- L'informazione è arrivata al livello 5 del ricevente e viene processata.

Si può vedere che ogni livello gestisce lo scambio di informazioni sono con un
suo pari.

### Perché i livelli

- Facile identificazione dei servizi
- Facile gestione ed update: trasparenza verso i livelli superiori

La divisione in livelli può essere pericolosa?

### Modello a livelli di internet (TCP/IP)

| Livello | Nome        | PDU            |
|:-------:|:-----------:|:--------------:|
| 5       | Applicativo | Messaggi       |
| 4       | Trasporto   | Segmenti       |
| 3       | Rete        | Pacchetti      |
| 2       | Link        | Trame (frames) |
| 1       | Fisico      | Bit            |

### Funzioni dei vari livelli

Molteplici sono le funzioni che possono essere svolte da un livello.

#### Multiplazione

Permette a più livelli superiori di condividere lo stesso servizio di
comunicazione. Nel momento in cui io trasferisco più informazioni di utilizzatori
diversi, alla ricezione devo essere in grado di risepararle dalla parte del
ricevitore.

Esempio: 1 singolo indirizzo di rete, la multiplazione è data dal numero di
porta (80, 25 ecc...)

#### Controllo d'errore

E' possibile garantire l'affidabilità della comunicazione anche in presenza di
errori sul canale.

Esempio: il TCP, quando invia un pacchetto, mette nell'header una sezione per il
controllo dell'errore. Il ricevitore userà questa sezione per verificare il
pacchetto. Se tutto è andato bene, il ricevitore manda un segnale di tutto ok
(ACK). Se il segnale non arriva al trasmittente, viene ritrasmesso il pacchetto.

#### Instradamento (routing)

Il livello superiore passa al livello con instradamento il parametro di indirizzo.
L'indirizzo viene aggiunto nell'header in modo che possa essere instradato.

I pacchetti possono anche essere in entrata: l'entità instradante legge
l'indirizzo e lo confronta con una tabella di instradamento e decide
se rimandarlo attraverso una porta d'uscita (forward).

La tabella di routing possono essere scritte:

- a mano (Human defined Networking). Le rotte scritte a mano vengono dette
  rotte statiche;
- protocolli di instradamento distribuiti. I nodi della rete scambiano tra di
  loro dei messaggi di servizio che permettono ai router di "imparare" da sé
  le rotte;
- software defined networking. Viene automatizzato con software il HDN;

Nota: il pacchetto in arrivo non sale mai più in alto nei livelli salvo che non
sia giunto a destinazione.

Nota: i nodi di rete spesso non salgono più in alto del livello di instradamento.
Un esempio di ciò sono i Router IP. La funzione di rete, però, non per forza è
implementata al livello 3:

- instradamento al livello 2: LAN switch;
- instradamento al livello 5: Proxy.

