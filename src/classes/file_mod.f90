!//
!///////////////////////////////////////////////////////////////////////////////

MODULE file_mod
  IMPLICIT NONE
  !// Make everything not specified as public invisible from outside the
  !// module
  INTEGER, PARAMETER                          :: d=8
  PRIVATE
  !// Declare a  type called file (to handle my printouts, logfile, performance analysis)
  TYPE, PUBLIC                                :: info
    !// Internal variables for this type
      integer                                 :: lun=10             ! unit used to write info
      character(len=256)                      :: filename="info.txt"
      logical                                 :: verbose=.TRUE.    ! write by default
  CONTAINS
    !// the procedures to print info
    PROCEDURE                                 :: open => openFileInfo
    PROCEDURE                                 :: loginfo => printFileInfo
    FINAL                                     :: closeFileInfo
  END TYPE info

  !// A child object 
  TYPE, PUBLIC, EXTENDS(info)                 :: timing    
      INTEGER, DIMENSION(2)                   :: ELA_tim
      REAL(kind=d), DIMENSION(2)              :: CPU_tim

      INTEGER, DIMENSION(8)                   :: values
      CHARACTER(LEN=8), DIMENSION(2)          :: date
      CHARACTER(LEN=10), DIMENSION(2)         :: time
      CHARACTER(LEN=5)                        :: zone
 
      CONTAINS

      PROCEDURE                               :: TIMING_start => TIMING_start
      PROCEDURE                               :: TIMING_stop  => TIMING_stop
      
      PROCEDURE                               :: loginfo => printTimingInfo
  END TYPE timing

CONTAINS

  SUBROUTINE openFileInfo(this, filename, verbose)
    !// A polymorphic object
    CLASS(info)                              :: this
    character(len=*), intent(in)             :: filename
    logical, intent(in), optional            :: verbose
    integer                                  :: err
    logical                                  :: is_opened
  
    if (present(verbose)) this%verbose=verbose
    do 
      inquire(unit=this%lun, OPENED=is_opened)
      if (.not. is_opened) exit
      this%lun = this%lun+1    ! take the next available unit
    enddo
    OPEN(UNIT=this%lun, FILE = filename, FORM='formatted', IOSTAT=err)
    if (err /= 0) STOP

  END SUBROUTINE openFileInfo

  SUBROUTINE closeFileInfo(this)
    !// A polymorphic object
    TYPE(info)                               :: this
    integer                                  :: err

    CLOSE(UNIT=this%lun, IOSTAT=err)
    if (err /= 0) STOP

  END SUBROUTINE closeFileInfo

  !// A common subroutine to print information
  SUBROUTINE printFileInfo(this, message)
    !// A polymorphic object
    CLASS(info)                              :: this
   
    character(len=*), intent(in)             :: message
    logical                                  :: is_opened
    
    if (this%verbose) then
       inquire(unit=this%lun, OPENED=is_opened)   
       if (.not. is_opened) then
         call this%open(this%filename)
       endif
       write(this%lun,*) trim(message)    
    endif

  END SUBROUTINE printFileInfo
 
  !// A specific subroutine to print information
  SUBROUTINE printTimingInfo(this, message)
    !// A polymorphic object
    CLASS(timing)                            :: this
   
    logical                                  :: is_opened
    character(len=*), intent(in)             :: message
    
    if (this%verbose) then
       inquire(file=this%filename, OPENED=is_opened)   
       if (.not. is_opened) then
         call this%open(this%filename)
       endif
       
       write(this%lun,*) 'printTimingInfo'           
       
    endif

  END SUBROUTINE printTimingInfo      

  !// A specific subroutine to print information
  SUBROUTINE TIMING_start(this)
    !// A polymorphic object
    CLASS(timing)                              :: this

        !... Local variables
    INTEGER :: dummy, ir
    CALL DATE_AND_TIME(this%date(1),this%time(1),this%zone,this%values)

    !... Compute CPU time 
    CALL CPU_TIME(this%CPU_tim(1))
    !... Compute Elapsed time 
    CALL SYSTEM_CLOCK(COUNT=this%ELA_tim(1))
  END SUBROUTINE TIMING_start

  SUBROUTINE TIMING_stop(this)

    !// A polymorphic object
    CLASS(timing)                              :: this

    !... Local variables
    INTEGER            :: i, ir, length, u=6
    LOGICAL            :: file_opened
    REAL(kind=d)       :: ELA_proc, CPU_proc
    CHARACTER(LEN=256) :: prologue,epilogue,proc_tab_label,proc_tab_2hline,&
                          proc_tab_fmt
    LOGICAL            :: is_opened

    CALL CPU_TIME(this%CPU_tim(2))
    CALL SYSTEM_CLOCK(count=this%ELA_tim(2), count_rate=ir)


    ELA_proc=(REAL(this%ELA_tim(2),kind=d) - REAL(this%ELA_tim(1),kind=d)) &
             / REAL(ir,kind=d) 
    CPU_proc = this%CPU_tim(2) -  this%CPU_tim(1) 

    !... End of timings on "date & time"
    CALL DATE_AND_TIME(this%date(2),this%time(2),this%zone,this%values)

    !... Output Format
    prologue       ='(//,5X,"Copyright (C) 2015, UIO"/)'
    proc_tab_label ='(5X,"Process CPU Time (s)",(" "),"|",(" "),"Process Elapsed Time (s)",(" "))'
    proc_tab_2hline='(5X,21("="),"|",26("="))'
    proc_tab_fmt   ='(5X,3(" "),F12.3,6(" "),"|",4(" "),F12.3,10(" "),5(" "),F7.3)'
    epilogue       ='(/,5X,"Started on ",2(A2,"/"),A4," at ",2(A2,":"),A2," MET ",A3,":",A2," from GMT",/,&
                                   &5X,"Stopped on ",2(A2,"/"),A4," at ",2(A2,":"),A2," MET ",A3,":",A2," from GMT",/)'
    inquire(file=this%filename, OPENED=is_opened)  
    if (.not. is_opened) then
         call this%open(this%filename)
    endif
    WRITE(UNIT=this%lun,FMT=TRIM(prologue)) 
    WRITE(UNIT=this%lun,FMT=TRIM(proc_tab_label))
    WRITE(UNIT=this%lun,FMT=TRIM(proc_tab_2hline))
    
    WRITE(UNIT=this%lun,FMT=TRIM(proc_tab_fmt)) CPU_proc, ELA_proc
    WRITE(UNIT=this%lun,FMT=TRIM(proc_tab_2hline))
    WRITE(UNIT=this%lun,FMT=TRIM(epilogue)) this%date(1)(7:8), this%date(1)(5:6), this%date(1)(1:4), &
                                     this%time(1)(1:2), this%time(1)(3:4), this%time(1)(5:6), &
                                     this%zone(1:3),    this%zone(4:5),                  &
                                     this%date(2)(7:8), this%date(2)(5:6), this%date(2)(1:4), &
                                     this%time(2)(1:2), this%time(2)(3:4), this%time(2)(5:6), &
                                     this%zone(1:3),    this%zone(4:5)
  END SUBROUTINE TIMING_stop
   
   
END MODULE file_mod
