.data
array1: .word 1,2,3,4,5,6,7,8
array2: .space 20
array3: .asciiz "Toi ten Nhu\n"

.text
la $s0,array1
add $t0,$zero,0
addi $t1,$zero,32
Print:
beq $t0,$t1,exit
addi $v0,$zero,1
add $a0,$t0,$s0
lw $a0,0($a0)
syscall
addi $t0,$t0,4
j Print
exit: