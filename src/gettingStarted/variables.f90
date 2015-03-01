program variables
!
!
! Demonstrate some properties of variables
!
!

  implicit none

  integer         :: i
  integer(kind=2) :: j
  integer(kind=4) :: k
  integer(kind=8) :: l

  real            :: a
  real(kind=4)    :: b
  real(kind=8)    :: c

write (*,*) 'Huge:   ',huge(i),huge(j),huge(k),huge(l)
write (*,*) 'Digits: ',digits(i),digits(j),digits(k),digits(l)

write (*,*) ''

write (*,*) 'Huge:   ',huge(a),huge(b),huge(c)
write (*,*) 'Digits: ',digits(a),digits(b),digits(c)
write (*,*) 'Epsilon: ',epsilon(a),epsilon(b),epsilon(c)

end program variables
