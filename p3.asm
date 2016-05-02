.model small
.stack
.data
num dw 0ffffh
.code
main proc
mov ax,@data
mov ds,ax

mov cx,0
mov ax,num
mov bx,10
l1:mov dx,0
div bx
push dx
inc cx
cmp ax,09
jg l1
push ax
inc cx

l2:pop ax
mov dl,al
add dl,30h
mov ah,02h
int 21h
loop l2

mov ax,4c00h
int 21h
main endp 
end main