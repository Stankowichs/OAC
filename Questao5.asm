
.data
	num1: .word 5          # Primeiro número para multiplicar
	num2: .word -3         # Segundo número para multiplicar
	result: .word 0        # Variável para armazenar o resultado
.text
	j main 	
	
main:
	lw $t0, num1 #carrega os numeros para os registradores
	lw $t1, num2
	addi $t2, $zero, 0 #variavel para guardar o resultado
	
	#checagem para ver se um dos numeros é zero, e inverte-los depois
	slt $a0, $t0, $zero #if num1 < 0, a0 = 1
	bne $a0, $zero, invertNum1
	slt $a0, $t1, $zero #if num2 < 0, a0 = 1 
	bne $a0, $zero, invertNum2
	
	addi $t3, $zero, 0 #cria um contador começando em 0 para realizar a multiplicação
	
	multp: 
	beq $t3, $t1, loadResult
	add $t2, $t2, $t0 #num1 += num1, ate realizar todas as somas do numero nele pela quantidade de vezes do segundo numero
	addi $t3, $t3, 1 #contador++
	j multp
	
	#funções para inverter se os numeros forem negativos, e chamar a função de multp negativa
	invertNum1: sub $t0, $zero, $t0
	j multpNeg
	invertNum2: sub $t1, $zero, $t1
	j multpNeg
	
	multpNeg: 
	beq $t3, $t1, loadResultNeg
	add $t2, $t2, $t0 #num1 += num1, ate realizar todas as somas do numero nele pela quantidade de vezes do segundo numero
	addi $t3, $t3, 1
	j multpNeg
	
	#resultados diferentes, se o numero for positivo ou negativo, para poder inverte-los
	loadResult: 	
	sw $t2, result
	j end
	loadResultNeg:
	sub $t2, $zero, $t2
	sw $t2, result
	
	end:
