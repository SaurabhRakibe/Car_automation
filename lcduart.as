opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6446"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_inithw
	FNCALL	_main,_initlcd
	FNCALL	_main,_initvar
	FNCALL	_main,_dispstr
	FNCALL	_main,_LCD_Cursor
	FNCALL	_main,_channel_Sel
	FNCALL	_main,___lmul
	FNCALL	_main,_dispnum
	FNCALL	_main,_delay
	FNCALL	_dispnum,___lwmod
	FNCALL	_dispnum,___lwdiv
	FNCALL	_dispnum,_display
	FNCALL	_dispstr,_display
	FNCALL	_LCD_Cursor,_write_lcd_command
	FNCALL	_display,_write_lcd_command
	FNCALL	_display,_write_lcd_data
	FNCALL	_display,_delay
	FNCALL	_initlcd,_write_lcd_command
	FNCALL	_initlcd,_delay
	FNCALL	_write_lcd_data,_send_nibble2lcd
	FNCALL	_write_lcd_command,_send_nibble2lcd
	FNCALL	_write_lcd_command,_delay
	FNCALL	_channel_Sel,_delay
	FNCALL	_send_nibble2lcd,_delay
	FNROOT	_main
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_str
	global	_Temp1
	global	_Temp2
	global	_Temp3
	global	_adcval
	global	_cnt1
	global	_cnt2
	global	_cnt3
	global	_delaycnt
	global	_milisec
	global	_wmax
	global	_wmin
	global	_Refresh
	global	_Second
	global	_TempZ
	global	_maxsign
	global	_minsign
	global	_scan
	global	_sign
	global	TEMPDEF@DataBuffer
	global	_DataBuffer
	global	_Rxcnt
	global	_Rxindex
	global	_kcnt
	global	_key
	global	_keyrel
	global	_RxFlag
	global	_adcflag
	global	_kflag
	global	_recBit
	global	TEMPDEF@str
	global	_lcd_dat
psect	nvBANK0,class=BANK0,space=1
global __pnvBANK0
__pnvBANK0:
_lcd_dat:
       ds      1

	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_INTCON
_INTCON	set	11
	global	_PIR1
_PIR1	set	12
	global	_RCREG
_RCREG	set	26
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_ADGO
_ADGO	set	250
	global	_ADIF
_ADIF	set	102
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RCIF
_RCIF	set	101
	global	_RD0
_RD0	set	64
	global	_RD7
_RD7	set	71
	global	_RX9
_RX9	set	198
	global	_SPEN
_SPEN	set	199
	global	_TMR1IF
_TMR1IF	set	96
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_OPTION
_OPTION	set	129
	global	_SPBRG
_SPBRG	set	153
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_TRISE
_TRISE	set	137
	global	_BRGH
_BRGH	set	1218
	global	_RBPU
_RBPU	set	1039
	global	_RCIE
_RCIE	set	1125
	global	_SYNC
_SYNC	set	1220
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TX9
_TX9	set	1222
	global	_TXEN
_TXEN	set	1221
	global	_TXIE
_TXIE	set	1124
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_2:	
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	112	;'p'
	retlw	32	;' '
	retlw	58	;':'
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_1:	
	retlw	87	;'W'
	retlw	69	;'E'
	retlw	76	;'L'
	retlw	67	;'C'
	retlw	79	;'O'
	retlw	77	;'M'
	retlw	69	;'E'
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	0
psect	strings
	file	"lcduart.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_RxFlag:
       ds      1

_adcflag:
       ds      1

_kflag:
       ds      1

_recBit:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_Rxcnt:
       ds      1

_Rxindex:
       ds      1

_kcnt:
       ds      1

_key:
       ds      1

_keyrel:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_str:
       ds      16

_Temp1:
       ds      4

_Temp2:
       ds      4

_Temp3:
       ds      4

_adcval:
       ds      2

_cnt1:
       ds      2

_cnt2:
       ds      2

_cnt3:
       ds      2

_delaycnt:
       ds      2

_milisec:
       ds      2

_wmax:
       ds      2

_wmin:
       ds      2

_Refresh:
       ds      1

_Second:
       ds      1

_TempZ:
       ds      1

_maxsign:
       ds      1

_minsign:
       ds      1

_scan:
       ds      1

_sign:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
TEMPDEF@str:
       ds      16

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
_DataBuffer:
       ds      75

psect	bssBANK2,class=BANK2,space=1
global __pbssBANK2
__pbssBANK2:
TEMPDEF@DataBuffer:
       ds      75

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+033h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+010h)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+04Bh)
	fcall	clear_ram
; Clear objects allocated to BANK2
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK2)
	movwf	fsr
	movlw	low((__pbssBANK2)+04Bh)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	??_isr
??_isr:	; 0 bytes @ 0x0
	global	?_inithw
?_inithw:	; 0 bytes @ 0x0
	global	?_write_lcd_command
?_write_lcd_command:	; 0 bytes @ 0x0
	global	?_write_lcd_data
?_write_lcd_data:	; 0 bytes @ 0x0
	global	?_initlcd
?_initlcd:	; 0 bytes @ 0x0
	global	?_display
?_display:	; 0 bytes @ 0x0
	global	?_channel_Sel
?_channel_Sel:	; 0 bytes @ 0x0
	global	?_initvar
?_initvar:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	6
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_inithw
??_inithw:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_initvar
??_initvar:	; 0 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	delay@num
delay@num:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	delay@time
delay@time:	; 2 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	?_send_nibble2lcd
?_send_nibble2lcd:	; 0 bytes @ 0x4
	global	??_channel_Sel
??_channel_Sel:	; 0 bytes @ 0x4
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	send_nibble2lcd@flag
send_nibble2lcd@flag:	; 1 bytes @ 0x4
	global	channel_Sel@channel
channel_Sel@channel:	; 1 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	ds	1
	global	??_send_nibble2lcd
??_send_nibble2lcd:	; 0 bytes @ 0x5
	global	send_nibble2lcd@PortData
send_nibble2lcd@PortData:	; 1 bytes @ 0x5
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x5
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	??_write_lcd_command
??_write_lcd_command:	; 0 bytes @ 0x6
	global	??_write_lcd_data
??_write_lcd_data:	; 0 bytes @ 0x6
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x6
	ds	1
	global	write_lcd_command@byte
write_lcd_command@byte:	; 1 bytes @ 0x7
	global	write_lcd_data@byte
write_lcd_data@byte:	; 1 bytes @ 0x7
	ds	1
	global	??_initlcd
??_initlcd:	; 0 bytes @ 0x8
	global	??_display
??_display:	; 0 bytes @ 0x8
	global	?_LCD_Cursor
?_LCD_Cursor:	; 0 bytes @ 0x8
	global	??___lmul
??___lmul:	; 0 bytes @ 0x8
	global	LCD_Cursor@column
LCD_Cursor@column:	; 1 bytes @ 0x8
	ds	1
	global	??_LCD_Cursor
??_LCD_Cursor:	; 0 bytes @ 0x9
	global	display@addr
display@addr:	; 1 bytes @ 0x9
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x9
	ds	1
	global	display@k
display@k:	; 1 bytes @ 0xA
	global	LCD_Cursor@row
LCD_Cursor@row:	; 1 bytes @ 0xA
	ds	1
	global	?_dispstr
?_dispstr:	; 0 bytes @ 0xB
	global	?_dispnum
?_dispnum:	; 0 bytes @ 0xB
	global	dispstr@stcol
dispstr@stcol:	; 1 bytes @ 0xB
	global	dispnum@num
dispnum@num:	; 2 bytes @ 0xB
	ds	1
	global	dispstr@endcol
dispstr@endcol:	; 1 bytes @ 0xC
	ds	1
	global	dispstr@addr
dispstr@addr:	; 1 bytes @ 0xD
	global	dispnum@stcol
dispnum@stcol:	; 1 bytes @ 0xD
	ds	1
	global	??_dispstr
??_dispstr:	; 0 bytes @ 0xE
	global	dispnum@endcol
dispnum@endcol:	; 1 bytes @ 0xE
	ds	1
	global	dispstr@s
dispstr@s:	; 1 bytes @ 0xF
	global	dispnum@dp
dispnum@dp:	; 1 bytes @ 0xF
	ds	1
	global	dispstr@i
dispstr@i:	; 1 bytes @ 0x10
	global	dispnum@addr
dispnum@addr:	; 1 bytes @ 0x10
	ds	1
	global	??_dispnum
??_dispnum:	; 0 bytes @ 0x11
	ds	2
	global	dispnum@i
dispnum@i:	; 1 bytes @ 0x13
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x14
	ds	4
;;Data sizes: Strings 36, constant 0, data 0, bss 222, persistent 1 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      12
;; BANK0           80     24      76
;; BANK1           80      0      16
;; BANK3           96      0      75
;; BANK2           96      0      75

;;
;; Pointer list with targets:

;; ?___lmul	unsigned long  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; dispstr@s	PTR const unsigned char  size(1) Largest target is 19
;;		 -> STR_2(CODE[19]), STR_1(CODE[17]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_dispnum
;;   _dispnum->_display
;;   _dispstr->_display
;;   _LCD_Cursor->_write_lcd_command
;;   _display->_write_lcd_command
;;   _display->_write_lcd_data
;;   _initlcd->_write_lcd_command
;;   _write_lcd_data->_send_nibble2lcd
;;   _write_lcd_command->_send_nibble2lcd
;;   _channel_Sel->_delay
;;   _send_nibble2lcd->_delay
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _isr in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 4     4      0    4081
;;                                             20 BANK0      4     4      0
;;                             _inithw
;;                            _initlcd
;;                            _initvar
;;                            _dispstr
;;                         _LCD_Cursor
;;                        _channel_Sel
;;                             ___lmul
;;                            _dispnum
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _dispnum                                              9     3      6    1622
;;                                             11 BANK0      9     3      6
;;                            ___lwmod
;;                            ___lwdiv
;;                            _display
;; ---------------------------------------------------------------------------------
;; (1) _dispstr                                              6     3      3    1087
;;                                             11 BANK0      6     3      3
;;                            _display
;; ---------------------------------------------------------------------------------
;; (1) _LCD_Cursor                                           3     2      1     443
;;                                              8 BANK0      3     2      1
;;                  _write_lcd_command
;; ---------------------------------------------------------------------------------
;; (2) _display                                              3     3      0     830
;;                                              8 BANK0      3     3      0
;;                  _write_lcd_command
;;                     _write_lcd_data
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _initlcd                                              1     1      0     415
;;                                              8 BANK0      1     1      0
;;                  _write_lcd_command
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (3) _write_lcd_data                                       2     2      0     285
;;                                              6 BANK0      2     2      0
;;                    _send_nibble2lcd
;; ---------------------------------------------------------------------------------
;; (3) _write_lcd_command                                    2     2      0     350
;;                                              6 BANK0      2     2      0
;;                    _send_nibble2lcd
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _channel_Sel                                          1     1      0     313
;;                                              4 BANK0      1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (4) _send_nibble2lcd                                      3     2      1     220
;;                                              4 BANK0      2     1      1
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) ___lmul                                              13     5      8     136
;;                                              0 BANK0     13     5      8
;; ---------------------------------------------------------------------------------
;; (2) ___lwmod                                              6     2      4     232
;;                                              0 BANK0      6     2      4
;; ---------------------------------------------------------------------------------
;; (2) ___lwdiv                                              8     4      4     241
;;                                              0 BANK0      8     4      4
;; ---------------------------------------------------------------------------------
;; (1) _initvar                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                4     2      2      65
;;                                              0 BANK0      4     2      2
;; ---------------------------------------------------------------------------------
;; (1) _inithw                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (6) _isr                                                  6     6      0       0
;;                                              0 COMMON     6     6      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _inithw
;;   _initlcd
;;     _write_lcd_command
;;       _send_nibble2lcd
;;         _delay
;;       _delay
;;     _delay
;;   _initvar
;;   _dispstr
;;     _display
;;       _write_lcd_command
;;         _send_nibble2lcd
;;           _delay
;;         _delay
;;       _write_lcd_data
;;         _send_nibble2lcd
;;           _delay
;;       _delay
;;   _LCD_Cursor
;;     _write_lcd_command
;;       _send_nibble2lcd
;;         _delay
;;       _delay
;;   _channel_Sel
;;     _delay
;;   ___lmul
;;   _dispnum
;;     ___lwmod
;;     ___lwdiv
;;     _display
;;       _write_lcd_command
;;         _send_nibble2lcd
;;           _delay
;;         _delay
;;       _write_lcd_data
;;         _send_nibble2lcd
;;           _delay
;;       _delay
;;   _delay
;;
;; _isr (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      6       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       5       2        0.0%
;;ABS                  0      0      FE       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     18      4C       5       95.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0      10       7       20.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0      4B       9       78.1%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0      4B      11       78.1%
;;DATA                 0      0     103      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 319 in file "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_inithw
;;		_initlcd
;;		_initvar
;;		_dispstr
;;		_LCD_Cursor
;;		_channel_Sel
;;		___lmul
;;		_dispnum
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
	line	319
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	320
	
l3142:	
;ADCLCD.C: 320: inithw() ;
	fcall	_inithw
	line	321
	
l3144:	
;ADCLCD.C: 321: RD0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	322
	
l3146:	
;ADCLCD.C: 322: RC0=0;
	bcf	(56/8),(56)&7
	line	323
	
l3148:	
;ADCLCD.C: 323: RC1=0;
	bcf	(57/8),(57)&7
	line	324
	
l3150:	
;ADCLCD.C: 324: RC2=0;
	bcf	(58/8),(58)&7
	line	325
	
l3152:	
;ADCLCD.C: 325: RC3=0;
	bcf	(59/8),(59)&7
	line	327
;ADCLCD.C: 327: initlcd() ;
	fcall	_initlcd
	line	328
;ADCLCD.C: 328: initvar() ;
	fcall	_initvar
	line	331
	
l3154:	
;ADCLCD.C: 331: dispstr("WELCOME         ", 0,15,0x80) ;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_dispstr)
	movlw	(0Fh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_dispstr)+01h
	movlw	(080h)
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	0+(?_dispstr)+02h
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_dispstr
	line	333
	
l3156:	
;ADCLCD.C: 333: LCD_Cursor(1,1);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_LCD_Cursor)
	bsf	status,0
	rlf	(?_LCD_Cursor),f
	movlw	(01h)
	fcall	_LCD_Cursor
	line	334
	
l3158:	
;ADCLCD.C: 334: adcflag=0;
	bcf	(_adcflag/8),(_adcflag)&7
	line	335
	
l3160:	
;ADCLCD.C: 335: scan=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_scan)
	line	336
	
l3162:	
;ADCLCD.C: 336: adcflag=0;
	bcf	(_adcflag/8),(_adcflag)&7
	line	337
	
l3164:	
;ADCLCD.C: 337: Second=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_Second)
	line	339
;ADCLCD.C: 339: while(1)
	
l732:	
	line	342
;ADCLCD.C: 340: {
;ADCLCD.C: 342: channel_Sel(0);
	movlw	(0)
	fcall	_channel_Sel
	line	343
;ADCLCD.C: 343: while(!adcflag);
	goto	l733
	
l734:	
	
l733:	
	btfss	(_adcflag/8),(_adcflag)&7
	goto	u3571
	goto	u3570
u3571:
	goto	l734
u3570:
	
l735:	
	line	344
;ADCLCD.C: 344: ADGO=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(250/8),(250)&7
	line	345
;ADCLCD.C: 345: adcflag=0;
	bcf	(_adcflag/8),(_adcflag)&7
	line	346
	
l3166:	
;ADCLCD.C: 346: Temp1=adcval;
	movf	(_adcval),w
	movwf	(_Temp1)
	movf	(_adcval+1),w
	movwf	((_Temp1))+1
	clrf	2+((_Temp1))
	clrf	3+((_Temp1))
	line	347
	
l3168:	
;ADCLCD.C: 347: Temp1*=10;
	movlw	0
	movwf	(?___lmul+3)
	movlw	0
	movwf	(?___lmul+2)
	movlw	0
	movwf	(?___lmul+1)
	movlw	0Ah
	movwf	(?___lmul)

	movf	(_Temp1+3),w
	movwf	3+(?___lmul)+04h
	movf	(_Temp1+2),w
	movwf	2+(?___lmul)+04h
	movf	(_Temp1+1),w
	movwf	1+(?___lmul)+04h
	movf	(_Temp1),w
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(3+(?___lmul)),w
	movwf	(_Temp1+3)
	movf	(2+(?___lmul)),w
	movwf	(_Temp1+2)
	movf	(1+(?___lmul)),w
	movwf	(_Temp1+1)
	movf	(0+(?___lmul)),w
	movwf	(_Temp1)

	line	348
	
l3170:	
;ADCLCD.C: 348: Temp1/=2;
	movlw	01h
u3585:
	clrc
	rrf	(_Temp1+3),f
	rrf	(_Temp1+2),f
	rrf	(_Temp1+1),f
	rrf	(_Temp1),f
	addlw	-1
	skipz
	goto	u3585

	line	349
	
l3172:	
;ADCLCD.C: 349: Temp1=Temp1-10;
	movlw	0F6h
	movwf	((??_main+0)+0)
	movlw	0FFh
	movwf	((??_main+0)+0+1)
	movlw	0FFh
	movwf	((??_main+0)+0+2)
	movlw	0FFh
	movwf	((??_main+0)+0+3)
	movf	(_Temp1),w
	addwf	(??_main+0)+0,f
	movf	(_Temp1+1),w
	skipnc
	incfsz	(_Temp1+1),w
	goto	u3590
	goto	u3591
u3590:
	addwf	(??_main+0)+1,f
u3591:
	movf	(_Temp1+2),w
	skipnc
	incfsz	(_Temp1+2),w
	goto	u3592
	goto	u3593
u3592:
	addwf	(??_main+0)+2,f
u3593:
	movf	(_Temp1+3),w
	skipnc
	incf	(_Temp1+3),w
	addwf	(??_main+0)+3,f
	movf	3+(??_main+0)+0,w
	movwf	(_Temp1+3)
	movf	2+(??_main+0)+0,w
	movwf	(_Temp1+2)
	movf	1+(??_main+0)+0,w
	movwf	(_Temp1+1)
	movf	0+(??_main+0)+0,w
	movwf	(_Temp1)

	line	350
	
l3174:	
;ADCLCD.C: 350: dispstr("Temp :            ",0,15,0x80) ;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_dispstr)
	movlw	(0Fh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_dispstr)+01h
	movlw	(080h)
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	0+(?_dispstr)+02h
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_dispstr
	line	351
	
l3176:	
;ADCLCD.C: 351: dispnum(Temp1,8,11,10,0x80) ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_Temp1+1),w
	clrf	(?_dispnum+1)
	addwf	(?_dispnum+1)
	movf	(_Temp1),w
	clrf	(?_dispnum)
	addwf	(?_dispnum)

	movlw	(08h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_dispnum)+02h
	movlw	(0Bh)
	movwf	(??_main+1)+0
	movf	(??_main+1)+0,w
	movwf	0+(?_dispnum)+03h
	movlw	(0Ah)
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	movwf	0+(?_dispnum)+04h
	movlw	(080h)
	movwf	(??_main+3)+0
	movf	(??_main+3)+0,w
	movwf	0+(?_dispnum)+05h
	fcall	_dispnum
	line	352
	
l3178:	
;ADCLCD.C: 352: if(Temp1>300)
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_Temp1+3),w
	skipz
	goto	u3605
	movlw	0
	subwf	(_Temp1+2),w
	skipz
	goto	u3605
	movlw	01h
	subwf	(_Temp1+1),w
	skipz
	goto	u3605
	movlw	02Dh
	subwf	(_Temp1),w
u3605:
	skipc
	goto	u3601
	goto	u3600
u3601:
	goto	l736
u3600:
	line	354
	
l3180:	
;ADCLCD.C: 353: {
;ADCLCD.C: 354: RD0=1;
	bsf	(64/8),(64)&7
	line	355
;ADCLCD.C: 355: }
	goto	l737
	line	356
	
l736:	
	line	358
;ADCLCD.C: 356: else
;ADCLCD.C: 357: {
;ADCLCD.C: 358: RD0=0;
	bcf	(64/8),(64)&7
	line	360
	
l737:	
	line	361
;ADCLCD.C: 360: }
;ADCLCD.C: 361: if(!RD7)
	btfsc	(71/8),(71)&7
	goto	u3611
	goto	u3610
u3611:
	goto	l738
u3610:
	line	363
	
l3182:	
;ADCLCD.C: 362: {
;ADCLCD.C: 363: RC0=0;
	bcf	(56/8),(56)&7
	line	364
;ADCLCD.C: 364: RC1=1;
	bsf	(57/8),(57)&7
	line	365
;ADCLCD.C: 365: RC2=0;
	bcf	(58/8),(58)&7
	line	366
;ADCLCD.C: 366: RC3=1;
	bsf	(59/8),(59)&7
	line	367
	
l3184:	
;ADCLCD.C: 367: delay(50);
	movlw	low(032h)
	movwf	(?_delay)
	movlw	high(032h)
	movwf	((?_delay))+1
	fcall	_delay
	line	368
	
l3186:	
;ADCLCD.C: 368: RC0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	369
	
l3188:	
;ADCLCD.C: 369: RC1=0;
	bcf	(57/8),(57)&7
	line	370
	
l3190:	
;ADCLCD.C: 370: RC2=0;
	bcf	(58/8),(58)&7
	line	371
	
l3192:	
;ADCLCD.C: 371: RC3=0;
	bcf	(59/8),(59)&7
	line	372
	
l738:	
	line	374
	
l739:	
	line	339
	goto	l732
	
l740:	
	line	375
	
l741:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_dispnum
psect	text617,local,class=CODE,delta=2
global __ptext617
__ptext617:

;; *************** function _dispnum *****************
;; Defined at:
;;		line 230 in file "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
;; Parameters:    Size  Location     Type
;;  num             2   11[BANK0 ] unsigned int 
;;  stcol           1   13[BANK0 ] unsigned char 
;;  endcol          1   14[BANK0 ] unsigned char 
;;  dp              1   15[BANK0 ] unsigned char 
;;  addr            1   16[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  i               1   19[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		___lwmod
;;		___lwdiv
;;		_display
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text617
	file	"C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
	line	230
	global	__size_of_dispnum
	__size_of_dispnum	equ	__end_of_dispnum-_dispnum
	
_dispnum:	
	opt	stack 7
; Regs used in _dispnum: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	232
	
l3126:	
;ADCLCD.C: 231: UCHAR i ;
;ADCLCD.C: 232: for(i = (endcol+1) ;i != stcol ; i--)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dispnum@endcol),w
	addlw	01h
	movwf	(??_dispnum+0)+0
	movf	(??_dispnum+0)+0,w
	movwf	(dispnum@i)
	goto	l681
	line	233
	
l682:	
	line	234
	
l3128:	
;ADCLCD.C: 233: {
;ADCLCD.C: 234: if(dp == (i-1))
	movf	(dispnum@i),w
	addlw	low(-1)
	movwf	(??_dispnum+0)+0
	movlw	high(-1)
	skipnc
	movlw	(high(-1)+1)&0ffh
	movwf	((??_dispnum+0)+0)+1
	movf	(dispnum@dp),w
	xorwf	0+(??_dispnum+0)+0,w
	iorwf	1+(??_dispnum+0)+0,w
	skipz
	goto	u3551
	goto	u3550
u3551:
	goto	l683
u3550:
	line	235
	
l3130:	
;ADCLCD.C: 235: str[i-1] = '.' ;
	movlw	(02Eh)
	movwf	(??_dispnum+0)+0
	movf	(dispnum@i),w
	addlw	0FFh
	addlw	_str&0ffh
	movwf	fsr0
	movf	(??_dispnum+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	goto	l684
	line	236
	
l683:	
	line	238
	
l3132:	
;ADCLCD.C: 236: else
;ADCLCD.C: 237: {
;ADCLCD.C: 238: str[i-1] = ((num % 10) + '0') ;
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movf	(dispnum@num+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(dispnum@num),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwmod)),w
	addlw	030h
	movwf	(??_dispnum+0)+0
	movf	(dispnum@i),w
	addlw	0FFh
	addlw	_str&0ffh
	movwf	fsr0
	movf	(??_dispnum+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	239
	
l3134:	
;ADCLCD.C: 239: num /= 10 ;
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	movf	(dispnum@num+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(dispnum@num),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	clrf	(dispnum@num+1)
	addwf	(dispnum@num+1)
	movf	(0+(?___lwdiv)),w
	clrf	(dispnum@num)
	addwf	(dispnum@num)

	line	240
	
l684:	
	line	232
	
l3136:	
	movlw	low(01h)
	subwf	(dispnum@i),f
	
l681:	
	
l3138:	
	movf	(dispnum@i),w
	xorwf	(dispnum@stcol),w
	skipz
	goto	u3561
	goto	u3560
u3561:
	goto	l682
u3560:
	
l685:	
	line	242
	
l3140:	
;ADCLCD.C: 240: }
;ADCLCD.C: 241: }
;ADCLCD.C: 242: display(addr) ;
	movf	(dispnum@addr),w
	fcall	_display
	line	243
	
l686:	
	return
	opt stack 0
GLOBAL	__end_of_dispnum
	__end_of_dispnum:
;; =============== function _dispnum ends ============

	signat	_dispnum,20600
	global	_dispstr
psect	text618,local,class=CODE,delta=2
global __ptext618
__ptext618:

;; *************** function _dispstr *****************
;; Defined at:
;;		line 219 in file "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR const unsigned char 
;;		 -> STR_2(19), STR_1(17), 
;;  stcol           1   11[BANK0 ] unsigned char 
;;  endcol          1   12[BANK0 ] unsigned char 
;;  addr            1   13[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  s               1   15[BANK0 ] PTR const unsigned char 
;;		 -> STR_2(19), STR_1(17), 
;;  i               1   16[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_display
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text618
	file	"C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
	line	219
	global	__size_of_dispstr
	__size_of_dispstr	equ	__end_of_dispstr-_dispstr
	
_dispstr:	
	opt	stack 7
; Regs used in _dispstr: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;dispstr@s stored from wreg
	line	221
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(dispstr@s)
	
l3110:	
;ADCLCD.C: 220: UCHAR i ;
;ADCLCD.C: 221: for(i = stcol ; i <= endcol ; i++ )
	movf	(dispstr@stcol),w
	movwf	(??_dispstr+0)+0
	movf	(??_dispstr+0)+0,w
	movwf	(dispstr@i)
	goto	l674
	line	222
	
l675:	
	line	223
	
l3112:	
;ADCLCD.C: 222: {
;ADCLCD.C: 223: str[i] = *s++ ;
	movf	(dispstr@s),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_dispstr+0)+0
	movf	(dispstr@i),w
	addlw	_str&0ffh
	movwf	fsr0
	movf	(??_dispstr+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3114:	
	movlw	(01h)
	movwf	(??_dispstr+0)+0
	movf	(??_dispstr+0)+0,w
	addwf	(dispstr@s),f
	line	224
	
l3116:	
;ADCLCD.C: 224: if(!(str[i])) str[i] = ' ' ;
	movf	(dispstr@i),w
	addlw	_str&0ffh
	movwf	fsr0
	movf	indf,f
	skipz
	goto	u3531
	goto	u3530
u3531:
	goto	l676
u3530:
	
l3118:	
	movlw	(020h)
	movwf	(??_dispstr+0)+0
	movf	(dispstr@i),w
	addlw	_str&0ffh
	movwf	fsr0
	movf	(??_dispstr+0)+0,w
	movwf	indf
	
l676:	
	line	221
	
l3120:	
	movlw	(01h)
	movwf	(??_dispstr+0)+0
	movf	(??_dispstr+0)+0,w
	addwf	(dispstr@i),f
	
l674:	
	
l3122:	
	movf	(dispstr@i),w
	subwf	(dispstr@endcol),w
	skipnc
	goto	u3541
	goto	u3540
u3541:
	goto	l675
u3540:
	
l677:	
	line	226
	
l3124:	
;ADCLCD.C: 225: }
;ADCLCD.C: 226: display(addr);
	movf	(dispstr@addr),w
	fcall	_display
	line	227
	
l678:	
	return
	opt stack 0
GLOBAL	__end_of_dispstr
	__end_of_dispstr:
;; =============== function _dispstr ends ============

	signat	_dispstr,16504
	global	_LCD_Cursor
psect	text619,local,class=CODE,delta=2
global __ptext619
__ptext619:

;; *************** function _LCD_Cursor *****************
;; Defined at:
;;		line 267 in file "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  column          1    8[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  row             1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_write_lcd_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text619
	file	"C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
	line	267
	global	__size_of_LCD_Cursor
	__size_of_LCD_Cursor	equ	__end_of_LCD_Cursor-_LCD_Cursor
	
_LCD_Cursor:	
	opt	stack 7
; Regs used in _LCD_Cursor: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LCD_Cursor@row stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(LCD_Cursor@row)
	line	268
	
l3096:	
;ADCLCD.C: 268: switch (row) {
	goto	l700
	line	269
;ADCLCD.C: 269: case 1: lcd_dat=0x80+column-1; write_lcd_command (); break;
	
l701:	
	
l3098:	
	movf	(LCD_Cursor@column),w
	addlw	07Fh
	movwf	(??_LCD_Cursor+0)+0
	movf	(??_LCD_Cursor+0)+0,w
	movwf	(_lcd_dat)
	
l3100:	
	fcall	_write_lcd_command
	goto	l702
	line	270
;ADCLCD.C: 270: case 2: lcd_dat=0xc0+column-1; write_lcd_command (); break;
	
l703:	
	
l3102:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(LCD_Cursor@column),w
	addlw	0BFh
	movwf	(??_LCD_Cursor+0)+0
	movf	(??_LCD_Cursor+0)+0,w
	movwf	(_lcd_dat)
	
l3104:	
	fcall	_write_lcd_command
	goto	l702
	line	271
;ADCLCD.C: 271: default: break;
	
l704:	
	goto	l702
	line	272
	
l3106:	
;ADCLCD.C: 272: }
	goto	l702
	line	268
	
l700:	
	
l3108:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(LCD_Cursor@row),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 1 to 2
; switch strategies available:
; Name         Bytes Cycles
; simple_byte     7     4 (average)
; direct_byte    28    22 (fixed)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l701
	xorlw	2^1	; case 2
	skipnz
	goto	l703
	goto	l704

	line	272
	
l702:	
	line	273
	
l705:	
	return
	opt stack 0
GLOBAL	__end_of_LCD_Cursor
	__end_of_LCD_Cursor:
;; =============== function _LCD_Cursor ends ============

	signat	_LCD_Cursor,8312
	global	_display
psect	text620,local,class=CODE,delta=2
global __ptext620
__ptext620:

;; *************** function _display *****************
;; Defined at:
;;		line 206 in file "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    9[BANK0 ] unsigned char 
;;  k               1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_write_lcd_command
;;		_write_lcd_data
;;		_delay
;; This function is called by:
;;		_dispstr
;;		_dispnum
;;		_disp_clear
;; This function uses a non-reentrant model
;;
psect	text620
	file	"C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
	line	206
	global	__size_of_display
	__size_of_display	equ	__end_of_display-_display
	
_display:	
	opt	stack 6
; Regs used in _display: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;display@addr stored from wreg
	line	208
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(display@addr)
	
l3076:	
;ADCLCD.C: 207: UCHAR k ;
;ADCLCD.C: 208: lcd_dat = addr ;
	movf	(display@addr),w
	movwf	(??_display+0)+0
	movf	(??_display+0)+0,w
	movwf	(_lcd_dat)
	line	209
	
l3078:	
;ADCLCD.C: 209: write_lcd_command() ;
	fcall	_write_lcd_command
	line	210
	
l3080:	
;ADCLCD.C: 210: for(k = 0 ; k <= 15 ; k++ )
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(display@k)
	
l3082:	
	movlw	(010h)
	subwf	(display@k),w
	skipc
	goto	u3511
	goto	u3510
u3511:
	goto	l669
u3510:
	
l3084:	
	goto	l670
	line	211
	
l669:	
	line	212
	
l3086:	
;ADCLCD.C: 211: {
;ADCLCD.C: 212: lcd_dat = str[k] ;
	movf	(display@k),w
	addlw	_str&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_display+0)+0
	movf	(??_display+0)+0,w
	movwf	(_lcd_dat)
	line	213
	
l3088:	
;ADCLCD.C: 213: write_lcd_data() ;
	fcall	_write_lcd_data
	line	210
	
l3090:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_display+0)+0
	movf	(??_display+0)+0,w
	addwf	(display@k),f
	
l3092:	
	movlw	(010h)
	subwf	(display@k),w
	skipc
	goto	u3521
	goto	u3520
u3521:
	goto	l669
u3520:
	
l670:	
	line	215
	
l3094:	
;ADCLCD.C: 214: }
;ADCLCD.C: 215: delay(1) ;
	movlw	low(01h)
	movwf	(?_delay)
	movlw	high(01h)
	movwf	((?_delay))+1
	fcall	_delay
	line	216
	
l671:	
	return
	opt stack 0
GLOBAL	__end_of_display
	__end_of_display:
;; =============== function _display ends ============

	signat	_display,4216
	global	_initlcd
psect	text621,local,class=CODE,delta=2
global __ptext621
__ptext621:

;; *************** function _initlcd *****************
;; Defined at:
;;		line 172 in file "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_write_lcd_command
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text621
	file	"C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
	line	172
	global	__size_of_initlcd
	__size_of_initlcd	equ	__end_of_initlcd-_initlcd
	
_initlcd:	
	opt	stack 7
; Regs used in _initlcd: [wreg+status,2+status,0+pclath+cstack]
	line	174
	
l3042:	
;ADCLCD.C: 174: lcd_dat = 0x03 ; write_lcd_command() ;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_initlcd+0)+0
	movf	(??_initlcd+0)+0,w
	movwf	(_lcd_dat)
	
l3044:	
	fcall	_write_lcd_command
	line	175
	
l3046:	
;ADCLCD.C: 175: delay(16) ;
	movlw	low(010h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay)
	movlw	high(010h)
	movwf	((?_delay))+1
	fcall	_delay
	line	176
;ADCLCD.C: 176: lcd_dat = 0x03 ; write_lcd_command() ;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_initlcd+0)+0
	movf	(??_initlcd+0)+0,w
	movwf	(_lcd_dat)
	
l3048:	
	fcall	_write_lcd_command
	line	177
	
l3050:	
;ADCLCD.C: 177: delay(16) ;
	movlw	low(010h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay)
	movlw	high(010h)
	movwf	((?_delay))+1
	fcall	_delay
	line	178
;ADCLCD.C: 178: lcd_dat = 0x03 ; write_lcd_command() ;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_initlcd+0)+0
	movf	(??_initlcd+0)+0,w
	movwf	(_lcd_dat)
	
l3052:	
	fcall	_write_lcd_command
	line	179
	
l3054:	
;ADCLCD.C: 179: delay(16);
	movlw	low(010h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay)
	movlw	high(010h)
	movwf	((?_delay))+1
	fcall	_delay
	line	180
;ADCLCD.C: 180: lcd_dat = 0x02; write_lcd_command() ;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_initlcd+0)+0
	movf	(??_initlcd+0)+0,w
	movwf	(_lcd_dat)
	
l3056:	
	fcall	_write_lcd_command
	line	181
	
l3058:	
;ADCLCD.C: 181: delay(16);
	movlw	low(010h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay)
	movlw	high(010h)
	movwf	((?_delay))+1
	fcall	_delay
	line	182
;ADCLCD.C: 182: lcd_dat = 0x28 ; write_lcd_command() ;
	movlw	(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_initlcd+0)+0
	movf	(??_initlcd+0)+0,w
	movwf	(_lcd_dat)
	
l3060:	
	fcall	_write_lcd_command
	line	183
	
l3062:	
;ADCLCD.C: 183: delay(16) ;
	movlw	low(010h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay)
	movlw	high(010h)
	movwf	((?_delay))+1
	fcall	_delay
	line	184
;ADCLCD.C: 184: lcd_dat = 0x08 ; write_lcd_command() ;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_initlcd+0)+0
	movf	(??_initlcd+0)+0,w
	movwf	(_lcd_dat)
	
l3064:	
	fcall	_write_lcd_command
	line	185
	
l3066:	
;ADCLCD.C: 185: delay(16) ;
	movlw	low(010h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay)
	movlw	high(010h)
	movwf	((?_delay))+1
	fcall	_delay
	line	186
;ADCLCD.C: 186: lcd_dat = 0x0c ; write_lcd_command() ;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_initlcd+0)+0
	movf	(??_initlcd+0)+0,w
	movwf	(_lcd_dat)
	
l3068:	
	fcall	_write_lcd_command
	line	187
	
l3070:	
;ADCLCD.C: 187: delay(4) ;
	movlw	low(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay)
	movlw	high(04h)
	movwf	((?_delay))+1
	fcall	_delay
	line	188
;ADCLCD.C: 188: lcd_dat = 0x06 ; write_lcd_command() ;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_initlcd+0)+0
	movf	(??_initlcd+0)+0,w
	movwf	(_lcd_dat)
	
l3072:	
	fcall	_write_lcd_command
	line	189
	
l3074:	
;ADCLCD.C: 189: delay(4) ;
	movlw	low(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay)
	movlw	high(04h)
	movwf	((?_delay))+1
	fcall	_delay
	line	190
	
l660:	
	return
	opt stack 0
GLOBAL	__end_of_initlcd
	__end_of_initlcd:
;; =============== function _initlcd ends ============

	signat	_initlcd,88
	global	_write_lcd_data
psect	text622,local,class=CODE,delta=2
global __ptext622
__ptext622:

;; *************** function _write_lcd_data *****************
;; Defined at:
;;		line 159 in file "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  byte            1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_send_nibble2lcd
;; This function is called by:
;;		_display
;;		_LCD_DisplayChar
;; This function uses a non-reentrant model
;;
psect	text622
	file	"C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
	line	159
	global	__size_of_write_lcd_data
	__size_of_write_lcd_data	equ	__end_of_write_lcd_data-_write_lcd_data
	
_write_lcd_data:	
	opt	stack 5
; Regs used in _write_lcd_data: [wreg+status,2+status,0+pclath+cstack]
	line	161
	
l3036:	
;ADCLCD.C: 160: unsigned char byte;
;ADCLCD.C: 161: byte=lcd_dat;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_lcd_dat),w
	movwf	(??_write_lcd_data+0)+0
	movf	(??_write_lcd_data+0)+0,w
	movwf	(write_lcd_data@byte)
	line	163
	
l3038:	
;ADCLCD.C: 163: send_nibble2lcd(((byte & 0xf0)), 0) ;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_send_nibble2lcd)
	movf	(write_lcd_data@byte),w
	andlw	0F0h
	fcall	_send_nibble2lcd
	line	164
	
l3040:	
;ADCLCD.C: 164: send_nibble2lcd(((byte & 0x0F)<<4), 0) ;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_send_nibble2lcd)
	movf	(write_lcd_data@byte),w
	andlw	0Fh
	movwf	(??_write_lcd_data+0)+0
	movlw	(04h)-1
u3505:
	clrc
	rlf	(??_write_lcd_data+0)+0,f
	addlw	-1
	skipz
	goto	u3505
	clrc
	rlf	(??_write_lcd_data+0)+0,w
	fcall	_send_nibble2lcd
	line	170
	
l657:	
	return
	opt stack 0
GLOBAL	__end_of_write_lcd_data
	__end_of_write_lcd_data:
;; =============== function _write_lcd_data ends ============

	signat	_write_lcd_data,88
	global	_write_lcd_command
psect	text623,local,class=CODE,delta=2
global __ptext623
__ptext623:

;; *************** function _write_lcd_command *****************
;; Defined at:
;;		line 142 in file "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  byte            1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_send_nibble2lcd
;;		_delay
;; This function is called by:
;;		_initlcd
;;		_display
;;		_LCD_Cursor
;;		_LCD_CursorOn
;;		_LCD_CursorOff
;;		_LCD_Clear
;; This function uses a non-reentrant model
;;
psect	text623
	file	"C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
	line	142
	global	__size_of_write_lcd_command
	__size_of_write_lcd_command	equ	__end_of_write_lcd_command-_write_lcd_command
	
_write_lcd_command:	
	opt	stack 5
; Regs used in _write_lcd_command: [wreg+status,2+status,0+pclath+cstack]
	line	144
	
l3026:	
;ADCLCD.C: 143: unsigned char byte;
;ADCLCD.C: 144: byte=lcd_dat;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_lcd_dat),w
	movwf	(??_write_lcd_command+0)+0
	movf	(??_write_lcd_command+0)+0,w
	movwf	(write_lcd_command@byte)
	line	146
	
l3028:	
;ADCLCD.C: 146: send_nibble2lcd(((byte & 0xf0)), 1) ;
	clrf	(?_send_nibble2lcd)
	bsf	status,0
	rlf	(?_send_nibble2lcd),f
	movf	(write_lcd_command@byte),w
	andlw	0F0h
	fcall	_send_nibble2lcd
	line	147
	
l3030:	
;ADCLCD.C: 147: delay(10) ;
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	148
	
l3032:	
;ADCLCD.C: 148: send_nibble2lcd(((byte & 0x0F)<<4), 1) ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_send_nibble2lcd)
	bsf	status,0
	rlf	(?_send_nibble2lcd),f
	movf	(write_lcd_command@byte),w
	andlw	0Fh
	movwf	(??_write_lcd_command+0)+0
	movlw	(04h)-1
u3495:
	clrc
	rlf	(??_write_lcd_command+0)+0,f
	addlw	-1
	skipz
	goto	u3495
	clrc
	rlf	(??_write_lcd_command+0)+0,w
	fcall	_send_nibble2lcd
	line	149
	
l3034:	
;ADCLCD.C: 149: delay(10);
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	157
	
l654:	
	return
	opt stack 0
GLOBAL	__end_of_write_lcd_command
	__end_of_write_lcd_command:
;; =============== function _write_lcd_command ends ============

	signat	_write_lcd_command,88
	global	_channel_Sel
psect	text624,local,class=CODE,delta=2
global __ptext624
__ptext624:

;; *************** function _channel_Sel *****************
;; Defined at:
;;		line 282 in file "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text624
	file	"C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
	line	282
	global	__size_of_channel_Sel
	__size_of_channel_Sel	equ	__end_of_channel_Sel-_channel_Sel
	
_channel_Sel:	
	opt	stack 7
; Regs used in _channel_Sel: [wreg+status,2+status,0+pclath+cstack]
;channel_Sel@channel stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(channel_Sel@channel)
	line	283
	
l2988:	
;ADCLCD.C: 283: adcflag=0;
	bcf	(_adcflag/8),(_adcflag)&7
	line	284
	
l2990:	
;ADCLCD.C: 284: if(channel==0)
	movf	(channel_Sel@channel),f
	skipz
	goto	u3411
	goto	u3410
u3411:
	goto	l711
u3410:
	line	285
	
l2992:	
;ADCLCD.C: 285: ADCON0 = 0x81 ;
	movlw	(081h)
	movwf	(31)	;volatile
	goto	l712
	line	286
	
l711:	
	
l2994:	
;ADCLCD.C: 286: else if(channel==1)
	movf	(channel_Sel@channel),w
	xorlw	01h
	skipz
	goto	u3421
	goto	u3420
u3421:
	goto	l713
u3420:
	line	287
	
l2996:	
;ADCLCD.C: 287: ADCON0 = 0x89 ;
	movlw	(089h)
	movwf	(31)	;volatile
	goto	l714
	line	288
	
l713:	
	
l2998:	
;ADCLCD.C: 288: else if(channel==2)
	movf	(channel_Sel@channel),w
	xorlw	02h
	skipz
	goto	u3431
	goto	u3430
u3431:
	goto	l715
u3430:
	line	289
	
l3000:	
;ADCLCD.C: 289: ADCON0 = 0x91 ;
	movlw	(091h)
	movwf	(31)	;volatile
	goto	l716
	line	290
	
l715:	
	
l3002:	
;ADCLCD.C: 290: else if(channel==3)
	movf	(channel_Sel@channel),w
	xorlw	03h
	skipz
	goto	u3441
	goto	u3440
u3441:
	goto	l717
u3440:
	line	291
	
l3004:	
;ADCLCD.C: 291: ADCON0 = 0x99 ;
	movlw	(099h)
	movwf	(31)	;volatile
	goto	l718
	line	292
	
l717:	
	
l3006:	
;ADCLCD.C: 292: else if(channel==4)
	movf	(channel_Sel@channel),w
	xorlw	04h
	skipz
	goto	u3451
	goto	u3450
u3451:
	goto	l719
u3450:
	line	293
	
l3008:	
;ADCLCD.C: 293: ADCON0 = 0xa1 ;
	movlw	(0A1h)
	movwf	(31)	;volatile
	goto	l720
	line	294
	
l719:	
	
l3010:	
;ADCLCD.C: 294: else if(channel==5)
	movf	(channel_Sel@channel),w
	xorlw	05h
	skipz
	goto	u3461
	goto	u3460
u3461:
	goto	l721
u3460:
	line	295
	
l3012:	
;ADCLCD.C: 295: ADCON0 = 0xa9 ;
	movlw	(0A9h)
	movwf	(31)	;volatile
	goto	l722
	line	296
	
l721:	
	
l3014:	
;ADCLCD.C: 296: else if(channel==6)
	movf	(channel_Sel@channel),w
	xorlw	06h
	skipz
	goto	u3471
	goto	u3470
u3471:
	goto	l723
u3470:
	line	297
	
l3016:	
;ADCLCD.C: 297: ADCON0 = 0xb1 ;
	movlw	(0B1h)
	movwf	(31)	;volatile
	goto	l724
	line	298
	
l723:	
	
l3018:	
;ADCLCD.C: 298: else if(channel==7)
	movf	(channel_Sel@channel),w
	xorlw	07h
	skipz
	goto	u3481
	goto	u3480
u3481:
	goto	l725
u3480:
	line	299
	
l3020:	
;ADCLCD.C: 299: ADCON0 = 0xb9 ;
	movlw	(0B9h)
	movwf	(31)	;volatile
	
l725:	
	line	300
	
l724:	
	
l722:	
	
l720:	
	
l718:	
	
l716:	
	
l714:	
	
l712:	
	
l3022:	
;ADCLCD.C: 300: delay(5);
	movlw	low(05h)
	movwf	(?_delay)
	movlw	high(05h)
	movwf	((?_delay))+1
	fcall	_delay
	line	301
	
l3024:	
;ADCLCD.C: 301: ADGO=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7
	line	302
	
l726:	
	return
	opt stack 0
GLOBAL	__end_of_channel_Sel
	__end_of_channel_Sel:
;; =============== function _channel_Sel ends ============

	signat	_channel_Sel,4216
	global	_send_nibble2lcd
psect	text625,local,class=CODE,delta=2
global __ptext625
__ptext625:

;; *************** function _send_nibble2lcd *****************
;; Defined at:
;;		line 87 in file "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
;; Parameters:    Size  Location     Type
;;  PortData        1    wreg     unsigned char 
;;  flag            1    4[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  PortData        1    5[BANK0 ] unsigned char 
;;  LcdData         1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_write_lcd_command
;;		_write_lcd_data
;; This function uses a non-reentrant model
;;
psect	text625
	file	"C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
	line	87
	global	__size_of_send_nibble2lcd
	__size_of_send_nibble2lcd	equ	__end_of_send_nibble2lcd-_send_nibble2lcd
	
_send_nibble2lcd:	
	opt	stack 4
; Regs used in _send_nibble2lcd: [wreg+status,2+status,0+pclath+cstack]
;send_nibble2lcd@PortData stored from wreg
	line	101
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(send_nibble2lcd@PortData)
	
l2972:	
;ADCLCD.C: 91: UCHAR LcdData;
;ADCLCD.C: 101: if(PortData & 0x80)
	btfss	(send_nibble2lcd@PortData),(7)&7
	goto	u3361
	goto	u3360
u3361:
	goto	l641
u3360:
	line	102
	
l2974:	
;ADCLCD.C: 102: RB7=1;
	bsf	(55/8),(55)&7
	goto	l642
	line	103
	
l641:	
;ADCLCD.C: 103: else RB7=0;
	bcf	(55/8),(55)&7
	
l642:	
	line	105
;ADCLCD.C: 105: if(PortData & 0x40)
	btfss	(send_nibble2lcd@PortData),(6)&7
	goto	u3371
	goto	u3370
u3371:
	goto	l643
u3370:
	line	106
	
l2976:	
;ADCLCD.C: 106: RB6=1;
	bsf	(54/8),(54)&7
	goto	l644
	line	107
	
l643:	
;ADCLCD.C: 107: else RB6=0;
	bcf	(54/8),(54)&7
	
l644:	
	line	109
;ADCLCD.C: 109: if(PortData & 0x20)
	btfss	(send_nibble2lcd@PortData),(5)&7
	goto	u3381
	goto	u3380
u3381:
	goto	l645
u3380:
	line	110
	
l2978:	
;ADCLCD.C: 110: RB5=1;
	bsf	(53/8),(53)&7
	goto	l646
	line	111
	
l645:	
;ADCLCD.C: 111: else RB5=0;
	bcf	(53/8),(53)&7
	
l646:	
	line	113
;ADCLCD.C: 113: if(PortData & 0x10)
	btfss	(send_nibble2lcd@PortData),(4)&7
	goto	u3391
	goto	u3390
u3391:
	goto	l647
u3390:
	line	114
	
l2980:	
;ADCLCD.C: 114: RB4=1;
	bsf	(52/8),(52)&7
	goto	l648
	line	115
	
l647:	
;ADCLCD.C: 115: else RB4=0;
	bcf	(52/8),(52)&7
	
l648:	
	line	126
;ADCLCD.C: 126: RB2 = 0 ;
	bcf	(50/8),(50)&7
	line	127
	
l2982:	
;ADCLCD.C: 127: if(flag)
	movf	(send_nibble2lcd@flag),w
	skipz
	goto	u3400
	goto	l649
u3400:
	line	128
	
l2984:	
;ADCLCD.C: 128: RB1 = 0 ;
	bcf	(49/8),(49)&7
	goto	l650
	line	129
	
l649:	
	line	130
;ADCLCD.C: 129: else
;ADCLCD.C: 130: RB1 = 1;
	bsf	(49/8),(49)&7
	
l650:	
	line	131
# 131 "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
nop ;#
psect	text625
	line	132
;ADCLCD.C: 132: RB2 = 1 ;
	bsf	(50/8),(50)&7
	line	133
# 133 "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
nop ;#
psect	text625
	line	134
;ADCLCD.C: 134: RB2 = 0 ;
	bcf	(50/8),(50)&7
	line	135
# 135 "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
nop ;#
psect	text625
	line	136
;ADCLCD.C: 136: RB1 = 0 ;
	bcf	(49/8),(49)&7
	line	137
	
l2986:	
;ADCLCD.C: 137: delay(2) ;
	movlw	low(02h)
	movwf	(?_delay)
	movlw	high(02h)
	movwf	((?_delay))+1
	fcall	_delay
	line	139
	
l651:	
	return
	opt stack 0
GLOBAL	__end_of_send_nibble2lcd
	__end_of_send_nibble2lcd:
;; =============== function _send_nibble2lcd ends ============

	signat	_send_nibble2lcd,8312
	global	___lmul
psect	text626,local,class=CODE,delta=2
global __ptext626
__ptext626:

;; *************** function ___lmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[BANK0 ] unsigned long 
;;  multiplicand    4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    9[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       8       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text626
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 7
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
l2958:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___lmul@product+3)
	movlw	0
	movwf	(___lmul@product+2)
	movlw	0
	movwf	(___lmul@product+1)
	movlw	0
	movwf	(___lmul@product)

	line	6
	
l885:	
	line	7
	
l2960:	
	btfss	(___lmul@multiplier),(0)&7
	goto	u3311
	goto	u3310
u3311:
	goto	l886
u3310:
	line	8
	
l2962:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3321
	addwf	(___lmul@product+1),f
u3321:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3322
	addwf	(___lmul@product+2),f
u3322:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3323
	addwf	(___lmul@product+3),f
u3323:

	
l886:	
	line	9
	
l2964:	
	movlw	01h
	movwf	(??___lmul+0)+0
u3335:
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	decfsz	(??___lmul+0)+0
	goto	u3335
	line	10
	
l2966:	
	movlw	01h
u3345:
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	addlw	-1
	skipz
	goto	u3345

	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u3351
	goto	u3350
u3351:
	goto	l885
u3350:
	
l887:	
	line	12
	
l2968:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	
l2970:	
	line	13
	
l888:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	___lwmod
psect	text627,local,class=CODE,delta=2
global __ptext627
__ptext627:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] unsigned int 
;;  dividend        2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_dispnum
;; This function uses a non-reentrant model
;;
psect	text627
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 6
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l2936:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u3251
	goto	u3250
u3251:
	goto	l826
u3250:
	line	9
	
l2938:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l827
	
l828:	
	line	11
	
l2940:	
	movlw	01h
	
u3265:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u3265
	line	12
	
l2942:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	line	13
	
l827:	
	line	10
	
l2944:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u3271
	goto	u3270
u3271:
	goto	l828
u3270:
	
l829:	
	line	14
	
l830:	
	line	15
	
l2946:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u3285
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u3285:
	skipc
	goto	u3281
	goto	u3280
u3281:
	goto	l831
u3280:
	line	16
	
l2948:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	
l831:	
	line	17
	
l2950:	
	movlw	01h
	
u3295:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u3295
	line	18
	
l2952:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u3301
	goto	u3300
u3301:
	goto	l830
u3300:
	
l832:	
	line	19
	
l826:	
	line	20
	
l2954:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	
l2956:	
	line	21
	
l833:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text628,local,class=CODE,delta=2
global __ptext628
__ptext628:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] unsigned int 
;;  dividend        2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    6[BANK0 ] unsigned int 
;;  counter         1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_dispnum
;; This function uses a non-reentrant model
;;
psect	text628
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 6
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l2912:	
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___lwdiv@quotient)
	movlw	high(0)
	movwf	((___lwdiv@quotient))+1
	line	10
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u3181
	goto	u3180
u3181:
	goto	l816
u3180:
	line	11
	
l2914:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l817
	
l818:	
	line	13
	
l2916:	
	movlw	01h
	
u3195:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u3195
	line	14
	
l2918:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	line	15
	
l817:	
	line	12
	
l2920:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u3201
	goto	u3200
u3201:
	goto	l818
u3200:
	
l819:	
	line	16
	
l820:	
	line	17
	
l2922:	
	movlw	01h
	
u3215:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u3215
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u3225
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u3225:
	skipc
	goto	u3221
	goto	u3220
u3221:
	goto	l821
u3220:
	line	19
	
l2924:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l2926:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	21
	
l821:	
	line	22
	
l2928:	
	movlw	01h
	
u3235:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u3235
	line	23
	
l2930:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u3241
	goto	u3240
u3241:
	goto	l820
u3240:
	
l822:	
	line	24
	
l816:	
	line	25
	
l2932:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	
l2934:	
	line	26
	
l823:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_initvar
psect	text629,local,class=CODE,delta=2
global __ptext629
__ptext629:

;; *************** function _initvar *****************
;; Defined at:
;;		line 305 in file "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text629
	file	"C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
	line	305
	global	__size_of_initvar
	__size_of_initvar	equ	__end_of_initvar-_initvar
	
_initvar:	
	opt	stack 7
; Regs used in _initvar: [wreg+status,2+status,0]
	line	306
	
l2900:	
;ADCLCD.C: 306: adcflag=0;
	bcf	(_adcflag/8),(_adcflag)&7
	line	307
	
l2902:	
;ADCLCD.C: 307: delaycnt=0;
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_delaycnt)
	movlw	high(0)
	movwf	((_delaycnt))+1
	line	308
	
l2904:	
;ADCLCD.C: 308: Second=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_Second)
	line	309
	
l2906:	
;ADCLCD.C: 309: milisec=0;
	movlw	low(0)
	movwf	(_milisec)
	movlw	high(0)
	movwf	((_milisec))+1
	line	310
;ADCLCD.C: 310: scan=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_scan)
	line	311
;ADCLCD.C: 311: Rxindex=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_Rxindex)
	line	312
	
l2908:	
;ADCLCD.C: 312: RxFlag = 0 ;
	bcf	(_RxFlag/8),(_RxFlag)&7
	line	313
;ADCLCD.C: 313: Rxcnt = 0 ;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_Rxcnt)
	line	314
	
l2910:	
;ADCLCD.C: 314: recBit=0;
	bcf	(_recBit/8),(_recBit)&7
	line	315
	
l729:	
	return
	opt stack 0
GLOBAL	__end_of_initvar
	__end_of_initvar:
;; =============== function _initvar ends ============

	signat	_initvar,88
	global	_delay
psect	text630,local,class=CODE,delta=2
global __ptext630
__ptext630:

;; *************** function _delay *****************
;; Defined at:
;;		line 81 in file "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
;; Parameters:    Size  Location     Type
;;  num             2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  time            2    2[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_send_nibble2lcd
;;		_write_lcd_command
;;		_initlcd
;;		_display
;;		_channel_Sel
;;		_main
;; This function uses a non-reentrant model
;;
psect	text630
	file	"C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
	line	81
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg+status,2+status,0]
	line	83
	
l2858:	
;ADCLCD.C: 82: UINT time ;
;ADCLCD.C: 83: time = num + delaycnt ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_delaycnt),w
	addwf	(delay@num),w
	movwf	(delay@time)
	movf	(_delaycnt+1),w
	skipnc
	incf	(_delaycnt+1),w
	addwf	(delay@num+1),w
	movwf	1+(delay@time)
	line	84
;ADCLCD.C: 84: while(time != delaycnt) ;
	goto	l635
	
l636:	
	
l635:	
	
l2860:	
	movf	(_delaycnt+1),w
	xorwf	(delay@time+1),w
	skipz
	goto	u3145
	movf	(_delaycnt),w
	xorwf	(delay@time),w
u3145:

	skipz
	goto	u3141
	goto	u3140
u3141:
	goto	l636
u3140:
	
l637:	
	line	85
	
l638:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_inithw
psect	text631,local,class=CODE,delta=2
global __ptext631
__ptext631:

;; *************** function _inithw *****************
;; Defined at:
;;		line 45 in file "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text631
	file	"C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
	line	45
	global	__size_of_inithw
	__size_of_inithw	equ	__end_of_inithw-_inithw
	
_inithw:	
	opt	stack 7
; Regs used in _inithw: [wreg+status,2]
	line	47
	
l2814:	
;ADCLCD.C: 47: ADCON1 = 0X84;
	movlw	(084h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	48
	
l2816:	
;ADCLCD.C: 48: OPTION = 0X00 ;
	clrf	(129)^080h	;volatile
	line	49
	
l2818:	
;ADCLCD.C: 49: INTCON = 0X00 ;
	clrf	(11)	;volatile
	line	50
;ADCLCD.C: 50: TRISA = 0X0f ;
	movlw	(0Fh)
	movwf	(133)^080h	;volatile
	line	51
	
l2820:	
;ADCLCD.C: 51: TRISB = 0X00 ;
	clrf	(134)^080h	;volatile
	line	52
	
l2822:	
;ADCLCD.C: 52: TRISC = 0X80 ;
	movlw	(080h)
	movwf	(135)^080h	;volatile
	line	53
	
l2824:	
;ADCLCD.C: 53: TRISD = 0X80 ;
	movlw	(080h)
	movwf	(136)^080h	;volatile
	line	54
	
l2826:	
;ADCLCD.C: 54: TRISE = 0X00 ;
	clrf	(137)^080h	;volatile
	line	55
;ADCLCD.C: 55: T1CON = 0X01 ;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(16)	;volatile
	line	56
	
l2828:	
;ADCLCD.C: 56: RBPU = 0X00 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1039/8)^080h,(1039)&7
	line	57
	
l2830:	
;ADCLCD.C: 57: ADIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(102/8),(102)&7
	line	58
;ADCLCD.C: 58: TMR1H = 0xF5 ;
	movlw	(0F5h)
	movwf	(15)	;volatile
	line	59
;ADCLCD.C: 59: TMR1L = 0x33 ;
	movlw	(033h)
	movwf	(14)	;volatile
	line	60
	
l2832:	
;ADCLCD.C: 60: PEIE = 1 ;
	bsf	(94/8),(94)&7
	line	61
	
l2834:	
;ADCLCD.C: 61: TMR1IE = 1 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	65
;ADCLCD.C: 65: SPBRG = 71 ;
	movlw	(047h)
	movwf	(153)^080h	;volatile
	line	66
	
l2836:	
;ADCLCD.C: 66: CREN = 1 ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(196/8),(196)&7
	line	67
	
l2838:	
;ADCLCD.C: 67: BRGH = 1 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1218/8)^080h,(1218)&7
	line	68
	
l2840:	
;ADCLCD.C: 68: SYNC = 0 ;
	bcf	(1220/8)^080h,(1220)&7
	line	69
	
l2842:	
;ADCLCD.C: 69: SPEN = 1 ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	70
	
l2844:	
;ADCLCD.C: 70: TXIE = 0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	71
	
l2846:	
;ADCLCD.C: 71: RCIE = 1 ;
	bsf	(1125/8)^080h,(1125)&7
	line	72
	
l2848:	
;ADCLCD.C: 72: TX9 = 0 ;
	bcf	(1222/8)^080h,(1222)&7
	line	73
	
l2850:	
;ADCLCD.C: 73: RX9 = 0 ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	74
	
l2852:	
;ADCLCD.C: 74: TXEN = 1 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1221/8)^080h,(1221)&7
	line	75
	
l2854:	
;ADCLCD.C: 75: PIR1 = 0 ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(12)	;volatile
	line	76
	
l2856:	
;ADCLCD.C: 76: GIE = 1 ;
	bsf	(95/8),(95)&7
	line	77
	
l632:	
	return
	opt stack 0
GLOBAL	__end_of_inithw
	__end_of_inithw:
;; =============== function _inithw ends ============

	signat	_inithw,88
	global	_isr
psect	text632,local,class=CODE,delta=2
global __ptext632
__ptext632:

;; *************** function _isr *****************
;; Defined at:
;;		line 5 in file "C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          6       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text632
	file	"C:\Documents and Settings\Ci1\Desktop\PIC_AnalogSensors_LED\Code\ADCLCD.C"
	line	5
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 2
; Regs used in _isr: [wreg-fsr0h+status,2-btemp+0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_isr+2)
	movf	fsr0,w
	movwf	(??_isr+3)
	movf	pclath,w
	movwf	(??_isr+4)
	movf	btemp+1,w
	movwf	(??_isr+5)
	ljmp	_isr
psect	text632
	line	6
	
i1l2384:	
;ADCLCD.C: 6: if(TMR1IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u255_21
	goto	u255_20
u255_21:
	goto	i1l619
u255_20:
	line	8
	
i1l2386:	
;ADCLCD.C: 7: {
;ADCLCD.C: 8: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	9
	
i1l2388:	
;ADCLCD.C: 9: TMR1H = 0xF5 ;
	movlw	(0F5h)
	movwf	(15)	;volatile
	line	10
;ADCLCD.C: 10: TMR1L = 0x33 ;
	movlw	(033h)
	movwf	(14)	;volatile
	line	11
;ADCLCD.C: 11: delaycnt++ ;
	movlw	low(01h)
	addwf	(_delaycnt),f
	skipnc
	incf	(_delaycnt+1),f
	movlw	high(01h)
	addwf	(_delaycnt+1),f
	line	12
	
i1l2390:	
;ADCLCD.C: 12: if(RxFlag && Rxcnt) Rxcnt-- ;
	btfss	(_RxFlag/8),(_RxFlag)&7
	goto	u256_21
	goto	u256_20
u256_21:
	goto	i1l620
u256_20:
	
i1l2392:	
	movf	(_Rxcnt),w
	skipz
	goto	u257_20
	goto	i1l620
u257_20:
	
i1l2394:	
	movlw	low(01h)
	subwf	(_Rxcnt),f
	
i1l620:	
	line	13
	
i1l2396:	
;ADCLCD.C: 13: milisec++ ;
	movlw	low(01h)
	addwf	(_milisec),f
	skipnc
	incf	(_milisec+1),f
	movlw	high(01h)
	addwf	(_milisec+1),f
	line	14
	
i1l2398:	
;ADCLCD.C: 14: if(milisec >= 1000) {milisec = 0 ; Second++;}
	movlw	high(03E8h)
	subwf	(_milisec+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(_milisec),w
	skipc
	goto	u258_21
	goto	u258_20
u258_21:
	goto	i1l621
u258_20:
	
i1l2400:	
	movlw	low(0)
	movwf	(_milisec)
	movlw	high(0)
	movwf	((_milisec))+1
	
i1l2402:	
	movlw	(01h)
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	addwf	(_Second),f
	
i1l621:	
	line	15
	
i1l2404:	
;ADCLCD.C: 15: if(kcnt) kcnt-- ;
	movf	(_kcnt),w	;volatile
	skipz
	goto	u259_20
	goto	i1l622
u259_20:
	
i1l2406:	
	movlw	low(01h)
	subwf	(_kcnt),f	;volatile
	goto	i1l623
	line	16
	
i1l622:	
	line	18
;ADCLCD.C: 16: else
;ADCLCD.C: 17: {
;ADCLCD.C: 18: if(!RD7) { kflag = 1 ; }
	btfsc	(71/8),(71)&7
	goto	u260_21
	goto	u260_20
u260_21:
	goto	i1l624
u260_20:
	
i1l2408:	
	bsf	(_kflag/8),(_kflag)&7
	
i1l624:	
	line	19
	
i1l623:	
	line	21
	
i1l619:	
	line	22
;ADCLCD.C: 19: }
;ADCLCD.C: 21: }
;ADCLCD.C: 22: if(ADIF)
	btfss	(102/8),(102)&7
	goto	u261_21
	goto	u261_20
u261_21:
	goto	i1l625
u261_20:
	line	24
	
i1l2410:	
;ADCLCD.C: 23: {
;ADCLCD.C: 24: ADIF = 0 ;
	bcf	(102/8),(102)&7
	line	25
;ADCLCD.C: 25: adcflag = 1 ;
	bsf	(_adcflag/8),(_adcflag)&7
	line	26
	
i1l2412:	
;ADCLCD.C: 26: adcval = (((UINT)ADRESH) << 8) + ADRESL ;
	movf	(30),w	;volatile
	movwf	(??_isr+0)+0
	clrf	(??_isr+0)+0+1
	movlw	08h
	movwf	btemp+0
u262_25:
	clrc
	rlf	(??_isr+0)+0,f
	rlf	(??_isr+0)+1,f
	decfsz	btemp+0,f
	goto	u262_25
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	addwf	0+(??_isr+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_adcval)
	movlw	0
	skipnc
	movlw	1
	addwf	1+(??_isr+0)+0,w
	movwf	1+(_adcval)
	line	27
	
i1l2414:	
;ADCLCD.C: 27: adcval &= 0x03FF ;
	movlw	low(03FFh)
	andwf	(_adcval),f
	movlw	high(03FFh)
	andwf	(_adcval+1),f
	line	28
	
i1l625:	
	line	29
	
i1l2416:	
;ADCLCD.C: 28: }
;ADCLCD.C: 29: if(RCIF)
	btfss	(101/8),(101)&7
	goto	u263_21
	goto	u263_20
u263_21:
	goto	i1l626
u263_20:
	line	31
	
i1l2418:	
;ADCLCD.C: 30: {
;ADCLCD.C: 31: DataBuffer[Rxindex] = RCREG ;
	movf	(26),w	;volatile
	movwf	(??_isr+0)+0
	movf	(_Rxindex),w
	addlw	_DataBuffer&0ffh
	movwf	fsr0
	movf	(??_isr+0)+0,w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	line	32
;ADCLCD.C: 32: if(DataBuffer[Rxindex]=='*')
	movf	(_Rxindex),w
	addlw	_DataBuffer&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	02Ah
	skipz
	goto	u264_21
	goto	u264_20
u264_21:
	goto	i1l627
u264_20:
	line	33
	
i1l2420:	
;ADCLCD.C: 33: recBit=1;
	bsf	(_recBit/8),(_recBit)&7
	
i1l627:	
	line	34
;ADCLCD.C: 34: if(recBit==1)
	btfss	(_recBit/8),(_recBit)&7
	goto	u265_21
	goto	u265_20
u265_21:
	goto	i1l628
u265_20:
	line	36
	
i1l2422:	
;ADCLCD.C: 35: {
;ADCLCD.C: 36: Rxcnt = 200 ;
	movlw	(0C8h)
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(_Rxcnt)
	line	37
	
i1l2424:	
;ADCLCD.C: 37: RxFlag = 1 ;
	bsf	(_RxFlag/8),(_RxFlag)&7
	line	38
	
i1l2426:	
;ADCLCD.C: 38: Rxindex++ ;
	movlw	(01h)
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	addwf	(_Rxindex),f
	line	39
	
i1l628:	
	line	41
	
i1l626:	
	line	43
	
i1l629:	
	movf	(??_isr+5),w
	movwf	btemp+1
	movf	(??_isr+4),w
	movwf	pclath
	movf	(??_isr+3),w
	movwf	fsr0
	movf	(??_isr+2),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,88
psect	text633,local,class=CODE,delta=2
global __ptext633
__ptext633:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
