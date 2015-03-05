program text_sequential

  implicit none
  real, dimension(10)  :: tab = 5
  integer              :: i = 100
  real                 :: r 
  integer              :: ios
  
  
  r = acos(-1.)
  open( unit=1,                        &
        file = "text_sequential.out", &
        form="formatted",              &
        access = "sequential",         &
        status="new",                  &
        action="write",                &
        position="rewind",             &
        iostat=ios )
  
  if ( ios .ne. 0 ) then
    print*,"Cannot open file"
  else
    write( unit=1, fmt='(10F8.4,I3,F6.3)' ) tab, i, r
  end if
  
  close( unit=1 )

end program text_sequential
