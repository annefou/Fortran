program formatF_read

  implicit none
  integer :: ios
  real    :: x,y
  
  open( unit=1,                  &
        file = "formatF_read.in", &
        form="formatted",        &
        access = "sequential",   &
        status="old",            &
        action="read",           &
        position="rewind",       &
        iostat=ios )
  
  if ( ios .ne. 0 ) then
    print*," Cannot open file"
  else
    read( unit=1, fmt='(f4.1,f6.2)' ) x,y
    print*, x, y
    read( unit=1, fmt='(f4.1,f6.2)' ) x,y
    print*, x, y
  end if
  close( unit=1 )
  
end program formatF_read
