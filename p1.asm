.model small
.stack
.data
fact db 5
msg1 db 13,10,"Factorial of 5 is : $"
num db ?
.code
main proc
   mov ax,@data
   mov ds,ax
   mov ax,0
   mov bx,0
   mov bx,02h
   mov ah,fact
   mov cl,fact
   sub cl,02h
l1:mul bx
   inc bx
   loop l1
   push ax
   lea dx,msg1
   mov ah,09h
   int 21h
   pop ax
   mov bx,ax
   mov ch,bl
   call print8
   mov ch,bh
   call print8
      
   mov ax,4c00h
   int 21h
   main endp
   print8 proc
    mov dx,0
    mov dl,ch
    and dl,0f0h
    mov cl,04h
    shr dl,cl
    call printa
    mov dl,ch
    and dl,0fh
    call printa
    ret
    print8 endp

   printa proc
      cmp dl,09h
	  jl less
	  sub dl,0Ah
	  add dl,'A'
	  jmp prt
	  less: add dl,30h
	  prt: mov ah,02h
	        int 21h
	   ret
	  printa endp
	  
     
end main