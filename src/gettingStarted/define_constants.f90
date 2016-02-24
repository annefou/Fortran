program define_constants
  IMPLICIT NONE
  integer, parameter :: dp = selected_real_kind(15)
  REAL(dp)           :: var1, var2, var3

  var1 = 10.0_dp
  var2 = 3.1415927 * var1     ! here the literal 3.14... is NOT typed
  var3 = 3.1415927_dp * var1  ! here the literal 3.14... is typed (dp)

  print*, 'var2 = ', var2
  print*, 'var3 = ', var3
end program define_constants
