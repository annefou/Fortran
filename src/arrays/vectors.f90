program vectors_example
  implicit none
  integer, parameter :: N=10
  integer            :: j
  integer            :: vector(N)
 
  vector(:) = (/ (j, j=1,N)/)
  print*, 'Initial values: ', vector
  
  vector(:) = vector(:) + 10
  print*, 'New values: ', vector
  
end program vectors_example

