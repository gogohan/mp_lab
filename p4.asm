.model small
.stack
.data
arr db 05h,02h,06h,03h,01h
len equ $-arr-1
.code
main proc
mov ax,@data
mov ds,ax
mov bh,len
mov ax,0
mov cx,0
mov bx,0
ol:
lea si,arr
mov cl,len
il: mov ah,[si]
    cmp ah,[si+1]
    jg l2
    xchg ah,[si+1]  
    mov [si],ah
    l2:
    inc si
    loop il
dec bh
cmp bh,0h
jne ol

mov cx,0
mov cl,len
inc cl
lea si,arr
l3: mov dl,[si]
    inc si
    add dl,30h
    mov ah,02h 
    int 21h
    loop l3	
	
	mov ax,4c00h
	int 21h
main endp
end main