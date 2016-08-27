section .data
  msg: db 'Nyan',10
  msgLen: equ $-msg

section .text
  global _start

_start:
  jmp mainLoop

mainLoop:
  mov eax,4
  mov ebx,1
  mov ecx,msg
  mov edx,msgLen
  int 80h
  jmp mainLoop
