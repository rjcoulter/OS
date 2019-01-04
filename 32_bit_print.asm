[bits 32] ; using 32 bit protected mode

; Define Constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_string_pm:
	pusha
	mov edx, VIDEO_MEMORY

print_string_pm_loop:
	mov al, [ebx] ; [ebx] is address of the char
	mov ah, WHITE_ON_BLACK

	; see if the end of the string is reached
	cmp al, 0
	je print_string_pm_done

	mov [edx], ax ; store in video memory
	add ebx, 1 ; go to next char
	add edx, 2 ; next position in video memory

	jmp print_string_pm_loop ; loop back

print_string_pm_done:
	popa
	ret
