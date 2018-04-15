
nasm -felf32 -o $1.o $1.nasm
ld -o $1 $1.o
