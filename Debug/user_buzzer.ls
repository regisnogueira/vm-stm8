   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  46                     ; 7 void init_buzzer(void)
  46                     ; 8 {
  48                     	switch	.text
  49  0000               _init_buzzer:
  53                     ; 9     buz_dir();
  55  0000 4be0          	push	#224
  56  0002 4b08          	push	#8
  57  0004 ae5000        	ldw	x,#20480
  58  0007 cd0000        	call	_GPIO_Init
  60  000a 85            	popw	x
  61                     ; 10     buz_off();
  64  000b 4b08          	push	#8
  65  000d ae5000        	ldw	x,#20480
  66  0010 cd0000        	call	_GPIO_WriteHigh
  68  0013 84            	pop	a
  69                     ; 11     buz_on();
  71  0014 4b08          	push	#8
  72  0016 ae5000        	ldw	x,#20480
  73  0019 cd0000        	call	_GPIO_WriteLow
  75  001c 84            	pop	a
  76                     ; 12     set_buzzer(3,1000,500);
  78  001d ae01f4        	ldw	x,#500
  79  0020 89            	pushw	x
  80  0021 ae03e8        	ldw	x,#1000
  81  0024 89            	pushw	x
  82  0025 a603          	ld	a,#3
  83  0027 ad03          	call	_set_buzzer
  85  0029 5b04          	addw	sp,#4
  86                     ; 13 }
  89  002b 81            	ret
 143                     ; 21 void set_buzzer(uint8_t nbeep, uint16_t ton, uint16_t toff)
 143                     ; 22 {
 144                     	switch	.text
 145  002c               _set_buzzer:
 147  002c 88            	push	a
 148       00000000      OFST:	set	0
 151                     ; 23     buzzer.nbeep = nbeep;
 153  002d b700          	ld	_buzzer,a
 154                     ; 24     buzzer.ton   = ton;
 156  002f 1e04          	ldw	x,(OFST+4,sp)
 157  0031 bf01          	ldw	_buzzer+1,x
 158                     ; 25     buzzer.toff  = toff;
 160  0033 1e06          	ldw	x,(OFST+6,sp)
 161  0035 bf03          	ldw	_buzzer+3,x
 162                     ; 26     buz_on();
 164  0037 4b08          	push	#8
 165  0039 ae5000        	ldw	x,#20480
 166  003c cd0000        	call	_GPIO_WriteLow
 168  003f 84            	pop	a
 169                     ; 27 }
 172  0040 84            	pop	a
 173  0041 81            	ret
 176                     	bsct
 177  0000               L74_state:
 178  0000 00            	dc.b	0
 179  0001               L15_ton:
 180  0001 0000          	dc.w	0
 181  0003               L35_toff:
 182  0003 0000          	dc.w	0
 235                     ; 29 void task_buzzer(void)
 235                     ; 30 {
 236                     	switch	.text
 237  0042               _task_buzzer:
 241                     ; 34     if (ton) {
 243  0042 be01          	ldw	x,L15_ton
 244  0044 2711          	jreq	L301
 245                     ; 35         buz_on();
 247  0046 4b08          	push	#8
 248  0048 ae5000        	ldw	x,#20480
 249  004b cd0000        	call	_GPIO_WriteLow
 251  004e 84            	pop	a
 252                     ; 36         --ton;
 254  004f be01          	ldw	x,L15_ton
 255  0051 1d0001        	subw	x,#1
 256  0054 bf01          	ldw	L15_ton,x
 257                     ; 37         return;
 260  0056 81            	ret
 261  0057               L301:
 262                     ; 40     if (toff) {
 264  0057 be03          	ldw	x,L35_toff
 265  0059 2711          	jreq	L501
 266                     ; 41         buz_off();
 268  005b 4b08          	push	#8
 269  005d ae5000        	ldw	x,#20480
 270  0060 cd0000        	call	_GPIO_WriteHigh
 272  0063 84            	pop	a
 273                     ; 42         --toff;
 275  0064 be03          	ldw	x,L35_toff
 276  0066 1d0001        	subw	x,#1
 277  0069 bf03          	ldw	L35_toff,x
 278                     ; 43         return;
 281  006b 81            	ret
 282  006c               L501:
 283                     ; 46     if (!buzzer.nbeep) {
 285  006c 3d00          	tnz	_buzzer
 286  006e 260a          	jrne	L701
 287                     ; 47         buz_off();
 289  0070 4b08          	push	#8
 290  0072 ae5000        	ldw	x,#20480
 291  0075 cd0000        	call	_GPIO_WriteHigh
 293  0078 84            	pop	a
 294                     ; 48         return;
 297  0079 81            	ret
 298  007a               L701:
 299                     ; 51     if (!ton && !state) {
 301  007a be01          	ldw	x,L15_ton
 302  007c 2615          	jrne	L111
 304  007e 3d00          	tnz	L74_state
 305  0080 2611          	jrne	L111
 306                     ; 52         ton = buzzer.ton;
 308  0082 be01          	ldw	x,_buzzer+1
 309  0084 bf01          	ldw	L15_ton,x
 310                     ; 53         buz_on();
 312  0086 4b08          	push	#8
 313  0088 ae5000        	ldw	x,#20480
 314  008b cd0000        	call	_GPIO_WriteLow
 316  008e 84            	pop	a
 317                     ; 54         state = 1;
 319  008f 35010000      	mov	L74_state,#1
 320  0093               L111:
 321                     ; 57     if (!toff && state) {
 323  0093 be03          	ldw	x,L35_toff
 324  0095 2615          	jrne	L311
 326  0097 3d00          	tnz	L74_state
 327  0099 2711          	jreq	L311
 328                     ; 58         toff = buzzer.toff;
 330  009b be03          	ldw	x,_buzzer+3
 331  009d bf03          	ldw	L35_toff,x
 332                     ; 59         buz_off();
 334  009f 4b08          	push	#8
 335  00a1 ae5000        	ldw	x,#20480
 336  00a4 cd0000        	call	_GPIO_WriteHigh
 338  00a7 84            	pop	a
 339                     ; 60         state = 0;
 341  00a8 3f00          	clr	L74_state
 342                     ; 61         --buzzer.nbeep;
 344  00aa 3a00          	dec	_buzzer
 345  00ac               L311:
 346                     ; 63 }
 349  00ac 81            	ret
 402                     	switch	.ubsct
 403  0000               _buzzer:
 404  0000 0000000000    	ds.b	5
 405                     	xdef	_buzzer
 406                     	xdef	_task_buzzer
 407                     	xdef	_set_buzzer
 408                     	xdef	_init_buzzer
 409                     	xref	_GPIO_WriteLow
 410                     	xref	_GPIO_WriteHigh
 411                     	xref	_GPIO_Init
 431                     	end
