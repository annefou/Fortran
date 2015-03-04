!//
!///////////////////////////////////////////////////////////////////////////////

MODULE matrix_mod
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
    PROCEDURE                                 :: load => load_data
    PROCEDURE                                 :: dump => dump_data
    PROCEDURE                                 :: clear => clear_data
    PROCEDURE                                 :: copy => copy_data
  END TYPE matrix

  !// A child object based on the parent object maps containing a 2D matrix
  !// of integer values to hold an pgmImage map
  TYPE, PUBLIC, EXTENDS(matrix)               :: pgmImage
     character(len=2)                         :: magics = 'P2'
     character(len=255)                       :: createdby = 'NONE'
     integer                                  :: maxgray = 0
  END TYPE pgmImage

CONTAINS

  !// A common subroutine for all the object types to load data from a file into the object
  SUBROUTINE load_data(this, filename)
    !// A polymorphic object
    CLASS(matrix)                            :: this
   
    character(len=255), intent(in)           :: filename
    
    !// Index and status variable
    INTEGER                                  :: i, res

    !// Find out what kind of object this is
    SELECT TYPE(this)
      !// Is it a pgmImage object
      CLASS IS (pgmImage)
        !// Yes, call the corresponding procedure
        CALL load_pgmImage(this, filename)
      CLASS DEFAULT
        call load_matrix(this, filename)
    END SELECT

  END SUBROUTINE load_data

  SUBROUTINE load_matrix(this, filename)
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

  SUBROUTINE dump_data(this)
    !// A polymorphic object
    CLASS(matrix)                              :: this
    !// Find out what kind of object this is
    SELECT TYPE(this)
      !// Is it an pgmImage object
      CLASS IS (pgmImage)
        !// Yes, write the header and integer values from the array to the screen
        write(*,'(a2)') this%magics 
        write(*,'("# Created by dump_data")')
        write(*,*) this%nx, this%ny
        write(*,*) this%maxgray
        write(*,*) this%A
      CLASS DEFAULT
        !// Yes, write the header and integer values from the array to the screen
        write(*,*) this%nx, this%ny
        write(*,*) this%A
    END SELECT
  END SUBROUTINE dump_data

  SUBROUTINE clear_data(this)
    !// A polymorphic object
    CLASS(matrix)                           :: this
    !// Clear the header variables
    this%nx = 0
    this%ny = 0
    DEALLOCATE(this%A)
!nothing specific here...
  END SUBROUTINE clear_data

  FUNCTION copy_data(this) RESULT(that)
    CLASS(matrix)                        :: this
    CLASS(*), POINTER                        :: that
    CLASS(pgmImage), POINTER                 :: eptr
    SELECT TYPE(this)
      CLASS IS (pgmImage)
        ALLOCATE(eptr)
        eptr%magics = this%magics
        eptr%createdby = this%createdby
        eptr%maxgray = this%maxgray
        eptr%nx = this%nx
        eptr%ny = this%ny
        ALLOCATE(eptr%A(eptr%nx,eptr%ny))
        eptr%A(:,:) = this%A(:,:)
        that => eptr
      CLASS DEFAULT
        eptr%nx = this%nx
        eptr%ny = this%ny
        ALLOCATE(eptr%A(eptr%nx,eptr%ny))
        eptr%A(:,:) = this%A(:,:)
        that => eptr
    END SELECT
  END FUNCTION copy_data


END MODULE matrix_mod
