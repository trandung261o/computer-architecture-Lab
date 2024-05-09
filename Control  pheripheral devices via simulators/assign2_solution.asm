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
	
	#moving the square from right to left
	li $t0, RED
	sw $t0, 104($k0)
	
	li $t0, 0 
	sw $t0, 108($k0)

