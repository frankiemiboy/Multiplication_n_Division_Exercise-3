; A simple template for assembly programs.
.386  ; Specify instruction set
.model flat, stdcall  ; Flat memory model, std. calling convention
.stack 4096 ; Reserve stack space
ExitProcess PROTO, dwExitCode: DWORD  ; Exit process prototype

.data ; data segment
	; define your variables here
	final_result DWORD ?
	x_1 DWORD 35
	y_1 DWORD 45
	c_1 DWORD 60
	d_1 DWORD 55
	contribution DWORD 50
	first_numerator DWORD ?
	second_numerator DWORD ?
	whole_numerator DWORD ?
	denominator DWORD ?

.code ; code segment

main PROC ; main procedure
	; write your assembly code here
	mov eax, x_1                ;move the value of x into the register eax
	mul d_1                     ;multiply x by d and store the value in register eax
	mul contribution            ;multiply the current eax value by the contribution
	mov first_numerator, eax    ;move the result into the variable first_numerator

	mov eax, contribution
	mul y_1
	mul c_1
	mov second_numerator, eax

	mov ebx, first_numerator
	mov ecx, second_numerator

	add ebx, ecx
	mov whole_numerator, ebx

	mov eax, c_1
	mul d_1
	mov denominator, eax

	mov eax, whole_numerator
	div denominator
	mov final_result, eax

	INVOKE ExitProcess, 0 ; call exit function
  
main ENDP ; exit main procedure
END main  ; stop assembling