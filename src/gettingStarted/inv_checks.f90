program inv
 implicit none
! by convention we define a MISSING value
 real, parameter   :: MISSING = -2147483647.0 
 character(len=32) :: arg
 logical           :: ltests = .FALSE.
 real              :: val
 
 if (command_argument_count() > 0) then
! We assume one argument only (ignore other arguments)
   call get_command_argument(1, arg)  
   if (trim(arg) == '-t' .OR. trim(arg) == '--tests' &
       .OR. trim(arg) == '--test') then
       LTESTS=.TRUE.
   else
     write(*,*) 'Error: program argument', trim(arg), &
                ' is unknown'
     call usage
     STOP
   end if
 endif

 if (LTESTS) then
   print*, 'Running test suite'
   call runTests
 else
   write(*,*) 'Enter a non-zero real value: '
   read(*,*) val
   write(*,*) 'The value of 1/', val, ' is ', runProg(val)
 endif

contains
!*************************************************
! print the usage of this program
!
 subroutine usage
   implicit none
   character(len=100) :: progName 

   CALL get_command_argument(0, progName)
   write(*,*) 'usage: ', trim(progName), ' [-t | --test | --tests] '

 end subroutine usage
!*************************************************
! Compute 1/x 
!
 real function runProg(val) 
   implicit none

   real, intent(in) :: val

! Check val and set result to MISSING if null
  if (val== 0.0) then 
   runProg = MISSING
  else
   runProg = 1/val
  endif

 end function runProg
!*************************************************
! Run tests for different predefined values
!
subroutine runTests
  implicit none

  real, parameter  :: EPS=1e-7
  real                         :: val, res
  character(len=32)            :: str

! Test code for 0 
  val=0.0
  res=runProg(val)
  
  if (res == MISSING) then
    print*, 'Test-1 OK'
  else
    print*, 'Test-1 FAILED'
  endif
! Test code for huge values
  val=huge(val)
  res=runProg(val)
  if ( res >=-EPS .and. res <= EPS) then
    print*, 'Test-2 OK'
  else
    print*, 'Test-2 FAILED'
  endif
! Test code for known values
  val = 4.
  res= runProg(val)
  if (res /= 0.25) then
    print*, 'Test-3 FAILED'
  else
    print*, 'Test-3 OK'
  endif
! Test for 3
  val= 3.0
  res= runProg(val)
  if (res >= 1./3.0 -EPS .AND. res <= 1/3. + EPS) then
    print*, 'Test-4 OK'
  else
    print*, 'Test-4 FAILED'
  endif
 end subroutine runTests

end program inv
