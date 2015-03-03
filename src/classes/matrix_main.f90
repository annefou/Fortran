program matrix_main
  use matrix_mod
  implicit none
! create one new object image
 type(pgmImage),pointer :: image

 !// Holding the number of command line arguments
  INTEGER                                          :: argc
  character(len=255)                               :: filename

  argc = COMMAND_ARGUMENT_COUNT()

  if (argc == 1) THEN
    call get_command_argument(1,filename)
    allocate(image)
    image = pgmImage()
    call image%load(filename)
    call image%dump()
    deallocate(image)
  else
    write(*,*) 'A filename is needed!'
  endif
 
end program matrix_main
