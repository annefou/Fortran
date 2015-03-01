program initialize_stack
  implicit none
  integer          :: i
  real             :: r
  complex          :: cplx
  double precision :: d

  call write_var(i,r,cplx,d)

contains
subroutine write_var(i,r,cplx, d)
  implicit none
  integer, intent(in)          :: i
  real, intent(in)             :: r
  complex, intent(in)          :: cplx
  double precision, intent(in) :: d

 print*, 'Integer = ', i
 print*, 'Real single precision = ', r
 print*, 'Complex = ', cplx
 print*, 'Double prevision = ', d
end subroutine write_var
end program initialize_stack
