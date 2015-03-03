module swap_interface
 implicit none

 interface swap 
   module procedure swapreal, swapint
 end interface swap 

CONTAINS

SUBROUTINE swapreal(a,b)
 IMPLICIT NONE
 REAL, INTENT(INOUT) :: a,b
 REAL :: temp
 temp=a
 a=b
 b=temp
 END SUBROUTINE swapreal

SUBROUTINE swapint(a,b)
 IMPLICIT NONE
 INTEGER, INTENT(INOUT) :: a,b
 INTEGER                :: temp
 temp=a
 a=b
 b=temp
 END SUBROUTINE swapint

end module swap_interface