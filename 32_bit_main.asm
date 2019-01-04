[org 0x7c00] ; offset for bootloader
	mov bp, 0x9000 ; set stack
	mov sp, bp

	mov bx, MSG_REAL_MODE
	call print ; written after BIOS message

	call switch_to_pm
	jmp $

; dependencies
%include "boot_sector_print.asm"
%include "32_bit_gdt.asm"
%include "32_bit_print.asm"
%include "32_bit_switch.asm"

[bits 32]
BEGIN_PM:
	mov ebx, MSG_PM
	call print_string_pm ; writes to top left corner
	jmp $

MSG_REAL_MODE db "Started in 16-bit real mode", 0
MSG_PM db "Loaded 32-bit protected mode", 0

; bootsector
times 510-($-$$) db 0
dw 0xaa55
