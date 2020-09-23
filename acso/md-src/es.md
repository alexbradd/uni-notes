# Esercitazione

## 23/09/20

### 1

Dati i seguenti moduli:

- Modulo "main":

```nasm
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

```nasm
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

si compilino le quattro tabelle relative a:

1. i moduli oggetto prodotti dall'assemblatore
2. le basi di rilocazione del codice e dei dati dei moduli
3. La tabella globale dei simboli
4. il contenuto del file eseguibile prodotto dal linker

#### Soluzione

1. Tabella file oggetto

   ```txt
   dim text: 0x18          | dim text: 0x14
   dim data: 0x24          | dim data: 0x1

   text:                   | text:
   0   lui $t0, FFF0       | 0   lw $t3, 0($gp)
   4   ori $t0, $t0, ABCC  | 4   lb $t4, 0($gp)
   8   sw $t0, 0($gp)      | 8   sub $t4, $t4, $t3
   C   lw $t1, 0($gp)      | C   beq $t4, $0, 0xFFFC
   10  beq $t0, $t0, 0     | 10  j 0
   14  syscall             |

   data:                   | data:
   0  uninitialized        | 0  0x59
   14 uninitialized        |
   20 0x17                 |

   symbols:                | symbols:
   STRUCT  D  0            | ALPHA    D  0
   VECT    D  14           | RESTART  T  0
   INT     D  20           | MODULE   T  4
   MAIN    T  0            | MODEND   T  10
   MAINEND T  14           |

   relocation:             | relocation:
   8  sw  STRUCT           | 0   lw  INT
   C  lw  VECT             | 4   lb  ALPHA
   10 beq MODULE           | 10  j   MAINEND
   ```

2. Basi di rilocazione

   |           | main       | module     |
   |-----------|------------|------------|
   | base text | 0x00400000 | 0x00400018 |
   | base data | 0x10000000 | 0x10000024 |

3. Tabella globale dei simboli

   | simbolo  | valore iniziale | base        | valore finale |
   |----------|-----------------|-------------|---------------|
   | STRUCT   | 0x0             | 0x10000000  | 0x10000000    |
   | VECT     | 0x14            | 0x10000000  | 0x10000014    |
   | INT      | 0x20            | 0x10000000  | 0x10000020    |
   | MAIN     | 0x0             | 0x00400000  | 0x00400000    |
   | MAINEND  | 0x14            | 0x00400000  | 0x00400014    |
   | ALPHA    | 0x0             | 0x10000024  | 0x10000024    |
   | RESTART  | 0x0             | 0x00400018  | 0x00400018    |
   | MODULE   | 0x4             | 0x00400018  | 0x0040001C    |
   | MODULEND | 0x10            | 0x000400018 | 0x00400028    |

4. Eseguibile

   ```txt
   400000  lui $t0, FFF0
   400004  ori $t0, $t0, ABCC
   400008  sw $t0, 0x8000($gp)
   40000C  lw $t1, 0x8014($gp)
   400010  beq $t0, $t0, 0x2
   400014  syscall
   400018  lw $t3, 0x8020($gp)
   40001C  lb $t4, 0x8024($gp)
   400020  sub $t4, $t4, $t3
   400024  beq $t4, $0, 0xFFFC
   400028  j 0x00100005
   ```
