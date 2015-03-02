program main
  implicit none
  integer :: int, val

  print*, 'Enter an integer '
  read*,int

  call simple_function(int, val)
  print*, 'the result is ', val
contains
! here we define an internal subroutine i.e.
! contained in your program unit
subroutine simple_function(s,res)
  implicit none
  integer, intent(in) :: s   ! s is an input parameter
                             ! it cannot be modified
  integer,intent(out) :: res ! res is an output parameter

  res = 10*s
end subroutine simple_function
end program main

