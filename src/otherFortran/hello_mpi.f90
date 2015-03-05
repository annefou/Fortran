! MPI example (Distributed memory)
! module load openmpi-x86_64
! mpif90 hello_mpi.f90 -o hello_mpi
! To execute it on 4 processors:
! mpirun -np 4 ./hello_mpi
program hello_mpi
   implicit none
   include 'mpif.h'
   integer  ::  rank, size, ierror, tag
   integer  ::  status(MPI_STATUS_SIZE)
   
   call MPI_INIT(ierror)
   call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierror)
   call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror)
   print*, 'node', rank, ': Hello world'
   call MPI_FINALIZE(ierror)
end program hello_mpi
