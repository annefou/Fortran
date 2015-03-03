PROGRAM swap_main
 implicit none

! Define an interface for swap
 interface swap 
   SUBROUTINE swapreal (a,b)
     REAL, INTENT(INOUT) :: a,b
   END SUBROUTINE swapreal
 
   SUBROUTINE swapint (a,b)
     INTEGER, INTENT(INOUT) :: a,b
   END SUBROUTINE swapint
 end interface swap 

  integer   :: i,j
  real      :: x, y

 i=10
 j=60
 x=40.567
 y=38.678

 print*, 'Before swaping: i= ', i, ' j= ', j, &
         ' x= ', x, ' y = ', y
 call swap(i,j)
 call swap(x,y)
 print*, 'After swaping: i= ', i, ' j= ', j, &
         ' x= ', x, ' y = ', y
  
end program swap_main
!
SUBROUTINE swapreal(a,b)
  IMPLICIT NONE
  REAL, INTENT(INOUT) :: a,b
  REAL :: temp
  temp=a
  a=b
  b=temp
END SUBROUTINE swapreal
!
SUBROUTINE swapint(a,b)
  IMPLICIT NONE
  INTEGER, INTENT(INOUT) :: a,b
  INTEGER                :: temp
  temp=a
  a=b
  b=temp
END SUBROUTINE swapint

