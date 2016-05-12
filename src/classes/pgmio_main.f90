program pgmio_main
  use pgmio_mod
  implicit none
! create one new object image
  type(Image)                                      :: m

  character(len=255)                               :: filename
  character(len=255)                               :: outputFormat

! get input filename and outputFormat

  call init(filename,outputFormat)

! Initialize m
  print*, 'Load Image'
  call m%load(filename, outputFormat)
! do something with m (here print a few values on screen and its type)
! (outputFormat)
  print*, 'Dump Image'
  call m%dump()
! clean image m
  print*, 'Clear Image'
  call m%clear()
  
CONTAINS
! Get filename and output format from arguments 
subroutine init(filename,typeOfImage)
 implicit none
  character(len=255), intent(out)                  :: filename
  character(len=255), intent(out)                  :: typeOfImage
 !// Holding the number of command line arguments
  INTEGER                                          :: argc

  argc = COMMAND_ARGUMENT_COUNT()

  if (argc == 2) THEN
    call get_command_argument(1,filename)
    call get_command_argument(2,typeOfImage)
    print*, 'filename to process...', trim(filename)
  else
    write(*,*) 'A filename is needed and choose output format (PGM or MATRIX)!'
    STOP
  endif
end subroutine init    
end program pgmio_main
