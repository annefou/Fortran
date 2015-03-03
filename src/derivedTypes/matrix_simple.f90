program matrix_simple
  implicit none

! define a new type mat_obj
  type mat_obj
    integer :: N,M
    real, dimension(:,:), allocatable :: A
  end type mat_obj

! create a new object mat of tpye mat_obj
 type(mat_obj) :: mat

 print*, 'Enter matrix dimension N,M: '
 read*, mat%N, mat%M
 allocate(mat%A(mat%N,mat%M))
!initialize mat with random numbers
 call random_number(mat%A)
! The matrix can be big so we 
! write 4 elements only mat%A(1,1),     mat%A(mat%N,1)
!                       mat%A(1,mat%M), mat(mat%N, mat%M)
 print*, mat%A( (/1,mat%N /), (/1, mat%M /) )
 deallocate( mat%A )
end program matrix_simple
