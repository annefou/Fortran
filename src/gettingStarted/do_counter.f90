program odd_number
  implicit none
  integer :: N, k
 
! odd integers between 0 & N
  READ(*,*) N
  WRITE(*,*) "Odd number between 0 and ", N
  DO k = 0, N, 2
  WRITE(*,*) k
END DO

end program odd_number

