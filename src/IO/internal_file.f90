PROGRAM internal_file

  IMPLICIT NONE
  CHARACTER(len=80) rec
  INTEGER           ios
  REAL              x, y, z
  NAMELIST/list/   x, y, z

  OPEN( UNIT=1,           FILE="internal_file.in", &
        FORM="formatted", ACTION="read",             &
        STATUS="old",     POSITION="rewind",         &
        IOSTAT=ios )
  IF ( ios /= 0 ) STOP 4
  READ( UNIT=1, FMT='(a)', IOSTAT=ios ) rec
  DO WHILE( ios == 0 )
    IF ( VERIFY( rec, &
                 " +-0123456789.eEdD" ) == 0 ) THEN
      READ( rec, FMT=*, iostat=ios ) x, y, z
      WRITE( UNIT=*, NML=list )
    END IF
    READ( UNIT=1, FMT='(a)', iostat=ios ) rec
  END DO
  CLOSE( UNIT=1 )

END PROGRAM internal_file
