#!/bin/bash

if (($# < 3))
then
  printf "%b""Error. Not enough arguments.\n"
  printf "%b""usage: myscript file1 op file2\n"
  exit 1
elif (($# > 3))
then
  printf "%b""Error. Too many arguments.\n"
  printf "%b""usage: myscript file1 op file2\n"
  exit 2
else
  printf "%b""Argument count correct. Proceeding...\n"
fi
