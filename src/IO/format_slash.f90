program format_slash

  implicit none
  integer          :: ios
  integer          :: i,j
  character(len=9) :: ch1, ch2, ch3
  
  open( unit=1,                   &
        file="format_slash.in",   &
        form="formatted",         &
        access="sequential",      &
        status="old",             &
        action="read",            &
        position="rewind",        &
        iostat=ios )
  
  if ( ios .ne. 0 ) then
    print*," Cannot open file"
  else
    read( unit=1, fmt='(i4,/,i4)' ) i, j
    print*, i, j
  end if
  close( unit=1 )
  
  open( unit=1,                    &
        file="format_slash.out",   &
        form="formatted",          &
        access="sequential",       &
        status="new",              &
        action="write",            &
        position="rewind",         &
        iostat=ios )
  
  if ( ios .ne. 0 ) then
    print*," Cannot open file"
  else
    ch1 = "Ludwig"
    ch2 = " Van"
    ch3 = "BEETHOVEN"
  
    write( unit=1, fmt='("Name    : ", A,/,"First Name : ",A,A)' ) &
           ch3, trim(ch1), trim(ch2)
  end if
  
  close( unit=1 )
  
end program format_slash