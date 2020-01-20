	INCLUDE MACROS.inc
    .MODEL COMPAT
	.STACK 64
	.DATA
    
	.CODE
	 ; __  __     _     ___   _  _ 
	 ;|  \/  |   /_\   |_ _| | \| |
	 ;| |\/| |  / _ \   | |  | .` |
	 ;|_|  |_| /_/ \_\ |___| |_|\_|
								  
	;MAIN MENUE
	MAIN PROC FAR

		MOV AX, @DATA
		MOV DS, AX	
		Mov es,ax 
     ;open text mode(80*25)
		;  mov ah,0
		;  mov al,03
		;  int 10h 

		mov ax,4f02h
		MOV BX,105H ; 1024*786 256 COLORS
		INT 10H 
		
		mov ah,0 
		int 16h


  END MAIN 
		