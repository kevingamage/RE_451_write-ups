global _start

section .text
_start:

;Problem 1

	;store values on the stack
	push 4
	push 77
	push 18
	push 57
	push 9		
	
	;add all the values and store in eax
	pop eax				;eax = 9
	pop ebx				;ebx = 57
	add eax, ebx		;eax += 57
	pop ebx				;ebx = 18
	add eax, ebx		;eax += 18
	pop ebx				;ebx = 77
	add eax, ebx		;eax += 77
	pop ebx				;ebx = 4
	add eax, ebx		;eax += 4

	;divide the sum of the values by the number of values
	mov ecx, 5			;ecx = 5
	div ecx				;eax = problem 1 task 2



