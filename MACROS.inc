Print MACRO  message,size, x, y ,color

    mov  ah,13h                ;SERVICE TO DISPLAY STRING WITH COLOR.
    mov  bh,0                  ;PAGE (ALWAYS ZERO).
    lea bp, message  ;STRING TO DISPLAY.
    mov  bl,color    ;color   
    mov  cx,size                 ;STRING LENGTH.
    mov  dl,x                  ;X (SCREEN COORDINATE). 
    mov  dh,y                  ;Y (SCREEN COORDINATE). 
    int  10h  
ENDM DRAW
