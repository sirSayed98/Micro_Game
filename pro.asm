	INCLUDE MACROS.inc
    .MODEL COMPAT
	.STACK 64
	.DATA
    WIDTH EQU 320
	HEIGHT EQU 195
	Data_F DB WIDTH*HEIGHT dup(0)
	Filename DB 'DRAW.bin', 0
	Filehandle DW ?
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
		
		OpenFile Filename,Filehandle
		ReadData Filehandle,Data_F,WIDTH,HEIGHT
		LEA BX , Data_F
		Draw BX,WIDTH,HEIGHT,0,0

    MOV AH , 0
    INT 16h
    
CloseFile Filehandle


  END MAIN 
		