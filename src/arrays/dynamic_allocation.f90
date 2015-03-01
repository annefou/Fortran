program dynamic_allocation
  implicit none
  integer                           :: N, M
  real, dimension(:,:), ALLOCATABLE :: A
  integer                           :: err

  read *, N, M
  allocate( A(N, M), STAT=err )
  if (err /= 0) STOP "Error when allocating M"
  call random_number( A )
  print*, A
  deallocate( A )

end program dynamic_allocation

