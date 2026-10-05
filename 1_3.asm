.data
	# (16 + 14) * 4 байта
array: 	.space 120

.text
main:
    	# массив + счётчик + ограничитель
    	la t0, array
    	li t1, 0
    	li t2, 30

loop:
    	# 30 чисел -> конец
    	beq t1, t2, end

    	# ввод числа
    	li a7, 5
    	ecall

	# 0 -> конец
   	beq a0, zero, end

	# число в массив
    	sw a0, 0(t0)

	# следующий элемент
    	addi t0, t0, 4
    	
    	# счётчик += 1
    	addi t1, t1, 1

    	j loop

end:
	# конец программы
    	li a7, 10
    	ecall