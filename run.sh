#/bin/bash

#Author: Molita Nuon
#Program name: Sum of Integers

rm *.o
rm *.out

echo "This is program <Sum of Integers>"

echo "Assemble the module fp-io.asm"
nasm -f elf64 -l sum.lis -o sum.o sum.asm

echo "Compile the C++ module sum_driver.cpp"
g++ -c -m64 -Wall -l sum_driver.lis -o sum_driver.o sum_driver.cpp -fno-pie -no-pie

echo "Link the two object files already created"
g++ -m64 -o fpio.out sum_driver.o sum.o -fno-pie -no-pie

echo "The bash script file is now closing."
