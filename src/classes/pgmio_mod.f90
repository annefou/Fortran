!//
!///////////////////////////////////////////////////////////////////////////////

MODULE pgmio_mod
  IMPLICIT NONE
  !// Make everything not specified as public invisible from outside the
  !// module
  PRIVATE
  !// Declare a  type called matrix
  TYPE, PUBLIC                                :: matrix
    !// Internal variables for this type
    INTEGER                                   :: nx = 0
    INTEGER                                   :: ny = 0
    INTEGER, POINTER                          :: A(:, :) => null()
  CONTAINS
    !// the procedures to load data, to write data to the screen,
    !// to clear the contents of an object and to copy data from one object
    !// to another
    PROCEDURE                                 :: load => load_matrix
    PROCEDURE                                 :: dump => dump_matrix
    PROCEDURE                                 :: copy => copy_matrix
    PROCEDURE                                 :: clear => clear_data
  END TYPE matrix

  !// A child object based on the parent object maps containing a 2D matrix
  !// of integer values to hold an pgmImage map
  TYPE, PUBLIC, EXTENDS(matrix)               :: pgmImage
     character(len=2)                         :: magics = 'P2'
     character(len=255)                       :: createdby = 'NONE'
     integer                                  :: maxgray = 0
    CONTAINS
    PROCEDURE                                 :: load => load_pgmImage
    PROCEDURE                                 :: dump => dump_pgmImage
    PROCEDURE                                 :: copy => copy_pgmImage
  END TYPE pgmImage

  TYPE, PUBLIC                                :: Image
! Class that can contain any class of image
    CLASS(matrix), POINTER                    :: imgIN
    CLASS(matrix), POINTER                    :: imgOUT
    character(len=255)                        :: inputFormat 
    character(len=255)                        :: outputFormat 

    CONTAINS
    PROCEDURE                                 :: load => load_image
    PROCEDURE                                 :: dump => dump_image
    PROCEDURE                                 :: clear => clear_image
! private methods
    PROCEDURE, PRIVATE                        :: convert => convert_image
  END TYPE Image
CONTAINS

  SUBROUTINE load_matrix(this, filename)
    implicit none
    !// A polymorphic object
    CLASS(matrix)                           :: this
    character(len=255), intent(in)          :: filename
    !// File unit number
    INTEGER                                  :: lun=10
    OPEN(UNIT=lun, file= filename)
    read(lun,*) this%nx, this%ny
    allocate(this%A(this%nx, this%ny))
    read(lun,*) this%A
    CLOSE(UNIT=lun)
  END SUBROUTINE load_matrix

  SUBROUTINE load_pgmImage(this, filename)
    implicit none
    !// A polymorphic object
    CLASS(pgmImage)                         :: this
    character(len=255), intent(in)          :: filename
    !// File unit number
    INTEGER                                  :: lun=10
    OPEN(UNIT=lun, file= filename)
    read(lun,*) this%magics
    read(lun,*) this%createdby
    read(lun,*) this%nx, this%ny
    read(lun,*) this%maxgray
    allocate(this%A(this%nx, this%ny))
    read(lun,*) this%A
    CLOSE(UNIT=lun)
  END SUBROUTINE load_pgmImage

  SUBROUTINE load_image(this, filename, outputFormat)
    implicit none
    !// A polymorphic object
    CLASS(Image)                          :: this
    character(len=*), intent(in)          :: filename
    character(len=*), intent(in)          :: outputFormat

    type(pgmImage), POINTER               :: pgm
    type(matrix), POINTER                 :: m

    integer                               :: idx ! index where we have . (to
                                                 ! find file extension

   
! we assume MATRIX file ends with .matrix and PGM file ends with .pgm 
    idx = INDEX(filename,'.matrix')
    if (idx > 0) then
      this%inputFormat='MATRIX'
    else
      idx = INDEX(filename,'.pgm')
      this%inputFormat='PGM'
    end if

    SELECT CASE(this%inputFormat)
     CASE('PGM')
      print*,'Input Format: PGM'
      allocate(pgm)
      pgm = pgmImage()
      this%imgIN => pgm
     CASE('MATRIX')
      print*,'Input Format: MATRIX'
      allocate(m)
      m = matrix()
      this%imgIN =>  m
     CASE DEFAULT
       print*,'inputFormat unknown'
       STOP
    END SELECT

    call this%imgIN%load(filename)
    this%outputFormat = trim(outputFormat)
  END SUBROUTINE load_image

  SUBROUTINE dump_pgmImage(this)
    implicit none
    !// A polymorphic object
    CLASS(pgmImage)                              :: this

    !// Yes, write the header and integer values from the array to the screen
    write(*,*) 'Write a PGM image'
    write(*,'(a2)') this%magics 
    write(*,'("# Created by dump_data")')
    write(*,*) this%nx, this%ny
    write(*,*) this%maxgray
    write(*,*) this%A(1,1), this%A(this%nx, this%ny)
  END SUBROUTINE dump_pgmImage

  SUBROUTINE dump_matrix(this)
    implicit none
    !// A polymorphic object
    CLASS(matrix)                              :: this
    !// Yes, write the header and integer values from the array to the screen
    write(*,*) 'Write a simple matrix'
     write(*,*) this%nx, this%ny
     write(*,*) this%A(1,1), this%A(this%nx/2,this%nx/2), this%A(this%nx,this%ny)
  END SUBROUTINE dump_matrix

  SUBROUTINE dump_image(this)
    implicit none
    !// A polymorphic object
    CLASS(image)                              :: this

    
    if (this%inputFormat == this%outputFormat) then
! no conversion needed
      print*, 'no conversion needed'
      call this%imgIN%dump()
    else
      call this%convert()
      call this%imgOUT%dump()
    endif
  END SUBROUTINE dump_image

 SUBROUTINE convert_image(this)
   implicit none

   !// A polymorphic object
   CLASS(image)                              :: this

   type(pgmImage), POINTER                   :: pgm
   type(matrix), POINTER                     :: m


   print*, 'Need to convert from ', trim(this%inputFormat), ' to ', &
                                    trim(this%outputFormat)

    SELECT CASE(this%outputFormat)
     CASE('PGM')
      print*,'Output Format chosen: PGM'
      allocate(pgm)
      pgm = pgmImage()
      pgm%magics = 'P2'
      pgm%createdby = '# Converted from another format'
      pgm%maxgray = MAXVAL(this%imgIN%A)
      pgm%nx = this%imgIN%nx
      pgm%ny = this%imgIN%ny
      pgm%A => this%imgIN%A
      this%imgOUT => pgm
     CASE('MATRIX')
      print*,'Output Format chosen: MATRIX'
      allocate(m)
      print*, 'm allocated'
      m = matrix()
      print*, 'm defined'
      m%nx = this%imgIN%nx
      m%ny = this%imgIN%ny
      m%A => this%imgIN%A
      this%imgOUT => m
      
      print*, 'Conversion done...'
     CASE DEFAULT
       print*,'ERROR: Choose PGM or MATRIX for outputFormat'
       STOP
    END SELECT
   
 END SUBROUTINE convert_image

  SUBROUTINE clear_data(this)
    implicit none
    !// A polymorphic object
    CLASS(matrix)                           :: this
    !// Clear the header variables
    this%nx = 0
    this%ny = 0
    DEALLOCATE(this%A)
!nothing specific here...
  END SUBROUTINE clear_data

  SUBROUTINE clear_image(this)
    implicit none
    !// A polymorphic object
    CLASS(image)                           :: this

    call this%imgIN%clear()
!nothing specific here...
  END SUBROUTINE clear_image

  FUNCTION copy_matrix(this) RESULT(that)
    implicit none
    CLASS(matrix)                          :: this
    CLASS(*), POINTER                      :: that
    CLASS(matrix), POINTER                 :: eptr

    ALLOCATE(eptr)
    eptr%nx = this%nx
    eptr%ny = this%ny
    ALLOCATE(eptr%A(eptr%nx,eptr%ny))
    eptr%A(:,:) = this%A(:,:)
    that => eptr
  END FUNCTION copy_matrix

  FUNCTION copy_pgmImage(this) RESULT(that)
    implicit none
    CLASS(pgmImage)                          :: this
    CLASS(*), POINTER                        :: that
    CLASS(pgmImage), POINTER                 :: eptr

    ALLOCATE(eptr)
    eptr%magics = this%magics
    eptr%createdby = this%createdby
    eptr%maxgray = this%maxgray
    eptr%nx = this%nx
    eptr%ny = this%ny
    ALLOCATE(eptr%A(eptr%nx,eptr%ny))
    eptr%A(:,:) = this%A(:,:)
    that => eptr
  END FUNCTION copy_pgmImage

END MODULE pgmio_mod
