SUBROUTINE test(x,y,z)
  implicit none
  
  real, intent(in)    :: x
  real, intent(out)   :: y
  real, intent(inout) :: z
  
!  x=10  ! Compilation error
!  z=y+1 ! Dangerous as the compiler assumes y is out only
  z=19  ! correct
  y=z*x ! correct
  
END SUBROUTINE test

