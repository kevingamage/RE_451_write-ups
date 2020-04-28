global _start

section .data
	msg db "CSCE 451 is fun!", 0x0a

section .text
_start:
    mov eax, 4      ;eax value for write()
    mov ebx, 1      ;file descriptor for stdout
    mov ecx, msg    ;message to send to stdout
    mov edx, 17     ;length of message
    int 0x80        ;system call
    
    mov eax, 1      ;exit program
    mov ebx, 0
    int 0x80        ;system call
    