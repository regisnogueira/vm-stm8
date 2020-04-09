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
 603                     ; 426  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 603                     ; 427 {    
 604                     	switch	.text
 605  0032               f_ADC1_IRQHandler:
 607  0032 8a            	push	cc
 608  0033 84            	pop	a
 609  0034 a4bf          	and	a,#191
 610  0036 88            	push	a
 611  0037 86            	pop	cc
 612  0038 3b0002        	push	c_x+2
 613  003b be00          	ldw	x,c_x
 614  003d 89            	pushw	x
 615  003e 3b0002        	push	c_y+2
 616  0041 be00          	ldw	x,c_y
 617  0043 89            	pushw	x
 620                     ; 428     read_adc();
 622  0044 cd0000        	call	_read_adc
 624                     ; 429     return;
 627  0047 85            	popw	x
 628  0048 bf00          	ldw	c_y,x
 629  004a 320002        	pop	c_y+2
 630  004d 85            	popw	x
 631  004e bf00          	ldw	c_x,x
 632  0050 320002        	pop	c_x+2
 633  0053 80            	iret
 658                     ; 451  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 658                     ; 452 {
 659                     	switch	.text
 660  0054               f_TIM4_UPD_OVF_IRQHandler:
 662  0054 8a            	push	cc
 663  0055 84            	pop	a
 664  0056 a4bf          	and	a,#191
 665  0058 88            	push	a
 666  0059 86            	pop	cc
 667  005a 3b0002        	push	c_x+2
 668  005d be00          	ldw	x,c_x
 669  005f 89            	pushw	x
 670  0060 3b0002        	push	c_y+2
 671  0063 be00          	ldw	x,c_y
 672  0065 89            	pushw	x
 675                     ; 453   task_timer();
 677  0066 cd0000        	call	_task_timer
 679                     ; 455   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 681  0069 a601          	ld	a,#1
 682  006b cd0000        	call	_TIM4_ClearITPendingBit
 684                     ; 457 }
 687  006e 85            	popw	x
 688  006f bf00          	ldw	c_y,x
 689  0071 320002        	pop	c_y+2
 690  0074 85            	popw	x
 691  0075 bf00          	ldw	c_x,x
 692  0077 320002        	pop	c_x+2
 693  007a 80            	iret
 716                     ; 465 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 716                     ; 466 {
 717                     	switch	.text
 718  007b               f_EEPROM_EEC_IRQHandler:
 722                     ; 470 }
 725  007b 80            	iret
 737                     	xref	_interrupt_buttons
 738                     	xref	_read_adc
 739                     	xref	_task_timer
 740                     	xdef	f_EEPROM_EEC_IRQHandler
 741                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 742                     	xdef	f_ADC1_IRQHandler
 743                     	xdef	f_I2C_IRQHandler
 744                     	xdef	f_UART1_RX_IRQHandler
 745                     	xdef	f_UART1_TX_IRQHandler
 746                     	xdef	f_TIM2_CAP_COM_IRQHandler
 747                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 748                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 749                     	xdef	f_TIM1_CAP_COM_IRQHandler
 750                     	xdef	f_SPI_IRQHandler
 751                     	xdef	f_EXTI_PORTE_IRQHandler
 752                     	xdef	f_EXTI_PORTD_IRQHandler
 753                     	xdef	f_EXTI_PORTC_IRQHandler
 754                     	xdef	f_EXTI_PORTB_IRQHandler
 755                     	xdef	f_EXTI_PORTA_IRQHandler
 756                     	xdef	f_CLK_IRQHandler
 757                     	xdef	f_AWU_IRQHandler
 758                     	xdef	f_TLI_IRQHandler
 759                     	xdef	f_TRAP_IRQHandler
 760                     	xref	_TIM4_ClearITPendingBit
 761                     	xref.b	c_x
 762                     	xref.b	c_y
 781                     	end
