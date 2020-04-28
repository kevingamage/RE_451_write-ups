global _start

section .bss
    sum: resd 1

section .text
_start:
    mov ecx, 0          ;ecx = 0 to keep track of the current value being pushed
    mov edx, 0          ;edx = 0 to keep track of the number of iterations in the loop
    mov dword [sum], 0  ;[sum] = 0 to keep track of the total sum of the sequence

push_seq_ret:

	cmp ecx, 100		;if ecx <= 100
	jle push_seq        ;jump to push_seq

    mov eax, edx        ;eax = Problem 3 task 2
    mov ecx, eax        ;edx register resets from overloaded mul operation so I used ecx
    mov eax, 1          ;reset eax value to use for next task

    jmp pop_seq

pop_seq_ret:

    ;eax holds the product of the multiplications at this point for Problem 3 task 3
    mov ebx, [sum]      ;store the sum in ebx

    ;Terminate the program
	mov eax, 1
	mov ebx, 0
	int 0x80

pop_seq:

    cmp ecx, 0          ;ecx holds the number of elements in the sequence
    jle pop_seq_ret     ;if ecx <= 0 jump to pop_seq_ret

    sub ecx, 1          ;decrement ecx
    pop ebx
    mov edx, [sum]
    add edx, ebx        ;add the popped value to the total sum
    mov dword [sum], edx
    cmp ebx, 30         ;if ebx >= 30
    jge pop_seq         ;jump to pop_seq
    
    mul ebx             ;else eax *= ebx 
    mov edx, [sum]
    jmp pop_seq         ;jump to pop_seq

push_seq:
    
    cmp ecx, 42         ;if ecx = 42
    je seq_42           ;jump to seq_42

seq_42_ret:

    push ecx            ;else push value of ecx
    add ecx, 1          ;increment ecx
    add edx, 1          ;increment edx
    jmp push_seq_ret    ;jump to push_seq_ret

seq_42:

    mov ebx, 0           ;ebx = 0 to keep track of the number of iterations in the loop_9

loop_9:
    cmp ebx, 9          ;if ebx = 9
    je seq_42_ret       ;jump to seq_42_ret

    push ecx            ;else push ecx
    add edx, 1          ;increment edx
    add ebx, 1          ;increment ebx
    jmp loop_9          ;return to beginning of loop_9