	INCLUDE MACROS.inc
    .MODEL COMPAT
	.STACK 64
	.386
	.DATA
    WIDTH EQU 200
	HEIGHT EQU 300
	Data_F DB WIDTH*HEIGHT dup(0)
	Teacher DB 'teacher.bin', 0
	Policer DB 'police.bin',0
	Doctor  DB 'doctor.bin',0
	Soldier db 'soldier.bin',0
	Lawyer db 'lawyer.bin',0

	Filehandle DW ?
	Jops DB 'Teacher','Policer','Doctor','Soldier','Lawyer','Player','Actor'
	Guess_who     db 'Guess Who .....?'
	Teacher_Jop   db 'I help people to learn,work in a classroom.I teach young children in kindergarten'
    Teacher_Jop_c db 'and primary schools. I teach older children in middle, junior high and high schools.'
                    

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
   
  

;   _______                         _                   
;  |__   __|                       | |                  
;     | |      ___    __ _    ___  | |__     ___   _ __ 
;     | |     / _ \  / _` |  / __| | '_ \   / _ \ | '__|
;     | |    |  __/ | (_| | | (__  | | | | |  __/ | |   
;     |_|     \___|  \__,_|  \___| |_| |_|  \___| |_|   
	    call Video_mode
		OpenFile Teacher,Filehandle
		ReadData Filehandle,Data_F,WIDTH,HEIGHT
		LEA BX , Data_F
		Draw BX,WIDTH,HEIGHT,0,0
		CloseFile Filehandle
		Print Teacher_Jop,81,27,3,04
		Print Teacher_Jop_c,84,27,5,04
		Print Guess_who,16,65,8,14
         MOV AH , 0
         INT 16h


;    ____    ______   ______   _                      
;   / __ \  |  ____| |  ____| (_)                     
;  | |  | | | |__    | |__     _    ___    ___   _ __ 
;  | |  | | |  __|   |  __|   | |  / __|  / _ \ | '__|
;  | |__| | | |      | |      | | | (__  |  __/ | |   
;   \____/  |_|      |_|      |_|  \___|  \___| |_|  
		call Video_mode
		OpenFile Policer,Filehandle
		ReadData Filehandle,Data_F,WIDTH,HEIGHT
		LEA BX , Data_F
		Draw BX,WIDTH,HEIGHT,0,0
		CloseFile Filehandle
		Print Teacher_Jop,81,27,3,04
		Print Teacher_Jop_c,84,27,5,04
		Print Guess_who,16,65,8,14
         MOV AH , 0
         INT 16h

;  _____                   _                  
;  |  __ \                 | |                 
;  | |  | |   ___     ___  | |_    ___    _ __ 
;  | |  | |  / _ \   / __| | __|  / _ \  | '__|
;  | |__| | | (_) | | (__  | |_  | (_) | | |   
;  |_____/   \___/   \___|  \__|  \___/  |_|  
        call Video_mode
	    OpenFile Doctor,Filehandle
		ReadData Filehandle,Data_F,WIDTH,HEIGHT
		LEA BX , Data_F
		pusha
		Draw BX,WIDTH,HEIGHT,0,0
		popa 
		CloseFile Filehandle
		Print Teacher_Jop,81,27,3,04
		Print Teacher_Jop_c,84,27,5,04
		Print Guess_who,16,65,8,14
         MOV AH , 0
         INT 16h 

;   _____       _     _ _           
;  / ____|     | |   | (_)          
; | (___   ___ | | __| |_  ___ _ __ 
;  \___ \ / _ \| |/ _` | |/ _ \ '__|
;  ____) | (_) | | (_| | |  __/ |   
; |_____/ \___/|_|\__,_|_|\___|_| 

        call Video_mode
		OpenFile Soldier,Filehandle
		ReadData Filehandle,Data_F,WIDTH,HEIGHT
		LEA BX , Data_F
		Draw BX,WIDTH,HEIGHT,0,0
		CloseFile Filehandle
		Print Teacher_Jop,81,27,3,04
		Print Teacher_Jop_c,84,27,5,04
		Print Guess_who,16,65,8,14
         MOV AH , 0
         INT 16h
;   _                                               
;  | |                                              
;  | |        __ _  __      __  _   _    ___   _ __ 
;  | |       / _` | \ \ /\ / / | | | |  / _ \ | '__|
;  | |____  | (_| |  \ V  V /  | |_| | |  __/ | |   
;  |______|  \__,_|   \_/\_/    \__, |  \___| |_|   
;                                __/ |              
;                               |___/               
        call Video_mode
		OpenFile Lawyer,Filehandle
		ReadData Filehandle,Data_F,WIDTH,HEIGHT
		LEA BX , Data_F
		Draw BX,WIDTH,HEIGHT,0,0
		CloseFile Filehandle
		Print Teacher_Jop,81,27,3,04
		Print Teacher_Jop_c,84,27,5,04
		Print Guess_who,16,65,8,14
         MOV AH , 0
         INT 16h

                                             
                                             





Video_mode PROC
	mov ax,4f02h
		MOV BX,105H ; 1024*786 256 COLORS
		INT 10H 
	ret	
Video_mode endp

  END MAIN 



		