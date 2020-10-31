# Esercitazione

## 23/09/20

### "eserciziAssemblaggio" esercizio 1

Dati i seguenti moduli:

- Modulo "main":

  ```mips
  .data
  STRUCT: .space 20
  VECT:   .space 12
  INT:    .int 23
  
  .text
  .globl MAIN
  
  MAIN:
      li $t0, 0xFFF0ABCC
      sw $t0, STRUCT
      lw $t1, VECT
      beq $t0, $t0, MODULE
  MAINEND:
      syscall
  ```

- Modulo "module":

  ```mips
  .data
  ALPHA: .byte 'Y'
  
  .text
  .globl MODULE
  RESTART:
      lw $t3, INT
  MODULE:
      lb $t4, ALPHA
      sub $t4, $t4, $t3
      beq $t4, $0, RESTART
  MODEND:
      j MAINEND
  ```

Si compilino le quattro tabelle relative a:

1. i moduli oggetto prodotti dall'assemblatore
2. le basi di rilocazione del codice e dei dati dei moduli
3. La tabella globale dei simboli
4. il contenuto del file eseguibile prodotto dal linker

---

1. Tabella file oggetto

   ```txt
   dim text: 18            | dim text: 14
   dim data: 24            | dim data: 1

   text:                   | text:
   0   lui $t0, FFF0       | 0   lw $t3, 0000($gp)
   4   ori $t0, $t0, ABCC  | 4   lb $t4, 0000($gp)
   8   sw $t0, 0000($gp)   | 8   sub $t4, $t4, $t3
   C   lw $t1, 0000($gp)   | C   beq $t4, $0, FFFC
   10  beq $t0, $t0, 0000  | 10  j 000 0000
   14  syscall             |

   data:                   | data:
   0  uninitialized        | 0  0000 0059
   14 uninitialized        |
   20 0000 0017            |

   symbols:                | symbols:
   STRUCT  D  0000 0000    | ALPHA    D  0000 0000
   VECT    D  0000 0014    | RESTART  T  0000 0000
   INT     D  0000 0020    | MODULE   T  0000 0004
   MAIN    T  0000 0000    | MODEND   T  0000 0010
   MAINEND T  0000 0014    |

   relocation:             | relocation:
   8  sw  STRUCT           | 0   lw  INT
   C  lw  VECT             | 4   lb  ALPHA
   10 beq MODULE           | 10  j   MAINEND
   ```

2. Basi di rilocazione

   |           | main       | module     |
   |-----------|------------|------------|
   | base text | 0040 0000  | 0040 0018  |
   | base data | 1000 0000  | 1000 0024  |

3. Tabella globale dei simboli

   | simbolo  | valore iniziale | base        | valore finale |
   |----------|-----------------|-------------|---------------|
   | STRUCT   | 0000 0000       | 1000 0000   | 1000 0000     |
   | VECT     | 0000 0014       | 1000 0000   | 1000 0014     |
   | INT      | 0000 0020       | 1000 0000   | 1000 0020     |
   | MAIN     | 0000 0000       | 0040 0000   | 0040 0000     |
   | MAINEND  | 0000 0014       | 0040 0000   | 0040 0014     |
   | ALPHA    | 0000 0000       | 1000 0024   | 1000 0024     |
   | RESTART  | 0000 0000       | 0040 0018   | 0040 0018     |
   | MODULE   | 0000 0004       | 0040 0018   | 0040 001C     |
   | MODULEND | 0000 0010       | 0004 00018  | 0040 0028     |

4. Eseguibile

   ```mips
   0040 0000  lui $t0, FFF0
   0040 0004  ori $t0, $t0, ABCC
   0040 0008  sw $t0, 8000($gp)
   0040 000C  lw $t1, 8014($gp)
   0040 0010  beq $t0, $t0, 0002
   0040 0014  syscall
   0040 0018  lw $t3, 8020($gp)
   0040 001C  lb $t4, 8024($gp)
   0040 0020  sub $t4, $t4, $t3
   0040 0024  beq $t4, $0, FFFC
   0040 0028  j 010 0005
   ```

## 25/09/20

### "eserciziAssemblaggio" esercizio 2

- Modulo "Main":

  ```mips
  .data
  INT: .word 37
  BLOCK: .space 12
  
  .text
  .globl MAIN
  MAIN:
      addi $t0, $0, 0x100A
      sw $t0, INT
      la $t1, BLOCK
      lw $t2, ($t1)
      j LIBRARY
  MAINEND:
      syscall
  ```

- Modulo "Library":

  ```mips
  .data
  VAR: .space 4
  
  .text
  .globl LIBRARY
  LIBRARY:
      lw $t3, VAR
      beq $t3, $t2, MAINEND
      addi $t3, $t3, 1
  LIBEND:
      bne $t3, $t2, LIBRARY
      syscall
  ```

Si compilino le quattro tabelle relative a:

1. i moduli oggetto prodotti dall'assemblatore
2. le basi di rilocazione del codice e dei dati dei moduli
3. La tabella globale dei simboli
4. il contenuto del file eseguibile prodotto dal linker

---

1. Tabella file oggetto

   ```txt
   dim text: 1C            | dim text: 14
   dim data: 10            | dim data: 4

   text:                   | text:
   0   addi $t0, $t0, 100A | 0   lw $t3, 0000($gp)
   4   sw $t0, 0000($gp)   | 4   beq $t3, $t2, 0000
   8   lui $t1, 0000       | 8   addi $t3, $t2, 0001
   C   ori $t1, 0000       | C   bne $t3, $t2, FFFC
   10  lw $t2, 0000($gp    | 10  syscall
   14  j 000 0000          |
   18  syscall             |

   data:                   | data:
   0  0000 0025            | 0  uninitialized
   4  uninitialized        |

   symbols:                | symbols:
   INT     D  0000 0000    | VAR      D  0000 0000
   BLOCK   D  0000 0004    | LIBRARY  T  0000 0000
   MAIN    D  0000 0000    | LIBEND   T  0000 000C
   MAINEND T  0000 0018    |

   relocation:             | relocation:
   4  sw  INT              | 0   lw  VAR
   8  lui $hi(BLOCK)       | 4   beq MAINEND
   C  ori %lo(BLOCK)       |
   14 j   LIBRARY          |
   ```

2. Basi di rilocazione

   |           | main      | module    |
   |-----------|-----------|-----------|
   | base text | 0040 0000 | 0040 001C |
   | base data | 1000 0000 | 1000 0010 |

3. Tabella globale dei simboli

   | simbolo | valore iniziale | base        | valore finale |
   |---------|-----------------|-------------|---------------|
   | INT     | 0000 0000       | 1000 0000   | 1000 0000     |
   | BLOCK   | 0000 0004       | 1000 0000   | 1000 0004     |
   | MAIN    | 0000 0000       | 0040 0000   | 0040 0000     |
   | MAINEND | 0000 0018       | 0040 0000   | 0040 0018     |
   | VAR     | 0000 0000       | 1000 0010   | 1000 0010     |
   | LIBRARY | 0000 0000       | 0040 001C   | 0040 001C     |
   | LIBEND  | 0000 000C       | 0040 001C   | 0040 0022     |

4. Eseguibile

   ```mips
   0040 0000  addi $t0, $0, 100A
   0040 0004  sw $t0, 8000($gp)
   0040 0008  lui $t1, 1000
   0040 000C  ori $t1, $t1, 0004
   0040 0010  lw $t2, 0000($t1)
   0040 0014  j 010 0007
   0040 0018  syscall
   0040 001C  lw $t3, 8010($gp)
   0040 0020  beq $t3, $t2, FFFD
   0040 0024  addi $t3, $t3, 0001
   0040 0028  bne $t3, $t2, FFFC
   0040 002C  syscall
   ```

## 30/09/20

### "eserciziAssembler1" esercizio 9

Si traduca il seguente programma C in MIPS. Il modello di memoria è quello
standard e gli interi sono a 32 bit. Non si eseguano ottimizzazioni. Si
facciano le seguenti ipotesi:

- non si usa il frame pointer
- le variabili locali sono allocate nei registri (se possibile)
- vanno salvati solo i registri necessari

Si svolgano i quattro punti:

1. Si traducano in linguaggio MIPS le dichiarazioni globali e si indichi
   l'indirizzo di ciascuna variabile globale dichiarata
2. Si traducano il linguaggio macchina il codice del programma principale
   `main`
3. Si descrivano l'area di attivazione della funzione `binary` e l'allocazione
   delle variabili locali nei registri
4. Si traduca in linguaggio macchina il codice della funzione `binary`

```c
#define N 16
int byte = 64;
int elem;
int elem;
int list[N];

int *binary(int i, int val) {
  int *p;
  p = &list[i];
  if (i < 0)
    return list;
  else if (*p == val)
    return p;
  else
    return binary(i / 2 - 1, val + 1);
}

int main(void) {
  elem = *binary(N - 1, byte);
}
```

---

1. MIPS e indirizzo:

   | MIPS              | Indirizzo   |
   |-------------------|-------------|
   | `.data`           | NA          |
   | `.eqv N, 16`      | NA          |
   | `BYTE: .word 64`  | 0x1000 0000 |
   | `ELEM: .word`     | 0x1000 0004 |
   | `LIST: .space 64` | 0x1000 0008 |

2. MIPS relativo a `main`:

   ```mips
   MAIN:
       li $t0, N
       subi $a0, $t0, 1
       lw $a1, BYTE
       jal BINARY
       lw $t0, ($v0)
       sw $t0, ELEM
   ```

3. Area di attivazione e registri di `binary`

   | contenuto simbolico | offset rispetto a `$sp` |
   |---------------------|-------------------------|
   | `$ra`               | 4                       |
   | `$s0`               | 0                       |

   | Parametro / variabile locale | registro |
   |------------------------------|----------|
   | `int i`                      | `$a0`    |
   | `int val`                    | `$a1`    |
   | `int *p`                     | `$s0`    |

4. Codice MIPS di `binary`

   ```mips
   BINARY:
       addi $sp, $sp, -8
       sw $ra, 4($sp)
       sw $s0, 0($sp)
       la $t0, LIST
       sll $t1, $a0, 2
       addu $s0, $t0, $t1
       bge $a0, $0, ELSEIF
       la $v0, LIST
       j ENDIF

   ELSEIF:
       lw $t0, ($s0)
       bne $t0, $a1, ELSE
       move $v0, $s0
       j ENDIF

   ELSE:
       srl $t0, $a0, 1
       subi $a0, $t0, 1
       addi $a1, $a1, 1
       jal BINARY

   ENDIF:
       lw $s0, 0($sp)
       lw $ra, 4($sp)
       add $sp, $sp, 8
       jr $ra
   ```

### "eserciziAssembler1" esercizio 10

Tradurre da C a MIPS il programma riportato. Il modello di memoria è quello
standard MIPS e gli interi sono a 32 bit. Non si eseguano ottimizzazioni. Si
facciano le seguenti ipotesi:

- non si usa il frame pointer
- le variabili locali sono allocate nei registri (se possibile)
- vanno salvati solo i registri necessari

Si svolgano i seguenti 3 punti:

1. Si descriva il segmento di dati statici, dando gli spiazzamenti rispetto ai
   due global pointer nelle due ipotesi indicate specificando se gli
   spiazzamenti sono positivi o negativi e si traducano in MIPS le dichiarazioni
   delle variabili globali
2. Si descrivano l'area di attivazione della funzione `fill` e l'allocazione
   delle variabili locali di `fill` nei registri
3. Si traduca in linguaggio macchina dell'intera funzione `fill`

Sullo stesso programma C, si usi adesso il frame pointer e si svolgano i
seguenti due punti:

1. Si descriva l'area di attivazione della funzione `fill`
2. Si traduca in linguaggio macchina l'istruzione: `pnt = &rnd;` di `fill`

```c
#define N 4
int idx = 0;
char str[N];

char init(int seed);

void fill(int len) {
  char *pnt, rnd;
  rnd = init(0) + init(1);
  pnt = &rnd;
  while (idx < len)
    str[idx++] = *pnt;
}

int main(void) {
  fill(N);
}
```

---

1. Segmento dati statici

   | Contenuto simbolico | Offset rispetto a `gp = 0x1000 8000` | Segno    |
   |---------------------|--------------------------------------|----------|
   | `str[3]`            | 0x80007                              | Negativo |
   | `str[2]`            | 0x80006                              | Negativo |
   | `str[1]`            | 0x80005                              | Negativo |
   | `str[0]`            | 0x80004                              | Negativo |
   | `idx`               | 0x80000                              | Negativo |

   | Contenuto simbolico | Offset rispetto a `gp = 0x1000 0000` | Segno    |
   |---------------------|--------------------------------------|----------|
   | `str[3]`            | 0x7                                  | Positivo |
   | `str[2]`            | 0x6                                  | Positivo |
   | `str[1]`            | 0x5                                  | Positivo |
   | `str[0]`            | 0x4                                  | Positivo |
   | `idx`               | 0x0                                  | Positivo |

   ```mips
         .data
         .eqv N, 4
   IDX:  .word 0
   STR:  .space 4
   ```

2. Area e registri di fill

   | Contenuto simbolico | Offset rispetto a `$sp` |
   |---------------------|-------------------------|
   | `$ra`               | 5                       |
   | `$s0`               | 1                       |
   | `rnd`               | 0                       |
   | `$a0`               | -                       |
   | `$v0`               | -                       |

   | Parametro / variabile locale | Registro |
   |------------------------------|----------|
   | `len`                        | `$a0`    |
   | `pnt`                        | `$s0`    |

3. Codice MIPS di `fill`

   ```mips
   FILL:
       addi $sp, $sp, -9 # $ra, $s0, rnd
       sw $ra, 5($sp)    # $ra
       sw $s0, 1($sp)    # $s0
       addi $sp, $sp, -7 # $a0, $v0 !! allineamento !!
       sw $a0, 0($sp)
       li $a0, 0
       jal INIT
       addi $sp, $sp, -4
       sw $v0, 0($sp)
       li $a0, 1
       jal INIT
       move $t0, $v0
       lw $t1, 0($sp)
       addi $sp, $sp, 4
       lw $a0, 0($sp)
       addi $sp, $sp, 7
       add $t0, $t0, $t1
       sb $t0, 0($sp)
       move $s0, $sp

   WHILE:
       lw $t1, IDX
       bge $t1, $a0, END
       la $t0, STR
       addu $t0, $t0, $t1
       lb $t1, 0($s0)
       sb $t1, 0(t0)
       lw $t0, IDX
       addi $t0, $t0, IDX
       sw $t0, IDX
       j WHILE

   END:
       lw $s0, 1($sp)
       lw $ra, 5($sp)
       addi $sp, $sp, 9
       jr $ra
   ```

---

1. Area di attivazione di `fill`

   | Contenuto simbolico | Offset rispetto a `$fp` |
   |---------------------|-------------------------|
   | `$fp`               | 0                       |
   | `$ra`               | -4                      |
   | `$s0`               | -8                      |
   | `rnd`               | -9                      |
   | `$a0`               | -                       |
   | `$v0`               | -                       |

2. Istruzione `pnt = &rnd` usando `$fp`

   ```mips
   addiu $s0, $fp, -9
   ```

## 07/10/20

### "eserciziAssembler2" esercizio 3

Tradurre da C a MIPS il programma riportato. Il modello di memoria è quello
standard MIPS e gli interi sono a 32 bit. Non si eseguano ottimizzazioni. Si
facciano le seguenti ipotesi:

- si usa il frame pointer
- le variabili locali sono allocate nei registri (se possibile)
- vanno salvati solo i registri necessari

Si svolgano i seguenti punti:

1. Si descriva il segmento dei dati statici, dando anche spiazzamenti delle
   variabili rispetto a `$gp`
2. SI traduca in MIPS fal funzione `main`
3. Si descriva l'area di attivaizone della funzione `fibonacci`, indicando
   l'indirizzo a cui puntano `$fp` e `$sp`
4. Si traduca in MIPS la funzione `fibonacci`
5. Si descrivano la stack e i registri usati prima della chiamata a
   `fibonacci(n-2)`. Si assuma che le chiamate vengano eseguite nell'ordine
   di scrittura.

```c
int valore = 6;

int fibonacci(int n) {
  if (n <= 1)
    return n;
  else
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void main(void) {
  fibonacci(valore);
  return 0;
}
```

---

1. Segmento dati globale:

   ```mips
   .data
   VALORE: .word 6
   ```

   | contenuto simbolico | indirizzo   | offset      |
   |---------------------|-------------|-------------|
   | VALORE              | 0x1000 0000 | 0x0000 8000 |

2. Funzione `main`;

   ```mips
   .text
   MAIN:
       lw $a0, VALORE
       jal FIBONACCI
       li $v0, 10
       syscall
   ```

3. Area di attivazione di fibonacci

   | contenuto simbolico | offset (`$sp`) | offest (`$fp`) |
   |---------------------|----------------|----------------|
   | `$fp`               | -4             | 0              |
   | `$ra`               | 0              | -4             |

4. Funzione `fibonacci`:

   ```mips
   FIBONACCI:
       addi $sp, $sp, -8
       sw $fp, 4($sp)
       sw $ra, 0($sp)
       addiu $fp, $sp, 4
       bgt $a0, 1, ELSE
       move $v0, $a0
       j END

   ELSE:
       addi $sp, $sp, -4
       sw $a0, -8(fp)
       subi $a0, $a0, 1
       jal FIBONACCI
       addi $sp, $sp, -4
       lw $a0, -8($fp)
       sw v0, -8($fp)
       subi $a0, $a0, 2
       jal FIBONACCI
       lw $t0, -8($fp)
       add $v0, $v0, $t0
       addiu $sp, $sp, 4

   END:
       lw $ra, 4($fp)
       lw $fp, 0($fp)
       addiu $sp, $sp, 8
       jr $ra
   ```

5. Contenuto stack:

   | contenuto simbolico | indirizzo   | valore |
   |---------------------|-------------|--------|
   | ...                 | 0x7FFF FFFC | ???    |
   | `$fp`               | 0x7FFF FFF8 | ???    |
   | `$ra`               | 0x7FFF FFF4 | ???    |
   | `$v0`               | 0X7FFF FFF0 | ???    |

   Registri:

   | registro | contenuto (hex) | significato        |
   |----------|-----------------|--------------------|
   | `$fp`    | 0x7FFF FFF8     | frame pointer      |
   | `$sp`    | 0x7FFF FFF0     | stack pointer      |
   | `$a0`    | 0x0000 0004     | `n - 2`            |
   | `$v0`    | 0x0000 0005     | `fibonacci(n - 1)` |

### "LogicaCombinatoria" esercizio 11

Si vuole progettare una rete combinatoria che riceve in ingresso 3 bit (A, B, C)
e fornisce un'uscita U. Il risultato deve essere 1 se il numero di 1 negli
ingressi è dispari, 0 altrimenti.

1. Completare la tabella di verità
2. Progettare la rete in prima forma canonica (SoP)
3. Scrivere una equazione equivalente a quella trovata in 2 contenente solamente
   operatori XOR

---

1. Tabella di verità:

   | A | B | C | U |
   |---|---|---|---|
   | 0 | 0 | 0 | 0 |
   | 0 | 0 | 1 | 1 |
   | 0 | 1 | 0 | 1 |
   | 0 | 1 | 1 | 0 |
   | 1 | 0 | 0 | 1 |
   | 1 | 0 | 1 | 0 |
   | 1 | 1 | 0 | 0 |
   | 1 | 1 | 1 | 1 |

2. SoP:

   $$
   U = \bar{AB}C + \bar{A}C\bar{C} + A\bar{BC} + ABC
   $$

3. Riduzione:

   $$
   \begin{aligned}
     U & = \bar{AB}C + \bar{A}C\bar{C} + A\bar{BC} + ABC = \\
       & = \bar{A}(\bar{B}C + B\bar{C}) + A(\bar{BC} + BC) = \\
       & = \bar{A}(B \oplus C) + A\bar{(B \oplus C)} = \\
       & = A \oplus B \oplus C
   \end{aligned}
   $$

### "LogicaSequenziale" esercizio 3

Sia dato il circuito sequenziale descritto dalle equazioni logiche:

$$
\begin{aligned}
  D1 &  = IN(Q1 Q2 + \bar{Q1 Q2}) + \bar{IN}(\bar{Q1} Q2 + Q1 \bar{Q2}) = \\
     &  = IN \oplus Q1 \oplus Q2 \\
  D2 &  = \bar{Q1} \\
  Z  &  = Q1 Q2
\end{aligned}
$$

Il circuito è composto da due bistabili di tipo flip-flop master-slave di tipo D
ed è dotato di ingresso $IN$ e di uscita $Z$.

1. Disegnare lo schema del circuito
2. Completare il diagramma temporale
   - Si trascurino ritardi di propagazione
   - La commutazione avviene sul fronte di discesa del clock
   - IN può variare in ogni momento

---

1. Circuito: (vedi figura)

   ![Circuito es 3](./img/logica-sequenziale-es3-1.pdf){width=50%}

2. Diagramma temporale: (vedi figura)

   ![Diagramma temporale es 3](./img/logica-sequenziale-es3-2.pdf){width=50%}

### "LogicaSequenziale" esercizio 4

Sia dato il seguente circuito sequenziale: (vedi figura)

![Circuito es 4](./img/logica-sequenziale-es4-1.pdf){width=50%}

Il circuito è composto da due bistabili di tipo flip-flop master-slave di tipo D
ed è dotato di ingressi $IN1, IN2, SEL$ e di uscita $U$. Completare il diagramma
temporale. Si considerino le seguenti ipotesi:

- Si trascurino ritardi di propagazione
- La commutazione avviene sul fronte di discesa del clock
- IN può variare in ogni momento

---

Soluzione in figura.

![Diagramma temporale es 4](./img/logica-sequenziale-es4-2.pdf){width=50%}

### "LogicaSequenziale" esercizio 7

Sia dato il circuito sequenziale descritto dalle equazioni logiche:

$$
\begin{aligned}
  D  & = I \oplus Q \\
  Z1 & = \bar{Q} \\
  Z2 & = Q D
\end{aligned}
$$

Il circuito è composto da un bistabile di tipo flip-flop master-slave di tipo D
ed è dotato di ingresso $I$ e di uscite $Z1, Z2$.

1. Disegnare lo schema del circuito
2. Completare il diagramma temporale
   - Si trascurino ritardi di propagazione
   - La commutazione avviene sul fronte di discesa del clock
   - IN può variare in ogni momento

---

1. Circuito: (vedi figura)

   ![Circuito es 7](./img/logica-sequenziale-es7-1.pdf){width=50%}

2. Diagramma temporale: (vedi figura)

   ![Diagramma temporale es 7](./img/logica-sequenziale-es7-2.pdf){width=50%}

## 21/10/20

### "pipeline" esercizio 1

Data l'istruzione:

```mips
0x0000 1000: add $t1, $t0, $t2
```

con

```txt
t0: 0x0010 AAAA
t1: 0x0001 0000
t2: 0x0000 0010
```

Completare le tabella con i segnali corrispondenti.

---

| Segnale    | Valore      |
|------------|-------------|
| IF/ID.PC   | 0x0000 1004 |
| IF/ID.istr | add         |

| Segnale           | Valore      |
|-------------------|-------------|
| ID/EX.WB.MemToReg | 0           |
| ID/EX.WB.RegWrite | 1           |
| ID/EX.M.MemWrite  | 0           |
| ID/EX.M.MemRead   | 0           |
| ID/EX.M.Branch    | 0           |
| ID/EX.PC          | 0x0000 1004 |
| ID/EX.(RS)        | 0x0010 AAAA |
| ID/EX.(RT)        | 0x0000 0010 |
| ID/EX.RT          | 0xA         |
| ID/EX.RD          | 0x9         |
| ID/EX.Immediate   | /           |
| ID/EX.EX.ALUsrc   | 0           |
| ID/EX.EX.RegDst   | 1           |

| Segnale            | Valore      |
|--------------------|-------------|
| EX/MEM.WB.MemToReg | 0           |
| EX/MEM.WB.RegWrite | 1           |
| EX/MEM.M.MemWrite  | 0           |
| EX/MEM.M.MemRead   | 0           |
| EX/MEM.M.Branch    | 0           |
| EX/MEM.PC          | /           |
| EX/MEM.ALU_out     | 0x0010 AABA |
| EX/MEM.Zero        | 0           |
| EX/MEM.(Rt)        | /           |
| EX/MEM.R           | 0x9         |

| Segnale            | Valore      |
|--------------------|-------------|
| MEM/WB.WB.MemToReg | 0           |
| MEM/WB.WB.RegWrite | 1           |
| MEM/WB.Dato        | X           |
| MEM/WB.ALU_out     | 0x0010 AABA |
| MEM/WB.R           | 0x9         |

### "pipeline" esercizio 2

Date le seguenti istruzioni:

```mips
0x0040 0800: lw $t1, 0x0BBB($t4)
             nop
             sw $t3, 0x0AA7($t2)
             add $t1, $t1, $t2
             nop
```

Con:

```txt
t0: 0x0100 A010 | 0x1060 0C10: 0x0044 0FFF
t1: 0x0000 1111 | 0x1060 0C21: 0x11FF 0040
t2: 0x1060 2ABC | 0x1060 3563: 0x48F0 6610
t3: 0x0050 0000 |
t3: 0x1060 0066 |
```

Completare le tabelle con i valori richiesti durante il 5 ciclo di esecuzione.

---

1. indirizzo `lw`: 0x1060 0C21
2. indirizzo `sw`: 0x1060 3563

| Segnale    | Valore      |
|------------|-------------|
| IF/ID.PC   | 0x0040 0814 |
| IF/ID.istr | nop         |

| Segnale           | Valore      |
|-------------------|-------------|
| ID/EX.WB.MemToReg | 0           |
| ID/EX.WB.RegWrite | 1           |
| ID/EX.M.MemWrite  | 0           |
| ID/EX.M.MemRead   | 0           |
| ID/EX.M.Branch    | 0           |
| ID/EX.PC          | 0x0040 0810 |
| ID/EX.(RS)        | 0x11FF 0040 |
| ID/EX.(RT)        | 0x1060 2ABC |
| ID/EX.RT          | 0xA         |
| ID/EX.RD          | 0x9         |
| ID/EX.Immediate   | /           |
| ID/EX.EX.ALUsrc   | 0           |
| ID/EX.EX.RegDst   | 1           |

| Segnale            | Valore      |
|--------------------|-------------|
| EX/MEM.WB.MemToReg | X           |
| EX/MEM.WB.RegWrite | 0           |
| EX/MEM.M.MemWrite  | 1           |
| EX/MEM.M.MemRead   | 0           |
| EX/MEM.M.Branch    | 0           |
| EX/MEM.PC          | \*          |
| EX/MEM.ALU_out     | 0x1060 3563 |
| EX/MEM.Zero        | 0           |
| EX/MEM.(Rt)        | 0x0050 0000 |
| EX/MEM.Rt          | 0x9         |

| Segnale            | Valore      |
|--------------------|-------------|
| MEM/WB.WB.MemToReg | 0           |
| MEM/WB.WB.RegWrite | 0           |
| MEM/WB.Dato        | X           |
| MEM/WB.ALU_out     | X           |
| MEM/WB.R           | X           |

Segnali del register file prima del fronte di discesa:

| Segnale       | Valore      |
|---------------|-------------|
| Reg letto 1   | $t1         |
| Reg letto 2   | $t2         |
| Reg scrittura | $t1         |
| Dato letto 1  | 0x0000 1111 |
| Dato letto 2  | 0x1060 2ABC |
| Dato scritto  | 0x1FFF 0040 |

### "pipeline" esercizio 3

Considera le seguenti istruzioni:

```mips
1: add $1, $3, $1
2: and $3, $2, $1
3: sw  $1, 4($3)
```

Completa le tabelle.

---

| Istruzione | Dipendenza | Registro | Propagazione | Ciclo |
|------------|------------|----------|--------------|-------|
| 2          | 1          | $1       | EX/EX        | 4     |
| 3          | 1          | $1       | MEM/EX       | 5     |
| 3          | 2          | $3       | EX/EX        | 5     |

|            | Ciclo 4 | Ciclo 5       |
|------------|---------|---------------|
| Istruzione | 2       | 3             |
| Tipo prop. | EX/EX   | EX/EX, MEM/EX |

|                 | Ciclo 4 | Ciclo 5 |
|-----------------|---------|---------|
| ID/EX.Rs        | $2      | $3      |
| ID/EX.Rt        | $1      | $1      |
| EX/MEM.R        | $1      | $3      |
| EX/MEM.RegWrite | 1       | 1       |
| MEM/WB.R        | /       | $1      |
| MEM/WB.RegWrite | /       | 1       |

|                | Ciclo 4 | Ciclo 5 |
|----------------|---------|---------|
| Mux utilizzato | PB      | PA, PB  |
| PA             | 00      | 10      |
| PB             | 10      | 01      |

## 29/10/20

### "simulazione memorie cache" es 1

Si consideri un sistema di memoria caratterizzato dalle seguenti dimensioni:

- memoria centrale di 4 KiB, indirizzata al byte
- cache di 1 KiB, indirizzata al byte
- un blocco di di cache di 256 byte

Considerando la sequenza di richieste riportata, si chiede di completare la
tabella che illustra il comportamento di un cache a indirizzamento diretto con
le seguenti indicazioni:

- indicare l'esito dell'azione (`H/M`)
- nella colonna dato indicare il blocco di memoria contenuto nel blocco di cache
  in decimale
- nella colonna relativa all'etichetta indicare l'etichetta in binario

---

Formato informazioni blocco:

- Valido: 1
- Etichetta: 2
- Dati: Rimanente

Esempio: `1 00 15`

| indirizzo        | Esito | Blocco 0  | Blocco 1  | Blocco 2  | Blocco 3  |
|------------------|-------|-----------|-----------|-----------|-----------|
| Situazione iniz. | -     | `1 00 00` | `0 11 02` | `1 01 03` | `0 10 xx` |
| `1110 1110 0010` | `M`   | -         | -         | `1 11 14` | -         |
| `0001 1110 0010` | `M`   | -         | `1 00 01` | -         | -         |
| `0001 0011 1001` | `H`   | -         | -         | -         | -         |
| `1100 0000 0010` | `M`   | `1 00 12` | -         | -         | -         |
| `0011 1111 1110` | `M`   | -         | -         | -         | `1 00 03` |
| `1001 0100 0111` | `M`   | -         | `1 10 09` | -         | -         |

### "temi cache" es 1

Si consideri una gerarchia di memoria composta dalla memoria centrale da 1 GiB
indirizzabile al byte con parola di 32 bit, una memoria cache istruzione e una
memoria cache dati da 512 KiB ciascuna, entrambe a indirizzamento diretto con
blocchi da 512 B.

Il tempo di accesso alla cache è pari a 1 ciclo di clock. Il tempo di accesso
alla memoria centrale è pari a 20 cicli di clock per la prima volta e 3 cicli di
clock per le parole a indirizzi successivi (memoria interlacciata). Il bus dati
è da 32 bit.

1. Indicare la struttura degli indirizzi di memoria per le memorie cache
2. Calcolare il tempo necessario per caricare un blocco in caso di fallimento
3. Si supponga una cache dati vuota; viene mandato in esecuzione un programma
   che carica sequenzialmente un file da 1026 blocchi e quindi accede
   sequenzialmente a tutte le parole dei blocchi 0, 1, 1023, 1024, 1025 per 9
   volte. Calcolare il numero di fallimenti della cache dati.
4. Calcolare il miss rate della cache dati del programma nel punto precedente
5. Calcolare il tempo medio di accesso alla memoria del programma del punto 3
   sapendo che il miss rate della cache istruzione è del 2% e la percentuale di
   accesso ai dati è del 50%

---

1. Avremo $2^{30}$ indirizzi e $2^{10}$ blocchi, quindi:

   ```txt
   29          18       8              0
   +-----------+--------+--------------+
   | Etichetta | Indice | Spiazzamento |
   +-----------+--------+--------------+
   ```

2. Miss penalty: $M_{penalty} = 20 + 127 * 5 = 655 \text{cicli}$
3. Numero fallimenti: $1024 + 2 + 9 * (2 + 2) = 1062 \text{miss}$
4. Miss rate cache dati:
   $M_{dati} = \frac{1062}{(1024 + 5 * 9) * 128} = 0.008 = 0.8\%$
5. Tempo medio di accesso alla memoria:

   $$
   \begin{aligned}
      AMAT_{dati} & = h + M_{dati} * M_{penalty} = 1 + 0.008 * 655 =
         6.24 \text{cicli} \\
      AMAT_{istruzioni} & = h + M_{istruzioni} * M_{penalty} =
         1 + 0.02 * 655 = 14.1 \text{cicli} \\
      AMAT & = \frac{100}{150} AMAT_{istruzioni} + \frac{50}{150} AMAT_{dati} =
         11.41 \text{cicli}
   \end{aligned}
   $$
