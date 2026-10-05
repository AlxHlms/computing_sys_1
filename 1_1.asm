.data
id: 	.word 14

.text
main:
	# чтение числа из консоли
	li a7, 5
    	ecall
    	
    	# сохраняем во временную переменную
    	mv t0, a0
	
	# считываем мой id
    	lw t1, id
	
	# если равны -> equal
    	beq t0, t1, equal

    	# x = 0
    	li a0, 0
    	
    	j print

equal:
    	# x = 1
    	li a0, 1

print:
	# вывод результата
	li a7, 1
	ecall
	
	# конец программы
	li a7, 10
	ecall