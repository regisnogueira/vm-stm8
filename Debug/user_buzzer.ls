   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  51                     ; 7 void init_buzzer(void)
  51                     ; 8 {
  53                     	switch	.text
  54  0000               _init_buzzer:
  58                     ; 9     buz_dir();
  60  0000 4be0          	push	#224
  61  0002 4b08          	push	#8
  62  0004 ae5000        	ldw	x,#20480
  63  0007 cd0000        	call	_GPIO_Init
  65  000a 85            	popw	x
  66                     ; 10     buz_off();
  69  000b 4b08          	push	#8
  70  000d ae5000        	ldw	x,#20480
  71  0010 cd0000        	call	_GPIO_WriteHigh
  73  0013 84            	pop	a
  74                     ; 11     buz_on();
  76  0014 4b08          	push	#8
  77  0016 ae5000        	ldw	x,#20480
  78  0019 cd0000        	call	_GPIO_WriteLow
  80  001c ae01f4        	ldw	x,#500
  81  001f 84            	pop	a
  82                     ; 12     set_buzzer(3,1000,500);
  84  0020 89            	pushw	x
  85  0021 58            	sllw	x
  86  0022 89            	pushw	x
  87  0023 a603          	ld	a,#3
  88  0025 ad03          	call	_set_buzzer
  90  0027 5b04          	addw	sp,#4
  91                     ; 13 }
  94  0029 81            	ret	
 148                     ; 21 void set_buzzer(uint8_t nbeep, uint16_t ton, uint16_t toff)
 148                     ; 22 {
 149                     	switch	.text
 150  002a               _set_buzzer:
 152       00000000      OFST:	set	0
 155                     ; 23     buzzer.nbeep = nbeep;
 157  002a b700          	ld	_buzzer,a
 158  002c 88            	push	a
 159                     ; 24     buzzer.ton   = ton;
 161  002d 1e04          	ldw	x,(OFST+4,sp)
 162  002f bf01          	ldw	_buzzer+1,x
 163                     ; 25     buzzer.toff  = toff;
 165  0031 1e06          	ldw	x,(OFST+6,sp)
 166  0033 bf03          	ldw	_buzzer+3,x
 167                     ; 26     buz_on();
 169  0035 4b08          	push	#8
 170  0037 ae5000        	ldw	x,#20480
 171  003a cd0000        	call	_GPIO_WriteLow
 173                     ; 27 }
 176  003d 5b02          	addw	sp,#2
 177  003f 81            	ret	
 180                     	bsct
 181  0000               L74_state:
 182  0000 00            	dc.b	0
 183  0001               L15_ton:
 184  0001 0000          	dc.w	0
 185  0003               L35_toff:
 186  0003 0000          	dc.w	0
 239                     ; 29 void task_buzzer(void)
 239                     ; 30 {
 240                     	switch	.text
 241  0040               _task_buzzer:
 245                     ; 34     if (ton) {
 247  0040 be01          	ldw	x,L15_ton
 248  0042 270f          	jreq	L301
 249                     ; 35         buz_on();
 251  0044 4b08          	push	#8
 252  0046 ae5000        	ldw	x,#20480
 253  0049 cd0000        	call	_GPIO_WriteLow
 255  004c be01          	ldw	x,L15_ton
 256  004e 5a            	decw	x
 257  004f bf01          	ldw	L15_ton,x
 258  0051 84            	pop	a
 259                     ; 36         --ton;
 261                     ; 37         return;
 264  0052 81            	ret	
 265  0053               L301:
 266                     ; 40     if (toff) {
 268  0053 be03          	ldw	x,L35_toff
 269  0055 270f          	jreq	L501
 270                     ; 41         buz_off();
 272  0057 4b08          	push	#8
 273  0059 ae5000        	ldw	x,#20480
 274  005c cd0000        	call	_GPIO_WriteHigh
 276  005f be03          	ldw	x,L35_toff
 277  0061 5a            	decw	x
 278  0062 bf03          	ldw	L35_toff,x
 279  0064 84            	pop	a
 280                     ; 42         --toff;
 282                     ; 43         return;
 285  0065 81            	ret	
 286  0066               L501:
 287                     ; 46     if (!buzzer.nbeep) {
 289  0066 b600          	ld	a,_buzzer
 290  0068 260a          	jrne	L701
 291                     ; 47         buz_off();
 293  006a 4b08          	push	#8
 294  006c ae5000        	ldw	x,#20480
 295  006f cd0000        	call	_GPIO_WriteHigh
 297  0072 84            	pop	a
 298                     ; 48         return;
 301  0073 81            	ret	
 302  0074               L701:
 303                     ; 51     if (!ton && !state) {
 305  0074 be01          	ldw	x,L15_ton
 306  0076 2615          	jrne	L111
 308  0078 b600          	ld	a,L74_state
 309  007a 2611          	jrne	L111
 310                     ; 52         ton = buzzer.ton;
 312  007c be01          	ldw	x,_buzzer+1
 313  007e bf01          	ldw	L15_ton,x
 314                     ; 53         buz_on();
 316  0080 4b08          	push	#8
 317  0082 ae5000        	ldw	x,#20480
 318  0085 cd0000        	call	_GPIO_WriteLow
 320  0088 35010000      	mov	L74_state,#1
 321  008c 84            	pop	a
 322                     ; 54         state = 1;
 324  008d               L111:
 325                     ; 57     if (!toff && state) {
 327  008d be03          	ldw	x,L35_toff
 328  008f 2615          	jrne	L311
 330  0091 b600          	ld	a,L74_state
 331  0093 2711          	jreq	L311
 332                     ; 58         toff = buzzer.toff;
 334  0095 be03          	ldw	x,_buzzer+3
 335  0097 bf03          	ldw	L35_toff,x
 336                     ; 59         buz_off();
 338  0099 4b08          	push	#8
 339  009b ae5000        	ldw	x,#20480
 340  009e cd0000        	call	_GPIO_WriteHigh
 342  00a1 3f00          	clr	L74_state
 343  00a3 84            	pop	a
 344  00a4 3a00          	dec	_buzzer
 345                     ; 60         state = 0;
 347                     ; 61         --buzzer.nbeep;
 349  00a6               L311:
 350                     ; 63 }
 353  00a6 81            	ret	
 406                     	switch	.ubsct
 407  0000               _buzzer:
 408  0000 0000000000    	ds.b	5
 409                     	xdef	_buzzer
 410                     	xdef	_task_buzzer
 411                     	xdef	_set_buzzer
 412                     	xdef	_init_buzzer
 413                     	xref	_GPIO_WriteLow
 414                     	xref	_GPIO_WriteHigh
 415                     	xref	_GPIO_Init
 435                     	end
