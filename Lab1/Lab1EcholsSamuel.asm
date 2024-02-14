# --- Helpful Macros -- #
.macro print_new_line
    addi $a0, $zero, 0xA
    addi $v0, $0, 0xB
    syscall
.end_macro

.macro print_int (%n)
    add $t3, %n, $0
    move $a0, $t3
    li $v0, 1
    syscall
.end_macro
.macro exit
	li $v0, 10
	syscall
.end_macro
# ------------------- #

#f = g + (h - i) + j

.main:
	# ---Part One--- #
	li $t0, 14
	# h - i
	subi $t1, $t0, 6
	#g + t1
	addi $t1, $t1, 20
	#j + t1
	addi $t1, $t1, 22
	
	print_int $t1

	# ---Part Two--- #
	print_new_line
	
	li $v0, 5
	syscall
	la $t4, ($v0)

	li $v0, 5
	syscall
	la $t5, ($v0)
	
	# h - i
	subi $t1, $t4, 6
	#g + t1
	addi $t1, $t1, 20
	#j + t1
	add $t1, $t1, $t5
	
	print_int $t1
	exit

