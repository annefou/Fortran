program tell_read

  implicit none
  integer          :: ios
  character(len=2) :: magics
  integer          :: dimX, dimY, maxV
  integer          :: offset
  
  open( unit=1,                  &
        file = "../../data/landsat8_pansharpended_1nov2014_trentino.pgm", &
        form="formatted",        &
        access = "sequential",   &
        status="old",            &
        action="read",           &
        position="rewind",       &
        iostat=ios )
  
  if ( ios .ne. 0 ) then
    print*," Cannot open file"
  else
    read( unit=1, fmt='(a2)' ) magics
    print*, 'magics: ', magics
    read( unit=1, fmt=* ) dimX, dimY
    print*, dimX, dimY
    read( unit=1, fmt='(i10.1)' ) maxV
    print*, maxV
! Retrieves the current position within an open file. 
    call ftell(1,offset)
    print*, 'current offset is', offset
  end if
  close( unit=1 )
  
end program tell_read
