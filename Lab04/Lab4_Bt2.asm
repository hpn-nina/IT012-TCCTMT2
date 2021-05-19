.data
str1: 		.asciiz "Enter a:"
str2: 		.asciiz "Enter b:"
str0:		.asciiz "\n The bigger number is:"
str3: 		.asciiz "\n a+b ="
str4:		.asciiz "\n a-b ="
str5: 		.asciiz "\n a*b ="
str6: 		.asciiz "\n a/b ="
str7:		.asciiz "\nb == 0, can not be divided\n"

.text
Main:		la $a0,str1
		addi $v0,$zero,4
		syscall
		addi $v0,$zero,5
		syscall #Enter a
		addi $s0,$v0,0
	
		la $a0,str2
		addi $v0,$zero,4
		syscall
		addi $v0,$zero,5
		syscall
		addi $s1,$v0,0
	
Compare: 	la $a0,str0
		addi $v0,$zero,4
		syscall
		slt $t0,$s0,$s1
		bnez $t0,print1
		addi $a0,$s0,0
		addi $v0,$zero,1
		syscall
		j Sum

print1:		addi $a0,$s1,0
		addi $v0,$zero,1
		syscall

Sum:		la $a0,str3
		addi $v0,$zero,4
		syscall
		add $a0,$s0,$s1
		addi $v0,$zero,1
		syscall
		
Minus: 		la $a0,str4
		addi $v0,$zero,4
		syscall
		sub $a0,$s0,$s1
		addi $v0,$zero,1
		syscall
		
Multiply: 	la $a0,str5
		addi $v0,$zero,4
		syscall
		mult $s0,$s1
		mflo $a0
		addi $v0,$zero,1
		syscall
	
Divide: 	beq $zero,$s1,exit
		la $a0,str6
		addi $v0,$zero,4
		syscall
		div $a0,$s0,$s1
		addi $v0,$zero,1
		syscall

exit:		li $v0,4
		la $a0,str7
		syscall