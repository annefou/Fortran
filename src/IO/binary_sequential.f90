program binary_sequential

  implicit none
  real, dimension(100) :: tab
  integer              :: i = 100
  real                 :: r 
  integer              :: ios
  
  
  r = acos(-1.)
  !generate a binary file
  open( unit=1,                         &
        file = "binary_sequential.in", &
        form="unformatted",             &
        access = "sequential",          &
        action="write",                  &
        position="rewind",              &
        iostat=ios )
  
  if ( ios .ne. 0 ) then
    print*," Cannot open file"
  else
    write( unit=1 ) tab, i, r
  end if
  
  close( unit=1 )
  
  ! Read the generated file
  open( unit=1,                         &
        file = "binary_sequential.in", &
        form="unformatted",             &
        access = "sequential",          &
        action="read",                  &
        position="rewind",              &
        iostat=ios )
  
  if ( ios .ne. 0 ) then
    print*," Cannot open file"
  else
    read( unit=1 ) tab, i, r
    print*, tab(1:100:49), i, r
  end if
  
  close( unit=1 )

end program binary_sequential
