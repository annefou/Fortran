module matrix_simple_mod
  implicit none

! define a new type mat_obj
  type mat_obj
    integer :: N=0
    integer :: M=0
    real, dimension(:,:), pointer :: A => null()
    contains 
     procedure :: create => createMat
     final     :: free
  end type mat_obj

CONTAINS

subroutine createMat(mat, N,M)
 implicit none
! create a new object mat of type mat_obj
 class(mat_obj), intent(inout)       :: mat
 integer, intent(in) :: N,M

print*, "create"
 mat%N=N
 mat%M=M
 print*, N,M
 allocate(mat%A(mat%N,mat%M))
!initialize mat with random numbers
 call random_number(mat%A)
! The matrix can be big so we 
! write 4 elements only mat%A(1,1),     mat%A(mat%N,1)
!                       mat%A(1,mat%M), mat(mat%N, mat%M)
 print*, mat%A( (/1,mat%N /), (/1, mat%M /) )
end subroutine createMat

subroutine free(mat)
 implicit none
! create a new object mat of tpye mat_obj
 type(mat_obj)       :: mat
 deallocate( mat%A )
end subroutine free
end module matrix_simple_mod
