   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  42                     ; 59 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  42                     ; 60 {
  43                     	switch	.text
  44  0000               f_TRAP_IRQHandler:
  48                     ; 64 }
  51  0000 80            	iret
  73                     ; 70 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  73                     ; 71 {
  74                     	switch	.text
  75  0001               f_TLI_IRQHandler:
  79                     ; 75 }
  82  0001 80            	iret
 104                     ; 82 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 104                     ; 83 {
 105                     	switch	.text
 106  0002               f_AWU_IRQHandler:
 110                     ; 87 }
 113  0002 80            	iret
 135                     ; 94 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 135                     ; 95 {
 136                     	switch	.text
 137  0003               f_CLK_IRQHandler:
 141                     ; 99 }
 144  0003 80            	iret
 167                     ; 106 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 167                     ; 107 {
 168                     	switch	.text
 169  0004               f_EXTI_PORTA_IRQHandler:
 173                     ; 111 }
 176  0004 80            	iret
 199                     ; 118 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 199                     ; 119 {
 200                     	switch	.text
 201  0005               f_EXTI_PORTB_IRQHandler:
 205                     ; 123 }
 208  0005 80            	iret
 232                     ; 130 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 232                     ; 131 {
 233                     	switch	.text
 234  0006               f_EXTI_PORTC_IRQHandler:
 236  0006 8a            	push	cc
 237  0007 84            	pop	a
 238  0008 a4bf          	and	a,#191
 239  000a 88            	push	a
 240  000b 86            	pop	cc
 241  000c 3b0002        	push	c_x+2
 242  000f be00          	ldw	x,c_x
 243  0011 89            	pushw	x
 244  0012 3b0002        	push	c_y+2
 245  0015 be00          	ldw	x,c_y
 246  0017 89            	pushw	x
 249                     ; 135   interrupt_buttons();
 251  0018 cd0000        	call	_interrupt_buttons
 253                     ; 136 }
 256  001b 85            	popw	x
 257  001c bf00          	ldw	c_y,x
 258  001e 320002        	pop	c_y+2
 259  0021 85            	popw	x
 260  0022 bf00          	ldw	c_x,x
 261  0024 320002        	pop	c_x+2
 262  0027 80            	iret
 285                     ; 143 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 285                     ; 144 {
 286                     	switch	.text
 287  0028               f_EXTI_PORTD_IRQHandler:
 291                     ; 148 }
 294  0028 80            	iret
 317                     ; 155 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 317                     ; 156 {
 318                     	switch	.text
 319  0029               f_EXTI_PORTE_IRQHandler:
 323                     ; 160 }
 326  0029 80            	iret
 348                     ; 206 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 348                     ; 207 {
 349                     	switch	.text
 350  002a               f_SPI_IRQHandler:
 354                     ; 211 }
 357  002a 80            	iret
 380                     ; 218 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 380                     ; 219 {
 381                     	switch	.text
 382  002b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 386                     ; 223 }
 389  002b 80            	iret
 412                     ; 230 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 412                     ; 231 {
 413                     	switch	.text
 414  002c               f_TIM1_CAP_COM_IRQHandler:
 418                     ; 235 }
 421  002c 80            	iret
 444                     ; 267  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 444                     ; 268 {
 445                     	switch	.text
 446  002d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 450                     ; 272 }
 453  002d 80            	iret
 476                     ; 279  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 476                     ; 280 {
 477                     	switch	.text
 478  002e               f_TIM2_CAP_COM_IRQHandler:
 482                     ; 284 }
 485  002e 80            	iret
 508                     ; 321  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 508                     ; 322 {
 509                     	switch	.text
 510  002f               f_UART1_TX_IRQHandler:
 514                     ; 326 }
 517  002f 80            	iret
 540                     ; 333  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 540                     ; 334 {
 541                     	switch	.text
 542  0030               f_UART1_RX_IRQHandler:
 546                     ; 338 }
 549  0030 80            	iret
 571                     ; 346 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 571                     ; 347 {
 572                     	switch	.text
 573  0031               f_I2C_IRQHandler:
 577                     ; 351 }
 580  0031 80            	iret
 602                     ; 426  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 602                     ; 427 {    
 603                     	switch	.text
 604  0032               f_ADC1_IRQHandler:
 608                     ; 429     return;
 611  0032 80            	iret
 636                     ; 451  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 636                     ; 452 {
 637                     	switch	.text
 638  0033               f_TIM4_UPD_OVF_IRQHandler:
 640  0033 8a            	push	cc
 641  0034 84            	pop	a
 642  0035 a4bf          	and	a,#191
 643  0037 88            	push	a
 644  0038 86            	pop	cc
 645  0039 3b0002        	push	c_x+2
 646  003c be00          	ldw	x,c_x
 647  003e 89            	pushw	x
 648  003f 3b0002        	push	c_y+2
 649  0042 be00          	ldw	x,c_y
 650  0044 89            	pushw	x
 653                     ; 453   task_timer();
 655  0045 cd0000        	call	_task_timer
 657                     ; 455   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 659  0048 a601          	ld	a,#1
 660  004a cd0000        	call	_TIM4_ClearITPendingBit
 662                     ; 457 }
 665  004d 85            	popw	x
 666  004e bf00          	ldw	c_y,x
 667  0050 320002        	pop	c_y+2
 668  0053 85            	popw	x
 669  0054 bf00          	ldw	c_x,x
 670  0056 320002        	pop	c_x+2
 671  0059 80            	iret
 694                     ; 465 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 694                     ; 466 {
 695                     	switch	.text
 696  005a               f_EEPROM_EEC_IRQHandler:
 700                     ; 470 }
 703  005a 80            	iret
 715                     	xref	_interrupt_buttons
 716                     	xref	_task_timer
 717                     	xdef	f_EEPROM_EEC_IRQHandler
 718                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 719                     	xdef	f_ADC1_IRQHandler
 720                     	xdef	f_I2C_IRQHandler
 721                     	xdef	f_UART1_RX_IRQHandler
 722                     	xdef	f_UART1_TX_IRQHandler
 723                     	xdef	f_TIM2_CAP_COM_IRQHandler
 724                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 725                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 726                     	xdef	f_TIM1_CAP_COM_IRQHandler
 727                     	xdef	f_SPI_IRQHandler
 728                     	xdef	f_EXTI_PORTE_IRQHandler
 729                     	xdef	f_EXTI_PORTD_IRQHandler
 730                     	xdef	f_EXTI_PORTC_IRQHandler
 731                     	xdef	f_EXTI_PORTB_IRQHandler
 732                     	xdef	f_EXTI_PORTA_IRQHandler
 733                     	xdef	f_CLK_IRQHandler
 734                     	xdef	f_AWU_IRQHandler
 735                     	xdef	f_TLI_IRQHandler
 736                     	xdef	f_TRAP_IRQHandler
 737                     	xref	_TIM4_ClearITPendingBit
 738                     	xref.b	c_x
 739                     	xref.b	c_y
 758                     	end
