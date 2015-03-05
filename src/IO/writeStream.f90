program writeStream
  real    :: x
  integer :: i
  integer :: ios

  open( UNIT=1,        FILE="test.data", ACCESS="stream", &
        ACTION="write", FORM="unformatted" )
  do i=1,10
    x=i*log10(real(i))
    write( unit=1, iostat=ios ) x
    if ( ios /= 0 ) exit
  end do
  close( unit=1 )
end program writeStream
