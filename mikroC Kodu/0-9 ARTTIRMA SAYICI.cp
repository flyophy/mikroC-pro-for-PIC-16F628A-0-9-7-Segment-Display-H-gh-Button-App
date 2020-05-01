#line 1 "C:/Users/EMRE/Desktop/ELEKTRONÝKK/mikroC/0-9 BUTON ARTTIRMA SAYICI/mikroC Kodu/0-9 ARTTIRMA SAYICI.c"
char dizi[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
char i=0;
void main()
{
trisb=0;
trisa.f0=1;
portb=dizi[0];
CMCON=7;
while(1)
 {
 if(porta.f0==0)
 {
 i++;
 if(i>9)
 {
 i=0;
 }
 portb=dizi[i];
 delay_ms(500);
 }
 }
}
