program logical_operators
  implicit none

  INTEGER, PARAMETER :: rk = SELECTED_REAL_KIND(6,37)
  real(kind=rk)      :: temperature
  logical            :: good_data
  logical            :: user_quality_flag


! Read temperature from user
  write(*,*) 'Enter temperature in degrees celsius'
  read(*,*) temperature
! We asked user for quality control 
  write(*,*) 'A temperature of ', temperature, &
             ' degrees Celsius is realistic in January in Oslo (Enter T or F) '
  read(*,*) user_quality_flag

! Quality control: combination of data checks and user quality flag
! Here we trust users...
  WRITE(*,*) 'Good data? (T if good, F is bad) ', &
                           ((temperature > -50) .AND. &   
                            (temperature < 20) .AND.  &
                             user_quality_flag) 
end program logical_operators
