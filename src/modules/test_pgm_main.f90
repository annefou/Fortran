PROGRAM test_pgm_main
  USE  pgm_library

  integer,allocatable :: image(:,:)

 call read_pgm(image)
call write_pgm(image)
END PROGRAM test_pgm_main
