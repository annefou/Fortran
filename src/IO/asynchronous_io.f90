PROGRAM asynchronous_io
! Both input and output I/O can be asynchronous i.e.:
! you can write (or read) in a file and at the same time
! do something else (for instance call a subroutine)
! This way you can overlap computation and I/O and improve the
! performance of your code
  implicit none
  INTEGER :: id
  REAL :: A(1000000), B(1000)
  OPEN (10, file="asynchronous_io.out", asynchronous='yes', form="unformatted")
  WRITE (10, id=id, asynchronous='yes') A
  CALL do_something_with( B)
  WAIT (10, id=id) ! Blocks until A read in
  CLOSE (10)
  CALL do_something_with( A)

CONTAINS
  SUBROUTINE do_something_with(vector)
    implicit none
    real, dimension(:) :: vector

    call random_number(vector)
  END SUBROUTINE do_something_with
END PROGRAM asynchronous_io
