.model small
.stack
.data
mat db 01h,02h,03h,04h,05h,06h,07h,08h,09h
len equ $-mat
row db 3
col db 3
.code
main proc
mov ax,@data
mov ds,ax
lea si,mat
mov ax,0
mov bx,0
mov cx,0

l2:
      mov cl,0
   l1:mov ax,0
      mov al,col
      mul ch
      add al,cl
	  mov bl,al
      call pmat
	  call space
      inc cl
      cmp cl,row
   jl l1
	  inc ch
	  call newline
	  cmp ch,row
jl l2

mov ax,4c00h
int 21h
	  

main endp

pmat proc
   mov dl,[si+bx]
   add dl,30h
   push ax
   mov ah,02h
   int 21h
   pop ax
   ret
pmat endp
   
newline proc
push ax
mov dl,13
mov ah,02h
int 21h
mov dl,10
int 21h
pop ax
ret
newline endp

space proc
  push ax
  mov dl,' '
  mov ah,02h
  int 21h
  pop ax
  ret
space endp
end main