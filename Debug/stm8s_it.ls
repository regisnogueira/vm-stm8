   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  47                     ; 59 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  47                     ; 60 {
  48                     	switch	.text
  49  0000               f_TRAP_IRQHandler:
  53                     ; 64 }
  56  0000 80            	iret	
  78                     ; 70 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  78                     ; 71 {
  79                     	switch	.text
  80  0001               f_TLI_IRQHandler:
  84                     ; 75 }
  87  0001 80            	iret	
 109                     ; 82 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 109                     ; 83 {
 110                     	switch	.text
 111  0002               f_AWU_IRQHandler:
 115                     ; 87 }
 118  0002 80            	iret	
 140                     ; 94 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 140                     ; 95 {
 141                     	switch	.text
 142  0003               f_CLK_IRQHandler:
 146                     ; 99 }
 149  0003 80            	iret	
 172                     ; 106 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 172                     ; 107 {
 173                     	switch	.text
 174  0004               f_EXTI_PORTA_IRQHandler:
 178                     ; 111 }
 181  0004 80            	iret	
 204                     ; 118 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 204                     ; 119 {
 205                     	switch	.text
 206  0005               f_EXTI_PORTB_IRQHandler:
 210                     ; 123 }
 213  0005 80            	iret	
 237                     ; 130 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 237                     ; 131 {
 238                     	switch	.text
 239  0006               f_EXTI_PORTC_IRQHandler:
 241  0006 8a            	push	cc
 242  0007 84            	pop	a
 243  0008 a4bf          	and	a,#191
 244  000a 88            	push	a
 245  000b 86            	pop	cc
 246  000c 3b0002        	push	c_x+2
 247  000f be00          	ldw	x,c_x
 248  0011 89            	pushw	x
 249  0012 3b0002        	push	c_y+2
 250  0015 be00          	ldw	x,c_y
 251  0017 89            	pushw	x
 254                     ; 135   handle_buttons();
 256  0018 cd0000        	call	_handle_buttons
 258                     ; 136 }
 261  001b 85            	popw	x
 262  001c bf00          	ldw	c_y,x
 263  001e 320002        	pop	c_y+2
 264  0021 85            	popw	x
 265  0022 bf00          	ldw	c_x,x
 266  0024 320002        	pop	c_x+2
 267  0027 80            	iret	
 290                     ; 143 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 290                     ; 144 {
 291                     	switch	.text
 292  0028               f_EXTI_PORTD_IRQHandler:
 296                     ; 148 }
 299  0028 80            	iret	
 322                     ; 155 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 322                     ; 156 {
 323                     	switch	.text
 324  0029               f_EXTI_PORTE_IRQHandler:
 328                     ; 160 }
 331  0029 80            	iret	
 353                     ; 206 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 353                     ; 207 {
 354                     	switch	.text
 355  002a               f_SPI_IRQHandler:
 359                     ; 211 }
 362  002a 80            	iret	
 385                     ; 218 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 385                     ; 219 {
 386                     	switch	.text
 387  002b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 391                     ; 223 }
 394  002b 80            	iret	
 417                     ; 230 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 417                     ; 231 {
 418                     	switch	.text
 419  002c               f_TIM1_CAP_COM_IRQHandler:
 423                     ; 235 }
 426  002c 80            	iret	
 449                     ; 267  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 449                     ; 268 {
 450                     	switch	.text
 451  002d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 455                     ; 272 }
 458  002d 80            	iret	
 481                     ; 279  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 481                     ; 280 {
 482                     	switch	.text
 483  002e               f_TIM2_CAP_COM_IRQHandler:
 487                     ; 284 }
 490  002e 80            	iret	
 513                     ; 321  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 513                     ; 322 {
 514                     	switch	.text
 515  002f               f_UART1_TX_IRQHandler:
 519                     ; 326 }
 522  002f 80            	iret	
 545                     ; 333  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 545                     ; 334 {
 546                     	switch	.text
 547  0030               f_UART1_RX_IRQHandler:
 551                     ; 338 }
 554  0030 80            	iret	
 576                     ; 346 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 576                     ; 347 {
 577                     	switch	.text
 578  0031               f_I2C_IRQHandler:
 582                     ; 351 }
 585  0031 80            	iret	
 608                     ; 426  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 608                     ; 427 {    
 609                     	switch	.text
 610  0032               f_ADC1_IRQHandler:
 612  0032 8a            	push	cc
 613  0033 84            	pop	a
 614  0034 a4bf          	and	a,#191
 615  0036 88            	push	a
 616  0037 86            	pop	cc
 617  0038 3b0002        	push	c_x+2
 618  003b be00          	ldw	x,c_x
 619  003d 89            	pushw	x
 620  003e 3b0002        	push	c_y+2
 621  0041 be00          	ldw	x,c_y
 622  0043 89            	pushw	x
 625                     ; 428     read_adc();
 627  0044 cd0000        	call	_read_adc
 629                     ; 429     return;
 632  0047 85            	popw	x
 633  0048 bf00          	ldw	c_y,x
 634  004a 320002        	pop	c_y+2
 635  004d 85            	popw	x
 636  004e bf00          	ldw	c_x,x
 637  0050 320002        	pop	c_x+2
 638  0053 80            	iret	
 663                     ; 451  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 663                     ; 452 {
 664                     	switch	.text
 665  0054               f_TIM4_UPD_OVF_IRQHandler:
 667  0054 8a            	push	cc
 668  0055 84            	pop	a
 669  0056 a4bf          	and	a,#191
 670  0058 88            	push	a
 671  0059 86            	pop	cc
 672  005a 3b0002        	push	c_x+2
 673  005d be00          	ldw	x,c_x
 674  005f 89            	pushw	x
 675  0060 3b0002        	push	c_y+2
 676  0063 be00          	ldw	x,c_y
 677  0065 89            	pushw	x
 680                     ; 453   task_timer();
 682  0066 cd0000        	call	_task_timer
 684                     ; 455   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 686  0069 a601          	ld	a,#1
 687  006b cd0000        	call	_TIM4_ClearITPendingBit
 689                     ; 457 }
 692  006e 85            	popw	x
 693  006f bf00          	ldw	c_y,x
 694  0071 320002        	pop	c_y+2
 695  0074 85            	popw	x
 696  0075 bf00          	ldw	c_x,x
 697  0077 320002        	pop	c_x+2
 698  007a 80            	iret	
 721                     ; 465 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 721                     ; 466 {
 722                     	switch	.text
 723  007b               f_EEPROM_EEC_IRQHandler:
 727                     ; 470 }
 730  007b 80            	iret	
 742                     	xref	_handle_buttons
 743                     	xref	_read_adc
 744                     	xref	_task_timer
 745                     	xdef	f_EEPROM_EEC_IRQHandler
 746                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 747                     	xdef	f_ADC1_IRQHandler
 748                     	xdef	f_I2C_IRQHandler
 749                     	xdef	f_UART1_RX_IRQHandler
 750                     	xdef	f_UART1_TX_IRQHandler
 751                     	xdef	f_TIM2_CAP_COM_IRQHandler
 752                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 753                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 754                     	xdef	f_TIM1_CAP_COM_IRQHandler
 755                     	xdef	f_SPI_IRQHandler
 756                     	xdef	f_EXTI_PORTE_IRQHandler
 757                     	xdef	f_EXTI_PORTD_IRQHandler
 758                     	xdef	f_EXTI_PORTC_IRQHandler
 759                     	xdef	f_EXTI_PORTB_IRQHandler
 760                     	xdef	f_EXTI_PORTA_IRQHandler
 761                     	xdef	f_CLK_IRQHandler
 762                     	xdef	f_AWU_IRQHandler
 763                     	xdef	f_TLI_IRQHandler
 764                     	xdef	f_TRAP_IRQHandler
 765                     	xref	_TIM4_ClearITPendingBit
 766                     	xref.b	c_x
 767                     	xref.b	c_y
 786                     	end
