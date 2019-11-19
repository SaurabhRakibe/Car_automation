#include <htc.h>
#include "tempdef.c"

void interrupt isr(void)
{
	if(TMR1IF)		
	{
		TMR1IF = 0 ; 
		TMR1H = TIMER1_RELOADH ;
		TMR1L = TIMER1_RELOADL ;
        delaycnt++ ;
		if(RxFlag && Rxcnt)	Rxcnt-- ;
		milisec++ ;
		if(milisec >= 1000)	{milisec = 0 ;/* secflag = 1; */Second++;}
			if(kcnt)	kcnt-- ;
		else
		{
			 if(!KEY)		{ kflag = 1 ; 	}				
		}

	}
	if(ADIF)
	{
        ADIF = 0 ;
		adcflag = 1 ;
		adcval = (((UINT)ADRESH) << 8) + ADRESL ;
		adcval &= 0x03FF ;
	}
	if(RCIF)
	{
		DataBuffer[Rxindex] = RCREG ;
		if(DataBuffer[Rxindex]=='*')
			recBit=1;
		if(recBit==1)
		{	
			Rxcnt = RXCNT ;
			RxFlag = 1 ;
			Rxindex++ ;
		}	
//		RCIF = 0 ;
	}

}
void inithw(void)
{
   
 ADCON1 = 0X84;//3 analog
        OPTION =  0X00 ;
 		INTCON =  0X00 ;
		TRISA = 0X0f ;      //0000 1011
        TRISB = 0X00 ;          
        TRISC = 0X80 ;          
        TRISD = 0X80 ;          
        TRISE = 0X00 ;          
        T1CON = 0X01 ;
		RBPU =  0X00 ;
		ADIF=0;
        TMR1H = TIMER1_RELOADH ;
        TMR1L = TIMER1_RELOADL ;
        PEIE = 1 ;
        TMR1IE = 1 ;

//if brgh=0 then baud=fosc/(16*(x+1)) where x=spbrg count

	SPBRG = 71 ;	//9600
	CREN = 1 ; 		// receive enable ;
	BRGH = 1 ;
	SYNC = 0 ;
	SPEN = 1 ;
	TXIE = 0 ;
	RCIE = 1 ;	//1 enable receive interrupt ;
	TX9 = 0 ;
	RX9 = 0 ;
	TXEN = 1 ;
	PIR1 = 0 ;
	GIE = 1 ;		//globle int enable
}


void delay(UINT num)
{
	UINT time ;
	time = num + delaycnt ;
	while(time != delaycnt) ;
}
void send_nibble2lcd(unsigned char PortData, char flag)
{



	UCHAR LcdData;	
#ifdef UPPER
	//higher------------------
/*	LcdData	=	LCDP;
	LcdData &= 0x0f;
	LcdData |= PortData;
	LCDP=LcdData ;
	//------------------------
	
	*/
	if(PortData & 0x80)
LCDD7=1;
else LCDD7=0;
  
 if(PortData & 0x40)
 LCDD6=1;
else LCDD6=0;
    
if(PortData & 0x20)
LCDD5=1;
else LCDD5=0;

if(PortData & 0x10)
LCDD4=1;
else LCDD4=0;
#else
	//lower------------------
	/*
	LcdData	=	LCDP;
	LcdData &= 0xf0;
	LcdData |= PortData;
	LCDP=LcdData ;
	*/
#endif	
	//--------------------
	LCDEN = 0 ;
	if(flag)
	LCDRS = 0 ;  
	else
	  LCDRS = 1; //	LCDRS = 1 ;  
	asm("nop") ; 
    LCDEN = 1 ;
	asm("nop") ; 
    LCDEN = 0 ;
	asm("nop") ; 
    LCDRS = 0 ;//      LCDRS = 0 ;
    delay(2) ; //10ms                    

}

void write_lcd_command(void) 
	{
		unsigned char byte;
		byte=lcd_dat;
#ifdef UPPER
	send_nibble2lcd(((byte & 0xf0)), 1) ;
	delay(10) ;
   send_nibble2lcd(((byte & 0x0F)<<4), 1) ;
	delay(10);
#else
	send_nibble2lcd(((byte & 0xf0)>>4), 1) ;
	delay(10) ;
   send_nibble2lcd(((byte & 0x0F)), 1) ;
	delay(10);
	
#endif
	} 
void write_lcd_data(void)
	{
		unsigned char byte;
		byte=lcd_dat;
#ifdef UPPER		
	send_nibble2lcd(((byte & 0xf0)), 0) ;
	send_nibble2lcd(((byte & 0x0F)<<4), 0) ; 
#else
	send_nibble2lcd(((byte & 0xf0)>>4), 0) ;
	send_nibble2lcd(((byte & 0x0F)), 0) ; 

#endif	
	}
void initlcd(void)
{
	//LCDRW=0;
	lcd_dat = 0x03 ; write_lcd_command() ;
	delay(16) ;
	lcd_dat = 0x03 ; write_lcd_command() ;
	delay(16) ;
	lcd_dat = 0x03 ; write_lcd_command() ;
	delay(16);
	lcd_dat = 0x02; write_lcd_command() ;
	delay(16); 
	lcd_dat = 0x28 ; write_lcd_command() ;
	delay(16) ;
	lcd_dat = 0x08 ; write_lcd_command() ;
	delay(16) ;
	lcd_dat = 0x0c ; write_lcd_command() ;
	delay(4) ;
	lcd_dat = 0x06 ; write_lcd_command() ;
	delay(4) ;
}

void LCD_CursorOn(void)
{
	lcd_dat=0x0d;
	write_lcd_command();
}

void LCD_CursorOff(void)
{
	lcd_dat=0x0c;
	write_lcd_command();
}


void display(UCHAR addr)
{
	UCHAR k  ;
	lcd_dat = addr ; 
	write_lcd_command() ;
	for(k = 0 ; k <= 15 ; k++ )
	{
		lcd_dat = str[k] ;
		write_lcd_data() ;
	}
	delay(1) ;	
}

void dispstr(const UCHAR *s, UCHAR stcol, UCHAR endcol,UCHAR addr ) 
{
	UCHAR i ;
	for(i = stcol ; i <= endcol ; i++ )
	{
		str[i] = *s++ ;
		if(!(str[i]))		str[i] = ' ' ;
	}
	display(addr);
}	

void dispnum(UINT num, UCHAR stcol, UCHAR endcol, UCHAR dp,UCHAR addr)
{
	UCHAR i ;
	for(i = (endcol+1) ;i != stcol ; i--)
	{
		if(dp == (i-1))
			str[i-1] = '.' ;
		else
		{	 
			str[i-1] = ((num % 10) + '0') ;
			num /= 10 	;
		}	
	}
	display(addr) ;	 
}

void disp_clear(UCHAR stcol, UCHAR endcol,UCHAR addr)
{

	UCHAR i ;
	for(i = stcol; i <= endcol ; i++ )
	{
		str[i] = ' ' ;
	}		
	display(addr) ;
}

void LCD_Clear(void)
{
    UCHAR i ;
     for(i = 0; i <= 15 ; i++ )
 	{
		str[i] = ' ' ;
	}		
        lcd_dat=0x01;
        write_lcd_command();        
}
void LCD_Cursor (char row, char column)
{
    switch (row) {
        case 1: lcd_dat=0x80+column-1; write_lcd_command (); break;
        case 2: lcd_dat=0xc0+column-1; write_lcd_command (); break;
        default: break;
    }
}

void LCD_DisplayChar (char a_char)
{
		lcd_dat=a_char;
        write_lcd_data();
}

void channel_Sel(UCHAR channel)
{
        adcflag=0;
        if(channel==0)
	   		ADCON0 = 0x81 ;
	   	else if(channel==1)
	   		ADCON0 = 0x89 ;
		else if(channel==2)
			ADCON0 = 0x91 ;    	
		else if(channel==3)
			ADCON0 = 0x99 ;    	
		else if(channel==4)
			ADCON0 = 0xa1 ;    	
		else if(channel==5)
			ADCON0 = 0xa9 ;    	
		else if(channel==6)
			ADCON0 = 0xb1 ;    	
		else if(channel==7)
			ADCON0 = 0xb9 ;    	
        delay(5);
        ADGO=1;
}

void initvar(void)
{
	adcflag=0;
	delaycnt=0;
 	Second=0;
    milisec=0;
    scan=0;
	Rxindex=0;
	RxFlag = 0 ;
	Rxcnt = 0 ;
	recBit=0;
}


void main(void)
{
	inithw() ;
	LEDR=0;	
	DC11=0;
	DC12=0;
	DC21=0;
	DC22=0;
	
	initlcd() ;
	initvar() ;
	
	
    dispstr("WELCOME         ", 0,15,0x80) ;
    
    LCD_Cursor(1,1);
	adcflag=0;
	scan=0;
	adcflag=0;
	Second=0;
	
        while(1)
        {
	        
			       channel_Sel(0);
        	       while(!adcflag);
            	   ADGO=0;
	               adcflag=0;
    	           Temp1=adcval;
    	           Temp1*=10;
    	           Temp1/=2;
    	           Temp1=Temp1-10;
        	       dispstr("Temp :            ",0,15,0x80) ;
            	   dispnum(Temp1,8,11,10,0x80) ; 
				if(Temp1>300)
				{
					LEDR=1;	
				}
				else
				{
					LEDR=0;	
				
				}
				if(!KEY)
				{
					DC11=0;
					DC12=1;
					DC21=0;
					DC22=1;
					delay(50);
					DC11=0;
					DC12=0;
					DC21=0;
					DC22=0;
				}
             
        }
}  

