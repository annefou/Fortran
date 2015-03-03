#!/bin/bash

for file in intent_test simple_function procedure_arguments \
            visibility_internal_procedure simple_functionR \
            simple_subroutine 
  do
  echo "Testing $file"
  ./$file
  echo "END TEST"
done

./test_pgm_main < ../../data/moon.pgm > myfile.pgm