program formatA_write

  implicit none
  integer          :: ios
  character(len=9) :: ch1, ch2, ch3
  
  open( unit=1,                   &
        file="formatA_write.out",   &
        form="formatted",         &
        access="sequential",      &
        status="new",             &
        action="write",           &
        position="rewind",        &
        iostat=ios )
  
  if ( ios .ne. 0 ) then
    print*," Cannot open file"
  else
   ch1 = "We"
   ch2 = "don't like"
   ch3 = "Fortran"
  
   write( unit=1, fmt='(a9,a8,a6,a)' ) ch1,ch2,ch3,ch3
   write( unit=1, fmt='(a10)' )        ch3
  
   ch1 = "we"
   ch2 = " like"
   ch3 = "Fortran"
   write(unit=1,fmt='(A,A,A,A)') trim(ch1),trim(ch2),' ', ch3
  end if
  
  close( unit=1 )
  
end program formatA_write
