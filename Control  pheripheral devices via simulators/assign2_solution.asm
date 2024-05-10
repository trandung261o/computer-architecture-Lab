.eqv MONITOR_SCREEN 0x10010000
.eqv RED 0x00FF0000
.eqv GREEN 0x0000FF00
.eqv BLUE 0x000000FF
.eqv WHITE 0x00FFFFFF
.eqv YELLOW 0x00FFFF00

.text
	li $k0, MONITOR_SCREEN
	
	#draw a red square
	li $t0, RED
	sw $t0, 108($k0)
	sw $t0, 112($k0)
	sw $t0, 140($k0)
	sw $t0, 144($k0)
	
	#wait for 3 seconds
	li $v0, 32
	la $a0, 3000
	syscall
	
	#moving the square from right to left
	#delete old square
	sw $0, 108($k0)
	sw $0, 112($k0)
	sw $0, 140($k0)
	sw $0, 144($k0)
	
	#moving square
	sw $t0, 100($k0)
	sw $t0, 104($k0)
	sw $t0, 132($k0)
	sw $t0, 136($k0)

