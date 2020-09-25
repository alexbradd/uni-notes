# int potenza(int n, int exp) {
#    if (exp == 0) 
#        return 1;
#    else
#        return n * potenza(nm, exp - 1);
# }
# int main(void) {
#    potenzia(2, 5);
# }

.text
.globl MAIN

MAIN:
	li $a0, 2
	li $a1, 5
	jal POTENZA
	
	add $a0, $v0, $0
	li $v0, 1
	syscall
	li $v0, 10 # exit
	syscall

POTENZA:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	bnez $a1, ELSE
	li $v0, 1
	j EXIT
ELSE:
	add $sp, $sp, -4 # backup di n
	sw $a0, 0($sp)
	addi $a1, $a1, -1
	jal POTENZA
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	mult $v0, $a0
	mflo $v0
EXIT:
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
	