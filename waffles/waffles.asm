section .data
  mes1: db 'Do you like waffles?',10
  mes1Len: equ $-mes1
  mes2: db 'Do you like pancakes?',10
  mes2Len: equ $-mes2
  mes3: db 'Good',10
  mes3Len: equ $-mes3
  wrongmsg: db 'Try again',10
  wrongmsgLen: equ $-wrongmsg
  yes: db 'yes'

section .bss
  inp_buff: resb 5

section .text
  global _start

_start:
  mov eax,4
  mov ebx,1
  mov ecx,mes1
  mov edx,mes1Len
  int 80h
  mov eax,3
  mov ebx,0
  mov ecx,inp_buff
  mov edx,5
  int 80h
  mov al,[inp_buff]
  mov ah,[yes]
  cmp al,ah
  je stage2
  jmp wrong

stage2:
  mov eax,4
  mov ebx,1
  mov ecx,mes2
  mov edx,mes2Len
  int 80h
  mov eax,3
  mov ebx,0
  mov ecx,inp_buff
  mov edx,5
  int 80h
  mov al,[inp_buff]
  mov ah,[yes]
  cmp al,ah
  je stage3
  jmp wrong

stage3:
  mov eax,4
  mov ebx,1
  mov ecx,mes3
  mov edx,mes3Len
  int 80h
  mov eax,1
  mov ebx,0
  int 80h

wrong:
  mov eax,4
  mov ebx,1
  mov ecx,wrongmsg
  mov edx,wrongmsgLen
  int 80h
  mov eax,1
  mov ebx,0
  int 80h
