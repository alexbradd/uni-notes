# Appunti di Ingegneria del Software

## Introduzione

### Cos'è l'ingegneria del software

Possiamo definire ingegneria del software un approccio sistematico allo sviluppo,
alla mesa in opera e alla manutenzione del software, secondo criteri
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

Per progettazione intendiamo la scomposizione di un problema in
sotto-problemi che possono essere risolti indipendentemente con l'obiettivo di
governare la complessità e rendere efficiente il processo.

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

- **SCRUM Master:** Il responsabile del processo;
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
viceversa. Ciò significa una integrazione di continuous testing e monitoring con
il processo di sviluppo che diventa collaborativo. Ciò permette la creazione di
cicli di sviluppo sempre più corti con cambiamenti piccoli che viene
automaticamente messo in produzione e monitorato, creando un ciclo continuo che
unisce lo sviluppo del software con la monitoraggio del funzionamento.
