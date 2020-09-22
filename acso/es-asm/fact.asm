.text
.globl MAIN

MAIN:
	li $a0, 5
	jal FACT
	move $s0, $v0
	
	li $v0, 10 # Exit
	syscall
	
FACT:
	subiu $sp, $sp, 4
	sw $ra, 0($sp)
	li $t0, 1
	bne $a0, $t0, ELSE
	li $v0, 1
	j END
ELSE:
	subiu $sp, $sp, 4
	sw $a0, 0($sp)
	subi $a0, $a0, 1
	jal FACT
	lw $a0, 0($sp)
	addiu $sp, $sp, 4
	mult $a0, $v0
	mflo $v0
END:
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
