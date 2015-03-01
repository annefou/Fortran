program array_count
  implicit none
  integer                           :: i
  character(len=1), dimension(10)   :: tab_char
  character(len=1), dimension(10)   :: tab_char_noA
  logical,dimension(10)             :: m
  integer                           :: noA


  do i=1,10
    print*, 'Enter 1 character:'
    read*, tab_char(i)
  enddo

  print*, 'You have entered: ', tab_char
  m(:) = tab_char(:) /= 'a'

  noA = count(mask=m(:))
 print*, noA
  tab_char_noA(:noA) = pack(array=tab_char(:),mask=m(:))

  print*,"and after we removed 'a' from your string: ",tab_char_noA
end program array_count

