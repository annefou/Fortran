program overloading_main
  use operator_overloading
  implicit none

  
 character(len=15) :: hello='hello', world = 'world'

 print*, hello + world
 print*, hello .PLUS. world
end program overloading_main
