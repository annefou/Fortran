MODULE pgm_library
! my module is called pgm_library and
! my source file is called pgm_library.f90
! it is not mandatory to do so but it helps
! when you need to search for a module within 
! a large set of files
  implicit none
! try to avoid defining global variable...

CONTAINS

subroutine read_pgm(img)
implicit none
  
  integer,allocatable, intent(out) :: img(:,:)
  
  integer             :: nx, ny, nmax, err
! read a PGM file
! do not need to save what I read as I won't use this information
  read(*,*) 
  read(*,*) 
  read(*,*) nx,ny
  allocate(img(nx,ny), STAT=err)
  if (err /= 0) STOP
  read(*,*) nmax
  read(*,*) img
end subroutine read_pgm
!----------------------------------------
subroutine write_pgm(img)
implicit none

  character(len=2)    :: magics
  character(len=100)  :: comments
  integer             :: nx, ny, nmax, err
  integer, intent(in) :: img(:,:)
  
  nx = size(img,1)
  ny = size(img,2)
  nmax = maxval(img)
! write a PGM file  
  write(*,'("P2")') 
  write(*,'("# file created by test.f90")')
  write(*,*) nx,ny
  write(*,*) nmax
  write(*,*) img

end subroutine write_pgm
!----------------------------------------
subroutine compress_pgm(img,step, small)
implicit none
  integer, intent(in)               :: img(:,:)
  integer, intent(in)               :: step
  integer, allocatable, intent(out) :: small(:,:)
  
  integer                           :: nx,ny, nxs, nys, err
  
  ! size of main image
  nx = size(img,1)
  ny = size(img,2)
  ! compute size of the reduced image (small)
  nxs = size(img(1:nx:step,:),1)
  nys = size(img(:,1:ny:step),2)
  
  allocate(small(nxs,nys), stat=err)
  if (err /= 0) STOP "Error when allocatin small"
  
  small(:,:) = img(1:nx:step,1:ny:step)
  
end subroutine compress_pgm
!----------------------------------------
subroutine free_pgm(img)
implicit none
  integer,allocatable, intent(inout) :: img(:,:)
  
  if (allocated(img)) deallocate(img)
end subroutine free_pgm
END MODULE pgm_library

