PROGRAM test_pgm_main
  USE  pgm_library

  integer,allocatable :: image(:,:)
  integer,allocatable :: newimage(:,:)
  character(len=255)  :: filearg(3)
  integer             :: i
  
  if (command_argument_count() /= 3) then
    write(*,*) 'Usage: ./test_pgm_main moon.pgm newmoon.pgm smallmoon.pgm'
  else
    do i=1,3
      call get_command_argument(i,filearg(i))
        enddo
 call read_pgm(filearg(1),image)
 write(0,*) 'size of my image: ', size(image,1), size(image,2)
 call write_pgm(filearg(2),image)
 call compress_pgm(image,3, newimage)
 call write_pgm(filearg(3),newimage)
 call free_pgm(image)
 call free_pgm(newimage)
 endif
END PROGRAM test_pgm_main

