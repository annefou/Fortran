program main
  implicit none
  integer :: int

  print*, 'Enter an integer '
  read*,int

  print*, 'the result is ', simple_function(int)
contains
! here we define an internal function i.e.
! contained in your program unit
function simple_function(s) result(res)
  implicit none
  integer, intent(in) :: s  ! s is an input parameter
                            ! it cannot be modified
  integer             :: res ! we define a local variable to
                             ! store our result

  res = 10*s
end function simple_function
end program main

