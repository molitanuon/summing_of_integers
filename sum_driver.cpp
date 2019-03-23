//Author name: Molita Nuon
//Program title: Sum of Integers
//Files in this program: sum_driver.cpp, sum.asm, run.sh
//Course number: CPSC 240
//Assignment number: 2
//Required delivery date: Feb 18, 2019 before 11:59pm
//Purpose:Learn how to use loop and array
//Language of this module: C++
//Compile this module: g++ -c -m64 -Wall -l sum_driver.lis -o sum_driver.o sum_driver.c -fno-pie -no-pie
//Link object files: g++ -m64 -o fpio.out sum_driver.o sum.o -fno-pie -no-pie
#include <stdio.h>

extern "C" long int sum();

int main()
{
  long  int return_code = -99.99;
  printf("%s", "Welcome to summing a sequence of integers. \n");
  printf("%s", "This program is brought to you by Molita Nuon. \n");
  return_code = sum();
  printf("%s%ld%s\n", "The main program received this number: ", return_code,
        ". Main will return 0 to the operating system. Have a nice day.");
  return 0;
}
