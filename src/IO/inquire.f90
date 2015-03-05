program inquire

  implicit none
  logical           :: exist
  integer           :: ios
  character(len=3)  :: form
  character(len=10) :: access

  inquire( FILE = "inquire.in", EXIST=exist )
  if ( exist ) then
    open( UNIT=1,            &
          FILE="inquire.in", &
          POSITION="rewind", &
          ACTION="read",     &
          IOSTAT=ios )

    if ( ios /= 0 ) then
      print*, "Cannot open inquire.in"
    else
      inquire( UNIT=1,         &
               FORMATTED=form, &
               ACCESS=access )
      print*, "FORMATTED = ", form, ", ACCESS = ", access
    end if
    close( unit=1 )
  end if

end program inquire