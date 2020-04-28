compile / run:
nasm -f elf32 a1p1.asm -o a1p1.o -g
ld -m elf_i386 a1p1.o -o a1p1

create objdump:
objdump --disassemble a1p1

run in gdb:
gdb a1p1

	break *0x(hex value of line in objdump file)