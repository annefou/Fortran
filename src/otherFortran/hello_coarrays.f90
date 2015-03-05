program hello_coarrays
! compile
! ifort -coarray hello_coarrays.f90 -o hello_coarrays
!To run it:
! ./hello_coarrays
!Your output should be similar to this: 
! Hello from image     1 out of      8  total images
! Hello from image     6 out of      8  total images
! Hello from image     7 out of      8  total images
! Hello from image     2 out of      8  total images
! Hello from image     5 out of      8  total images
! Hello from image     8 out of      8  total images
! Hello from image     3 out of      8  total images
! Hello from image     4 out of      8  total images


  write(*,*) "Hello from image ", this_image(), &
              "out of ", num_images()," total images"

end program hello_coarrays
