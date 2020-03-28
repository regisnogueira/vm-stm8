   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 58 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  43                     ; 59 {
  44                     	switch	.text
  45  0000               f_TRAP_IRQHandler:
  49                     ; 63 }
  52  0000 80            	iret
  74                     ; 69 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  74                     ; 70 {
  75                     	switch	.text
  76  0001               f_TLI_IRQHandler:
  80                     ; 74 }
  83  0001 80            	iret
 105                     ; 81 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 105                     ; 82 {
 106                     	switch	.text
 107  0002               f_AWU_IRQHandler:
 111                     ; 86 }
 114  0002 80            	iret
 136                     ; 93 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 136                     ; 94 {
 137                     	switch	.text
 138  0003               f_CLK_IRQHandler:
 142                     ; 98 }
 145  0003 80            	iret
 168                     ; 105 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 168                     ; 106 {
 169                     	switch	.text
 170  0004               f_EXTI_PORTA_IRQHandler:
 174                     ; 110 }
 177  0004 80            	iret
 200                     ; 117 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 200                     ; 118 {
 201                     	switch	.text
 202  0005               f_EXTI_PORTB_IRQHandler:
 206                     ; 122 }
 209  0005 80            	iret
 232                     ; 129 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 232                     ; 130 {
 233                     	switch	.text
 234  0006               f_EXTI_PORTC_IRQHandler:
 238                     ; 134 }
 241  0006 80            	iret
 264                     ; 141 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 264                     ; 142 {
 265                     	switch	.text
 266  0007               f_EXTI_PORTD_IRQHandler:
 270                     ; 146 }
 273  0007 80            	iret
 296                     ; 153 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 296                     ; 154 {
 297                     	switch	.text
 298  0008               f_EXTI_PORTE_IRQHandler:
 302                     ; 158 }
 305  0008 80            	iret
 327                     ; 204 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 327                     ; 205 {
 328                     	switch	.text
 329  0009               f_SPI_IRQHandler:
 333                     ; 209 }
 336  0009 80            	iret
 359                     ; 216 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 359                     ; 217 {
 360                     	switch	.text
 361  000a               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 365                     ; 221 }
 368  000a 80            	iret
 391                     ; 228 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 391                     ; 229 {
 392                     	switch	.text
 393  000b               f_TIM1_CAP_COM_IRQHandler:
 397                     ; 233 }
 400  000b 80            	iret
 423                     ; 265  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 423                     ; 266 {
 424                     	switch	.text
 425  000c               f_TIM2_UPD_OVF_BRK_IRQHandler:
 429                     ; 270 }
 432  000c 80            	iret
 455                     ; 277  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 455                     ; 278 {
 456                     	switch	.text
 457  000d               f_TIM2_CAP_COM_IRQHandler:
 461                     ; 282 }
 464  000d 80            	iret
 487                     ; 319  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 487                     ; 320 {
 488                     	switch	.text
 489  000e               f_UART1_TX_IRQHandler:
 493                     ; 324 }
 496  000e 80            	iret
 519                     ; 331  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 519                     ; 332 {
 520                     	switch	.text
 521  000f               f_UART1_RX_IRQHandler:
 525                     ; 336 }
 528  000f 80            	iret
 550                     ; 344 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 550                     ; 345 {
 551                     	switch	.text
 552  0010               f_I2C_IRQHandler:
 556                     ; 349 }
 559  0010 80            	iret
 582                     ; 424  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 582                     ; 425 {    
 583                     	switch	.text
 584  0011               f_ADC1_IRQHandler:
 586  0011 8a            	push	cc
 587  0012 84            	pop	a
 588  0013 a4bf          	and	a,#191
 589  0015 88            	push	a
 590  0016 86            	pop	cc
 591  0017 3b0002        	push	c_x+2
 592  001a be00          	ldw	x,c_x
 593  001c 89            	pushw	x
 594  001d 3b0002        	push	c_y+2
 595  0020 be00          	ldw	x,c_y
 596  0022 89            	pushw	x
 599                     ; 426     read_adc();
 601  0023 cd0000        	call	_read_adc
 603                     ; 427     return;
 606  0026 85            	popw	x
 607  0027 bf00          	ldw	c_y,x
 608  0029 320002        	pop	c_y+2
 609  002c 85            	popw	x
 610  002d bf00          	ldw	c_x,x
 611  002f 320002        	pop	c_x+2
 612  0032 80            	iret
 637                     ; 449  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 637                     ; 450 {
 638                     	switch	.text
 639  0033               f_TIM4_UPD_OVF_IRQHandler:
 641  0033 8a            	push	cc
 642  0034 84            	pop	a
 643  0035 a4bf          	and	a,#191
 644  0037 88            	push	a
 645  0038 86            	pop	cc
 646  0039 3b0002        	push	c_x+2
 647  003c be00          	ldw	x,c_x
 648  003e 89            	pushw	x
 649  003f 3b0002        	push	c_y+2
 650  0042 be00          	ldw	x,c_y
 651  0044 89            	pushw	x
 654                     ; 451   task_timer();
 656  0045 cd0000        	call	_task_timer
 658                     ; 453   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 660  0048 a601          	ld	a,#1
 661  004a cd0000        	call	_TIM4_ClearITPendingBit
 663                     ; 455 }
 666  004d 85            	popw	x
 667  004e bf00          	ldw	c_y,x
 668  0050 320002        	pop	c_y+2
 669  0053 85            	popw	x
 670  0054 bf00          	ldw	c_x,x
 671  0056 320002        	pop	c_x+2
 672  0059 80            	iret
 695                     ; 463 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 695                     ; 464 {
 696                     	switch	.text
 697  005a               f_EEPROM_EEC_IRQHandler:
 701                     ; 468 }
 704  005a 80            	iret
 716                     	xref	_read_adc
 717                     	xref	_task_timer
 718                     	xdef	f_EEPROM_EEC_IRQHandler
 719                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 720                     	xdef	f_ADC1_IRQHandler
 721                     	xdef	f_I2C_IRQHandler
 722                     	xdef	f_UART1_RX_IRQHandler
 723                     	xdef	f_UART1_TX_IRQHandler
 724                     	xdef	f_TIM2_CAP_COM_IRQHandler
 725                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 726                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 727                     	xdef	f_TIM1_CAP_COM_IRQHandler
 728                     	xdef	f_SPI_IRQHandler
 729                     	xdef	f_EXTI_PORTE_IRQHandler
 730                     	xdef	f_EXTI_PORTD_IRQHandler
 731                     	xdef	f_EXTI_PORTC_IRQHandler
 732                     	xdef	f_EXTI_PORTB_IRQHandler
 733                     	xdef	f_EXTI_PORTA_IRQHandler
 734                     	xdef	f_CLK_IRQHandler
 735                     	xdef	f_AWU_IRQHandler
 736                     	xdef	f_TLI_IRQHandler
 737                     	xdef	f_TRAP_IRQHandler
 738                     	xref	_TIM4_ClearITPendingBit
 739                     	xref.b	c_x
 740                     	xref.b	c_y
 759                     	end
