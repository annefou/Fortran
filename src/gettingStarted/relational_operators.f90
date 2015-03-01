program relational_operators
implicit none

 integer           :: i1,i2
 real              :: r1,r2
 double precision  :: d1,d2
 complex           :: cplx1,cplx2
 character(len=50) :: ch1
 character(len=12) :: ch2

 NAMELIST /inputs/ i1,i2,r1,r2,d1,d2,cplx1,cplx2, ch1, ch2

! Read input values from a namelist called relational_operators.nml

 open(unit=1, file='relational_operators.nml',status='old')
 READ(unit=1,NML=inputs)
 close(unit=1)

! write namelist to standard output
 write(*,NML=inputs)

! relational operators:

! For integers
 write(*,*) 'i1 < i2 ', i1 .lt. i2, i1 < i2
 write(*,*) 'i1 <= i2 ', i1 .le. i2, i1 <= i2
 write(*,*) 'i1 > i2 ', i1 .gt. i2, i1 > i2
 write(*,*) 'i1 >= i2 ', i1 .ge. i2, i1>=i2
 write(*,*) 'i1 == i2 ', i1 .eq. i2, i1==i2
 write(*,*) 'i1 /= i2 ', i1 .ne. i2, i1/=i2
 write(*,*)
! For real and integers
! when mixing reals and integer, integers are first converted to reals
 write(*,*) 'r1 < i2 ', r1 .lt. i2, r1 < i2
 write(*,*) 'i1 <= r2 ', i1 .le. r2, i1 <= r2
 write(*,*) 'r1 > i2 ', r1 .gt. i2, r1 > i2
 write(*,*) 'i1 >= r2 ', i1 .ge. r2, i1>=r2
 write(*,*) 'r1 == i2 ', r1 .eq. i2, r1==i2
 write(*,*) 'r1 /= r2 ', r1 .ne. r2, r1/=r2
 write(*,*)
! COMPLEX values can only use == and /=
 write(*,*) 'cplx1 == cplx2 ', cplx1 .eq. cplx2, cplx1==cplx2
 write(*,*) 'cplx1 /= cplx2 ', cplx1 .ne. cplx2, cplx1/=cplx2
 write(*,*)
! CHARACTERS can only be compared with CHARACTERS
 write(*,*) 'ch1 < ch2 ', ch1 .lt. ch2, ch1 < ch2
 write(*,*) 'ch1 <= ch2 ', ch1 .le. ch2, ch1 <= ch2
 write(*,*) 'ch1 > ch2 ', ch1 .gt. ch2, ch1 > ch2
 write(*,*) 'ch1 >= ch2 ', ch1 .ge. ch2, ch1>=ch2
 write(*,*) 'ch1 == ch2 ', ch1 .eq. ch2, ch1==ch2
 write(*,*) 'ch1 /= ch2 ', ch1 .ne. ch2, ch1/=ch2
end program relational_operators
