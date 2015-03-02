program degtest
  implicit none
  intrinsic asin, acos, atan

  write(*,*) 'arcsin(0.5) : ', deg(ASIN, 0.5)
  write(*,*) 'arccos(0.5) : ', deg(ACOS, 0.5)
  write(*,*) 'arctan(1.0) : ', deg(ATAN, 1.0)

CONTAINS
  REAL function deg(f,x)
    implicit none
    
    intrinsic atan
    REAL, EXTERNAL :: f
    REAL, INTENT(IN) :: x

    deg = 45*f(x) / ATAN(1.0)
  end function deg 
end program degtest
