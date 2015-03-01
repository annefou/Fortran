program if_and_logical_operators
  implicit none

  INTEGER, PARAMETER :: rk = SELECTED_REAL_KIND(6,37)
  real(kind=rk)      :: salinity


! Read salinity value in ppt from user
  write(*,*) 'Enter salinity in ppt'
  read(*,*) salinity

! Classification according to the salinity value
  IF (SALINITY .LT. 0.) THEN
    WRITE(*,*) 'INVALID SALINITY VALUE'
  ELSE IF (SALINITY .LT. 0.5) THEN
    WRITE(*,*) 'FRESHWATER'
  ELSE IF (SALINITY .LT. 30) THEN
    WRITE(*,*) 'BRACKFISH WATER'
  ELSE IF (SALINITY .LT. 50) THEN
    WRITE(*,*) 'SALINE WATER'
  ELSE 
    WRITE(*,*) 'BRINE WATER'
  ENDIF

end program if_and_logical_operators
