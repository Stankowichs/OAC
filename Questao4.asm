 	j main
 	
 	soma:
	beq $a2, $a1, return #se o contador for igual ao valor de B, a recursão se encerra
	
	add $v0, $v0, $a2 #v0 += a2, resultado += contador
	addi $a2, $a2, 1 #contador++
	j soma
	return: jr $ra

main:
	addi $a0, $zero, 2 #int a = 2
	addi $a1, $zero, 5 #int b = 3
	
	slt $v1, $s1, $s0 #if b < a, v1 = 1
	bne $v1, $zero, end #if b < a == true, end
	
	add $a2, $zero, $a0 #adicionando ao contador o valor de a
	jal soma

	#a soma esta no registrador v0;
	
end:
