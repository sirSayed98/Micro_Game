	INCLUDE MACROS.inc
    .MODEL COMPAT
	.STACK 64
	.386
	.DATA
                                                               
;    _____                          ________          __          
;   /     \   ____   ____  __ __    \______ \ _____ _/  |______   
;  /  \ /  \_/ __ \ /    \|  |  \    |    |  \\__  \\   __\__  \  
; /    Y    \  ___/|   |  \  |  /    |    `   \/ __ \|  |  / __ \_
; \____|__  /\___  >___|  /____/____/_______  (____  /__| (____  /
;         \/     \/     \/    /_____/       \/     \/          \/ 
   

   Learn         db 'L E A R N  B Y  P I C T U R E','$'
   Learn_Jops    db '1-Learn Jops','$'
   Learn_Animals db '2-Learn Animals','$'
   


    WIDTH  EQU 200
	HEIGHT EQU 300
	Data_F DB WIDTH*HEIGHT dup(0)
	Filehandle DW ?
; 	 ____.________ __________  _________
;     |    |\_____  \\______   \/   _____/
;     |    | /   |   \|     ___/\_____  \ 
; /\__|    |/    |    \    |    /        \
; \________|\_______  /____|   /_______  /
;                   \/                 \/ 
; 	
    Jops DB 'Teacher','Policer','Doctor','Soldier','Lawyer','Player','Actor'
	Teacher_Jop   db 'I help people to learn,work in a classroom.I teach young children in kindergarten'
    Teacher_Jop_c db 'and primary schools. I teach older children in middle, junior high and high schools.'
     
    Teacher DB 'teacher.bin', 0
	Policer DB 'police.bin',0
	Doctor  DB 'doctor.bin',0
	Soldier db 'soldier.bin',0
	Lawyer db 'lawyer.bin',0
    Player db 'player.bin',0
	Actor  db 'actor.bin',0
;    .__          
;   /  _  \   ____ |__| _____ _____  |  |   ______
;  /  /_\  \ /    \|  |/     \\__  \ |  |  /  ___/
; /    |    \   |  \  |  Y Y  \/ __ \|  |__\___ \ 
; \____|__  /___|  /__|__|_|  (____  /____/____  >
;         \/     \/         \/     \/          \/ 
    Animals DB 'Lion','Bear','Elephant','Monkey','Horse','Zebra','Camel'
    Lion DB 'Lion.bin', 0
    Bear DB 'Bear.bin', 0

; ________                                       
; \_   ___ \  ____   _____   _____   ____   ____  
; /    \  \/ /  _ \ /     \ /     \ /  _ \ /    \ 
; \     \___(  <_> )  Y Y  \  Y Y  (  <_> )   |  \
;  \______  /\____/|__|_|  /__|_|  /\____/|___|  /
;         \/             \/      \/            \/ 
	Guess_who     db 'Guess Who .....?'
	               

	.CODE
	 ; __  __     _     ___   _  _ 
	 ;|  \/  |   /_\   |_ _| | \| |
	 ;| |\/| |  / _ \   | |  |    |
	 ;|_|  |_| /_/ \_\ |___| |_|\_|
								  
	;MAIN MENUE
	MAIN PROC FAR

		MOV AX, @DATA
		MOV DS, AX	
		Mov es,ax 
		PUSHA
   ; open text mode(80*25)
		;   mov ah,0
		;   mov al,03
		;   int 10h 
		pusha
		call Video_mode
		popa

		mov ah,2 
		mov dl,30h
		mov dh,5h 
		int 10h 

		mov ah, 9 
		mov dx, offset Learn 
		int 21h 

        mov ah,2 
		mov dl,36h
		mov dh,10h 
		int 10h 

		mov ah, 9 
		mov dx, offset Learn_Jops
		int 21h

		mov ah,2 
		mov dl,35h
		mov dh,13h 
		int 10h 
		
		mov ah, 9 
		mov dx, offset Learn_Animals
		int 21h 


	DEFAULTG:  

			MOV AH , 0      ;WAIT FOR KEY
			INT 16h
		
			CMP AL, 31h     ;JOPS_MODE
			JE JOPS_MODE
			
			CMP AL, 32h
			JE Animals_MODE   ;Animals_MODE 
			
			JMP DEFAULTG
   
  

;   _______                         _                   
;  |__   __|                       | |                  
;     | |      ___    __ _    ___  | |__     ___   _ __ 
;     | |     / _ \  / _` |  / __| | '_ \   / _ \ | '__|
;     | |    |  __/ | (_| | | (__  | | | | |  __/ | |   
;     |_|     \___|  \__,_|  \___| |_| |_|  \___| |_|   
	 JOPS_MODE:   call Video_mode
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

;   _____    _                               
;  |  __ \  | |                              
;  | |__) | | |   __ _   _   _    ___   _ __ 
;  |  ___/  | |  / _` | | | | |  / _ \ | '__|
;  | |      | | | (_| | | |_| | |  __/ | |   
;  |_|      |_|  \__,_|  \__, |  \___| |_|   
;                         __/ |              
;                        |___/               
        call Video_mode
		OpenFile Player,Filehandle
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
		
;    _____          __                
;   /  _  \   _____/  |_  ___________ 
;  /  /_\  \_/ ___\   __\/  _ \_  __ \
; /    |    \  \___|  | (  <_> )  | \/
; \____|__  /\___  >__|  \____/|__|   
;         \/     \/                   
		call Video_mode
		OpenFile Actor,Filehandle
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



Animals_MODE: 
        call Video_mode
		OpenFile Lion,Filehandle
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

		call Video_mode
		OpenFile Bear,Filehandle
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
                                             
                                             





Video_mode PROC
	mov ax,4f02h
		MOV BX,105H ; 1024*786 256 COLORS
		INT 10H 
	ret	
Video_mode endp

  END MAIN 



		