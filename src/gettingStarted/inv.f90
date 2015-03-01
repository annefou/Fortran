program inv
 implicit none

 real :: val

 write(*,*) 'Enter a non-zero real value: '
 read(*,*) val
 write(*,*) 'The value of 1/', val, ' is ', 1/val

end program inv
