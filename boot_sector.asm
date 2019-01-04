[org 0x7c00] ; tell the assembler that our offset is bootsector code

mov bp, 0x8000
mov sp, bp

mov bx, 0x9000
mov dh, 2
call disk_load

mov dx, [0x9000]
call print_hex
call print_nl

mov dx, [0x9000 + 512]
call print_hex

jmp $

%include "boot_sector_print.asm"
%include "boot_sector_print_hex.asm"
%include "boot_sector_disk.asm"

times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xdada
times 256 dw 0xface
