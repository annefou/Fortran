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

PROGRAMS = matrix_simple_main matrix_main file_main pgmio_main 

all: $(PROGRAMS)

matrix_simple_main: matrix_simple_mod.o
matrix_simple_main.o: matrix_simple_mod.o

matrix_main: matrix_mod.o
matrix_main.o: matrix_mod.o

pgmio_main: pgmio_mod.o
pgmio_main.o: pgmio_mod.o

file_main: file_mod.o
file_main.o: file_mod.o

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


