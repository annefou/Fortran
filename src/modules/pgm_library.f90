MODULE pgm_library
  implicit none

  character(len=255)  :: magics, comments
  integer             :: nx, ny, nmax, err


contains

subroutine read_pgm(img)
implicit none

  integer,allocatable, intent(out) :: img(:,:)
! read a PGM file
  read(*,*) magics
  read(*,*) comments
  read(*,*) nx,ny
  allocate(img(nx,ny), STAT=err)
  if (err /= 0) STOP
  read(*,*) nmax
  read(*,*) img
end subroutine read_pgm

subroutine write_pgm(img)
implicit none
  integer,allocatable, intent(inout) :: img(:,:)
  
! write a PGM file  
  write(*,'(a2)') magics
  write(*,'("# file created by test.f90")')
  write(*,*) nx,ny
  write(*,*) nmax
  write(*,*) img

  deallocate(img)
end subroutine write_pgm
! ./test.exe < ../../data/moon.pgm  > myfile.pgm 

END MODULE pgm_library
