# The compiler
FC = gfortran
# flags for debugging or for maximum performance, comment as necessary
FCFLAGS = -g -fbounds-check
FCFLAGS = -O2
# flags forall (e.g. look for system .mod files, required in gfortran)
FCFLAGS += -I/usr/include

# libraries needed for linking, unused in the examples
#LDFLAGS = -li_need_this_lib

# List of executables to be built within the package
PROGRAMS =  free_format               \
            select_kind               \
            kind_int_types            \
            kind_real_precision       \
            kind_real_range           \
            variables                 \
            define_constants          \
            initialize_stack          \
            inv                       \
            inv_checks                \
            logical_operators         \
            selectCase                \
            do_counter                \
            do_cycle_exit             \
            if_and_logical_operators  \
            intrinsicFunctions        \
            relational_operators      
            

# "make" builds all
all: $(PROGRAMS)

%: %.o
	$(FC) $(FCFLAGS) -o $@ $^ $(LDFLAGS)

# General rules for building prog.o from prog.f90 or prog.F90; $< is
# used in order to list only the first prerequisite (the source file)
# and not the additional prerequisites such as module or include files
%.o: %.f90
	$(FC) $(FCFLAGS) -c $<

%.o: %.F90
	$(FC) $(FCFLAGS) -c $<

# Utility targets
.PHONY: clean veryclean

clean:
	rm -f *.o *.mod *.MOD

veryclean: clean
	rm -f *~ $(PROGRAMS)
