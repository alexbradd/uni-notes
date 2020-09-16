; Leggi da input 10 numeri (maggiori di 0) e salvali in un vettore. In seguito,
; eleva al quadrato ogni singolo vettore (senza usare MUL).

V:		.RES	10
N:		.RES	1
I:		.RES	1

IN:		 MOV	#10,	N
		 MOV	#0,		I
L1:		 BREQ	N,		OL1		; Inizio for read vettore
		 MOV	#0,		R3
		 ADD	I,		R3
		 ADD	#V,		R3
		 READ	(R3)
		 ADD	#-1,	N
		 ADD	#1,		I
		 BR		L1
OL1:	 MOV	#10,	N		; Fine for read vettore
		 MOV	#0,		I
L2:		 BREQ	N,		OL2		; Inizio for sqr vettore
		 MOV	#0,		R3
		 ADD	I,		R3
		 ADD	#V,		R3
		 ADD	#-2,	SP		; Inizio chamata sqr()
		 MOV	(R3),	(SP)
		 ADD	#-1,	SP
		 JTS	SQR				; Chiamata sqr()
		 ADD	#-2,	SP
		 MOV	(SP),	(R3)
		 ADD	#-1,	SP		; Fine chiamata sqr()
		 ADD	#-1,	N
		 ADD	#1,		I
		 BR		L2
OL2:	 EXIT					; Fine for sqr vettore
		.END	IN

; Funzione sqr()
SQR:	 MOV	R0,		(SP)
		 ADD	#-1,	SP
		 MOV	SP,		R0
		 ADD	#-3,	SP		; alloca spazio variabili locali (3)
		 MOV	R0,		R1
		 MOV	R0,		R2
		 ADD	#3,		R1
		 ADD	#-1,	R2
		 MOV	(R1),	(R0)	; R0 -> var1 = n
		 MOV	(R1),	(R2)	; var2 = n
		 ADD	#-1,	R2
		 MOV	(R1),	(R2)	; R2 -> var3 = n
		 ADD	#-1,	(R2)	; R2 -> var3 - 1
		 MOV	R0,		R1
		 ADD	#-1,	R1		; R1 -> var2
FL1:	 BREQ	(R2),	FOL1	; Inizio for moltiplicazione 
		 ADD	(R1),	(R0)
		 ADD	#-1,	(R2)
		 BR		FL1
FOL1:	 MOV	R0,		R1
		 ADD	#4,		R1
		 MOV	(R0),	(R1)	; return var1
		 ADD	#4,		SP		; dealloca variabili
		 MOV	(SP),	R0
		 RTS
