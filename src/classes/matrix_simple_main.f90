program matrix_simple_main
  USE matrix_simple_mod
  implicit none

! create a new object mat of tpye mat_obj
 type(mat_obj) :: mat
 integer       :: N,M

 print*, 'Enter matrix dimension N,M: '
 read*, N, M
 call mat%create(N,M)
! free needs to be called manually 
! (no destructor is called at the termination of a program)
call mat%free()
end program matrix_simple_main
