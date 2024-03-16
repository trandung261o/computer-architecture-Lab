.text
li $s0, 0x0563 # load test value 

# Extract MSB of $s0
srl $t0, $s0, 24

# Clear LSB of $s0
andi $s0, $s0, 0xFFFFFF00

# Set LSB of $s0 (bits 7 to 0 are set to 1)
ori $s0, $s0, 0xFF

# Clear $s0 (s0=0, must use logical instructions)
xor $s0, $s0, $s0


