program elemental_main
  use elemental_procedure
  implicit none
 
  integer, parameter   :: n=5
  real, dimension(n,n) :: a,b,c
  real, dimension(n)   :: t,u,v

  call random_number(a)
  call random_number(b)
  call random_number(t)
  call random_number(u)
  c = f(a,b)
  v = f(t,u)

  print*, 'c = ', c
  print*, 'v = ', v
end program elemental_main
