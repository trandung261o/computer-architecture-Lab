##### assign.1
  This home assignment implements “if-then-else” statement using some 
  fundamental instructions, such as slt, addi, jump and branch.
    if (i<=j)
      x=x+1;
      z=1;
    else
      y=y-1;
      z=2*z;
  At first, you should draw the algorithm chart for this statement. After that, you 
  read this example carefully, try to clarify the function of each intructions.
  #Laboratory Exercise 3, Home Assignment 1
  start:
  	slt $t0,$s2,$s1 # j<i
  	bne $t0,$zero,else # branch to else if j<i
  	addi $t1,$t1,1 # then part: x=x+1
  	addi $t3,$zero,1 # z=1
  	j endif # skip “else” part
  else: 	addi $t2,$t2,-1 # begin else part: y=y-1
  	add $t3,$t3,$t3 # z=2*z
  endif:
