   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  19                     	bsct
  20  0000               _menu_options:
  21  0000 41            	dc.b	65
  22  0001 62            	dc.b	98
  23  0002 43            	dc.b	67
  24  0003 64            	dc.b	100
  25  0004 45            	dc.b	69
  26  0005 46            	dc.b	70
  27  0006 48            	dc.b	72
  28  0007 4c            	dc.b	76
  29  0008 50            	dc.b	80
  30  0009 55            	dc.b	85
  31  000a               _num_option:
  32  000a 00            	dc.b	0
  68                     ; 11 void init_menu(void)
  68                     ; 12 {
  70                     	switch	.text
  71  0000               _init_menu:
  75                     ; 13     btn_set_dir();
  77  0000 4b60          	push	#96
  78  0002 4b08          	push	#8
  79  0004 ae500a        	ldw	x,#20490
  80  0007 cd0000        	call	_GPIO_Init
  82  000a 85            	popw	x
  83                     ; 14     btn_inc_dir();
  85  000b 4b60          	push	#96
  86  000d 4b10          	push	#16
  87  000f ae500a        	ldw	x,#20490
  88  0012 cd0000        	call	_GPIO_Init
  90  0015 85            	popw	x
  91                     ; 15     btn_dec_dir();
  93  0016 4b60          	push	#96
  94  0018 4b20          	push	#32
  95  001a ae500a        	ldw	x,#20490
  96  001d cd0000        	call	_GPIO_Init
  98  0020 85            	popw	x
  99                     ; 16     EXTI_DeInit();
 101  0021 cd0000        	call	_EXTI_DeInit
 103                     ; 18     disableInterrupts();
 106  0024 9b            	sim	
 108                     ; 19     EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
 111  0025 ae0202        	ldw	x,#514
 112  0028 cd0000        	call	_EXTI_SetExtIntSensitivity
 114                     ; 20     EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 116  002b 4f            	clr	a
 117  002c cd0000        	call	_EXTI_SetTLISensitivity
 119                     ; 21     ITC_SetSoftwarePriority(ITC_IRQ_PORTC , ITC_PRIORITYLEVEL_3);
 121  002f ae0503        	ldw	x,#1283
 122  0032 cd0000        	call	_ITC_SetSoftwarePriority
 124                     ; 22     enableInterrupts();
 127  0035 9a            	rim	
 129                     ; 23 }
 133  0036 81            	ret	
 157                     ; 25 void tmr_menu(void)
 157                     ; 26 {
 158                     	switch	.text
 159  0037               _tmr_menu:
 163                     ; 27     if (menu_timer)
 165  0037 be00          	ldw	x,_menu_timer
 166  0039 2703          	jreq	L13
 167                     ; 28         menu_timer--;
 169  003b 5a            	decw	x
 170  003c bf00          	ldw	_menu_timer,x
 171  003e               L13:
 172                     ; 29 }
 175  003e 81            	ret	
 202                     ; 31 void handle_buttons(void)
 202                     ; 32 {
 203                     	switch	.text
 204  003f               _handle_buttons:
 208                     ; 33     if ((GPIO_ReadInputData(BTN_PORT) & BTN_SET_PIN_NUM) == 0x00) {
 210  003f ae500a        	ldw	x,#20490
 211  0042 cd0000        	call	_GPIO_ReadInputData
 213  0045 a508          	bcp	a,#8
 214  0047 260a          	jrne	L34
 215                     ; 34         dp[DIG1_POS] = (uint8_t)!dp[DIG1_POS];
 217  0049 b600          	ld	a,_dp
 218  004b 2603          	jrne	L23
 219  004d 4c            	inc	a
 220  004e 2001          	jra	L43
 221  0050               L23:
 222  0050 4f            	clr	a
 223  0051               L43:
 224  0051 b700          	ld	_dp,a
 225  0053               L34:
 226                     ; 36     if ((GPIO_ReadInputData(BTN_PORT) & BTN_INC_PIN_NUM) == 0x00) {
 228  0053 ae500a        	ldw	x,#20490
 229  0056 cd0000        	call	_GPIO_ReadInputData
 231  0059 a510          	bcp	a,#16
 232  005b 260a          	jrne	L54
 233                     ; 37         if (++num_option > sizeof(menu_options)-1)
 235  005d 3c0a          	inc	_num_option
 236  005f b60a          	ld	a,_num_option
 237  0061 a10a          	cp	a,#10
 238  0063 2502          	jrult	L54
 239                     ; 38             num_option = 0;
 241  0065 3f0a          	clr	_num_option
 242  0067               L54:
 243                     ; 40     if ((GPIO_ReadInputData(BTN_PORT) & BTN_DEC_PIN_NUM) == 0x00) {
 245  0067 ae500a        	ldw	x,#20490
 246  006a cd0000        	call	_GPIO_ReadInputData
 248  006d a520          	bcp	a,#32
 249  006f 2606          	jrne	L15
 250                     ; 41         if (num_option)
 252  0071 b60a          	ld	a,_num_option
 253  0073 2702          	jreq	L15
 254                     ; 42             num_option--;
 256  0075 3a0a          	dec	_num_option
 257  0077               L15:
 258                     ; 44 }
 261  0077 81            	ret	
 288                     ; 46 void task_menu(void)
 288                     ; 47 {
 289                     	switch	.text
 290  0078               _task_menu:
 294                     ; 48     if (!tick)
 296  0078 b600          	ld	a,_tick
 297  007a 2601          	jrne	L56
 298                     ; 49         return;
 301  007c 81            	ret	
 302  007d               L56:
 303                     ; 51     set_option_display(menu_options[num_option]);    
 305  007d b60a          	ld	a,_num_option
 306  007f 5f            	clrw	x
 307  0080 97            	ld	xl,a
 308  0081 e600          	ld	a,(_menu_options,x)
 310                     ; 52 }
 313  0083 cc0000        	jp	_set_option_display
 356                     	xdef	_handle_buttons
 357                     	xref.b	_dp
 358                     	switch	.ubsct
 359  0000               _menu_timer:
 360  0000 0000          	ds.b	2
 361                     	xdef	_menu_timer
 362                     	xdef	_num_option
 363                     	xdef	_menu_options
 364                     	xref.b	_tick
 365                     	xref	_set_option_display
 366                     	xdef	_task_menu
 367                     	xdef	_tmr_menu
 368                     	xdef	_init_menu
 369                     	xref	_ITC_SetSoftwarePriority
 370                     	xref	_GPIO_ReadInputData
 371                     	xref	_GPIO_Init
 372                     	xref	_EXTI_SetTLISensitivity
 373                     	xref	_EXTI_SetExtIntSensitivity
 374                     	xref	_EXTI_DeInit
 394                     	end
