# int sums (int n, int m) {
#     return  n * m + 17;
# }
# int big__fun (int a. int b, int c, int d, int e) {
#    return c + sums(d, e) + a * b;
# }
# int main(void) {
#    int a = 1, b = 2, c = 3, d = 4, e = 5, res;
#    res = big_fun(a, b, c, d, e);
# }

### con $fp

.text
.globl MAIN

MAIN:
	li $s0, 1
	li $s1, 2
	li $s2, 3
	li $s3, 4
	li $s4, 5
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	move $a3, $s3
	add $sp, $sp, -4
	sw $s4, 0($sp)
	
	jal BIG_FUN
	move $s5, $v0
	addi $sp, $sp, 4

	move $s5, $a0
	li $v0, 1
	syscall
	li $v0, 10
	syscall

BIG_FUN:
	addi $sp, $sp, -8
	sw $fp, 4($sp)
	addi $fp, $sp, 4
	sw $ra, 0($sp)
	
	addi $sp, $sp, -12
	sw $a0, 8($sp)
	sw $a1, 4($sp)
	sw $a2, 0($sp)
	
	move $a0, $a3
	lw $a1, 4($fp)
	jal SUMS
	
	lw $a0, 8($sp)
	lw $a1, 4($sp)
	lw $a2, 0($sp)
	addi $sp, $sp, 12
	
	add $t0, $a2, $v0
	mult $a0, $a1
	mflo $t1
	add $v0, $t0, $1
	
	lw $ra, -4($fp)
	lw $fp, 0($fp)
	addi $sp, $sp, 8
	jr $ra
	
SUMS: # Funzione foglia, niente sw $ra ...
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp

	mult $a0, $a1
	mflo $t0
	addi $v0, $t0, 17
	
	lw $fp, 0($sp)
	add $sp, $sp, 4
	jr $ra
