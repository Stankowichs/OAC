	j main
	
main:
	addi $t0, $zero, 6 #variavel inicial para contagem do fibonacci; n = 6
	addi $t2, $zero, 1 #variaveis auxiliares de soma e subtração; x = 1
	addi $t3, $zero, 0 #variaveis auxiliares de soma e subtração; y = 0
	addi $t9, $zero, 0 #contador para condição de parada;
	
	fibonacci: 
	#condições de parada
	beq $t0, $t9, end #if contador == n, return o valor da soma
	
	add $t1, $t2, $t3 #temp = x + y
	add $t2, $zero, $t3 #x = y
	add $t3, $zero, $t1 #y = temp
	
	addi $t9, $t9, 1 #contador += 1 
	j fibonacci
end:
#valor final no registrador t1
