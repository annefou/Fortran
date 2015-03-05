module  elemental_procedure
  implicit none
contains
  elemental real function f(x,y)
    real, intent(in) :: x,y
    f = sqrt(x**2 + y**2)
  end function f
end module elemental_procedure
