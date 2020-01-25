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
    Jops DB 'Teacher','Policer','Doctor ','Soldier','Lawyer ','Player ','Actor  '

	Teacher_Jop   db 'I help people to learn,work in a classroom.I teach young children in kindergarten'
    Teacher_Jop_c db 'and primary schools. I teach older children in middle, junior high and high schools.'

	Policer_Jop   db ' He protects citizens by preventing crime, enforcing laws, apprehending '
	Policer_Jop_c db 'suspects, and monitoring traffic.He apprehends suspects by responding to calls for help.'

	Doctor_Jop    db 'They also known as Physicians, are licensed health professionals who maintain and   '
	Doctor_Jop_c  db 'restore human health through the practice of medicine and they examine patients.'

	Soldier_Jop   db 'He is a person who serves in the army the branch of armed forces '
	Soldier_Jop_c db ' trained for land warfare.They perform duties such as maintaining military equipment.'

	Lawyer_Jop db 'They, also known as Attorneys, are certified professionals who advise and represent natural'
	Lawyer_Jop_c db 'and juristic persons in legal matters. They counsel clients, perform legal research.'

	Player_Job     db 'Their job involves working and training as a team. Most footballers specialise in '
	 
	Player_Job_c   db '   playing one position, such as goalkeeper, striker, defender or mid-fielder.'

	 Actor_Job db 'They express ideas and portray characters in theater, film, television, and other performing arts.'
	 Actor_Job_c db 'They also work at theme parks or other live events. They interpret a writers script to entertain.'

    Teacher DB 'teacher.bin', 0
	Policer DB 'police.bin',0
	Doctor  DB 'doctor.bin',0
	Soldier db 'soldier.bin',0
	Lawyer db  'lawyer.bin',0
    Player db  'player.bin',0
	Actor  db  'actor.bin',0
;    .__          
;   /  _  \   ____ |__| _____ _____  |  |   ______
;  /  /_\  \ /    \|  |/     \\__  \ |  |  /  ___/
; /    |    \   |  \  |  Y Y  \/ __ \|  |__\___ \ 
; \____|__  /___|  /__|__|_|  (____  /____/____  >
;         \/     \/         \/     \/          \/ 
    Animals DB 'Lion  ','Bear  ','Monkey','Horse ','Zebra ','Camel ','Elephant'
    Lion      DB 'Lion.bin', 0
    Bear      DB 'Bear.bin', 0
	Elephant  DB 'Elephant.bin', 0
	Horse     DB 'Horse.bin', 0
	Zebra     DB 'Zebra.bin', 0
	Camel     DB 'Camel.bin', 0
    Monkey    DB 'Monkey.bin', 0

	Lion_Info DB 'It is a species in the family Felidae it is a muscular, deep-chested cat with a short, rounded head.'

	Lion_Info_c DB 'It is the king of the forest. It loves Meat.'
	
	Bear_Info DB 'They are carnivoran mammals of the family Ursidae. They are classified doglike carnivorans. '

	Bear_Info_c DB 'Bears have been hunted for their meat and fur.They love fish and dance.'

	Monkey_Info DB 'They are species of mammals, in part, the simians of infraorder Simiiformes.'

	Monkey_Info_c DB 'They love climbing and eat Bananas.'

	Horse_Info DB 'Horses are adapted to run, allowing them to quickly escape predators, possessing an excellent'

	Horse_Info_c DB ' sense of balance and a strong fight or flight response. They eat grass.'

    Camel_Info DB 'They do not directly store water in their humps they are reservoirs of fatty tissue. Concentrating '

	Camel_Info_c DB 'body fat in their humps minimizes effect fat would have if distributed over the rest of their bodies.'


	Elephant_Info DB 'They are mammals of the family Elephantidae and the largest existing land animals.'

	Elephant_Info_c DB 'Males leave their family groups when they reach puberty, and may live alone or with other males.'

	Zebra_Info db 'They are several species of African horse family united by their distinctive black and white.'
	Zebra_Info_c db 'They love running and eat grass.'

; ________                                       
; \_   ___ \  ____   _____   _____   ____   ____  
; /    \  \/ /  _ \ /     \ /     \ /  _ \ /    \ 
; \     \___(  <_> )  Y Y  \  Y Y  (  <_> )   |  \
;  \______  /\____/|__|_|  /__|_|  /\____/|___|  /
;         \/             \/      \/            \/ 
	Guess_who     db 'Guess Who .....?'
	Score         db 0
	One           db '1-'
	Two           db '2-'
	Three         db '3-'
	TRUE          DB 'TRUE  ANSWER','$'
	FALSE         DB 'WRONG ANSWER','$'

	               

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
	MAIN_MENUE:
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
	 JOPS_MODE: 
	    call Video_mode
		OpenFile Teacher,Filehandle
		ReadData Filehandle,Data_F,WIDTH,HEIGHT
		LEA BX , Data_F
		Draw BX,WIDTH,HEIGHT,0,0
		CloseFile Filehandle

		Print Teacher_Jop,81,27,3,04
		Print Teacher_Jop_c,84,27,5,04
		Print Guess_who,16,65,8,14
  
        call Print_NUM
		Print Jops,7,29,12,5 ;answer
        Print Jops[7],7,29,14,7
		Print Jops[14],7,29,16,9
      
        MOV dh,31H
		call Check_answer
       



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

		Print Policer_Jop,72,27,3,04
		Print Policer_Jop_c,88,27,5,04
		Print Guess_who,16,65,8,14

		call Print_NUM
		Print Jops[21],7,29,12,5
        Print Jops[7],7,29,14,7 ;answer
		Print Jops[14],7,29,16,9

		MOV dh,32H
		call Check_answer

;   _____                   _                  
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
		Print Doctor_Jop,81,27,3,04
		Print Doctor_Jop_c,80,27,5,04
		Print Guess_who,16,65,8,14
		
        
		call Print_NUM
		Print Jops[35],7,29,12,5
        Print Jops[28],7,29,14,7 
		Print Jops[14],7,29,16,9;answer

		MOV dh,33H
		call Check_answer

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
		Print Soldier_Jop,66,35,3,04
		Print Soldier_Jop_c,85,27,5,04
		Print Guess_who,16,65,8,14

        call Print_NUM
		Print Jops[42],7,29,12,5 
        Print Jops[21],7,29,14,7;answer
		Print Jops,7,29,16,9
      
        MOV dh,32H
		call Check_answer
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

		Print Lawyer_Jop,91,27,3,04
		Print Lawyer_Jop_c,84,27,5,04
		Print Guess_who,16,65,8,14

        call Print_NUM
		Print Jops[28],7,29,12,5 ;answer
        Print Jops[21],7,29,14,7
		Print Jops[42],7,29,16,9
      
        MOV dh,31H
		call Check_answer
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
		Print Player_Job,82,29,3,04
		Print Player_Job_c,78,27,5,04
		Print Guess_who,16,65,8,14

        call Print_NUM
		Print Jops[7],7,29,12,5 
        Print Jops[21],7,29,14,7
		Print Jops[35],7,29,16,9;answer
      
        MOV dh,33H
		call Check_answer
		
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

		Print Actor_Job,98,27,3,04
		Print Actor_Job_c,97,27,5,04
		Print Guess_who,16,65,8,14

        call Print_NUM
		Print Jops[14],7,29,12,5 
        Print Jops[0],7,29,14,7
		Print Jops[42],7,29,16,9;answer
      
        MOV dh,33H
		call Check_answer
		JMP MAIN_MENUE


Animals_MODE: 
; ____    .__               
; |    |   |__| ____   ____  
; |    |   |  |/  _ \ /    \ 
; |    |___|  (  <_> )   |  \
; |_______ \__|\____/|___|  /
;         \/              \/ 
        call Video_mode
		OpenFile Lion,Filehandle
		ReadData Filehandle,Data_F,WIDTH,HEIGHT
		LEA BX , Data_F
		pusha
		Draw BX,WIDTH,HEIGHT,0,0
		popa
		CloseFile Filehandle

		Print Lion_Info,100,27,3,04
		Print Lion_Info_c,44,50,5,04
		Print Guess_who,16,65,8,14

        call Print_NUM
		Print Animals[0],6,29,12,5;answer 
        Print Animals[6],6,29,14,7
		Print Animals[12],6,29,16,9
      
        MOV dh,31H
		call Check_answer
	
; __________                     
; \______   \ ____ _____ _______ 
;  |    |  _// __ \\__  \\_  __ \
;  |    |   \  ___/ / __ \|  | \/
;  |______  /\___  >____  /__|   
;         \/     \/     \/    
		call Video_mode
		OpenFile Bear,Filehandle
		ReadData Filehandle,Data_F,WIDTH,HEIGHT
		LEA BX , Data_F
		pusha
		Draw BX,WIDTH,HEIGHT,0,0
		popa
		CloseFile Filehandle
		Print Bear_Info,91,27,3,04
		Print Bear_Info_c,71,27,5,04
		Print Guess_who,16,65,8,14

        call Print_NUM
		Print Animals[24],6,29,12,5
        Print Animals[18],6,29,14,7
		Print Animals[6],6,29,16,9;answer 
      
        MOV dh,33H
		call Check_answer
		
                                             
;  \_   _____/|  |   ____ ______ |  |__ _____    _____/  |_ 
;  |    __)_ |  | _/ __ \\____ \|  |  \\__  \  /    \   __\
;  |        \|  |_\  ___/|  |_> >   Y  \/ __ \|   |  \  |  
; /_______  /|____/\___  >   __/|___|  (____  /___|  /__|  
;         \/           \/|__|        \/     \/     \/                                               
        call Video_mode
		OpenFile Elephant,Filehandle
		ReadData Filehandle,Data_F,WIDTH,HEIGHT
		LEA BX , Data_F
		pusha
		Draw BX,WIDTH,HEIGHT,0,0
		popa
		CloseFile Filehandle
		Print Elephant_Info,82,36,3,04
		Print Elephant_Info_c,96,26,5,04
		Print Guess_who,16,65,8,14

        call Print_NUM
		Print Animals[24],6,29,12,5
        Print Animals[36],8,29,14,7;asnwer
		Print Animals[12],6,29,16,9 
      
        MOV dh,32H
		call Check_answer
; _________                       .__   
; \_   ___ \_____    _____   ____ |  |  
; /    \  \/\__  \  /     \_/ __ \|  |  
; \     \____/ __ \|  Y Y  \  ___/|  |__
;  \______  (____  /__|_|  /\___  >____/
;         \/     \/      \/     \/      
		call Video_mode
		OpenFile Camel,Filehandle
		ReadData Filehandle,Data_F,WIDTH,HEIGHT
		LEA BX , Data_F
		pusha
		Draw BX,WIDTH,HEIGHT,0,0
		popa
		CloseFile Filehandle
		Print Camel_Info,99,27,3,04
		Print Camel_Info_c,101,26,5,04
		Print Guess_who,16,65,8,14

        call Print_NUM
		Print Animals[6],6,29,12,5
        Print Animals[24],6,29,14,7
		Print Animals[30],6,29,16,9;answer 
		
		MOV dh,33H
		call Check_answer
;    _____                 __                 
;   /     \   ____   ____ |  | __ ____ ___.__.
;  /  \ /  \ /  _ \ /    \|  |/ // __ <   |  |
; /    Y    (  <_> )   |  \    <\  ___/\___  |
; \____|__  /\____/|___|  /__|_ \\___  > ____|
;         \/            \/     \/    \/\/     
		call Video_mode
		OpenFile Monkey,Filehandle
		ReadData Filehandle,Data_F,WIDTH,HEIGHT
		LEA BX , Data_F
		pusha
		Draw BX,WIDTH,HEIGHT,0,0
		popa
		CloseFile Filehandle
		Print Monkey_Info,76,30,3,04
		Print Monkey_Info_c,35,50,5,04
		Print Guess_who,16,65,8,14

        call Print_NUM
		Print Animals[12],6,29,12,5;answer
        Print Animals[6],6,29,14,7
		Print Animals[36],8,29,16,9 
		
		MOV dh,31H
		call Check_answer
;   ___ ___                             
;  /   |   \  ___________  ______ ____  
; /    ~    \/  _ \_  __ \/  ___// __ \ 
; \    Y    (  <_> )  | \/\___ \\  ___/ 
;  \___|_  / \____/|__|  /____  >\___  >
;        \/                   \/     \/ 
                       
		call Video_mode
		OpenFile Horse,Filehandle
		ReadData Filehandle,Data_F,WIDTH,HEIGHT
		LEA BX , Data_F
		pusha
		Draw BX,WIDTH,HEIGHT,0,0
		popa
		CloseFile Filehandle
		Print Horse_Info,93,27,3,04
		Print Horse_Info_c,72,27,5,04
		Print Guess_who,16,65,8,14

        call Print_NUM
		Print Animals[0],6,29,12,5
        Print Animals[18],6,29,14,7;answer
		Print Animals[36],8,29,16,9 
		
		MOV dh,32H
		call Check_answer
; _________    ___.                 
; \____    /____\_ |______________   
;   /     // __ \| __ \_  __ \__  \  
;  /     /\  ___/| \_\ \  | \// __ \_
; /_______ \___  >___  /__|  (____  /
;         \/   \/    \/           \/ 
                                          
		call Video_mode
		OpenFile Zebra,Filehandle
		ReadData Filehandle,Data_F,WIDTH,HEIGHT
		LEA BX , Data_F
		pusha
		Draw BX,WIDTH,HEIGHT,0,0
		popa
		CloseFile Filehandle
		Print Zebra_Info,93,32,3,04
		Print Zebra_Info_c,32,54,5,04
		Print Guess_who,16,65,8,14

        call Print_NUM
		Print Animals[24],6,29,12,5;answer
        Print Animals[36],8,29,14,7
		Print Animals[18],6,29,16,9 
		
		MOV dh,31H
		call Check_answer

		jmp MAIN_MENUE


Video_mode PROC
	mov ax,4f02h
		MOV BX,105H ; 1024*786 256 COLORS
		INT 10H 
	ret	
Video_mode endp

Print_NUM PROC

Print One,2,27,12,2 
Print Two,2,27,14,2	
Print Three,2,27,16,2
ret
Print_NUM endp

Check_answer PROC
DEFAULT_CHECK:  

			MOV AH , 0      ;WAIT FOR KEY
			INT 16h
		
			CMP AL,dh        ;answer
			JE TRUE_ANSWER	
			
			CMP AL, 30h
			Jl DEFAULT_CHECK   ;wrong_key
            
			CMP AL, 33h
			JG DEFAULT_CHECK   ;wrong_key

	WRONG_ANSWER:
	
		mov ah,2 
		mov dl,43h
		mov dh,11h 
		int 10h 

		mov ah, 9 
		mov dx,offset FALSE
		int 21h 		
		JMP   RETURN_CHECK

	TRUE_ANSWER:
		mov ah,2 
		mov dl,43h
		mov dh,11h 
		int 10h 

		mov ah, 9 
		mov dx,offset TRUE
		int 21h 		
		JMP   RETURN_CHECK	
			
RETURN_CHECK:
         MOV AH , 0
         INT 16h
	ret
Check_answer endp
  END MAIN 



		