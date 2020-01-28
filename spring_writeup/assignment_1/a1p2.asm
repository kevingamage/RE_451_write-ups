global _start
section .data
	result1 db 33		;result from Problem 1
section .bss
	greatest: resd 1
	least: resd 1
	size1: resd 1
	size2: resd 1
	sum1: resd 1
	sum2: resd 1
section .text
_start:

;Problem 2
	mov ecx, 1				;ecx = 1 to keep track of the current value being pushed and # of elements in first sequence
	mov [greatest], ecx		;set greatest to the first value in the sequence
	mov [least], ecx		;set least to the first value in the sequence
	mov eax, [result1]		;set eax to the result of Problem 1
	mov dword [sum1], 0		;set sum1 = 0
	mov dword [sum2], 0		;set sum2 = 0
	mov dword [size2], 0	;set size2 = 0

	jmp push_loop		;enter loop to push values onto stack

push_loop_ret:
	sub ecx, 1
	mov [size1], ecx	;store size of sequence1 into size1

	jmp pop_loop
pop_loop_ret:

	mov edx, 0
	mov eax, [sum1]
	mov ecx, [size1]
	div ecx				;eax = problem 2 task 2

	mov eax, [sum2]
	mov ecx, [size2]
 	div ecx				;eax = problem 2 task 3	
	
 	mov edx, [greatest]	;edx = the highest value in the sequence
	mov ebx, [least]	;ebx = the least value in the sequence
 	sub edx, ebx		;edx = problem 2 task 4

	;terminate the program
 	mov eax, 1
 	mov ebx, 0
 	int 0x80

push_loop:
	cmp ecx, eax		;if ecx > result1
	jg push_loop_ret	;exit loop
	
	push ecx			;else push ecx
	
	cmp [greatest], ecx	;if [greatest] < exc
	jge L1				;do not update [greatest]
	
	mov [greatest], ecx	;else set [greatest] to the new greatest value

L1:
	cmp [least], ecx	;if [least] <= ecx
	jle L2				;do not update [least]
	
	mov [least], ecx	;else set [least] to the new least value

L2:

	add ecx, 1			;increment ecx
	jmp push_loop		;cycle to beginning of push_loop

pop_loop:
	cmp ecx, 1			;if ecx < 1
	jl pop_loop_ret		;exit loop

	pop ebx				;else store popped values in ebx
	mov eax, [sum1]
	add eax, ebx		;add ebx to sum1
	mov [sum1], eax

	cmp ebx, 20			;if ebx > 20
	jg greater20		;jump to greater20

greater30:
	mov edx, [sum2]
	add edx, ebx		;else add ebx to sum2
	mov [sum2], edx
	mov edx, [size2]
	add edx, 1			;increment size of sequence2
	mov [size2], edx

less30:
	sub ecx, 1			;decrement ecx
	jmp pop_loop		;cycle to beginning of pop_loop


greater20:
	cmp ebx, 30			;if ebx < 30
	jl less30			;do not add to sum2

	jmp greater30		;else jump to greater30