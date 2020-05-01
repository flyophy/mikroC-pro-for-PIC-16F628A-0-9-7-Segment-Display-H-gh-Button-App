
_main:

;0-9 ARTTIRMA SAYICI.c,3 :: 		void main()   // ANA PRO�RAM BA�LANGICI...
;0-9 ARTTIRMA SAYICI.c,5 :: 		trisb=0;        // TRISB'NIN B�T�N P�NLER� �IKI� OLARAK AYARLANDI...
	CLRF       TRISB+0
;0-9 ARTTIRMA SAYICI.c,6 :: 		trisa.f0=1;     // TRISA'NIN 0. P�N� G�R�� OLARAK AYARLANDI...
	BSF        TRISA+0, 0
;0-9 ARTTIRMA SAYICI.c,7 :: 		portb=dizi[0];  // PORTB'YE D�Z�N�N 0. ELEMANI OLAN SIFIR RAKAMI Y�KLEN�YOR...
	MOVF       _dizi+0, 0
	MOVWF      PORTB+0
;0-9 ARTTIRMA SAYICI.c,8 :: 		CMCON=7;        // KOMPARAT�RLER KAPATILDI...
	MOVLW      7
	MOVWF      CMCON+0
;0-9 ARTTIRMA SAYICI.c,9 :: 		while(1)        // SONSUZ D�NG� BA�LANGICI...
L_main0:
;0-9 ARTTIRMA SAYICI.c,11 :: 		if(porta.f0==0)      //PORTA.F0'DAK� PULL-UP D�RENC� 0 MI ( 0V )... ?
	BTFSC      PORTA+0, 0
	GOTO       L_main2
;0-9 ARTTIRMA SAYICI.c,13 :: 		i++;        // 1 DE���KEN� 1 ARTTIRILDI...
	INCF       _i+0, 1
;0-9 ARTTIRMA SAYICI.c,14 :: 		if(i>9)     // � DE���KEN� 9 SAYISINDAN B�Y�K �SE...
	MOVF       _i+0, 0
	SUBLW      9
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;0-9 ARTTIRMA SAYICI.c,16 :: 		i=0;   // � DE���KEN�N� 0 YAP...
	CLRF       _i+0
;0-9 ARTTIRMA SAYICI.c,17 :: 		}
L_main3:
;0-9 ARTTIRMA SAYICI.c,18 :: 		portb=dizi[i];  //PORTB'YE D�Z�N�N � DE���KEN� KA�SA O ELAMANINI Y�KLE...
	MOVF       _i+0, 0
	ADDLW      _dizi+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;0-9 ARTTIRMA SAYICI.c,19 :: 		delay_ms(500);  //500 M�L�SAN�YE BEKLE...
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;0-9 ARTTIRMA SAYICI.c,20 :: 		}  //�F KOMUTU SONU...
L_main2:
;0-9 ARTTIRMA SAYICI.c,21 :: 		} // SONSUZ D�NG� SONU...
	GOTO       L_main0
;0-9 ARTTIRMA SAYICI.c,22 :: 		}  // ANA PRO�RAM SONU...
L_end_main:
	GOTO       $+0
; end of _main
