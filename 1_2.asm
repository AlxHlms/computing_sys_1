.data
group:	.word 126
id:  	.word 14

.text
main:
	# чтение числа + сохранение во временную
    	li a7, 5
    	ecall
    	mv t0, a0

    	# чтение id меня и группы
    	lw t1, group
    	lw t2, id

	# (x >= group) -> x_start
    	bge t0, t1, x_start
	
	# (x ... group)
    	mv t3, t0
	mv t4, t1
    	
    	j loop

x_start:
	# (group ... x)
    	mv t3, t1
    	mv t4, t0

loop:
    	# пока не a_min > a_max
    	bgt t3, t4, end

    	# из временной в регистр + выводим текущее число
    	mv a0, t3
    	li a7, 1
    	ecall

    	# пробел в регистр + его вывод
	li a0, 32
	li a7, 11
	ecall

    	# шаг (a_min += id)
    	add t3, t3, t2

    	j loop

end:
    	# конец программы
    	li a7, 10
    	ecall