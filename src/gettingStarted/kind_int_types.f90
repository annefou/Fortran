! This program demonstrates the usage of selected_int_kind
! SELECTED_INT_KIND(R) return the kind value of the smallest integer 
! type that can represent all values ranging from 
! -10^R (exclusive) to 10^R (exclusive).
! If there is no integer kind that accommodates this range, 
! SELECT_INT_KIND returns -1. 
!
program kind_int_types
  implicit none
  print*, 'SELECTED_INT_KIND(1) = ', selected_int_kind(1)
  print*, 'SELECTED_INT_KIND(2) = ', selected_int_kind(2)
  print*, 'SELECTED_INT_KIND(3) = ', selected_int_kind(3)
  print*, 'SELECTED_INT_KIND(4) = ', selected_int_kind(4)
  print*, 'SELECTED_INT_KIND(5) = ', selected_int_kind(5)
  print*, 'SELECTED_INT_KIND(6) = ', selected_int_kind(6)
  print*, 'SELECTED_INT_KIND(7) = ', selected_int_kind(7)
  print*, 'SELECTED_INT_KIND(8) = ', selected_int_kind(8)
  print*, 'SELECTED_INT_KIND(9) = ', selected_int_kind(9)
  print*, 'SELECTED_INT_KIND(10) = ', selected_int_kind(10)
end program kind_int_types
