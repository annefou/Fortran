# A simple hand-made makefile for a package including applications
# built from Fortran 90 sources, taking into account the usual
# dependency cases.
#
# to run this command: gmake
#
FC = gfortran
# flags for debugging or for maximum performance, comment as necessary
FCFLAGS = -g -fbounds-check
FCFLAGS = -O2

PROGRAMS = intent_test simple_function \
           procedure_arguments visibility_internal_procedure \
           simple_functionR simple_subroutine test_pgm_main

all: $(PROGRAMS)

# visibility_internal_procedure.f90 depends on external_subroutine.f90
# which therefore needs to be compiled separately (external subroutine)
# and linked to visibility_procedure
visibility_internal_procedure: external_subroutine.o

# dependecy for test_pgm_main on library_pgm module
# Using Fortran MODULES: test_pgm_main.f90 USEs a Fortran module defined
# inside library_pgm.f90.
test_pgm_main: pgm_library.o
test_pgm_main.o: pgm_library.o

# General rule for building prog from prog.o; $^ (GNU extension) is
# used in order to list additional object files on which the
# executable depends
%: %.o
	$(FC) $(FCFLAGS) -o $@ $^ $(LDFLAGS)

# General rules for building prog.o from prog.f90 or prog.F90; $< is
# used in order to list only the first prerequisite (the source file)
# and not the additional prerequisites such as module or include files
%.o: %.f90
	$(FC) $(FCFLAGS) -c $<

# Utility targets
.PHONY: clean veryclean

clean:
	rm -f *.o *.mod *.MOD

veryclean: clean
	rm -f *~ $(PROGRAMS)


