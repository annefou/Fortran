program swap_main
  use swap_interface
  implicit none

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
