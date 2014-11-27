; EXAMPLE.ASM - пример простейших начальных установок входа 
		;в графический режим
	.model  small
	.code

	cnt dw ?

	mov	ax,4h	;инициализация графического
	int	10h				;режима

	mov ah,0Bh
	mov bh,01h
	mov bl,00h
	int 10h	

	mov	ax, 0B800h
	mov 	es,ax				;видеопамяти в
	mov bx, 0
	mov cnt, 0

render1:
	mov bx, 0
	mov cx, bx
	add cx, cnt
	mov bx,cx
	mov es:[bx], 80h
	add cnt, 80
	cmp cnt, 6000
	jl render1

	mov	ax, 0BA00h
	mov 	es,ax
	mov bx, 0
	mov cnt, 0	

render2:
	mov bx, 0
	mov cx, bx
	add cx, cnt
	mov bx,cx
	mov es:[bx], 80h
	add cnt, 80
	cmp cnt, 6000
	jl render2

	xor	ax,ax				;ожидание нажатия клавиши
	int	16h

	mov ax,3h
	int 10h

	mov	ax,4c00h			;выход из графики с возвратом
	int	21h				;в предыдущий режим

	end