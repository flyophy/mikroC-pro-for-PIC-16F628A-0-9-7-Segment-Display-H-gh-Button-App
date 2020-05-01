
_main:

;0-9 ARTTIRMA SAYICI.c,3 :: 		void main()   // ANA PROÐRAM BAÞLANGICI...
;0-9 ARTTIRMA SAYICI.c,5 :: 		trisb=0;        // TRISB'NIN BÜTÜN PÝNLERÝ ÇIKIÞ OLARAK AYARLANDI...
	CLRF       TRISB+0
;0-9 ARTTIRMA SAYICI.c,6 :: 		trisa.f0=1;     // TRISA'NIN 0. PÝNÝ GÝRÝÞ OLARAK AYARLANDI...
	BSF        TRISA+0, 0
;0-9 ARTTIRMA SAYICI.c,7 :: 		portb=dizi[0];  // PORTB'YE DÝZÝNÝN 0. ELEMANI OLAN SIFIR RAKAMI YÜKLENÝYOR...
	MOVF       _dizi+0, 0
	MOVWF      PORTB+0
;0-9 ARTTIRMA SAYICI.c,8 :: 		CMCON=7;        // KOMPARATÖRLER KAPATILDI...
	MOVLW      7
	MOVWF      CMCON+0
;0-9 ARTTIRMA SAYICI.c,9 :: 		while(1)        // SONSUZ DÖNGÜ BAÞLANGICI...
L_main0:
;0-9 ARTTIRMA SAYICI.c,11 :: 		if(porta.f0==0)      //PORTA.F0'DAKÝ PULL-UP DÝRENCÝ 0 MI ( 0V )... ?
	BTFSC      PORTA+0, 0
	GOTO       L_main2
;0-9 ARTTIRMA SAYICI.c,13 :: 		i++;        // 1 DEÐÝÞKENÝ 1 ARTTIRILDI...
	INCF       _i+0, 1
;0-9 ARTTIRMA SAYICI.c,14 :: 		if(i>9)     // Ý DEÐÝÞKENÝ 9 SAYISINDAN BÜYÜK ÝSE...
	MOVF       _i+0, 0
	SUBLW      9
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;0-9 ARTTIRMA SAYICI.c,16 :: 		i=0;   // Ý DEÐÝÞKENÝNÝ 0 YAP...
	CLRF       _i+0
;0-9 ARTTIRMA SAYICI.c,17 :: 		}
L_main3:
;0-9 ARTTIRMA SAYICI.c,18 :: 		portb=dizi[i];  //PORTB'YE DÝZÝNÝN Ý DEÐÝÞKENÝ KAÇSA O ELAMANINI YÜKLE...
	MOVF       _i+0, 0
	ADDLW      _dizi+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;0-9 ARTTIRMA SAYICI.c,19 :: 		delay_ms(500);  //500 MÝLÝSANÝYE BEKLE...
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
;0-9 ARTTIRMA SAYICI.c,20 :: 		}  //ÝF KOMUTU SONU...
L_main2:
;0-9 ARTTIRMA SAYICI.c,21 :: 		} // SONSUZ DÖNGÜ SONU...
	GOTO       L_main0
;0-9 ARTTIRMA SAYICI.c,22 :: 		}  // ANA PROÐRAM SONU...
L_end_main:
	GOTO       $+0
; end of _main
