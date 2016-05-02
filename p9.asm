model sm0000
.stack
msg macro m
	lea dx,m
	mov ah,09h
	int 21h
endm 
.data 
m1 db 1h,1h,2h,3h,2h,1h
m2 db 1h,2h,3h
column1 db 03h
row1 db 2h
column2 db 01h
row2 db 03h
sum dw 00h
m11 db 13,10,"odd","$"
m22 db " ","$"
res1 db 00h
res2 db 00h

.code
main proc
	mov ax,@data
	mov ds,ax
	xor bx,bx
	lea si,m1
	lea di,m2
	xor dx,dx
	mov dl,0h
outer:	
	xor cx,cx
inner:	mov sum,00h
	xor dx,dx
innermost:	
	mov ax,bx
	mul column1
	add ax,dx
	
	push bx
	push dx
	mov bx,ax
	mov al,[si+bx]
	mov res1,al
	pop dx
	pop bx
	mov ax,dx
	mul column2
	add ax,cx
	push bx
	push dx
	mov bx,ax	
	mov al,[di+bx]
	mov res2,al
	pop dx
	pop bx
	mov ah,0h
	mov al,res1
	mul res2
	add sum,ax
	inc dl
	cmp dl,column1
	jl innermost
	push dx
	mov dx,sum	
	add dl,30h
	cmp dl,39h
	jg mp
	jmp lp
mp:	add dl,07h 
lp:	mov ah,02h
	int 21h
	msg m22
	pop dx
	
	inc cl
	
	cmp cl,column2
	jl inner
	push dx
	call entr


0-op dx*
	inc bl
	cmp bl,row1
	jl outer
		
	mov ah,4ch
	int 21h
main endp
entr proc
	mov dl,13
0	mov ah,02h
	int 21h
	mov dl ,10
	mov ah,02h
	int 21h
	ret
entr endp 
end main  