
nasm -felf32 -o $1.o $1.nasm
ld -N -o $1 $1.o
