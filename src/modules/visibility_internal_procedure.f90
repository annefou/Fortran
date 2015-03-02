program main
  implicit none
  integer            :: N, err
  real, allocatable  :: x(:)
  external           :: subOutside

  print*, 'Enter an integer N'
  read*, N
  allocate(x(N), STAT=err)
  if (err /= 0 ) STOP
  call random_number(x)

  print*, 'Processing x...', process()

  call printX(x)

  call subOutside(x,N)
  deallocate(x)
  contains
  logical function process()
! in this function N and X can be accessed directly
! Please not that this method is not recommended:
! it would be better to pass X as an argument of process
    implicit none

    if (sum(x) > 5.) then
       process = .FALSE.
    else
       process = .TRUE.
    endif 
  end function process
! 
  subroutine printX(x)
    implicit none
    real, intent(in)  :: x(:) ! x is defined as part of main
                              ! so its size and shape is known
    
    integer           :: j 

    print*, 'size of x ', size(x)
    do  j=1,size(x)
      print*, 'x(',j,') = ', x(j)
    enddo
  end subroutine printX
end program main
