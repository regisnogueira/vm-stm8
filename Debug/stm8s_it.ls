   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 59 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  43                     ; 60 {
  44                     	switch	.text
  45  0000               f_TRAP_IRQHandler:
  49                     ; 64 }
  52  0000 80            	iret
  74                     ; 70 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  74                     ; 71 {
  75                     	switch	.text
  76  0001               f_TLI_IRQHandler:
  80                     ; 75 }
  83  0001 80            	iret
 105                     ; 82 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 105                     ; 83 {
 106                     	switch	.text
 107  0002               f_AWU_IRQHandler:
 111                     ; 87 }
 114  0002 80            	iret
 136                     ; 94 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 136                     ; 95 {
 137                     	switch	.text
 138  0003               f_CLK_IRQHandler:
 142                     ; 99 }
 145  0003 80            	iret
 168                     ; 106 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 168                     ; 107 {
 169                     	switch	.text
 170  0004               f_EXTI_PORTA_IRQHandler:
 174                     ; 111 }
 177  0004 80            	iret
 200                     ; 118 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 200                     ; 119 {
 201                     	switch	.text
 202  0005               f_EXTI_PORTB_IRQHandler:
 206                     ; 123 }
 209  0005 80            	iret
 233                     ; 130 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 233                     ; 131 {
 234                     	switch	.text
 235  0006               f_EXTI_PORTC_IRQHandler:
 237  0006 8a            	push	cc
 238  0007 84            	pop	a
 239  0008 a4bf          	and	a,#191
 240  000a 88            	push	a
 241  000b 86            	pop	cc
 242  000c 3b0002        	push	c_x+2
 243  000f be00          	ldw	x,c_x
 244  0011 89            	pushw	x
 245  0012 3b0002        	push	c_y+2
 246  0015 be00          	ldw	x,c_y
 247  0017 89            	pushw	x
 250                     ; 135   handle_buttons();
 252  0018 cd0000        	call	_handle_buttons
 254                     ; 136 }
 257  001b 85            	popw	x
 258  001c bf00          	ldw	c_y,x
 259  001e 320002        	pop	c_y+2
 260  0021 85            	popw	x
 261  0022 bf00          	ldw	c_x,x
 262  0024 320002        	pop	c_x+2
 263  0027 80            	iret
 286                     ; 143 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 286                     ; 144 {
 287                     	switch	.text
 288  0028               f_EXTI_PORTD_IRQHandler:
 292                     ; 148 }
 295  0028 80            	iret
 318                     ; 155 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 318                     ; 156 {
 319                     	switch	.text
 320  0029               f_EXTI_PORTE_IRQHandler:
 324                     ; 160 }
 327  0029 80            	iret
 349                     ; 206 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 349                     ; 207 {
 350                     	switch	.text
 351  002a               f_SPI_IRQHandler:
 355                     ; 211 }
 358  002a 80            	iret
 381                     ; 218 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 381                     ; 219 {
 382                     	switch	.text
 383  002b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 387                     ; 223 }
 390  002b 80            	iret
 413                     ; 230 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 413                     ; 231 {
 414                     	switch	.text
 415  002c               f_TIM1_CAP_COM_IRQHandler:
 419                     ; 235 }
 422  002c 80            	iret
 445                     ; 267  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 445                     ; 268 {
 446                     	switch	.text
 447  002d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 451                     ; 272 }
 454  002d 80            	iret
 477                     ; 279  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 477                     ; 280 {
 478                     	switch	.text
 479  002e               f_TIM2_CAP_COM_IRQHandler:
 483                     ; 284 }
 486  002e 80            	iret
 509                     ; 321  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 509                     ; 322 {
 510                     	switch	.text
 511  002f               f_UART1_TX_IRQHandler:
 515                     ; 326 }
 518  002f 80            	iret
 541                     ; 333  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 541                     ; 334 {
 542                     	switch	.text
 543  0030               f_UART1_RX_IRQHandler:
 547                     ; 338 }
 550  0030 80            	iret
 572                     ; 346 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 572                     ; 347 {
 573                     	switch	.text
 574  0031               f_I2C_IRQHandler:
 578                     ; 351 }
 581  0031 80            	iret
 604                     ; 426  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 604                     ; 427 {    
 605                     	switch	.text
 606  0032               f_ADC1_IRQHandler:
 608  0032 8a            	push	cc
 609  0033 84            	pop	a
 610  0034 a4bf          	and	a,#191
 611  0036 88            	push	a
 612  0037 86            	pop	cc
 613  0038 3b0002        	push	c_x+2
 614  003b be00          	ldw	x,c_x
 615  003d 89            	pushw	x
 616  003e 3b0002        	push	c_y+2
 617  0041 be00          	ldw	x,c_y
 618  0043 89            	pushw	x
 621                     ; 428     read_adc();
 623  0044 cd0000        	call	_read_adc
 625                     ; 429     return;
 628  0047 85            	popw	x
 629  0048 bf00          	ldw	c_y,x
 630  004a 320002        	pop	c_y+2
 631  004d 85            	popw	x
 632  004e bf00          	ldw	c_x,x
 633  0050 320002        	pop	c_x+2
 634  0053 80            	iret
 659                     ; 451  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 659                     ; 452 {
 660                     	switch	.text
 661  0054               f_TIM4_UPD_OVF_IRQHandler:
 663  0054 8a            	push	cc
 664  0055 84            	pop	a
 665  0056 a4bf          	and	a,#191
 666  0058 88            	push	a
 667  0059 86            	pop	cc
 668  005a 3b0002        	push	c_x+2
 669  005d be00          	ldw	x,c_x
 670  005f 89            	pushw	x
 671  0060 3b0002        	push	c_y+2
 672  0063 be00          	ldw	x,c_y
 673  0065 89            	pushw	x
 676                     ; 453   task_timer();
 678  0066 cd0000        	call	_task_timer
 680                     ; 455   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 682  0069 a601          	ld	a,#1
 683  006b cd0000        	call	_TIM4_ClearITPendingBit
 685                     ; 457 }
 688  006e 85            	popw	x
 689  006f bf00          	ldw	c_y,x
 690  0071 320002        	pop	c_y+2
 691  0074 85            	popw	x
 692  0075 bf00          	ldw	c_x,x
 693  0077 320002        	pop	c_x+2
 694  007a 80            	iret
 717                     ; 465 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 717                     ; 466 {
 718                     	switch	.text
 719  007b               f_EEPROM_EEC_IRQHandler:
 723                     ; 470 }
 726  007b 80            	iret
 738                     	xref	_handle_buttons
 739                     	xref	_read_adc
 740                     	xref	_task_timer
 741                     	xdef	f_EEPROM_EEC_IRQHandler
 742                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 743                     	xdef	f_ADC1_IRQHandler
 744                     	xdef	f_I2C_IRQHandler
 745                     	xdef	f_UART1_RX_IRQHandler
 746                     	xdef	f_UART1_TX_IRQHandler
 747                     	xdef	f_TIM2_CAP_COM_IRQHandler
 748                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 749                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 750                     	xdef	f_TIM1_CAP_COM_IRQHandler
 751                     	xdef	f_SPI_IRQHandler
 752                     	xdef	f_EXTI_PORTE_IRQHandler
 753                     	xdef	f_EXTI_PORTD_IRQHandler
 754                     	xdef	f_EXTI_PORTC_IRQHandler
 755                     	xdef	f_EXTI_PORTB_IRQHandler
 756                     	xdef	f_EXTI_PORTA_IRQHandler
 757                     	xdef	f_CLK_IRQHandler
 758                     	xdef	f_AWU_IRQHandler
 759                     	xdef	f_TLI_IRQHandler
 760                     	xdef	f_TRAP_IRQHandler
 761                     	xref	_TIM4_ClearITPendingBit
 762                     	xref.b	c_x
 763                     	xref.b	c_y
 782                     	end
