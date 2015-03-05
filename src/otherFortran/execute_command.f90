program execute_command
implicit none
integer :: exit_stat, command_stat

call execute_command_line('ls -al', .TRUE., exit_stat, command_stat)
! exit_stat contains the integer exit code of the command, as returned by system. 
!command_stat is set to zero if the command line was executed (whatever its exit status was). 

if (estat /=0) then
   write(*,'(A)') "Error command has not completed successfully"
  STOP
endif
end program execute_command
