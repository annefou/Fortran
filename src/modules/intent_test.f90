PROGRAM main
  implicit none
 
  real   :: xx,yy,zz

  xx=10.
  zz=15.678e0

  call test(xx,yy,zz)
  
  print*, 'xx= ', xx, ' yy= ', yy, ' zz= ', zz

CONTAINS
  SUBROUTINE test(x,y,z)
    implicit none
  
    real, intent(in)    :: x
    real, intent(out)   :: y
    real, intent(inout) :: z
  
!    x=10  ! Compilation error
!    z=y+1 ! Dangerous as the compiler assumes y is out only
    z=19  ! correct
    y=z*x ! correct
  
  END SUBROUTINE test
END PrOGRAM main
