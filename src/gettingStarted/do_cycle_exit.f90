program odd_number
  implicit none
  integer :: N, k
! odd integers between 0 & N
  PRINT*, 'Enter an integer N'
  READ(*,*) N
  WRITE(*,*) 'Odd number between 0 and ', N
  k = 0
  DO 
    k = k + 1
    if (k > N) EXIT
    if (mod(k,2) .eq. 0) CYCLE
    WRITE(*,*) k, ' is an odd number between 0 and ', N
  END DO
end program odd_number