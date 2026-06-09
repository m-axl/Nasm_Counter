asm=nasm
ld=ld
asmflags=-f elf64

all:
	$(asm) $(asmflags) src/main.asm -o main.o
	$(asm) $(asmflags) src/lib.asm -o lib.o
	$(asm) $(asmflags) src/constantes.asm -o constantes.o
	$(ld) main.o lib.o constantes.o -o contador_bshasm

clean:
	rm -f *.o contador_bshasm