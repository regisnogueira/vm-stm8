   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     	bsct
  16  0000               _menu_options:
  17  0000 41            	dc.b	65
  18  0001 62            	dc.b	98
  19  0002 43            	dc.b	67
  20  0003 64            	dc.b	100
  21  0004 45            	dc.b	69
  22  0005 46            	dc.b	70
  23  0006 48            	dc.b	72
  24  0007 4c            	dc.b	76
  25  0008 50            	dc.b	80
  26  0009 55            	dc.b	85
  27  000a               _num_option:
  28  000a 00            	dc.b	0
  62                     ; 10 void init_menu(void)
  62                     ; 11 {
  64                     	switch	.text
  65  0000               _init_menu:
  69                     ; 12     btn_set_dir();
  71  0000 4b60          	push	#96
  72  0002 4b08          	push	#8
  73  0004 ae500a        	ldw	x,#20490
  74  0007 cd0000        	call	_GPIO_Init
  76  000a 85            	popw	x
  77                     ; 13     EXTI_DeInit();
  79  000b cd0000        	call	_EXTI_DeInit
  81                     ; 14     EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
  83  000e ae0202        	ldw	x,#514
  84  0011 cd0000        	call	_EXTI_SetExtIntSensitivity
  86                     ; 15     EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
  88  0014 4f            	clr	a
  89  0015 cd0000        	call	_EXTI_SetTLISensitivity
  91                     ; 18     enableInterrupts();
  94  0018 9a            rim
  96                     ; 19 }
 100  0019 81            	ret
 124                     ; 21 void tmr_menu(void)
 124                     ; 22 {
 125                     	switch	.text
 126  001a               _tmr_menu:
 130                     ; 23     if (menu_timer)
 132  001a be00          	ldw	x,_menu_timer
 133  001c 2707          	jreq	L13
 134                     ; 24         menu_timer--;
 136  001e be00          	ldw	x,_menu_timer
 137  0020 1d0001        	subw	x,#1
 138  0023 bf00          	ldw	_menu_timer,x
 139  0025               L13:
 140                     ; 25 }
 143  0025 81            	ret
 169                     ; 27 void handle_buttons(void)
 169                     ; 28 {
 170                     	switch	.text
 171  0026               _handle_buttons:
 175                     ; 29     if (!btn_set()) {
 177  0026 4b08          	push	#8
 178  0028 ae500a        	ldw	x,#20490
 179  002b cd0000        	call	_GPIO_ReadInputPin
 181  002e 5b01          	addw	sp,#1
 182  0030 4d            	tnz	a
 183  0031 2602          	jrne	L34
 184                     ; 30         num_option++;
 186  0033 3c0a          	inc	_num_option
 187  0035               L34:
 188                     ; 33     if (num_option > sizeof(menu_options)-1)
 190  0035 b60a          	ld	a,_num_option
 191  0037 a10a          	cp	a,#10
 192  0039 2502          	jrult	L54
 193                     ; 34         num_option = 0;
 195  003b 3f0a          	clr	_num_option
 196  003d               L54:
 197                     ; 35 }
 200  003d 81            	ret
 203                     	bsct
 204  000b               L74_dp:
 205  000b 00            	dc.b	0
 241                     ; 37 void task_menu(void)
 241                     ; 38 {
 242                     	switch	.text
 243  003e               _task_menu:
 247                     ; 41     if (!tick)
 249  003e 3d00          	tnz	_tick
 250  0040 2601          	jrne	L76
 251                     ; 42         return;
 254  0042 81            	ret
 255  0043               L76:
 256                     ; 44     set_option_display(menu_options[num_option], dp);
 258  0043 b60b          	ld	a,L74_dp
 259  0045 97            	ld	xl,a
 260  0046 b60a          	ld	a,_num_option
 261  0048 905f          	clrw	y
 262  004a 9097          	ld	yl,a
 263  004c 90e600        	ld	a,(_menu_options,y)
 264  004f 95            	ld	xh,a
 265  0050 cd0000        	call	_set_option_display
 267                     ; 58 }
 270  0053 81            	ret
 313                     	xdef	_handle_buttons
 314                     	switch	.ubsct
 315  0000               _menu_timer:
 316  0000 0000          	ds.b	2
 317                     	xdef	_menu_timer
 318                     	xdef	_num_option
 319                     	xdef	_menu_options
 320                     	xref.b	_tick
 321                     	xref	_set_option_display
 322                     	xdef	_task_menu
 323                     	xdef	_tmr_menu
 324                     	xdef	_init_menu
 325                     	xref	_GPIO_ReadInputPin
 326                     	xref	_GPIO_Init
 327                     	xref	_EXTI_SetTLISensitivity
 328                     	xref	_EXTI_SetExtIntSensitivity
 329                     	xref	_EXTI_DeInit
 349                     	end
