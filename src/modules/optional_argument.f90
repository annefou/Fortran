program optional_argument
  implicit none

  real :: x(10)

  call random_number(x)
  
  x = x*50.3

  print*, average(x)
  print*, average(x,10.,30.)
 contains

 real function average(x,low,up)
  implicit none
  real, dimension(:), intent(in) :: x
  real, intent(in), optional :: low, up
  
  real :: a, b

  integer :: i, icount
 
  a=-huge(a)
  b = huge(b)

  if (present(low)) a = low
  if (present(up)) b = up

  average = 0.0
  icount = 0
  do i=1, size(x)
    if (x(i) >= a .and. x(i) <= b) then
      average = average + x(i)
      icount = icount + 1
    endif
  enddo
  average = average / icount
 end function average
end program optional_argument
