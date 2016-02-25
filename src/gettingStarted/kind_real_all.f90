! This program shows how to use selected_real_kind
! SELECTED_REAL_KIND(P,R, RADIX) returns the kind value of 
! a real data type with decimal precision of at least 
! P digits, exponent range of at least R, and with
! a radix of RADIX.
!
! Note the repeated kind type values for different precisions.
! Not all real representations are available
!
program kind_real_all
  implicit none
  integer, parameter  :: p1   = selected_real_kind(p=6, r=10, radix= 2)
  integer, parameter  :: p2   = selected_real_kind(20, 140)
  integer, parameter  :: p3   = selected_real_kind(p=10)

  real(kind = p1)     :: v1
  real(kind = p2)     :: v2
  real(kind = p3)     :: v3

  print*,'selected_real_kind(p=6, r=10, radix=2)', p1
  print*,' p = ', precision(v1), ' r = ', & 
         range(v1), ' radix = ', radix(v1)
  print*,'selected_real_kind(20, 40)', p2
  print*,' p = ', precision(v2), ' r = ', & 
         range(v2), ' radix = ', radix(v2)
  print*,'selected_real_kind(p=10)', p3
  print*,' p = ', precision(v3), ' r = ', & 
         range(v3), ' radix = ', radix(v3)
end program kind_real_all
