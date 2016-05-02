.model small
.stack
.data
arr db 05h,03h,04h,05h,06h,07h
len equ $-arr
count db 4
prims db ?
ck db ?
.code
main proc
mov ax,@data
mov ds,ax
dec count
mov ch,count
xor ax,ax
xor bx,bx
xor cx,cx
mov count,0
mov bh,len
lea si,arr
lea di,prims
l1:mov bl,[si]
inc si
call prime
add count,ch
cmp ch,01h
jne l2
mov [di],bl
inc di
l2:dec bh
jnz l1

mov dl,count
add dl,30h
mov ah,02h
int 21h 


mov ax,4c00h
int 21h
main endp

prime proc
mov cl,02h
mov al,bl
div cl
mov ck,al
xor ax,ax
l3:mov al,bl
cmp cl,ck
je yprime 
div cl
inc cl
cmp ah,00h
jne l3
mov ch,00h
jmp en
yprime : mov ch,01h
en : 
ret 
prime endp 

end main