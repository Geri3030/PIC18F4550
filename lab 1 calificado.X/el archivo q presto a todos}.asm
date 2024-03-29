    list p=18f4550
    #include <p18f4550.inc>

    CONFIG  FOSC = XT_XT          ; Oscillator Selection bits (XT oscillator (XT))
    CONFIG  PWRT = ON             ; Power-up Timer Enable bit (PWRT enabled)
    CONFIG  BOR = OFF             ; Brown-out Reset Enable bits (Brown-out Reset disabled in hardware and software)
    CONFIG  WDT = OFF             ; Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
    CONFIG  PBADEN = OFF          ; PORTB A/D Enable bit (PORTB<4:0> pins are configured as digital I/O on Reset)
    CONFIG  LVP = OFF             ; Single-Supply ICSP Enable bit (Single-Supply ICSP disabled)
    
    cblock 0x0020
    cta_a
    cta_b
    cta_c
    
    dig1
    dig2
    dig3
    dig4
    
    vel
    flecha
    
    indicaconfig
    pase
    endc
    
    org 0x1000
mensaje1   db 0x00,0x00,0x00,0x00,0x37,0x06,0x39,0x50,0x5C,0x039,0x5C,0x54,0x78,0x50,0x5C,0x38,0x77,0x5E,0x5C,0x50,0x79,0x6D,0x00,0x3E,0x73,0x39,0x00,0x09,0x0F,0x00,0x00,0x00,0x00
	      ;   ;    ;    ;    ;M   ;i   ;c   ;r   ;o   ;c    ;o   ;n   ;t   ;r   ;o   ;l   ;a   ;d   ;o   ;r   ;e   ;s   ;    ;U   ;P   ;C   ;    ;:   ;)                   
    org 0x1100
mensaje2   db 0x00,0x00,0x00,0x00,0x39,0x06,0x39,0x38,0x5C,0x00,0x5B,0x3F,0x06,0x67,0x40,0x06,0x00,0x00,0x00,0x00
	      ;   ;    ;    ;    ;C   ;i   ;c   ;l   ;o   ;    ;2   ;0   ;1   ;9   ;-   ;1      
    org 0x1200
mensaje3a  db 0x00,0x00,0x00,0x00,0x38,0x77,0x00,0x1C,0x06,0x5E,0x77,0x00,0x79,0x6D,0x00,0x3E,0x54,0x77,0x00,0x79,0x6D,0x73,0x79,0x39,0x06,0x79,0x00,0x5E,0x79,0x00,0x7C,0x06,0x39  
	      ;   ;    ;    ;    ;l   ;a   ;    ;v   ;i   ;d   ;a   ;    ;e   ;s   ;    ;u   ;n   ;a   ;    ;e   ;s   ;p   ;e   ;c   ;i   ;e   ;    ;d   ;e   ;    ;b   ;i   ;c             
    org 0x1300
mensaje3b  db 0x7C,0x06,0x39,0x06,0x39,0x38,0x79,0x78,0x77,0x09,0x00,0x6D,0x06,0x00,0x67,0x3E,0x06,0x79,0x50,0x79,0x6D,0x00,0x37,0x77,0x54,0x78,0x79,0x54,0x79,0x50,0x78,0x79,0x00    
	      ;b   ;i   ;c  ;i   ;c   ;l   ;e   ;t   ;a   ;:   ;    ;s   ;i   ;    ;q   ;u   ;i   ;e   ;r   ;e   ;s   ;    ;m   ;a   ;n   ;t   ;e   ;n   ;e   ;r   ;t   ;e   ;                
    org 0x1400
mensaje3c  db 0x78,0x79,0x00,0x79,0x54,0x00,0x79,0x67,0x3E,0x06,0x38,0x06,0x7C,0x50,0x06,0x5C,0x00,0x5E,0x79,0x7C,0x79,0x6D,0x00,0x73,0x79,0x5E,0x77,0x38,0x79,0x77,0x50,0x00,0x74
	      ;t  ;e   ;    ;e   ;n   ;    ;e   ;q   ;u   ;i   ;l   ;i   ;b   ;r   ;i   ;o   ;    ;d   ;e   ;b   ;e   ;s   ;    ;p   ;e   ;d   ;a   ;l   ;e   ;a   ;r   ;    ;h              
    org 0x1500
mensaje3d  db 0x50,0x00,0x74,0x77,0x39,0x06,0x77,0x00,0x77,0x5E,0x79,0x38,0x77,0x54,0x78,0x79,0x00,0x00,0x00,0x00
              ;r   ;   ;h   ;a   ;c   ;i   ;a   ;    ;a   ;d   ;e   ;l   ;a   ;n   ;t   ;e   ;    ;    ;    ;
    org 0x1600
mensaje4a   db 0x00,0x00,0x00,0x00,0x38,0x5C,0x00,0x67,0x3E,0x79,0x00,0x54,0x5C,0x00,0x37,0x79,0x00,0x37,0x77,0x78,0x77,0x04,0x00,0x37,0x79,0x00,0x77,0x38,0x06,0x37,0x79,0x54,0x78                
	       ;   ;    ;    ;    ;L   ;o   ;    ;q   ;u   ;e   ;    ;n   ;o   ;    ;m   ;e   ;    ;m   ;a   ;t   ;a   ;,   ;    ;m   ;e   ;    ;a   ;l   ;i   ;m   ;e   ;n   ;t   
    org 0x1700
mensaje4b   db 0x79,0x54,0x78,0x77,0x00,0x00,0x00,0x00
	       ;e  ;n   ;t   ;a   ;    ;    ;    ;  
    org 0x1800
mensaje5   db 0x00,0x10,0x30,0x21,0x03,0x42,0x50,0x18,0x08
	      ;0  ;1   ;2   ;3   ;4   ;5   ;6   ;7   ;8
    
    org 0x0000
    goto configura
    
    org 0x0008
    goto memachucaron
    
    org 0x0020
configura:
    clrf TRISD		;puerto D como salida
    
    ;puertos de seleccion
    bcf TRISA,0		
    bcf TRISE,0
    bcf TRISE,1
    bcf TRISE,2
    ; setear a 1
    bsf LATA,0
    bsf LATE,0
    bsf LATE,1
    bsf LATE,2
    ; valores iniciales
    movlw .0
    movwf flecha
    movlw .10
    movwf vel
    movlw .1
    movwf pase
    ;----vaina para el teclad matricial----;
    clrf LATB		
    movlw 0xF0		;B del  7 al 4 (columnas) son entrada 
    movwf TRISB		;B del  3 al 0 (filas) son salida
    bcf INTCON2,RBPU 
    bsf INTCON,RBIE 
    bsf INTCON,GIE
    
apreguntar:
    movlw .1
    cpfseq indicaconfig
    goto sa
    goto configura1
sa:
    movlw .2
    cpfseq indicaconfig
    goto saa
    goto configura2
saa:
    movlw .3
    cpfseq indicaconfig
    goto saaa
    goto configura3
saaa:
    movlw .4
    cpfseq indicaconfig
    goto apreguntar
    goto configura4
    
;-----configuracion de mensaje 1----;    
configura1:
    movlw .1
    cpfseq pase
    goto salta1
    goto entra1
entra1:
    movlw .0
    movwf pase
    movlw .0
    movwf dig1
    movlw .1 
    movwf dig2
    movlw .2 
    movwf dig3
    movlw .3 
    movwf dig4
salta1:
    ; aplicar la tabla
    movlw HIGH mensaje1
    movwf TBLPTRH
    movlw LOW mensaje1
    movwf TBLPTRL
inicio1:
    call delaymon
    movlw .0
    cpfseq flecha
    goto dere1
    goto izqui1
dere1:
    movlw .0
    cpfseq dig1
    goto falso1
    goto verdad1
falso1:
    decf dig1,f
    decf dig2,f
    decf dig3,f
    decf dig4,f
    goto inicio1
verdad1:    
    clrf TBLPTRL
    movlw .29
    movwf dig1
    movlw .30
    movwf dig2
    movlw .31
    movwf dig3
    movlw .32 
    movwf dig4
    goto apreguntar
izqui1:
    movlw .32
    cpfseq dig4
    goto falso2
    goto verdad2
falso2:
    incf dig1,f
    incf dig2,f
    incf dig3,f
    incf dig4,f
    goto inicio1
verdad2:    
    clrf TBLPTRL
    movlw .0
    movwf dig1
    movlw .1 
    movwf dig2
    movlw .2 
    movwf dig3
    movlw .3 
    movwf dig4
    goto apreguntar
    
;-----configuracion de mensaje 2----;    
configura2:
    movlw .1
    cpfseq pase
    goto salta2
    goto entra2
entra2:    
    movlw .0
    movwf pase
    movlw .0
    movwf dig1
    movlw .1 
    movwf dig2
    movlw .2 
    movwf dig3
    movlw .3 
    movwf dig4
salta2:
    ; aplicar la tabla
    movlw HIGH mensaje2
    movwf TBLPTRH
    movlw LOW mensaje2
    movwf TBLPTRL
inicio2:
    call delaymon
    movlw .0
    cpfseq flecha
    goto dere2
    goto izqui2
dere2:
    movlw .0
    cpfseq dig1
    goto falso3
    goto verdad3
falso3:
    decf dig1,f
    decf dig2,f
    decf dig3,f
    decf dig4,f
    goto inicio2
verdad3:    
    clrf TBLPTRL
    movlw .16
    movwf dig1
    movlw .17 
    movwf dig2
    movlw .18
    movwf dig3
    movlw .19 
    movwf dig4
    goto apreguntar
izqui2:
    movlw .19
    cpfseq dig4
    goto falso4
    goto verdad4
falso4:
    incf dig1,f
    incf dig2,f
    incf dig3,f
    incf dig4,f
    goto inicio2
verdad4:    
    clrf TBLPTRL
    movlw .0
    movwf dig1
    movlw .1 
    movwf dig2
    movlw .2 
    movwf dig3
    movlw .3 
    movwf dig4
    goto apreguntar

;-----configuracion de mensaje 3----;    
configura3:
inicio3:
    movlw .0
    cpfseq flecha
    goto dere3
    goto izqui3
    ;---------------;
dere3:
    movlw .16
    movwf dig1
    movlw .17 
    movwf dig2
    movlw .18 
    movwf dig3
    movlw .19 
    movwf dig4
    movlw HIGH mensaje3d
    movwf TBLPTRH
    movlw LOW mensaje3d
    movwf TBLPTRL
izqui311:
    call delaymon
    movlw .0
    cpfseq dig1
    goto falso311
    goto verdad311
falso311:
    decf dig1,f
    decf dig2,f
    decf dig3,f
    decf dig4,f
    goto izqui311
verdad311:    
    clrf TBLPTRL
    movlw HIGH mensaje3c
    movwf TBLPTRH
    movlw LOW mensaje3c
    movwf TBLPTRL
    movlw .29
    movwf dig1
    movlw .30 
    movwf dig2
    movlw .31 
    movwf dig3
    movlw .32 
    movwf dig4
izqui321:
    call delaymon
    movlw .0
    cpfseq dig1
    goto falso321
    goto verdad321
falso321:
    decf dig1,f
    decf dig2,f
    decf dig3,f
    decf dig4,f
    goto izqui321
verdad321: 
    clrf TBLPTRL
    movlw HIGH mensaje3b
    movwf TBLPTRH
    movlw LOW mensaje3b
    movwf TBLPTRL
    movlw .29
    movwf dig1
    movlw .30 
    movwf dig2
    movlw .31 
    movwf dig3
    movlw .32 
    movwf dig4
izqui331:
    call delaymon
    movlw .0
    cpfseq dig1
    goto falso331
    goto verdad331
falso331:
    decf dig1,f
    decf dig2,f
    decf dig3,f
    decf dig4,f
    goto izqui331
verdad331: 
    clrf TBLPTRL
    movlw HIGH mensaje3a
    movwf TBLPTRH
    movlw LOW mensaje3a
    movwf TBLPTRL
    movlw .29
    movwf dig1
    movlw .30 
    movwf dig2
    movlw .31 
    movwf dig3
    movlw .32 
    movwf dig4
izqui341:
    call delaymon
    movlw .0
    cpfseq dig1
    goto falso341
    goto verdad341
falso341:
    decf dig1,f
    decf dig2,f
    decf dig3,f
    decf dig4,f
    goto izqui341
verdad341: 
    clrf TBLPTRL
    goto apreguntar
;---------------------;
izqui3:    
    movlw .0
    movwf dig1
    movlw .1 
    movwf dig2
    movlw .2 
    movwf dig3
    movlw .3 
    movwf dig4
    movlw HIGH mensaje3a
    movwf TBLPTRH
    movlw LOW mensaje3a
    movwf TBLPTRL
izqui31:
    call delaymon
    movlw .32
    cpfseq dig4
    goto falso31
    goto verdad31
falso31:
    incf dig1,f
    incf dig2,f
    incf dig3,f
    incf dig4,f
    goto izqui31
verdad31:    
    clrf TBLPTRL
    movlw HIGH mensaje3b
    movwf TBLPTRH
    movlw LOW mensaje3b
    movwf TBLPTRL
    movlw .0
    movwf dig1
    movlw .1 
    movwf dig2
    movlw .2 
    movwf dig3
    movlw .3 
    movwf dig4
izqui32:
    call delaymon
    movlw .32
    cpfseq dig4
    goto falso32
    goto verdad32
falso32:
    incf dig1,f
    incf dig2,f
    incf dig3,f
    incf dig4,f
    goto izqui32
verdad32: 
    clrf TBLPTRL
    movlw HIGH mensaje3c
    movwf TBLPTRH
    movlw LOW mensaje3c
    movwf TBLPTRL
    movlw .0
    movwf dig1
    movlw .1 
    movwf dig2
    movlw .2 
    movwf dig3
    movlw .3 
    movwf dig4
izqui33:
    call delaymon
    movlw .32
    cpfseq dig4
    goto falso33
    goto verdad33
falso33:
    incf dig1,f
    incf dig2,f
    incf dig3,f
    incf dig4,f
    goto izqui33
verdad33: 
    clrf TBLPTRL
    movlw HIGH mensaje3d
    movwf TBLPTRH
    movlw LOW mensaje3d
    movwf TBLPTRL
    movlw .0
    movwf dig1
    movlw .1 
    movwf dig2
    movlw .2 
    movwf dig3
    movlw .3 
    movwf dig4
izqui34:
    call delaymon
    movlw .19
    cpfseq dig4
    goto falso34
    goto verdad34
falso34:
    incf dig1,f
    incf dig2,f
    incf dig3,f
    incf dig4,f
    goto izqui34
verdad34: 
    clrf TBLPTRL
    goto apreguntar
    
;-----configuracion de mensaje 4----;
configura4:
inicio4:
    movlw .0
    cpfseq flecha
    goto dere4
    goto izqui4
;-----------------------------------;
dere4:
    movlw .4
    movwf dig1
    movlw .5 
    movwf dig2
    movlw .6 
    movwf dig3
    movlw .7 
    movwf dig4
    movlw HIGH mensaje4b
    movwf TBLPTRH
    movlw LOW mensaje4b
    movwf TBLPTRL
izqui411:
    call delaymon
    movlw .0
    cpfseq dig1
    goto falso411
    goto verdad411
falso411:
    decf dig1,f
    decf dig2,f
    decf dig3,f
    decf dig4,f
    goto izqui411
verdad411:    
    clrf TBLPTRL
    movlw HIGH mensaje4a
    movwf TBLPTRH
    movlw LOW mensaje4a
    movwf TBLPTRL
    movlw .29
    movwf dig1
    movlw .30 
    movwf dig2
    movlw .31 
    movwf dig3
    movlw .32 
    movwf dig4
izqui421:
    call delaymon
    movlw .0
    cpfseq dig1
    goto falso421
    goto verdad421
falso421:
    decf dig1,f
    decf dig2,f
    decf dig3,f
    decf dig4,f
    goto izqui421
verdad421: 
    clrf TBLPTRL
    goto apreguntar
;-----------------------------------;
izqui4:    
    movlw .0
    movwf dig1
    movlw .1 
    movwf dig2
    movlw .2 
    movwf dig3
    movlw .3 
    movwf dig4
    movlw HIGH mensaje4a
    movwf TBLPTRH
    movlw LOW mensaje4a
    movwf TBLPTRL
izqui41:
    call delaymon
    movlw .32
    cpfseq dig4
    goto falso41
    goto verdad41
falso41:
    incf dig1,f
    incf dig2,f
    incf dig3,f
    incf dig4,f
    goto izqui41
verdad41:    
    clrf TBLPTRL
    movlw HIGH mensaje4b
    movwf TBLPTRH
    movlw LOW mensaje4b
    movwf TBLPTRL
    movlw .0
    movwf dig1
    movlw .1 
    movwf dig2
    movlw .2 
    movwf dig3
    movlw .3 
    movwf dig4
izqui42:
    call delaymon
    movlw .7
    cpfseq dig4
    goto falso42
    goto verdad42
falso42:
    incf dig1,f
    incf dig2,f
    incf dig3,f
    incf dig4,f
    goto izqui42
verdad42: 
    clrf TBLPTRL
    goto apreguntar
    
;-------secuencia para mostrar el display por un tiempo-----------;
delaymon:
    movff vel,cta_a
otro1:
    call bucle2
    decfsz cta_a, f
    goto otro1
    return
bucle2:
    movlw .5
    movwf cta_b
otro2:
    call bucle3
    decfsz cta_b, f
    goto otro2
    return
bucle3:
    movlw .100
    movwf cta_c
otro3:
    call displayada
    decfsz cta_c, f
    goto otro3
    return
;------rafaga de muestra------;
displayada:
    ;-- digito1 --;
    clrf TBLPTRL
    movf dig1, W
    addwf TBLPTRL
    TBLRD*
    movff TABLAT, LATD
    bcf LATA,0
    nop
    bsf LATA,0
    ;-- digito2 --;
    clrf TBLPTRL
    movf dig2, W
    addwf TBLPTRL
    TBLRD*
    movff TABLAT, LATD
    bcf LATE,0
    nop
    bsf LATE,0
    ;-- digito3 --;
    clrf TBLPTRL
    movf dig3, W
    addwf TBLPTRL
    TBLRD*
    movff TABLAT, LATD
    bcf LATE,1
    nop
    bsf LATE,1
    ;-- digito4 --;
    clrf TBLPTRL
    movf dig4, W
    addwf TBLPTRL
    TBLRD*
    movff TABLAT, LATD
    bcf LATE,2
    nop
    bsf LATE,2
    return
;------rutina de interrupcion------;
    org 0x3000
memachucaron:
    call displayada
    bcf INTCON,RBIF	;bajar bandera
    btfss PORTB,4 
    goto COL1 
    btfss PORTB,5 
    goto COL2 
    btfss PORTB,6 
    goto COL3 
    btfss PORTB,7 
    goto COL4 
    retfie
COL1:
    movlw 0x0F		;0F = 00001111
    movwf TRISB 
    clrf LATB 
    btfss PORTB,0 
    goto tablear1
    btfss PORTB,1 
    goto tablear2
    btfss PORTB,2 
    goto tablear3
    btfss PORTB,3 
    goto tablear4
    goto SALIR
COL2:
    movlw 0x0F 
    movwf TRISB 
    clrf LATB 
    btfss PORTB,0 
    goto velo1
    btfss PORTB,1 
    goto velo2 
    btfss PORTB,2 
    goto velo3
    btfss PORTB,3 
    goto velo4
    goto SALIR
COL3:
    movlw 0x0F 
    movwf TRISB 
    clrf LATB 
    btfss PORTB,0 
    goto izqui 
    btfss PORTB,1 
    goto dere
    btfss PORTB,2 
    goto SALIR
    btfss PORTB,3 
    goto SALIR
    goto SALIR
COL4:
    movlw 0x0F 
    movwf TRISB 
    clrf LATB 
    btfss PORTB,0 
    goto SALIR
    btfss PORTB,1 
    goto SALIR
    btfss PORTB,2 
    goto SALIR
    btfss PORTB,3 
    goto SALIR
    goto SALIR
    ;-----cajas de seleccion----;
tablear1:
    movlw .1
    movwf indicaconfig
    movlw .1
    movwf pase
    goto SALIR
tablear2:
    movlw .2
    movwf indicaconfig
    movlw .1
    movwf pase
    goto SALIR
tablear3:
    movlw .3
    movwf indicaconfig
    movlw .1
    movwf pase
    goto SALIR
tablear4:
    movlw .4
    movwf indicaconfig
    movlw .1
    movwf pase
    goto SALIR
velo1:
    movlw .5
    movwf vel
    goto SALIR
velo2:
    movlw .7
    movwf vel
    goto SALIR
velo3:
    movlw .10
    movwf vel
    goto SALIR
velo4:
    movlw .20
    movwf vel
    goto SALIR
izqui:
    movlw .0
    movwf flecha
    goto SALIR
dere:
    movlw .1
    movwf flecha
    goto SALIR
SALIR:
    movlw 0xF0
    movwf TRISB
    retfie
        
    end