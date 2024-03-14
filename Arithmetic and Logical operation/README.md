##### assign.1
    The sum of two 32-bit integers may not be representable in 32 bits. In this case, 
    we say that an overflow has occurred. Overflow is possible only with operands of 
    the same sign. For two nonnegative (negative) operands, if the sum obtained is 
    less (greater) than eitheir operand, overflow has occurred. The following program 
    dectects overflow based on this rule. Two operands are stored in register $s1 and 
    $s2, the sum is stored in register $s3. If overflow occur, $t0 register is set to 1 
    and clear to 0 in otherwise.

    .text
    start:
      li $t0,0 #No Overflow is default status
      addu $s3,$s1,$s2 # s3 = s1 + s2
      xor $t1,$s1,$s2 #Test if $s1 and $s2 have the same sign
      bltz $t1,EXIT #If not, exit
      slt $t2,$s3,$s1
      bltz $s1,NEGATIVE #Test if $s1 and $s2 is negative?
      beq $t2,$zero,EXIT #s1 and $s2 are positive
       # if $s3 > $s1 then the result is not overflow
      j OVERFLOW
    NEGATIVE:
      bne $t2,$zero,EXIT #s1 and $s2 are negative
       # if $s3 < $s1 then the result is not overflow
    OVERFLOW:
      li $t0,1 #the result is overflow
    EXIT:

    Create a new project to implement assign.1. Compile and upload 
    to simulator. Initialize two operands (register $s1 and $s2), run this program step 
    by step, observe memory and registers value.