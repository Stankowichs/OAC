.data
	x: .asciiz "HArdwArE"
	y: .space 9
.text
	
main:
	la $a0, x #cria a variavel x 
	la $a1, y #cria a variavel y
	
	addi $s0, $zero, 0 #int i = 0
	addi $s1, $zero, 7 #int j = 8, com o tamanho da string - 1, pois existe o indice 0
	
	#repeticao para inverter a palavra
L1:
	add $t0, $a0, $s1 #endereço de x[j] na variavel t0
	lbu $t1, 0($t0) #t1 = x[j], o lbu serve para acessar a string no endereço da variavel
	add $t2, $a1, $s0 #endereço de y[i] na variavel t2
	sb $t1, 0($t2) #y[i] = x[j]
	
	beq $s1, $zero, exit #verifico se y[i] == 0
	addi $s0, $s0, 1 #i toma o valor de i++
	addi $s1, $s1, -1 #j toma o valor de j--  
	j L1
	exit:	
	
	#passando os argumentos para a chamada da função de comparação para as letras 
	addi $t7, $zero, 97 #cria a variavel que armazena o char 'a' em ascii
	addi $t8, $zero, 122 #cria a variavel que armazena o char 'z' em ascii
	
	#começo do loop para inverter maiuscula para minuscula, e vice versa
	addi $s0, $zero, 0 #int i = 0, para o novo loop
	
	add $t2, $a1, $s0    # endereço de y[i] em $t2
    	sb $zero, 9($t2)     #adiciona o operador \0
	
L2: 
	add $t0, $a1, $s0 #enderaça y[i] para a variavel t0
	lbu $t1, 0($t0) #t1 = y[i]
	
	beq $t1, $zero, end # if y[i] == '\0', end
	
	#verificação para ver se é minuscula, se for ele passa direto, se for maiuscula pula para a label "maiuscula"
	slt $v0, $t1, $t7 #if(y[i] < a) v0 = 1, else v0 = 0
	bne $v0, $zero, maiuscula #if v0 != 0, return
	slt $v0, $t8, $t1 #if (z < y[i]) v0 = 1, else(y[i] >= z) v0 = 0
	bne $v0, $zero, maiuscula
	
	
	addi $t1, $t1, -32 #subtrai 32 se for minuscula
	sb $t1, 0($t0)
	
	add $s0, $s0, 1 #i++
	j L2
	maiuscula: 
	add $t1, $t1, 32 #soma 32 se for maiuscula
	sb $t1, 0($t0) #endereça o y ja invertido
	addi $s0, $s0, 1 #i++
	j L2
	
	end:
