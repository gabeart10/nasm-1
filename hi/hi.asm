section .data 
  mesg: db 'What is your name?',10
  mesgLen: equ $-mesg
  resp: db 'Hi '
  respLen: equ $-resp

section .bss
  inp_buff: resb 5

section .text
  global _start

_start:
  mov eax,4
  mov ebx,1
  mov ecx,mesg
  mov edx,mesgLen
  int 80h
  mov eax,3
  mov ebx,0
  mov ecx,inp_buff
  mov edx,5
  int 80h
  mov eax,4
  mov ebx,1
  mov ecx,resp
  mov edx,respLen
  int 80h
  mov eax,4
  mov ebx,1
  mov ecx,inp_buff
  mov edx,5
  int 80h
  mov eax,1
  mov ebx,0
  int 80h
