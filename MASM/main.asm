; A simple template for assembly programs.
.386  ; Specify instruction set
.model flat, stdcall  ; Flat memory model, std. calling convention
.stack 4096 ; Reserve stack space
ExitProcess PROTO, dwExitCode: DWORD  ; Exit process prototype

.data ; data segment
	; define your variables here
	final_result DWORD ?
	x_1 dd 35                        ;this is the variable for the value x ("dd" can be used in place of writing DWORD)
	y_1 DWORD 45                     ;this is the variable for the value y
	c_1 DWORD 60                     ;this is the variable for the value c
	d_1 DWORD 55                     ;this is the variable for the value d
	contribution DWORD 50            ;this is the individual contribution towards the coursework
	first_numerator DWORD ?          ;this is the result of multiplying 50*x*d
	second_numerator DWORD ?         ;this is the result of multiplying 50*y*c
	whole_numerator DWORD ?          ;this is the total from adding the two numerators, hence the whole numerator
	denominator DWORD ?              ;this is the denominator as a result of multiply c*d

.code ; code segment

main PROC ; main procedure
	; write your assembly code here
	mov eax, x_1                ;move the value of x into the register eax
	mul d_1                     ;multiply x by d and store the value in register eax
	mul contribution            ;multiply the x*d value by 50 (the contribution)
	mov first_numerator, eax    ;move the result into the variable first_numerator

	mov eax, contribution       ;set eax as 50 (the contribution)
	mul y_1                     ;multiply 50 by y
	mul c_1                     ;multiply 50*y by c
	mov second_numerator, eax   ;move the result into the variable second_numerator

	mov ebx, first_numerator    ;move the first numerator into the register ebx
	mov ecx, second_numerator   ;move the second numerator into the register ecx

	add ebx, ecx                ;add the registers ebx + ecx in order to find out what the whole value of the numerator is
	mov whole_numerator, ebx

	mov eax, c_1                ;set the value of eax to c
	mul d_1                     ;multiply c * d to find out the the value of the denominator
	mov denominator, eax        

	mov eax, whole_numerator    ;in order to perform division, we must set teh value of eax to that of the divident, that is, the whole numerator
	div denominator             ;divide the whole numerator (eax) by the denominator, to find the final result
	mov final_result, eax       ;set teh final result variable from eax. This should display the final result as 70, that is 70%

	INVOKE ExitProcess, 0 ; call exit function
  
main ENDP ; exit main procedure
END main  ; stop assembling