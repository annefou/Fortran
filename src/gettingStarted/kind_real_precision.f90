! This program shows how to use selected_real_kind
! SELECTED_REAL_KIND(P,R) returns the kind value of 
! a real data type with decimal precision of at least 
! P digits, exponent range of at least R, and with
! a radix of RADIX.
!
! Note the repeated kind type values for different precisions.
! Not all real representations are available
!
program kind_real_precision
  implicit none
  integer, parameter  :: p1   = selected_real_kind(p=1)
  integer, parameter  :: p2   = selected_real_kind(p=2)
  integer, parameter  :: p3   = selected_real_kind(p=3)
  integer, parameter  :: p4   = selected_real_kind(p=4)
  integer, parameter  :: p5   = selected_real_kind(p=5)
  integer, parameter  :: p6   = selected_real_kind(p=6)
  integer, parameter  :: p7   = selected_real_kind(p=7)
  integer, parameter  :: p8   = selected_real_kind(p=8)
  integer, parameter  :: p9   = selected_real_kind(p=9)
  integer, parameter  :: p10  = selected_real_kind(p=10)

  real(kind = p1)     :: v1
  real(kind = p2)     :: v2
  real(kind = p3)     :: v3
  real(kind = p4)     :: v4
  real(kind = p5)     :: v5
  real(kind = p6)     :: v6
  real(kind = p7)     :: v7
  real(kind = p8)     :: v8
  real(kind = p9)     :: v9
  real(kind = p10)    :: v10

  print*,'selected_real_kind(p=1)', p1
  print*,' p = ', precision(v1), ' r = ', & 
         range(v1), ' radix = ', radix(v1)
  print*,'selected_real_kind(p=2)', p2
  print*,' p = ', precision(v2), ' r = ', & 
         range(v2), ' radix = ', radix(v2)
  print*,'selected_real_kind(p=3)', p3
  print*,' p = ', precision(v3), ' r = ', & 
         range(v3), ' radix = ', radix(v3)
  print*,'selected_real_kind(p=4)', p4
  print*,' p = ', precision(v4), ' r = ', & 
         range(v4), ' radix = ', radix(v4)
  print*,'selected_real_kind(p=5)', p5
  print*,' p = ', precision(v5), ' r = ', & 
         range(v5), ' radix = ', radix(v5)
  print*,'selected_real_kind(p=6)', p6
  print*,' p = ', precision(v6), ' r = ', & 
         range(v6), ' radix = ', radix(v6)
  print*,'selected_real_kind(p=7)', p7
  print*,' p = ', precision(v7), ' r = ', & 
         range(v7), ' radix = ', radix(v7)
  print*,'selected_real_kind(p=8)', p8
  print*,' p = ', precision(v8), ' r = ', & 
         range(v8), ' radix = ', radix(v8)
  print*,'selected_real_kind(p=9)', p9
  print*,' p = ', precision(v9), ' r = ', & 
         range(v9), ' radix = ', radix(v9)
  print*,'selected_real_kind(p=10)', p10
  print*,' p = ', precision(v10), ' r = ', & 
         range(v10), ' radix = ', radix(v10)
end program kind_real_precision
