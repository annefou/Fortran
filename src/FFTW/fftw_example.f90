program main

  implicit none

  integer, parameter              :: iounit=10 
  integer, parameter              :: thresh=255 
  integer ( kind = 4 )            :: nx 
  integer ( kind = 4 )            :: ny 
  integer                         :: i,j 
  integer ( kind = 4 )            :: seed

  real(kind=8), allocatable       :: img(:,:)
  character(len=1024)             :: myimage

  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) 'FFTW3_PRB'
  write ( *, '(a)' ) '  FORTRAN90 version'
  write ( *, '(a)' ) '  Test the FFTW3 library.'

  myimage = '../../data/antartica_glaciers_landsatwall.pgm'

  call pgmsize(myimage,nx,ny)
  print*, 'nx = ', nx, ' ny = ', ny
  allocate(img(nx,ny))
  call pgmread(myimage,img)

  call fft_example ( img )
  call pgmwrite('output.pgm', img)
  deallocate(img)
!
!  Terminate.
!
  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) 'FFTW3_PRB'
  write ( *, '(a)' ) '  Normal end of execution.'
  write ( *, '(a)' ) ' '

contains
!  Routine to get size of a PGM image
!  Note that this assumes a single line comment and no other white space

subroutine pgmsize(filename, nx, ny)

  integer :: nx, ny

  character*(*) :: filename
  character(len=1024) :: temp

  open(unit=iounit, file=filename)

  read(iounit,'(A)') temp
  read(iounit,'(A)') temp
!  read(iounit,*)
  read(iounit,*) nx, ny

  close(unit=iounit)

end subroutine pgmsize
!===========================================
!  Routine to read a PGM file into a 2D floating-point array x
!  Note that this assumes a single line comment and no other white space


subroutine pgmread(filename, x)

  character*(*) :: filename
  integer :: nx, ny, nxt, nyt
  real(kind=8), dimension(:,:) :: x

  integer i, j

  nx = size(x,1)
  ny = size(x,2)

  write(*,*) 'Reading ', nx, ' x ', ny, ' picture from file: ', filename

  open(unit=iounit, file=filename)

  read(iounit,*)
  read(iounit,*)
  read(iounit,*) nxt, nyt

  if (nx .ne. nxt .or. ny .ne. nyt) then
    write(*,*) 'datread: size mismatch, (nx,ny) = (', nxt, ',', nyt, &
               ') expected (', nx, ',', ny, ')'
    stop
  end if

  read(iounit,*)
  read(iounit,*) ((x(i,ny-j+1), i=1,nx), j=1,ny)

  close(unit=iounit)

end subroutine pgmread

!======================================================
!  Routine to write a PGM image file from a 2D floating-point array x
!  To cope with negative numbers we take the absolute value
!  Output values are scaled to lie between 0 and thresh

subroutine pgmwrite(filename, x)

  implicit none

  character*(*) :: filename
  integer :: nx, ny

  real(kind=8), dimension(:,:) :: x

  real(kind=8) :: tmin, tmax
 
 

  integer :: i, j

  nx = size(x,1)
  ny = size(x,2)

  write(*,*) 'Writing ', nx, ' x ', ny, ' picture into file: ', filename

  open(unit=iounit, file=filename)

  tmin = minval(abs(x(:,:)))
  tmax = maxval(abs(x(:,:)))
  if (tmin == tmax) tmin = tmax-1

  write(iounit,fmt='(''P2''/''# Written by pgmwrite'')')
  write(iounit,fmt='(i4, '' '', i4)') nx, ny

  write(iounit,*) int(tmax)
  write(iounit,fmt='(18(i3,'' ''))') ((int(x(i,ny-j+1)), i=1,nx), j=1,ny)

  close(unit=iounit)

end subroutine pgmwrite
!=====================================
subroutine fft_example (in )
!
  implicit none

  real(kind=8), intent(inout)       :: in(:,:)
  integer ( kind = 4 )              :: nx
  integer ( kind = 4 )              :: ny 
  integer ( kind = 4 )              :: nh

  include "fftw3.f"

  integer ( kind = 4 )              :: i, j
  real ( kind = 8 ), allocatable    :: in2(:,:)
  complex ( kind = 8 ), allocatable :: out(:,:)
  integer ( kind = 8 )              :: plan_backward
  integer ( kind = 8 )              :: plan_forward


  nx = size(img,1)
  ny = size(img,2)
  nh = (nx / 2 ) + 1

  allocate(in2(nx,ny))
  allocate(out(nh,ny))

  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) 'FFT'
  write ( *, '(a)' ) '  Demonstrate FFTW3 on a 2D real array'
  write ( *, '(a,i8)' ) '  NX = ', nx
  write ( *, '(a,i8)' ) '  NY = ', ny
  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  Transform data to FFT coefficients.'
  write ( *, '(a)' ) '  Backtransform FFT coefficients to recover'
  write ( *, '(a)' ) '  the data.'
  write ( *, '(a)' ) '  Compare recovered data to original data.'

  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  Input Data:'
  write ( *, '(a)' ) ' '

  do i = 1, nx, 100
    do j = 1, ny, 100
      write ( *, '(2x,i4,2x,i4,2x,g14.6)' ) i, j, in(i,j)
    end do
  end do
!
!  Make a plan for the FFT, and forward transform the data.
!
  call dfftw_plan_dft_r2c_2d ( plan_forward, nx, ny, in, out, FFTW_ESTIMATE )

  call dfftw_execute ( plan_forward )

  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  Output FFT Coefficients:'
  write ( *, '(a)' ) ' '

  print*, 'max real ', maxval(real(out))
  print*, 'max imaginary ', maxval(aimag(out))
  
!
!  Make a plan for the backward FFT, and recover the original data.
!
  call dfftw_plan_dft_c2r_2d ( plan_backward, nx, ny, out, in2, FFTW_ESTIMATE )

  call dfftw_execute ( plan_backward )

  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  Recovered input data divided by NX * NY:'
  write ( *, '(a)' ) ' '

  do i = 1, nx
    do j = 1, ny
       in(i,j) = in2(i,j) / real( nx * ny, kind= 8 )
    end do
  end do
!
!  Discard the information associated with the plans.
!
  call dfftw_destroy_plan_ ( plan_forward )
  call dfftw_destroy_plan_ ( plan_backward )

  deallocate(in2)
  deallocate(out)
  return
end subroutine fft_example
end program main
