	addi $s0, $zero, 2 #cria a variavel a com da constante
	addi $s1, $zero, 1 #cria a variavel a com da constante
	addi $s2, $zero, 0 #cria a variavel x com o valor 0
		
	#primeiro confirmação do if
	slt $t0, $s0, $zero #se a < 0, t0 = 1, se a >= 0 t0 = 0
	beq $t0, $zero, and1
	#primeira confirmação do else if:
	slt $t0, $s0, $zero #se a < 0, t0 = 1, se a >= 0, t0 = 0
	bne $t0, $zero, and2	
	j Else #pula para o else se nenhuma das duas confirmações forem verdade
	
	#and para o if
	and1: 
		slt $t0, $s0, $s1 #se a < b, t0 = 1, se a >= b, t0 = 0
		bne $t0, $zero, exe1
	#and para o else if
	and2:
		slt $t0, $s1, $s2 #se b < a, t0 = 1, se b >= a, t0 = 0
		bne $t0, $zero, exe2
		
	#else
	Else: 
		addi, $s2, $zero, 3 #x = 3
		j End	
		
	#execução do primeiro if	
	exe1:
		addi $s2, $zero, 1 #x = 1
		j End
	
	#execução do else if
	exe2:
		addi $s2, $zero, 2 #x = 2
		j End
			
	End:
