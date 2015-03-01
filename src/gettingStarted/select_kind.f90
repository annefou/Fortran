program select_kind
  implicit none
  integer, parameter   :: i4=SELECTED_INT_KIND(4)
  integer, parameter   :: i8=SELECTED_INT_KIND(8)
  integer, parameter   :: i15=SELECTED_INT_KIND(15)
  integer, parameter   :: r4=SELECTED_REAL_KIND(6,37)
  integer, parameter   :: r8=SELECTED_REAL_KIND(15,307)
  integer(KIND=i4) :: ia
  integer(KIND=i8) :: ib
  integer(KIND=i15) :: ic
  real(KIND=r4) :: ra
  real(KIND=r8) :: rb

  print *,' Integer kind=', i4, ' biggest value=', huge(ia)
  print *,' Integer kind=', i8, ' biggest value=', huge(ib)
  print *,' Integer kind=', i15, ' biggest value=', huge(ic)
  print *,' Real kind=', r4, ' smallest value= ', tiny(ra) , &
          ' biggest value=', huge(ra)
  print *,' Real kind=', r8, ' smallest value= ', tiny(rb) , &
          ' biggest value=', huge(rb)

end program select_kind
