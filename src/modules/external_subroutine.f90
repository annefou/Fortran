!------------------------------
! subOutside is an external procedure
subroutine subOutside(y,M)
  implicit none

  real, intent(in)    :: y(M)
  integer, intent(in) :: M

  
  integer           :: j 

  print*, 'size of y ', size(y)
  do  j=1,size(y)
    print*, 'y(',j,') = ', y(j)
  enddo

! it will not work here:  print*,x
! because x is not visible from subOutside (no interface)
end subroutine subOutside
