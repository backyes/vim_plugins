#!/bin/sh
##Written by backtyes
##generate the ctags and cscope database.
rm tags cscope.out cscope.in.out cscope.po.out  cscope.files
find $(pwd) -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "Makefile" > cscope.files
cscope -bkq -U -i cscope.files
ctags -R
