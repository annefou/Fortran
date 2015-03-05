program command_line
  implicit none
  character(len=:), allocatable :: arg
  integer long, i

  do i=0, COMMAND_ARGUMENT_COUNT()
    call GET_COMMAND_ARGUMENT( NUMBER=i, LENGTH=long )
    allocate( character(len=long) :: arg )
    call GET_COMMAND_ARGUMENT( NUMBER=i, VALUE=arg )
	! argument 0 is the name of the program
	! user argument starts from 1
    print *,"Argument number ", i, ": ", arg
    deallocate( arg )
  end do
end program command_line
