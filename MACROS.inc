Print MACRO  message,size, x, y ,color

    mov  ah,13h                ;SERVICE TO DISPLAY STRING WITH COLOR.
    mov  bh,0                  ;PAGE (ALWAYS ZERO).
    lea bp, message  ;STRING TO DISPLAY.
    mov  bl,color    ;color   
    mov  cx,size                 ;STRING LENGTH.
    mov  dl,x                  ;X (SCREEN COORDINATE). 
    mov  dh,y                  ;Y (SCREEN COORDINATE). 
    int  10h  
ENDM Print

OpenFile MACRO Filename,Filehandle  

    MOV AH, 3Dh
    MOV AL, 0 ; read only
    LEA DX, Filename
    INT 21h
    MOV [Filehandle], AX
    
ENDM OpenFile

ReadData MACRO Filehandle,Filedata,width,height

    MOV AH,3Fh
    MOV BX, [Filehandle]
    MOV CX,width*height ; number of bytes to read
    LEA DX, Filedata
    INT 21h

ENDM ReadData

CloseFile MACRO Filehandle
	MOV AH, 3Eh
	MOV BX, [Filehandle]

	INT 21h
	
ENDM  CloseFile 

Draw MACRO REG,WIDTH,HEIGHT,X,Y
LOCAL drawLoop
          MOV CX,X
          MOV DX,Y
          MOV AH,0ch
drawLoop:
    MOV AL,[REG]
    INT 10h 
    INC CX
    INC REG
    CMP CX,WIDTH 
JNE drawLoop 
	
    MOV CX , 0
    INC DX
    CMP DX , HEIGHT
JNE drawLoop
ENDM  Draw  


