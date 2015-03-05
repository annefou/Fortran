program text_direct

  implicit none
  real, dimension(100) :: tab
  integer              :: ios, n

  OPEN( UNIT=1,                  &
        FILE="text_direct.in1", &
        ACCESS="direct",         &
        FORM="formatted",        &
        ACTION="read",           &
        STATUS="old",            &
        RECL=800,                &
        IOSTAT=ios )

  if ( ios /= 0 ) then ! Problem when opening file
    print*, "Cannot open text_direct.in1"
  else 
    OPEN( UNIT=2,                  &
          FILE="text_direct.in2", &
          ACTION="read",           &
          STATUS="old",            &
          IOSTAT=ios )

    if ( ios /= 0 ) then ! Problem when opening file
      print*, "Cannot open text_direct.in2"
    else
      read( unit=2, fmt=* ) n
      read( unit=1, rec=n, fmt='(100F8.4)', iostat=ios ) tab
      if ( ios > 0 ) then ! Problem when reading file
        print '(a,i0,/,a)', "Error when processing &
                            &record RECL", n, &
                            "    ==> Maybe it does not exist!"
      else
        print '(F8.4)', tab(1:100:49)
      end if
    end if
    close( unit=2 )
  end if
  close( unit=1 )

end program text_direct
