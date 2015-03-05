program namelist

  implicit none
  integer ios
  integer i/100/, &
          j/200/, &
          k/300/
  integer t(3)
  character(len=11) ch
  NAMELIST/LIST/ i, j, k, t, ch
  
  
  open( unit=1,                &
        file="namelist.in",    &
        form="formatted",      &
        access="sequential",   &
        status="old",          &
        action="read",         &
        position="rewind",     &
        iostat=ios )
  
  open( unit=2,                &
        file="namelist.out",   &
        form="formatted",      &
        access="sequential",   &
        status="new",          &
        action="write",        &
        position="rewind",     &
        iostat=ios )
  
  read ( unit=1, nml=list )
  write( unit=2, nml=list )
  
  close( unit=1 )
  close( unit=2 )

end program namelist