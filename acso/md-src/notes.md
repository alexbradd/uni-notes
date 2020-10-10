# Appunti ACSO

## I principi fondamentali

I processori eseguono le istruzioni in maniera sequenziale (non vedremo la Out
of Order Execution). Il processore contiene una sezione di controllo che
controlla l'esecuzione leggendo le istruzioni dalla memoria. I vari programmi
da eseguire sono salvati in una memoria.

L'architettura di riferimento è l'architettura di Von Neumann. Esso contiene:

- Processore
  - Sezione di controllo
  - ALU
  - Registri
- Memoria
- Interfacce I/O
- Bus che collega i vari componenti sopra elencati

I registri sono delle piccole celle di memoria che il processore usa per
salvare dati utili. Ogni registro ha una dimensione massima specificata in bit.
I registri che studieremo saranno quelli a 32 bit.

Viene detta parola del processore la lunghezza dei suoi registri, ossia la
lunghezza massima della sequenza di bit che può gestire.

Esistono dei registri particolare:

- PC (Program Counter): contiene l'indirizzo della prossima istruzione
  in memoria
- IR (Instruction Register): contiene l'intera istruzione da eseguire

Il ciclo di esecuzione di un'istruzione è divisa nelle seguenti fasi:

- fetch: viene presa dalla memoria attraverso il bus l'istruzione puntata dal
  program counter e incrementalo nel frattempo (memoria più lenta del
  processore)
- decode: decodifica l'istruzione e prepara l'esecuzione prelevando gli operandi
- execute: esegui e memorizza i risultati

I vari processori si differenziano in base alla lunghezza delle istruzioni che
usano (può essere una singola parola (RISC) oppure più (CISC)).

### Data path

Il data path è formato da registri e da ALU. I registri sono divisi in:

- utilizzabili dall'assembler
- di supporto per altri componenti (es.: 3 registri di supporto dell'ALU
  (sorgente, sorgente, destinazione))

Abbiamo due classi di istruzioni:

- Prendono registri e memorizzano in altri registri (registro-registro)
- Gestiscono lo spostamento da registri a memoria (registro-memoria)

L'esecuzione di una istruzione registro-registro viene detta ciclo di data path.
Il ciclo di data path è collegato al ciclo di clock.

### Codifica delle istruzioni

Ogni istruzione è divisa in codice operativo e campi (field). Il codice
operativo indica il tipo di operazione. I campi vengono usati per gli operandi
dell'istruzione.

Le modalità di indirizzamento descrivono le diverse modalità attraverso le cui
far riferimento agli operandi nelle istruzioni.

### Architettura LOAD/STORE

Il numero di registri ad uso generale non è abbastanza grande per mantenere
tutte le variabili di un programma. Ad ogni variabile viene quindi assegnata una
locazione in memoria nella quale salvare il contenuto del registro che la
rappresenta quando deve essere usato per altro.

Poiché gli operandi delle istruzioni possono provenire solamente dai registri
ad uso generale, servono delle istruzioni di caricamento e salvataggio a
memoria. Da qui il nome dell'architettura.

### Interruzioni (interrupt)

Il normale flusso dei programmi può essere interrotto attraverso le
interruzioni. Quando un dispositivo esterno vuole richiedere l'attenzione del
processore, esso attiva un segnale hardware (segnale di interrupt) per
notificarlo.

Il check degli interrupt viene fatto alla fine dell'esecuzione di
un'istruzione ma prima del fetch della successiva. Se viene trovato un segnale
di interrupt, il processore interrompe la normale esecuzione del programma ed
esegue la richiesta. Una volta gestita il processore torna ad eseguire
normalmente il suo programma.

### La gerarchia di memoria

E' divisa in una gerarchia (dalla più veloce alla più lenta):

- Registri
- Cache (L1, L2, L3)
- Memoria fisica: RAM (es. DDR-SDRAM)
- Memoria a stato solido (SSD)
- Memoria virtuale: basata su file (HDD)

### Indirizzi di memoria principale

La memoria principale è suddivisa in celle. La dimensione di una cella è
chiamata parola, come anche il numero massimo di bit che il processore può
gestire. La parola di memoria non per forza avrà la stessa dimensione della
parola del processore.

Nel MIPS useremo una parola di memoria di 8 bit (memoria indirizzabile al byte).
Di conseguenza una parola MIPS è lunga 4 parole di memoria.

Il tempo di indirizzamento di ogni singola parola è uguale.

L'insieme di tutte le celle di memoria indirizzabili con 1 parola di processore
è detto spazio di memoria: per una parola di 32 bit si ha uno spazio di memoria
di 4 GB.

### Bus di sistema

Un bus è un insieme di fili. Ogni filo trasferisce un bit. I vari fili sono
suddivisi in categorie:

- Bus dati: comprende le linee usate per trasferire dati da/verso memoria.
  La dimensione del bus dati deve essere abbastanza da garantire il
  trasferimento contemporaneo di una o più parole di memoria
- Bus indirizzi: comprende le linee sulle quali la CPU procede a trasmettere
  gli indirizzi di memoria delle risorse
- Bus di controllo: comprende le linee su cui transitano le informazioni
  ausiliarie per la corretta definizione delle operazioni e per sincronizzare
  CPU e memoria

Il bus può essere utilizzato per un solo trasferimento alla volta: in ogni
istante solo due entità possono comunicare (master - slave). Il master è il
processore, gli slave sono le periferiche. Il processore regola l'accesso delle
varie periferiche. L'unico filo che può essere usato senza permesso del
processore è quello di interrupt request.

L'architettura a bus singolo è molto flessibile e semplice. I dispositivi, però,
hanno velocità diverse. Serve, quindi, un meccanismo di sincronizzazione tra le
varie periferiche.

#### Esempio: operazione di lettura da memoria

1. CPU fornisce l'indirizzo della parola desiderata sul bus indirizzi e richiede
  la lettura sul bus di controllo
2. Quando la memoria ha completato la lettura della parola richiesta, il dato
  viene trasmesso sul bus dati

## MIPS assembler

Il linguaggio assembler è simbolico. E' il primo livello di astrazione prima
del linguaggio macchina.

Un programma è composto da più file (oggetti). Il compito di "collegare" i vari
oggetti è delegato al linker.

L'assembler non istruzioni che effettuano un controllo di flusso come inteso in
C. L'unico strumento che ha è il jump/branch che permette di saltare da
un'istruzione all'altra.

### Sintassi

Nel MIPS i registri sono numerati da 0 a 31 e hanno dei nomi simbolici.
Vengono identificati dal simbolo `$`. Mettere un registro tra parentesi tonde
effettua un'operazione di indirezione. Il primo registro nei field è quasi
sempre la destinazione del risultato dell'istruzione.

#### Direttive

I comandi che iniziano con `.` sono direttive del preprocessore. Esse sono:

- `.text` o `.data`: indica che le linee successive sono istruzioni o dati
- `.align n`: specifica l'allineamento a 2^n bit
- `.globl main`: indica che l'etichetta `main` è visibile anche in altri file
  (visibilità globale)
- `.aciiz`: specifica un'area di memoria che contiene una stringa ASCII
  terminata da `\0`
- `.space n`: riserva uno spazio di n byte
- `.word n`: equivalente a `.space 4` e settare a `n`
- `.half n`:  equivalente a `.space 2` e settare a `n`
- `.byte n`:  equivalente a `.space 1` e settare a `n`
- `.eqv A, n`: equivalente alla `#define` del C

#### Registri

Essi sono 32, numerati da 0 a 31 (occupa 5 bit). Ogni istruzione, quindi, può
usare 3 registri alla volta. Gli operandi delle istruzioni devono essere prima
salvati nei registri.

Registri referenziabili:

- `$0`: contiene sempre 0
- `$1`/`$at`: riservato
- `$v0` e `$v1`: usati per risultati di funzioni e calcolo espressioni
- `$a0` - `$a3`: usati per il passaggio di argomenti
- `$t0` - `$t7`: variabili temporanee
- `$s0` - `$s7`: variabili da preservare
- `$k0` e `$k1`: riservati al kernel
- `$gp`: global pointer (punta ad area di dati globale/statica)
- `$sp`: stack pointer
- `$fp`: frame pointer (puntatore ai frame funzione; in aiuto a `$sp`)
- `$ra`: return address utilizzato nelle chiamate di funzione

Registri non referenziabili:

- `$pc`: program counter
- `$hi`: registro per moltiplicazione/divisione
- `$lo`: registro per moltiplicazione/divisione

#### Istruzioni

Le istruzioni si dividono in 4 categorie:

1. istruzioni aritmetico logiche
2. istruzioni di trasferimento da/verso memoria (ad es. `lw` e `sw`)
3. istruzioni di salto condizionato/incondizionato
4. istruzioni di ingresso/uscita (non fornite da tutti gli assembler)

Le istruzioni sono tutte lunghe massimo 32 bit. I 6 bit più significativi si
chiamano "codice operativo" (OPCODE) e indica il tipo di istruzione.

In MIPS ci sono 3 tipi di istruzioni:

- tipo R: istruzioni aritmetico-logiche; strutturate in:

  ```txt
      6        5        5        5         6       5
  +--------+--------+--------+--------+--------+--------+
  | OPCODE |   rs   |   rt   |   rd   |   sa   | funct  |
  +--------+--------+--------+--------+--------+--------+
  ```

- tipo I: istruzioni di accesso alla memoria o contenenti costanti

  ```txt
      6        5        5                 16
  +--------+--------+--------+--------------------------+
  | OPCODE |   rs   |   rt   |           const          |
  +--------+--------+--------+--------------------------+
  ```

- tipo J: salto

  ```txt
      6                        26
  +--------+--------------------------------------------+
  | OPCODE |                jump target                 |
  +--------+--------------------------------------------+
  ```

Sintassi:

```mips
istruzione field1, field2, field3 # comment
```

La lista completa di tutte le istruzioni non è riportata qui. Può essere trovata
nella cartella con il materiale del corso.

##### Istruzioni aritmetico-logiche

| istruzione | campo | campo |  campo  |
|------------|-------|-------|---------|
| `add`      | `rd`  | `rs`  | `rt`    |
| `addu`     | `rd`  | `rs`  | `rt`    |
| `addi`     | `rd`  | `rs`  | `const` |
| `addui`    | `rd`  | `rs`  | `const` |
| `sub`      | `rd`  | `rs`  | `rt`    |
| `subu`     | `rd`  | `rs`  | `rt`    |
| `subi`     | `rd`  | `rs`  | `const` |
| `subui`    | `rd`  | `rs`  | `const` |
| `mult`     | `rs`  | `rt`  | -       |
| `multu`    | `rs`  | `rt`  | -       |
| `div`      | `rs`  | `rt`  | -       |
| `divu`     | `rs`  | `rt`  | -       |

Le istruzioni immediate (`*i`) hanno la peculiarità di prendere una costante al
posto di un secondo registro. Per come è strutturato il formato delle istruzioni
immediate, la costante sarà di massimo 2^16.

Il registro di destinazione della `mult` è implicito: il risultato viene
salvato in `$hi` (32 cifre più significative) e `$lo` (32 cifre meno
significative). Per spostare il risultato da questi due registri viene usato
`mfhi rd` e `mflo rd`. Stessa cosa vale per la divisione solo che il quoziente
è posto nel registro `$lo`, mentre il resto in `$hi`.

##### Trasferimenti in memoria

| istruzione | campo | campo                  |
|------------|-------|------------------------|
| `lw`       | `rd`  | `const(registro base)` |
| `sw`       | `rs`  | `const(registro base)` |
| `la`       | `rd`  | `const`                |

La parte `const(registro base)` serve a calcolare l'indirizzo di memoria a cui
si fa riferimento. L'indirizzo di memoria è pari a
`const + indirizzo contenuto nel registro base`. Per come è strutturata il tipo
di istruzione I, posso caricare/salvare nell'intervallo `[-2^15 ; +2^15 -1]`
rispetto al registro base.

In memoria una `lw` o una `sw` avranno questo formato:

```txt
    6        5        5                 16
+--------+--------+--------+--------------------------+
| OPCODE | rd/rs  | r base |           const          |
+--------+--------+--------+--------------------------+
```

L'istruzione `la` è una pseudo istruzione: poiché gli indirizzi sono di 32 bit,
non è possibile specificare un intero indirizzo in un'istruzione.
L'assemblatore, allora, espande la `la` in 2 istruzioni:

- si utilizza `lui $rt const` per caricare i 16 bit più significativi in
  `$at` (mettendo a 0 gli altri 16 bit meno significativi)
- si utilizza un'altra istruzione (`ori` un esempio) per caricare gli altri
  bit meno significativi e spostare tutto nel registro di destinazione

Un'altra pseudo istruzione simile è `li $rd, const`.

L'ordinamento dei byte di una parola non è da dare per scontato:

- big-endian: ordinamento da sinistra a destra
- little-endian: ordinamento da destra a sinistra

Il MIPS può operare con entrambe le modalità.

###### Load e store con indirizzi simbolici

Nelle chiamate a `lw` e `sw` si può omettere il registro base. In quel caso
verrà usato `$gp` e l'offset verrà calcolato dal linker.

```mips
.data
...
A: .word
...

.text
...
    lw $t0, A
    # viene assemblato in
    #   lw $t0, %gp_rel(A)($gp)
    # dove %gp_rel(A) è una direttiva del linker che calcola l'offset di A da
    # $gp
```

Anche `la` possiede una forma simile: i bit più significativi e meno
significativi non sono calcolati dal compilatore, ma il compito viene delegato
al linker:

```mips
.data
...
A: .word
...

.text
...
    la $t0, A
    # viene assemblato in:
    #   lui $t0, %hi(A)
    #   addiu $t0, %lo(A) # oppure ori $t0, %lo(A)
    # dove come prima %hi(A) e %lo(A) sono direttive del linker
```

Queste forme vanno usate solo con valori dichiarati con `.word`, `.half` e
`.byte`.

Per più dettagli vedi la sezione sulla compilazione e assemblaggio.

##### Istruzioni logiche

| istruzione | campo | campo | campo |
|------------|-------|-------|-------|
| `and`      | `rd`  | `rs`  | `rt`  |
| `or`       | `rd`  | `rs`  | `rt`  |
| `nor`      | `rd`  | `rs`  | `rt`  |
| `sll`      | `rd`  | `rs`  | `sa`  |
| `srl`      | `rd`  | `rs`  | `sa`  |

`sll` di 1 bit equivale a moltiplicare per 2. `srl` di 1 bit equivale dividere
per 2.

L'istruzione `not` viene eseguita con usando `nor $rd $rs $0`.

Esistono anche le varianti immediate per `and`, `or` e `nor`.

##### Istruzioni di modifica del flusso

Le istruzioni di modifica del flusso servono a forzare la modifica del `$pc`,
rompendo il flusso sequenziale standard. Il salto condizionato viene chiamato
branch, quello incondizionato jump.

###### Branch

Le istruzioni di branch hanno tutte la forma:

```mips
branch_condizione rs, rt, offset
```

Le istruzioni di branch sono di tipo I. Avrò quindi a disposizione un salto di
`[-2^15 ; +2^15 -1]` (salvato a complemento a 2) parole. Il salto però viene
effettuato relativo al program counter. Il principio di località degli
indirizzi, però, ci viene in aiuto: i programmi lavorano solo su segmenti vicini
di indirizzi. La probabilità di saltare verso indirizzi più distanti di 2^15-1 è
molto bassa.

| istruzione | campo | campo | campo  | condizione |
|------------|-------|-------|--------|------------|
| `beq`      | `rs`  | `rt`  | offset | `rs == rt` |
| `bne`      | `rs`  | `rt`  | offset | `rs != rt` |

L'assemblatore, a un'etichetta messa nel campo offset, sostituisce
`(L-(PC+4))/4`.

Per verificare diseguaglianze usiamo le seguenti istruzioni ausiliarie. Esse
caricano 1 nel registro destinazione se la condizione è avverata e 0 altrimenti.

| istruzione | campo | campo | campo | condizione |
|------------|-------|-------|-------|------------|
| `slt`      | `rd`  | `rs`  | `rt`  | `rs < rt`  |
| `sltu`     | `rd`  | `rs`  | `rt`  | `rs < rt`  |

Queste istruzioni sono di tipo R. Esistono anche le varianti immediate di
queste istruzioni.

###### Jump

Sono possibili 3 salti assoluti:

| istruzione | campo  |
|------------|--------|
| `j`        | offset |
| `jal`      | offset |
| `jr`       | `rs`   |

Nel campo offset rizzo posso salvare fino a 26 bit. Poiché le
istruzioni hanno allineamento 4, i due bit meno significativi saranno sempre
`00`. Posso, quindi, ignorare questi due bit salvando escludendo i due bit meno
significativi ottenendo un salto totale di 2^28 indirizzi (ossia 2^26 parole).
A runtime il processore farà uno shift di due a sinistra il campo indirizzo e lo
concatenerà ai 4 bit più significativi del program counter, ottenendo
l'indirizzo di salto.

Per saltare a indirizzi superiori a 2^28 Byte devo usare la `jr`.

La `jal` salva `$pc + 4` nel registro `$ra` prima di saltare. Essa viene usata
per implementare la chiamata a funzione. La `jr` invece viene usata per
implementare il ritorno al chiamante (`jr $ra`).

Nota bene: anche i salti hanno delle restrizioni sull'indirizzo
(26 bit dedicati)

##### Gestione delle costanti

Se usiamo costanti di 32 bit, l'assemblatore deve fare 2 passi per caricarla:
deve separare la costanti in due parti di 16 bit e trattarle con due istruzioni
separate. Proprio come `la`, esiste la pseudo istruzione `li $rs, const` che
esegue gli stessi passaggi.

#### Modalità di indirizzamento

In MIPS ci sono 5 modalità di indirizzamento:

- Immediato (quello usato dalle istruzioni di tipo I)
- A registro (quello usato dalle istruzioni di tipo R)
- Con base e offset (quello usato da `lw`/`sw`)
- Relativo al program counter (quello usato da `beq`)
- Pseudo diretto (quello usato da `jr`)

#### Etichette

Le etichette vengono usate per dare nomi simbolici a delle celle di memoria.
Sarà compito dell'assemblatore tradurre le etichette in indirizzi di memoria.
Sintassi:

```mips
etichetta:
    add $1, $2, $3 # anche direttiva
```

## Traduzione da C a MIPS

Per tradurre da un linguaggio sorgente a un linguaggio macchina, bisogna
definire un modello di architettura runtime. Alcune delle convenzioni di questo
modello sono:

- collocazione e ingombro di tipi di variabili
- destinazione di uso dei registri

### Modello di memoria

La memoria di un programma è divisa in vari segmenti:

- text (`.text`): codice del programma (dichiarato dal programma)
- data (`.data`): dati statici e dinamici (dichiarato del programma)
- stack: la stack del processo (allocato dal sistema operativo)

```txt
 0x7ffffffc ----------
                        Stack
            ----------
                v


                ^
            ----------
                        Dynamic Data
                        Static Data
 0x10000000 ----------
                        Text
   0x400000 ----------
                        Riservato
        0x0 ----------
```

Gli indirizzi di impianto dei segmenti sono indirizzi virtuali, non fisici.

Programmi molto grandi e sofisticati possono avere due o più segmenti dati o
testo, segmenti di dati condivisi, segmenti di libreria dinamica e altro.

### Syscall

La `syscall` è un'istruzione che passa il controllo al kernel. Il kernel offre
vari servizi, ognuno indentificato da un codice.

Il codice, prima, viene salvato dal chiamante nel registro `$v0`, seguito dagli
argomenti in `$a*` o `$f12`. Viene poi chiamata l'istruzione `syscall`.

Se una `syscall` ritorna un valore, esso viene salvato nel registro `$v0`, anche
`$f0` se è più grande di 32 bit.

### Dimensioni delle variabili

| tipo    | dimensione (B) |
|---------|----------------|
| `char`  | 1              |
| `short` | 2              |
| `int`   | 4              |
| `void*` | 4              |

Per dichiarare un array allochiamo semplicemente `n*dimensione` byte. Per
accederci, usiamo l'aritmetica dei puntatori (come si fa anche in C):
`base + (dimensione * n)`.

Una sintassi alterativa di `.word` è: `.word n, m,...`. Essa equivale
all'inizializzazione diretta di un array (come in C)

Per dichiarare una `struct`, basta semplicemente allocare una dimensione di pari
alla dimensione totale della `struct.` Per accedere ai vari elementi,
semplicemente ci accede come ad un array, tenendo conto dell'ordine degli
elementi.

### Classi di variabili

In C abbiamo diversi tipi di variabili: globali, locali, parametri e allocate
dinamicamente.

#### Variabili globali

Le variabili globali sono allocate in `.data` a partire da 0x10000000. Per
indirizzarla usiamo un'etichetta che gli assegniamo.

Per puntare al segmento dati statici usiamo il registro `$gp`, inizializzato
all'indirizzo 0x10008000

#### Variabili locali

Per le variabili locali posso usare i registri `$s*`. Se, però, ho bisogno di
usare l'indirizzo di una variabile locale, essa andrà salvata sulla stack.

#### Parametri

I primi quattro parametri vengono passati tramite i registri `$a*`. Se la
funzione ha più di 4 parametri essi vengono salvati sulla stack.

Nota bene: per array e struct viene passato l'indirizzo!

Il chiamante, prima della chiamata, salva in memoria i registri che vuole
mantenere inalterati durante la chiamata.

Per i valori in uscita si usa il registro `$v0`. Se la return è più lunga di
32 bit si usa anche il registro `$v1`.

#### Variabili dinamiche

Come anche in C, bisogna ricorrere a una funzione che ci allochi memoria sulla
heap. Viene utilizzata la syscall `sbrk` (codice 9 su SPIM) passando in entrata
il numero di byte da allocare. L'indirizzo dello spazio di memoria allocato è
ritornato in `$v0`.

### Funzioni

La chiamata a funzione, in linguaggi come il C, ha come effetto la creazione di
un record di attivazione sulla stack. Il record di attivazione contiene:

- i parametri formali e i loro valori
- l'indirizzo di ritorno al chiamante
- le informazioni per gestire lo spazio allocato per il record
- le variabili locali
- il valore restituito

Il chiamante esegue le seguenti operazioni preliminari:

1. Predispone i parametri in ingresso negli opportuni registri
2. Salva sulla stack il valore di registri che vuole mantenere
3. Trasferisce il controllo alla procedura tramite `jal`

Il chiamato esegue le seguenti operazioni:

1. Alloca lo spazio di memoria necessario alla memorizzazione dei dati e alla
   sua esecuzione
2. Salva alcuni registri sulla stack
3. Eseguire le sue funzioni
4. Memorizzare il risultato nell'apposito registro
5. Ripristina i registri salvati sulla stack
6. Ritornare il controllo al chiamante tramite `jr`

#### Salvataggio dei registri

Vengono salvati sullo stack solo un particolare gruppo di registri. I registri
che vengono preservati dal chiamato sono: `$s*`, `$fp`, `$ra`.

I registri che il chiamante può salvare, invece, sono: `$t*`, `$a*` e `$v*`.

Entrambe le parti devono salvare i registri solo se verranno modificati.

##### Minimo salvataggio dei registri

- Il chiamato non deve salvare nulla se:
  - Non chiama nessun'altra funzione
  - scrive solo in registri temporanei, per parametri, per risultati o non
    indirizzabili
- La funzione chiamante non deve salvare nulla se:
  - non vuole salvare il contenuto dei suoi registri temporanei, parametro e
    risultato

#### Gestione dello stack

Lo stack cresce dall'altro verso il basso. Lo stack pointer contiene
l'indirizzo della cima della stack. Quindi ogni volta che dobbiamo
spingere qualcosa sulla stack dobbiamo decrementare lo stack pointer e ogni
volta che dobbiamo rimuovere qualcosa dobbiamo incrementarlo.

```mips
PUSH:
    addi $sp, $sp, -4
    sw $reg, 0($sp)

POP:
    lw $reg, 0($sp)
    addi $sp, $sp, 4
```

Nello stack sono salvati i record di attivazione (frame). Lo spazio sulla stack
viene allocato dal programmatore in una sola volta all'inizio della procedura.
Lo stesso vale per la deallocazione.

##### Stack frame

Lo stack frame è allocato dal chiamato e ha la seguente forma:

```txt
    -------------------
    Registri salvati
    dal chiamante
    -------------------
    Paramentri (5, 6...)
    ------------------- <- $fp

    Registri salvati

    -------------------

    Variabili locali

    ------------------- <- $sp
```

Il registro `$fp` punta alla prima parola del frame, mentre `$sp` punta
all'ultima parola del frame. L'utilizzo del frame pointer è opzionale.

Il layout dei registri salvati è il seguente:

```txt
    ...
    -------------------
    Vecchio $fp
    -------------------
    Vecchio $ra
    -------------------

    Vecchi $s0 - $s7

    -------------------
    ....
```

La generalizzazione dello stack frame è l'area di attivazione e comprende anche
i registri salvati dal chiamante.

#### Funzioni foglia

Si dice funzione foglia una funzione che non ha annidate al suo interno altre
chiamate a procedure. La peculiarità di questo tipo di funzioni è che non deve
salvare il valore di `$ra`.

### Valutazioni espressioni algebriche

Adotteremo la regola più semplice senza ottimizzare. Basta seguire un semplice
procedimento:

1. Completa l'espressione associando a sinistra
2. Finché non hai finito valuta il primo operatore valutabile da sinistra

Un operatore viene considerato valutabile se da entrambi i lati sono presenti
solo costanti o risultati di sotto-espressioni già calcolate.

## Flusso di compilazione e assemblaggio

Un programma C passa attraverso diverse fasi prima di essere eseguibile: prima
viene compilato in linguaggio assembler, poi viene assemblato da un assemblatore
in linguaggio macchina e poi i riferimenti ad altre funzioni o variabili vengono
riempiti (collegato) per poi essere eseguibile.

Ciò che ci interesserà di più è il processo di assemblaggio.

### L'assemblaggio

L'assembler legge, riga per riga, le istruzioni simboliche e poi le traduce in
formato macchina:

- Le pseudo istruzioni vengono espanse
- Le istruzioni vengono tradotte nel loro corrispettivo binario
- I riferimenti ai registri vengono tradotti nei loro "numeri" di registro
- I riferimenti simbolici vengono risolti

Ogni segmento è assemblato in termini di memoria virtuale rilocabili.

Il risultato dell'assemblaggio è la generazione dei file oggetto.

#### Tabella dei simboli

Il primo passo svolto dall'assemblatore è la costruzione della tabella dei
simboli, ossia una corrispondenza tra le varie etichette e i rispettivi
indirizzi di memoria. Le etichette definite come globali (`.globl`) vengono rese
disponibili anche ad altri oggetti.

I valori degli indirizzi usati non sono assoluti, ma sono rilocabili ossia
relativi alla posizione del segmento a cui appartengono.

#### Assemblaggio e tabella di rilocazione

Usando la tabella dei simboli e la tabella di rilocazione, l'assemblatore
assembla le varie istruzioni

Alcune istruzioni vengono assemblate in modo incompleto e vanno processate anche
dal linker. Una istruzione viene tradotta parzialmente se:

- il riferimento simbolico al suo interno è relativo al segmento `.data`
- il riferimento è relativo a simboli non presenti nella tabella dei simboli
  (il simbolo è posto a 0 per convenzione)
- è un istruzione di salto di tipo J (usa indirizzi assoluti): il simbolo è
  posto a 0 per convenzione

In corrispondenza a ogni elemento tradotto incompletamente è creato un elemento
nella tabella di rilocazione della forma:

```txt
<indirizzo rilocabile dell'istruzione, OPCODE, simbolo da risolvere>
```

L'indirizzo del simbolo in una branch, se locale, può essere risolto subito con
questa formula: `(DEST_REL_ADDR - (SOURCE_REL_ADDR + 4))/4)`

#### Il formato oggetto

Il formato di un oggetto è il seguente:

```txt
| object file | text    | data    | relocation  | symbol | debug |
| header      | segment | segment | information | table  | info  |
```

- L'intestazione: descrive le dimensioni di testo e dati
- Il segmento di testo: contiene le istruzioni eseguibili; esse potrebbero
  essere non complete a causa di riferimenti non risolti
- Il segmento dati: Contiene una rappresentazione binaria dei dati definiti
  nella sorgente; essi potrebbero non essere completi a causa di riferimenti non
  risolti
- Le informazioni di rilocazione: identificano le istruzioni che dipendono da
  indirizzi assoluti
- La tabella dei simboli: associa un indirizzo alle etichette globali
- Le informazioni di debug

### Indirizzamento di dati statici

Poiché il segmento dati inizia all'indirizzo 0x10000000, le istruzioni di load
non possono far rifermento direttamente ai dati. Per evitare ogni volta di
espandere le load in due istruzioni, viene usato il `$gp` come riferimento per
lo spiazzamento (con segno) di 16 bit delle istruzioni di load e store.

L'utilizzo del global pointer permette di accedere ai primi 64 kB del segmento
di dati statici.

### Simboli rilocabili, locali ed esterni

Gli indirizzi all'interno del modulo possono variare se i vari segmenti
dell'oggetto sono rilocati. Di conseguenza tutte le etichette che corrispondono
ad indirizzi assoluti possono puntare ad indirizzi diversi.

Un simbolo può essere locale (definito nel modulo) o esterno (definito in un
altro modulo).

L'assemblatore non può tradurre completamente istruzioni se:

- fa riferimento ad un simbolo esterno (risolto dal linker)
- fa riferimento ad un simbolo rilocabile (risolto dal linker)
  - un'eccezione sono le istruzioni di branch in quanto compiono un salto
    relativo al PC e la distanza relativa delle istruzioni non viene modificata

### Il linker

Il compito del linker è quello di mettere insieme i diversi moduli di un
programma.

Il linker "collega" i vari oggetti risolvendo i simboli esterni e crea un vero
e proprio eseguibile.

Il linker crea un unico programma binario eseguibile con un solo spazione di
indirizzamento per tutto il programma.

Il linker prima:

- Determina la posizione in memoria delle sezioni di codice e dati dei diversi
  moduli
  - I moduli solo caricati in memoria sequenzialmente rispettando la struttura
    generale della memoria
- Crea la tabella dei simboli globale
  - Essa consiste nell'unione di tutte le tabelle dei simboli di tutti i moduli
    che devono essere collegati, modificate in base all'indirizzo di base del
    modulo di appartenenza di ciascun simbolo
- Corregge in tutti i moduli i riferimenti ad indirizzi simbolici

#### Regole di correzione dei riferimenti nei moduli

Siano:

- `ISTR` un'istruzione riferita dalla tabella di rilocazione di un modulo `M`,
  con simbolo `S` e indirizzo `IND`
- `IADDR` l'indirizzo di una istruzione `ISTR` riferita dalla tabella di
  rilocazione di un modulo `M` con simbolo `S`
- `VS` il valore di `S` nella tabella globale dei simboli
- `GP` il valore del global pointer

Regole da applicare in base al tipo di istruzioni:

- `ISTR` è in formato J: inserire `VS/4` nell'istruzione
- `ISTR` è di salto in formato I: inserire `(VS - (IADDR + 4)) / 4`
- `ISTR` è aritmetico/logica in formato I: inserire i 16 bit meno significativi
  di `VS` (`VS_Low`)
- `ISTR` è di tipo load o store: inserire `VS-GP`
- `ISTR` è l'istruzione `lui`: inserire i 16 bit più significativi di `VS`
  (`VS_High`)

### Caricamento ed esecuzione del programma

Nei sistemi UNIX, il kernel carica il programma in memoria e ne lancia
l'esecuzione. Le operazioni eseguite sono:

1. Legge l'intestazione dell'eseguibile per determinare le dimensioni dei vari
   segmenti
2. Crea un nuovo spazio di indirizzamento per il programma abbastanza grande per
   contenere i vari segmenti del programma (inclusa la stack)
3. Copia le istruzioni e i dati del file eseguibile in memoria all'interno dello
   spazio appena allocato
4. Copia nello stack gli argomenti passati al programma
5. Inizializza i registri dell'architettura (in generale tutti azzerati tranne
   per lo stack pointer a cui viene assegnato il nuovo indirizzo della stack)
6. Salta a una procedura di avvio che copia i gli argomenti del programma dallo
   stack ai registri, per poi chiamare la procedura `main` del programma.
7. Quando la procedura `main` termina, la procedura di avvio conclude il
   programma attraverso la syscall `exit`

### Librerie dinamiche

Alcune volte, per ridurre le dimensioni degli eseguibili, alcune librerie
vengono collegate solo a runtime. Il linker dinamico esegue la procedura di
caricamento in memoria alla prima chiamata di un determinato simbolo.

## Livello logico-digitale

### I segnali

I segnali che utilizzeremo saranno segnali discreti, adatti a rappresentare i
numeri binari. Essi sono derivati da segnali elettrici continui. La grandezza
che varierà sarà la tensione elettrica: essa oscillerà tra un minimo ed un
massimo che rappresentano rispettivamente 0 e 1.

Ci sono due classi di dispositivi di elaborazione:

- reti combinatorie: reti senza retroazioni: il risultato dipende solo dagli
  ingressi
- reti sequenziali: reti con retroazioni: il risultato dipende sia dagli
  ingressi che dalla sequenza di segnali precedenti (stato del circuito)

### I circuiti sequenziali

Un circuito sequenziale possiede uno stato che ne influenza il comportamento

Lo stato di un circuito sequenziale rappresenta una sorta di descrizione della
storia passata del circuito stesso. L'elemento funzionale elementare per la
realizzazione di circuiti sequenziali è il bistabile, che è in grado di
memorizzare un bit di informazione.

I circuiti sequenziali sono formati da:

- bistabili: memorizzano valori di singoli bit
- porte logiche organizzate in reti combinatorie: elaborano le informazioni

### Algebra di commutazione

Deriva dall'algebra di Boole e consente di descrivere matematicamente i circuiti
digitali. Definisce espressioni logiche che descrivono il comportamento del
circuito da realizzare nella forma `U = f(I)`. A partire da queste espressioni
è possibile derivare una rappresentazione circuitale.

#### Operatori

Chiameremo variabile di commutazione, o variabile logica, il singolo bit di
informazione rappresentata e elaborata.

- Negazione: `!A` vale 0 se A è 1 e viceversa
- Somma logica: equivale a OR
- Prodotto logico: equivale a AND

##### Proprietà

|     Legge      |           AND           |              OR             |
|----------------|-------------------------|-----------------------------|
| Identità       | `1 A = A`               | `0 + A = A`                 |
| Elemento nullo | `0 A = 0`               | `1+ A = 1`                  |
| Idempotenza    | `A A = A`               | `A + A = A`                 |
| Inverso        | `A !A = 0`              | `A + !A = 1`                |
| Commutativa    | `A B = B A`             | `A + B = B + A`             |
| Associativa    | `(A B) C = A (B C)`     | `(A + B) + C = A + (B + C)` |
| Distributiva   | `A (B + C) = A B + A C` | `A + B C = (A + B)(A + C)`  |
| Assorbimento   | `A (A + B) = A`         | `A + A B = A`               |
| De Morgan      | `!(A B) = !A + !B`      | `!(A + B) = !A !B`          |

#### Funzione combinatoria

Una funzione combinatoria corrisponde ad una espressione booleana. Essa si
comporta esattamente come una normale funzione.

### Porte logiche

I circuiti digitali sono formati da componenti digitali elementari, chiamate
porte logiche, ossia circuiti minimi per l'elaborazione di segnali binari
e corrispondo agli operatori elementari dell'algebra di commutazione. L'insieme
NOT, AND e OR è detto insieme di operatori funzionalmente completo, ossia un
insieme con il quale è possibile costruire qualsiasi calcolatore.

![Porte logiche fondamentali](./img/gates1.pdf)

Oltre alle porte logiche fondamentali si definiscono altre 2 porte anch'esse
funzionalmente complete: NAND (`!(AB)`) e NOR (`!(A+B)`). Con NAND e NOR si
possono costruire tutti e tre gli operatori fondamentali.

![Porte logiche negate](./img/gates2.pdf)

Definiamo ancora altre 2 porte logiche: XOR (`!AB + A!B` o OR esclusivo) e
XNOR (`!(!AB + A!B)` o NOR esclusivo). Essi sono utilizzati per contare il
numero di bit: XOR ci dice se c'è un numero dispari di 1, mentre XNOR se c'è
un numero pari.

![Porte logiche esclusive](./img/gates3.pdf)

Esistono porte con più di 2 ingressi. Esse però sono realizzate con delle porte
a 2 ingressi (ad esempio una porta a 3 ingressi viene realizzata con 2 porte
a 2 ingressi). Nel conteggio delle porte logiche utilizzate bisogna usare come
unità di misura le porte a 2 ingressi.

Le porte logiche sono costruite tramite i transistor. Il transistor funziona
come un interruttore: ha uno stato di aperto e uno chiuso.

#### Costo e velocità delle porte

Il costo di realizzazione equivale al numero di transistor necessari per
realizzare una porta. Esso dipende dalla tecnologia utilizzata, dalla funzione
e dal numero di ingressi.

Ogni porta ha anche una velocità di commutazione. Anch'essa come il costo
dipende da tecnologia, funzione e numero di ingressi.

Il costo delle porte e la velocità permettono di calcolare il costo della rete
logica e il ritardo di propagazione associato alla rete.

Nel conteggio di solito non includiamo le porte NOT in quanto costituite solo da
1 transistor.

### Analisi e sintesi di reti combinatorie

A ogni funzione combinatoria si può sempre associare un circuito digitale
formato da porte logiche chiamato rete combinatoria. Gli ingressi della rete
saranno le variabili della funzione e le uscite il valore della funzione.
Considereremo sempre solo 1 uscita.

Una funzione combinatoria può ammettere più reti combinatorie che differiscono
per il numero di porte logiche.

L'operazione di trovare la funzione combinatoria data una tabella di verità
viene detta sintesi. L'inverso (trovare la tabella di verità di una rete o
funzione) è detta analisi.

#### Sintesi

La sintesi di una rete combinatoria è un problema Np completo, ossia esiste un
algoritmo che risolverà sempre il problema, anche se non nel modo più ottimale.

Data una funzione booleana, la soluzione iniziale al problema consiste nel
ricorso alle forme canoniche:

- forma somma di prodotti (SoP o prima forma canonica)
- forma prodotto di somme (PoS o seconda forma canonica)

Data una una funzione booleana esistono una e una sola espressione per
ciascuna delle forme canonica.

Le forme canoniche non sono una forma ottimale. E', quindi, necessaria una
ottimizzazione utilizzando i teoremi dell'algebra combinatoria visti sopra

##### Sintesi in prima forma canonica

La funzione F può essere specificata come:

- la somma di tutti i termini prodotto delle variabili di ingresso
  corrispondenti agli 1 della funzione
- Ogni termine prodotto (o mintermine) è costituito dal prodotto logico delle
  variabili di ingresso prese in forma naturale (se valgono 1) o in forma
  complementata (se valgono 0)

##### Sintesi in seconda forma canonica

La funzione F può essere specificata come:

- il prodotto di tutti i termini somma delle variabili di ingresso
  corrispondenti agli 0 della funzione
- il termine somma (o maxtermine) è costituito dalla somma logica delle
  variabili di ingresso prese in forma naturale se valgono 0 o in forma
  complementata se valgono 1

### I blocchi funzionali combinatori

Esiste una libreria di blocchi funzionali predefiniti di tipo combinatorio che
contiene i blocchi per tutte le funzioni combinatorie di base:

- Multiplexer/demultiplexer
- Decoder
- Confrontatore
- Shifter combinatorio
- Half/full adder
- Addizionatore a n bit
- ALU or, not, e somma

#### Multiplexer

Ha `n >= 1` ingressi di selezione, `2^n > 2` ingressi dati e un'uscita. Gli ingressi dati sono numerati a partire da 0. Sugli ingressi di selezione è
presente il numero binario k e il k-esimo ingresso dati viene inviato in uscita.

![Multiplexer](./img/mux.pdf)

#### Demultiplexer

Ha `n >= 1` ingressi di selezione, 1 ingresso dati e `2^n > 2` uscite. Ha la
funzione opposta del multiplexer.

![Demultiplexer](./img/demux.pdf)

#### Decoder

Ha `n >= 1` ingressi e `2^n > 2` uscite. Le uscite sono numerate a partire da
0. Se sugli ingressi è presente il numero binario k, la k-esima uscita assume il
valore 1 e le restanti uscite assumono il valore 0.

#### Comparatore

Ha due gruppi A e B di ingressi da `n >= 1` bit ciascuno e tre uscite:
minoranza, uguaglianza e maggioranza. Il blocco confronta i due numeri binari A
e B presenti sui due ingressi e attiva l'uscita corrispondente all'esito del
confronto.

#### Shifter combinatorio

Ha `n >= 1` ingressi, 1 ingresso per il bit aggiunto a dx, 1 ingresso per il
bit aggiunto a sx, 1 ingresso di controllo che comanda lo scorrimento, `n >= 1`
uscite.  Sull'uscita vengono attivati i bit corrispondenti al numero shiftato a
destra o sinistra.

Viene implementato con multiplexer in serie.

#### Half adder

Ha come input 2 bit e come output la somma dei due bit e il riporto. Viene
implementato con un AND e un XOR.

![Half Adder](./img/half-adder.pdf)

#### Full adder

Ha come input 2 bit e il CarryIn e come output la somma e il riporto. Esegue la
somma dei due bit tenendo conto del riporto in entrata.

![Full Adder](./img/full-adder.pdf)

#### Addizionatore a k bit in binario naturale intero

Ha come input 2 numeri binari e come output la somma e il riporto. He formato da
una cascata di Half Adder e Full Adder. Questa struttura è molto lenta,
soprattutto per numeri con grande numero di bit. Ci sono addizionatori più
veloci basati sul carry look-ahead, un blocco funzionali che cerca di prevedere
il valore del carry per velocizzare il processo.

Il sottrattore funziona alla stessa maniera e viene sintetizzato analogamente.

#### Unità aritmetico logica

Ha 2 ingressi da n bit, un ingresso per i comandi, un'uscita di esito e il
risultato dell'operazione. L'esito viene usato per segnalare l'esito dei
confronti o informazioni addizionali per date operazioni matematiche.

### Bistabili

Esistono due famiglie di bistabili:

- Asincroni: privi di un segnale di sincronizzazione e modificano lo stato
  rispondendo direttamente a eventi sugli ingressi
- Sincroni: sensibili ad un segnale di controllo e la transizione da uno stato
  all'altro può avvenire solo in corrispondenza di eventi del segnale di
  controllo
  - bistabili sincroni controllati (gated latch)
  - flip-flop master-slave
  - flip-flop edge-triggered

#### Bistabili SR asincroni

Ha 2 ingressi, S (set) e R (Reset), e 2 uscite Q e !Q:

- Q = 1: stato di set
- Q = 0: stato di reset

L'uscita Q rappresenta, quindi, lo stato memorizzato.

Studiando il circuito si nota che ci sono solo due stati stabili (bistabile):

- S = R = 0, Q = 1
- S = R = 0, Q = 0

Se viene passato R = 1 allora Q = 0 qualunque sia il vecchio valore. Se viene
passato S = 1 allora Q = 1 qualunque sia il vecchio valore. Se sia S che R sono
1, si avrà uno stato indefinito in cui sia Q che !Q sono nulli.

![Bistabile SR asincrono](./img/bistable-sr-async.pdf)

#### Segnale di sincronizzazione

E' un segnale binario con andamento periodico nel tempo. Esso è una successione
di impulsi consecutivi a distanza costante. Il periodo di clock è il tempo
dall'inizio del livello inferiore fino alla fine del livello superiore. Un ciclo
di clock contiene 3 eventi: livello basso, fronte di salita, fronte di discesa.

#### Bistabili sincroni

I fattori che differenziano i bistabili riguardano due aspetti:

- la relazione ingresso-stato: definisce quando gli ingressi vengono modificati
  - temporizzazione basata sul livello: il valore viene modificato durante tutta
    la permanenza su un livello
  - temporizzazione basata sul fronte: il valore viene modificato solo durante
    il fronte
- relazione stato-uscita: definisce quando le uscite vengono modificate
  - commutazione basata sul livello: le uscite vengono aggiornate durante tutta
    la permanenza su un livello (latch)
  - commutazione basata sul fronte: le uscite vengono aggiornate solo durante il
    fronte

|         |      Livello     |           Fronte         |
|---------|------------------|--------------------------|
| Fronte  | N.A.             | Flip-flop edge-triggered |
| Livello | Latch con Enable | Flip-flop master-slave   |

Affinché i bistabili sincroni funzionino, è necessario che il tempo di clock sia
lungo tanto quanto il più lungo cammino nella logica combinatoria associata. Se
ciò avviene, possiamo ottenere lettura e scrittura all'interno di un singolo
stato di clock.

#### Bistabile SR sincrono (SR-latch)

Il bistabile SR sincrono è molto simile al bistabile SR asincrono. Esso ha in
più l'entrata per il segnale di sincronizzazione. Inoltre se il clock vale 0,
si segnali non vengono modificati, se è 1 si comporta come un bistabile SR
asincrono.

![Bistabile SR sincrono](./img/bistable-sr-sync.pdf)

#### Bistabile D sincrono (D-latch)

Ha 1 ingresso D (dati), 1 ingresso di clock e le due uscite Q e !Q come negli
altri bistabili. Se il clock vale 0, l'ingresso D non è efficace, se è 1
l'ingresso D è efficace e il bistabile memorizza il valore logico in D.

![Bistabile D sincrono](./img/bistable-d-sync.pdf)

Se il clock è 1, il bistabile si dice trasparente: le uscite sono sempre pari
alle entrate, come se non ci fosse. Per evitare il fenomeno di trasparenza,
dobbiamo usare i flip-flop.

#### Flip-flop D master-salve

Sono realizzati tramite una coppia di bistabili sincroni D in cascata con clock
invertiti. L'insieme dei due permette di eliminare il fenomeno della
trasparenza.

![Flip-flop D master-slave](./img/flip-flop-d-ms.pdf)

#### Flip-flop D edge-triggered

Sono meno costosi rispetto ai flip-flop master-slave. Sono realizzati con 3 SR
latch asincroni e 1 porta OR. Nelle implementazioni reali sono più utilizzati
della controparte master-slave.

![Flip-flop D edge-triggered](./img/flip-flop-d-et.pdf)

### Blocchi funzionali sequenziale

I tipi principali sono:

- Registro parallelo
- Registro a scorrimento
- Banco di registri
- Memoria

#### Il registro parallelo

E' un vettore di `n >= 1` flip-flop di tipo D. Ha `n >= 1` ingressi e uscite e
l'ingresso per il clock.

A ogni ciclo di clock, il registro legge e memorizza nel suo stato la parola di
n bit presenti in ingresso e lo presenta sui n bit di uscita il prossimo ciclo.

Il registro parallelo è formato da n flip-flop sincroni tutti in parallelo. Il
clock viene condiviso tra tutti i bistabili. Se si usano dei bistabili sincroni
su livello, o asincroni, il registro sarebbe anch'esso trasparente.

![Registro parallelo (4 bit)](./img/parallel-register.pdf)

Il registro di parallelo con comando di caricamento funziona allo stesso modo
del registro parallelo, ma ha un ingresso in più: il comando L. Quando il
comando L è attivo, viene aggiornato lo stato; quando il comando L non è attivo
lo stato viene mantenuto.

![Registro parallelo con comando (2 bit)](./img/parallel-register-cmd.pdf)

Il registro parallelo con comando è realizzato in modo simile al registro
parallelo, solo con un multiplexer con comando L in entrata a ogni bistabile.

Esistono altre varianti di registri paralleli con diversi comandi.

#### Registro a scorrimento

E' simile al registro parallelo, ma prende i bit in ingresso in modo seriale
invece che in parallelo. Avrà quindi un solo ingresso S, un ingresso di clock e
`n >= 1` uscite.

A ogni ciclo di clock fa scorrere di un bit verso destra la parola memorizzata
aggiungendo a sinistra il bit presente sull'ingresso seriale.

Viene realizzato usando flip-flop in cascata. L'uso di bistabili trasparenti
causerebbe un comportamento errato.

![Registro a scorrimento (4 bit)](./img/shift-register.pdf)

Esistono diverse varianti di registro a scorrimento: a destra, a sinistra o
universale (scelta con comando). Possiamo anche avere un registro che combina
le funzionalità del parallelo e dello scorrimento in base al comando. Possiamo
anche avere ingressi seriali, uscite seriali o una combinazione di parallelo
e seriale.

## Banchi di registri e memoria

### Circuito di pilotaggio

Per pilotare le uscite dei vari componenti di memoria deve essere regolata in
modo da garantire un comportamento consistente. Per fare ciò sono necessari dei
circuiti di pilotaggio delle uscite. Per fare ciò si usa il buffer ti-state.

Il buffer tri-state ha 3 posizioni:

- uno stato di bassa impedenza consente il passaggio di entrambi i livelli di
  tensione
- uno stato di alta impedenza isola elettricamente l'uscita

Il comportamento viene regolato da un segnale di controllo (Output Enable).

### Banchi di registri

I banchi di registri sono strutture tipo vettore dove ogni elemento è un
registro parallelo.

Si consideri un banco 8x16 (8 registri da 16 bit). Ogni registro è identificato
da un indirizzo. Serviranno quindi 3 bit per indirizzare i vari registri. Le
operazioni eseguibili sul banco sono lettura e scrittura.

Possiamo quindi disegnare il banco di registri 8x16 come un blocco sequenziale
con:

- 3 ingressi indirizzo
- 16 uscite e ingressi dati
- 1 ingresso di comando (lettura o scrittura)
- 1 ingresso di abilitazione al banco
- 1 ingresso di controllo per la gestione delle uscite tri-state
- il segnale di clock

I banchi, ovviamente, esistono in diverse dimensioni. I banchi più sofisticati
possono avere più porte di accesso distinte, in lettura/scrittura o solo per
una delle due, per poter operare in parallelo su più registri.

### Memoria

La memoria è un tipo di tipo sequenziale complesso. Ha anch'essa una struttura a
vettore i cui elementi sono le parole di memoria. Un componente integrato (chip)
è caratterizzato da:

- capacità misurata in numero totale di bit memorizzabili
- le funzioni (lettura/scrittura)
- il numero di porte d'accesso
- il tempo utilizzato per l'accesso alla memoria

Solitamente il contenuto della memoria viene letto/scritto una parola per volta
in un ciclo di clock. Per accedere alla memoria si usa la porta d'accesso alla
memoria.

La porta di accesso è formata da:

- Gli ingressi di indirizzo: codificano l'indirizzo della cella su cui si deve
  operare
- Le uscite/ingresso di dato: servono per leggere/scrivere una parola
- il comando di lettura/scrittura
- il comando di abilitazione del componente
- il comando di abilitazione delle uscite dati

Le strutture interne della memoria sono diverse. Il modo più semplice (non
adatto a grandi capacità) è quello di creare una matrice di bistabili dove le
righe sono le parole e le colonne i bit della parola. Le memorie ad alta
capacità sono solitamente disposti a matrice bidimensionale per ridurre i
collegamenti interni. In questo caso saranno necessari altri due comandi: RAS e
CAS (Row Address Select e Column Address Select).

I banchi di memoria sono l'aggregazione di più componenti di memoria per
ottenere memoria di capacità più elevata. I banchi di memoria hanno struttura a
matrice di chip:

- Per aumentare la lunghezza della parola si compone una colonna di chip di
  memoria da usare in parallelo
- Per aumentare il numero di parallelo si compone una riga di chip di memoria
  da usare in esclusione

#### Tecnologie di memoria

##### SRAM (Static RAM)

E' una memoria realizzata con bistabili. Perciò ha una capacità medio-piccola ed
è volatile. Ha un tempo di accesso molto veloce ma occupa tanto spazio (6
transistor per bit). Viene usata come cache dei professori

##### DRAM (Dynamic RAM)

E' una memoria che usa circa 1 transistor per bit (fenomeno di accumulo di
carica sul transistor). Ha una alta densità e quindi può essere usata per creare
memorie più grandi. Il tempo di accesso è medio ed anch'essa è volatile. Viene
usata per la memoria centrale.

##### ROM

Memoria a sola lettura realizzata come matrice di transistor. Ha una capacità
grande e un tempo di accesso medio. Essa è persistente. Viene usata per
memorizzare programmi permanenti non modificabili.

Per memoria ROM si intendono anche i sistemi ottici (CD-ROM ecc.). Noi
considereremo memoria ROM solo quella a stato solido basata su transistor.

##### PROM, EPROM, EEPROM

Capacità e tempo simili alla ROM. Anch'esse sono di sola lettura e persistenti.
Possono essere riprogrammate tramite un apposito programmatore:

- PROM: programmabile solo 1 volta
- EPROM: cancellabile con raggi UV e riscrivibile un numero limitato di volte
- EEPROM: cancellabile elettricamente e scrittura di 1 byte alla volta

Le memorie cancellabili sono anche dette "read-mostly". Si usano principalmente
per sistemi embedded e prototipi.

##### Memoria FLASH

Capacità e tempo poco inferiori alla DRAM. Funziona in lettura e scrittura
(scrittura a blocchi di byte) ed è persistente. Viene usata per dati
multimediali o programmi fissi ma periodicamente aggiornabili.
