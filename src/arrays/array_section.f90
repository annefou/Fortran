program array_section
  implicit none
 
 REAL(kind=8) :: A( 10,10)
 INTEGER      :: p3D(15,15,15)

 ! Initialization
 A = 0.0d0
 p3D = 0
 
 ! array sections
 A(2:5,3:7:2) = 4.0d0
 p3D(12:15,5:8,1:15:8) = 4837

 print*, 'A = ', A
 print*, 'p3D = ', p3D
  
end program array_section

