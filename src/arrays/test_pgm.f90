program test_pgm
  implicit none
  integer, parameter :: nx=347, ny=289
  integer            :: img(nx,ny)
  integer            :: nxt, nyt ! true values
  
  integer            :: i, j, tmax
  
  read(*,*)
  read(*,*)
  read(*,*) nxt, nyt
  
  ! check if size is OK
  if (nx /= nxt .or. ny /= nyt) then
    write(*,*) 'read: size mismatch, (nx,ny) = ', nxt, ',', nyt, &
	    ') expected (', nx, ',', ny, ')'
	STOP
  endif
  read(*,*)
  read(*,*) ((img(i,ny-j+1),i=1,nx), j=1,ny)
  
  ! we just write our file back
  nxt = size(img,1)
  nyt = size(img,2)
  
  tmax = maxval(img(:,:))
  
  write(*,fmt='(a2)') 'P2'
  write(*,'("# written by test_pgm_sections")')
  write(*,*) nxt, nyt
  write(*,*) tmax
  write(*,*) ((img(i,nyt-j+1),i=1,nxt), j=1,nyt)
  
end program test_pgm
