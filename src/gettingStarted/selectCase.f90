program selectCase
  implicit none

  integer :: month, ndays, year
  logical :: leap_year

 print*, 'Enter a year'
 read*, year
 print*, 'Enter a month Enter a month (1-12)'
 read*, month

 if( ((year/4*4     .eq. year) .and. &
      (year/100*100 .ne. year)) .or. &
      (year/400*400 .eq. year) ) then
   leap_year = .true.
 else
   leap_year = .false.
 end if

 select case(month)
   case(4,6,9,11)
     ndays = 30
   case(1,3,5,7:8,10,12)
     ndays = 31
   case(2)
!----------------------------------
     fevrier: select case(leap_year)
       case(.true.)
         ndays = 29
       case(.false.)
         ndays = 28
     end select fevrier
!-----------------------------------
   case DEFAULT
     print*, 'Invalid month'
 end select

 print*, "There are ", ndays, " days in this month."

end program selectCase
