PROGRAM test_pgm_main
  USE  pgm_library

  integer,allocatable :: image(:,:)
  integer,allocatable :: newimage(:,:)

 call read_pgm(image)
 write(0,*) 'size of my image: ', size(image,1), size(image,2)
 call write_pgm(image)
 call compress_pgm(image,3, newimage)
 call write_pgm(newimage)
 call free_pgm(image)
 call free_pgm(newimage)
END PROGRAM test_pgm_main
