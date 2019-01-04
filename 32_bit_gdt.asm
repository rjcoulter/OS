gdt_start:
	; gdt begins with null 8-byte
	dd 0x0
	dd 0x0

; gdt for code: base = 0x00000000 length = 0xffff
gdt_code:
	dw 0xffff    ; length bits 0 - 15
	dw 0x0	     ; base bits 0-15
	db 0x0       ; base bits 16-23
	db 10011010b ; flags - 8 bits
	db 11001111b ; flags - 4 bits + length bits 16-19
	db 0x0 	     ; basebits 24-31

; gdt for data, identical base/length
gdt_data:
	dw 0xffff    
	dw 0x0	     
	db 0x0       
	db 10010010b 
	db 11001111b ; flags - 4 bits + length bits 16-19
	db 0x0 	     ; basebits 24-31

gdt_end:
	
gdt_descriptor:
	dw gdt_end - gdt_start - 1
	dd gdt_start

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
