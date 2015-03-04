
program matrix_main
  use matrix_mod
  implicit none
! create one new object image
 type(matrix),pointer     :: m
 type(pgmImage),pointer   :: image

 !// Holding the number of command line arguments
  INTEGER                                          :: argc
  character(len=255)                               :: filename
  character(len=255)                               :: typeOfImage

  argc = COMMAND_ARGUMENT_COUNT()

  if (argc == 2) THEN
    call get_command_argument(1,filename)
    call get_command_argument(2,typeOfImage)
    
    SELECT CASE(typeOfImage)
     CASE('PGM')
      allocate(image)
      image = pgmImage()
      call image%load(filename) ! not need to pass 'this' argument
      call image%dump()
      deallocate(image)
     CASE('MATRIX') 
      allocate(m)
      m = matrix()
      call m%load(filename)
      call m%dump()
      deallocate(m)
      
    END SELECT
  else
    write(*,*) 'A filename is needed!'
  endif
 
end program matrix_main
