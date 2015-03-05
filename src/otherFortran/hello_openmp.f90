program hello_parallel  
! to compile this code
! gfortran -fopenmp hello_parallel.f90
use OMP_LIB  ! Fortran library for parallel OpenMP execution   
implicit none
  integer   :: nprocs,myproc    
  
!$OMP PARALLEL   PRIVATE(myproc)   
myproc = OMP_GET_THREAD_NUM()
write(*,*)'ID: ', myproc, 'hello world'

nprocs = OMP_GET_NUM_THREADS()
if (myproc == 0) write(*,*) 'There are ', nprocs, ' for this program'
!$OMP END PARALLEL      
end program hello_parallel
