
typedef unsigned int UINT ;
typedef unsigned char UCHAR ;
typedef unsigned long ULONG ;

#define TIMER1_RELOADH	0xF5
#define TIMER1_RELOADL	0x33
#define RXCNT		200


#define	 LCDRS	RB1
#define	 LCDRW	RB3
#define	 LCDEN	RB2

#define LCDD7 RB7
#define LCDD6 RB6
#define LCDD5 RB5
#define LCDD4 RB4
#define UPPER 1

#define KEY RD7
#define LEDR	RD0
#define DC11	RC0
#define DC12	RC1
#define DC21	RC2
#define DC22	RC3





volatile UCHAR kcnt,key,keyrel;
int cnt1,cnt2,cnt3;
//int currX2,currY2,currZ2;

UCHAR Refresh,Second,sign,minsign,maxsign;
UINT  delaycnt,milisec,adcval,wmin,wmax;
ULONG Temp1,Temp2,Temp3;
UCHAR lcd_dat,TempZ,scan,Rxcnt,Rxindex;
bit adcflag,RxFlag,recBit,kflag;
static bank1 UCHAR str[16] ;
static bank2 UCHAR DataBuffer[75] ; 

void delay(UINT num);
void LCD_DisplayChar (char a_char);
void TransStr(const UCHAR *s) ;
void Transmit(UCHAR Byte);




