.data
mes1: 	.asciiz "Enter an character:"
mes2: 	.asciiz "\nIt's a number\n"
mes3: 	.asciiz "\nIt's a capital letter\n"
mes4: 	.asciiz "\nIt's a normal letter\n"
mes5:	.asciiz "\nThe character before it:"
mes6: 	.asciiz "\nThe character behind it:"
mes0:	.asciiz "\nInvalid type\n"
.text
Main: 	la $a0,mes1
	addi $v0,$zero,4
	syscall #Print the string Enter an character
	
	addi $v0,$zero,12
	syscall #Enter the character into v0
	
	addi $a0,$v0,0
	addi $a1,$a0,0
	
ss1:	li $t5,'0'
	sgt $t0,$a0,$t5 #Check if a0 > 0
	bne $a0,$t5,cont1 #Check if a0 == 0
	addi $t0,$t0,1
	
cont1:	li $t6,'9'
	slt $t1,$a0,$t6 #Check if a0 < 9
	bne $a0,$t6,cont2 #Check if a0 == 9
	addi $t1,$t1,1 
	
cont2:	add $t2,$t0,$t1 #Check if 0 <= a0 <= 9
	addi $t7,$zero,2 
	bne $t7,$t2,ss2 #if not go to ss2
	la $a0,mes2
	addi $v0,$zero,4
	syscall
	j exit
	
	
ss2:	li $t5,'A'
	sgt $t0,$a0,$t5
	bne $a0,$t5,cont3 #Check if a0 == "A"
	addi $t0,$t0,1
	
cont3:	li $t6,'Z'
	slt $t1,$a0,$t6
	bne $a0,$t6,cont4 #Check if a0 == 'Z'
	addi $t1,$t1,1 
	
cont4:	add $t2,$t0,$t1
	addi $t0,$zero,2
	bne $t2,$t0,ss3
	la $a0,mes3
	addi $v0,$zero,4
	syscall
	j exit
	
ss3: 	li $t5,'a'
	sgt $t0,$a0,$t5
	bne $a0,$t5,cont5 #Check if a0 == "a"
	addi $t0,$t0,1
	
cont5:	li $t6,'z'
	slt $t1,$a0,$t6
	bne $a0,$t6,cont6 #Check if a0 == 'z'
	addi $t1,$t1,1 
	
cont6:	add $t2,$t0,$t1
	addi $t0,$zero,2
	bne $t2,$t0,print
	la $a0,mes4
	addi $v0,$zero,4
	syscall
	j exit
	
exit: 	la $a0,mes5
	addi $v0,$zero,4
	syscall
	subi $a0,$a1,1
	addi $v0,$zero,11
	syscall
	la $a0,mes6
	addi $v0,$zero,4
	syscall
	addi $a0,$a1,1
	addi $v0,$zero,11
	syscall
	j end
	
print: 	la $a0,mes0
	addi $v0,$zero,4
	syscall
end:
	