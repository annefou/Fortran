program formatF_write

  implicit none
  integer          :: ios
  double precision :: x,y,z
  
  x =   3.14159d0
  y = -15.137d0
  z = 799.7432d0
  
  open( unit=1,                   &
        file="formatF_write.out",   &
        form="formatted",         &
        access="sequential",      &
        status="new",             &
        action="write",           &
        position="rewind",        &
        iostat=ios )
  
  if ( ios .ne. 0 ) then
    print*,"Cannot open file"
  else
   write( unit=1, fmt='(f7.5,f8.3,f9.4)' )  x,y,z
   write( unit=1, fmt='(f6.2,f9.4,f10.5)' ) x,y,z
  end if
  
  close( unit=1 )
  
end program formatF_write
