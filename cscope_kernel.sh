#!/bin/sh
##Written by backtyes
##generate the ctags and cscope database.
rm tags cscope.out cscope.in.out cscope.po.out  cscope.files
find $(pwd)/arch/x86 $(pwd)/block/ $(pwd)/crypto/ $(pwd)/Documentation/ $(pwd)/drivers/ $(pwd)/firmware/ $(pwd)/fs/ $(pwd)/include/ $(pwd)/init/ $(pwd)/ipc/ $(pwd)/kernel/ $(pwd)/lib/ $(pwd)/mm/ $(pwd)/net/ $(pwd)/samples/ $(pwd)/scripts/ $(pwd)/security/ $(pwd)/sound/ $(pwd)/tools/ $(pwd)/usr/ $(pwd)/virt/ -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "Makefile" > cscope.files
cscope -bkq -U -i cscope.files
ctags -L cscope.files 
