.text
main:
        	la $t0,count
        	addi $t0, $zero, 1 #count = 1
        
        	la $t1,ind
        	addi $t1, $zero ,20 #ind = 20
        
Loop:
        	slt $t2,$t0,$t1
        	beq $zero,$t2,exit
		la $s0,arrayA
		la $s1,arrayB
	
		addi $t3,$t0,-1 #count - 1
		addi $t4,$t0,2 #count - 2
	
	#Dich trai la chia 2, dich phai la nhan hai
DicharrayA: 	slt $t7,$zero,$t3
		beq $zero,$t7,DicharrayB
		sll $s0,$s0,4
		addi $t7,$t7,-1
		beq $t7,$zero,DicharrayB
		jal DicharrayA
		
DicharrayB: 	slt $t7,$zero,$t4
		beq $zero,$t7,continue
		sll $s1,$s1,4
		addi $t7,$t7,-1
		beq $t7,$zero,continue
		jal DicharrayB
		
continue:
        	add $s0,$zero,$s1
        	jal Loop
        	addi $t0,$t0,1
exit:
	
.data
count: .space 6
ind: .space 6
arrayA: .word 6,4,5,10,11
arrayB: .word 7,8,9,8,5,6,7
