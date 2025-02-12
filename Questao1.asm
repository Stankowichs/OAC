	addi $s0, $zero, 2 #adiciona 2 a variavel A
	addi $s1, $zero, 1 #adiciona 1 a variavel B
	addi $s2, $zero, 0 #seta a variavel M com 0

	add $s2, $zero, $s0 #m = a
	slt $t0, $s1, $s2 # se b < m, então t0 = 1, caso contrario t0 = 0
	bne $t0, $zero, igualaB
	#Else:
	addi $s2, $zero, 0 #m = 0
	j End
	igualaB: add $s2, $zero, $s1 # m = b
	j End # Salta para o fim do if-else
	
	End:
