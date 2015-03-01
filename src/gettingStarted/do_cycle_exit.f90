program odd_number
  implicit none
  integer :: N, k
! odd integers between 0 & N
  READ(*,*) N
  WRITE(*,*) 'Odd number between 0 and ', N
  k = -1
  DO 
    k = k + 1
    if (k > N) EXIT
    if (mod(k,2) .ne. 0) CYCLE
    WRITE(*,*) k
  END DO
end program odd_number
