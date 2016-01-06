.data
arr: .space 100
spaceP: .asciiz" "
.text
.globl main
.ent main
main:
la $a0, arr
addi $s0, $a0, 0

inputLoop:
li $v0, 5
syscall
addi $t0, $v0, 0
beq $t0, 0, exit
sw $t0, ($a0) # add number to array
addi $a0, $a0, 4
j inputLoop

exit:
addi $a0, $s0, 0

outerLoop:
addi $a0, $a0, 4
lw $s1, ($a0)
beq $s1, $0, exit2
addi $s4, $a0, 0
sub $s4, $s4, 4
innerLoop:
lw $s2, ($s4)
beq $s2, $0, exit1
ble $s2, $s1, exit1
addi $s3, $s4, 0
addi $s3, $s3, 4
sw $s2, ($s3)
sub $s4, $s4, 4
addi $s3, $s4, 0
addi $s3, $s3, 4
sw $s1, ($s3)
j innerLoop
exit1:
j outerLoop

exit2:
addi $a1, $s0, 0

printLoop:
lw $t0, ($a1)
beq $t0, $0, exit3
li $v0, 1
addi $a0, $t0, 0
syscall
addi $a1, $a1, 4
li $v0, 4
la $a0, spaceP
syscall
j printLoop

exit3:
li $v0, 10
syscall