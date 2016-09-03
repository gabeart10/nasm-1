section .data
  snake: db 'SNAKE',10
  snakeLen: equ $-snake
  mushroom: db 'Mushroom',10
  mushroomLen: equ $-mushroom
  badger: db "Badger",10
  badgerLen: equ $-badger
  timeval:
    tv_sec dd 0
    tv_usec dd 0
section .text
  global _start

_start:
  mov rcx,0
  mov rax,0
  mov rbx,0
  push rcx
  jmp badgerLoop

reset:
  pop rcx
  cmp rcx,3
  je snakeLoop
  mov rax,0
  mov rbx,0
  add rcx,1
  push rcx
  jmp badgerLoop

badgerLoop:
  cmp rax,6
  je mushClear
  push rax
  mov eax,4
  mov ebx,1
  mov ecx,badger
  mov edx,badgerLen
  int 80h
  mov dword [tv_sec],1
  mov dword [tv_usec],0
  mov eax,162
  mov ebx,timeval
  mov ecx,0
  int 80h
  pop rax
  add rax,1
  jmp badgerLoop


mushClear:
  mov rbx,0
  jmp mushroomLoop

mushroomLoop:
  cmp rbx,2
  je reset
  push rbx
  mov eax,4
  mov ebx,1
  mov ecx,mushroom
  mov edx,mushroomLen
  int 80h
  mov dword [tv_sec],2
  mov dword [tv_usec],0
  mov eax,162
  mov ebx,timeval
  mov ecx,0
  int 80h
  pop rbx
  add rbx,1
  jmp mushroomLoop

snakeLoop:
  mov eax,4
  mov ebx,1
  mov ecx,snake
  mov edx,snakeLen
  int 80h
  mov dword [tv_sec],3
  mov dword [tv_usec],5
  mov eax,162
  mov ebx,timeval
  mov ecx,0
  int 80h
  mov rbx,0
  jmp _start

