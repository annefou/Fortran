program array_reshape
  implicit none
  integer                           :: N, M, J
  real, dimension(:,:), ALLOCATABLE :: A
  integer                           :: err

  read *, N, M

  allocate( A(N, M), STAT=err )
  if (err /= 0) STOP "Error when allocating M"
  A = reshape((/(j,j=1,N*M)/),shape=(/N,M/))
  do j=1,N
    print*, A(J,:)
  enddo
  deallocate( A )
end program array_reshape

