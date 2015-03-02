program odd_number
  implicit none
  integer :: N, k
 
! odd integers between 0 & N
  PRINT*, 'Enter an integer N: '
  READ(*,*) N
  WRITE(*,*) "Odd number between 0 and ", N
  DO k = 1, N, 2
    WRITE(*,*) k, 'is an odd number between 0 and ', N
  END DO

end program odd_number
