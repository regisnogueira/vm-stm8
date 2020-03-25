   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  47                     ; 58 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  47                     ; 59 {
  48                     	switch	.text
  49  0000               f_TRAP_IRQHandler:
  53                     ; 63 }
  56  0000 80            	iret	
  78                     ; 69 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  78                     ; 70 {
  79                     	switch	.text
  80  0001               f_TLI_IRQHandler:
  84                     ; 74 }
  87  0001 80            	iret	
 109                     ; 81 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 109                     ; 82 {
 110                     	switch	.text
 111  0002               f_AWU_IRQHandler:
 115                     ; 86 }
 118  0002 80            	iret	
 140                     ; 93 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 140                     ; 94 {
 141                     	switch	.text
 142  0003               f_CLK_IRQHandler:
 146                     ; 98 }
 149  0003 80            	iret	
 172                     ; 105 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 172                     ; 106 {
 173                     	switch	.text
 174  0004               f_EXTI_PORTA_IRQHandler:
 178                     ; 110 }
 181  0004 80            	iret	
 204                     ; 117 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 204                     ; 118 {
 205                     	switch	.text
 206  0005               f_EXTI_PORTB_IRQHandler:
 210                     ; 122 }
 213  0005 80            	iret	
 236                     ; 129 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 236                     ; 130 {
 237                     	switch	.text
 238  0006               f_EXTI_PORTC_IRQHandler:
 242                     ; 134 }
 245  0006 80            	iret	
 268                     ; 141 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 268                     ; 142 {
 269                     	switch	.text
 270  0007               f_EXTI_PORTD_IRQHandler:
 274                     ; 146 }
 277  0007 80            	iret	
 300                     ; 153 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 300                     ; 154 {
 301                     	switch	.text
 302  0008               f_EXTI_PORTE_IRQHandler:
 306                     ; 158 }
 309  0008 80            	iret	
 331                     ; 204 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 331                     ; 205 {
 332                     	switch	.text
 333  0009               f_SPI_IRQHandler:
 337                     ; 209 }
 340  0009 80            	iret	
 363                     ; 216 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 363                     ; 217 {
 364                     	switch	.text
 365  000a               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 369                     ; 221 }
 372  000a 80            	iret	
 395                     ; 228 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 395                     ; 229 {
 396                     	switch	.text
 397  000b               f_TIM1_CAP_COM_IRQHandler:
 401                     ; 233 }
 404  000b 80            	iret	
 427                     ; 265  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 427                     ; 266 {
 428                     	switch	.text
 429  000c               f_TIM2_UPD_OVF_BRK_IRQHandler:
 433                     ; 270 }
 436  000c 80            	iret	
 459                     ; 277  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 459                     ; 278 {
 460                     	switch	.text
 461  000d               f_TIM2_CAP_COM_IRQHandler:
 465                     ; 282 }
 468  000d 80            	iret	
 491                     ; 319  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 491                     ; 320 {
 492                     	switch	.text
 493  000e               f_UART1_TX_IRQHandler:
 497                     ; 324 }
 500  000e 80            	iret	
 523                     ; 331  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 523                     ; 332 {
 524                     	switch	.text
 525  000f               f_UART1_RX_IRQHandler:
 529                     ; 336 }
 532  000f 80            	iret	
 554                     ; 344 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 554                     ; 345 {
 555                     	switch	.text
 556  0010               f_I2C_IRQHandler:
 560                     ; 349 }
 563  0010 80            	iret	
 587                     ; 424  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 587                     ; 425 {
 588                     	switch	.text
 589  0011               f_ADC1_IRQHandler:
 591  0011 8a            	push	cc
 592  0012 84            	pop	a
 593  0013 a4bf          	and	a,#191
 594  0015 88            	push	a
 595  0016 86            	pop	cc
 596  0017 3b0002        	push	c_x+2
 597  001a be00          	ldw	x,c_x
 598  001c 89            	pushw	x
 599  001d 3b0002        	push	c_y+2
 600  0020 be00          	ldw	x,c_y
 601  0022 89            	pushw	x
 604                     ; 431      ADC1_ClearITPendingBit(ADC1_IT_EOC);
 606  0023 ae0080        	ldw	x,#128
 607  0026 cd0000        	call	_ADC1_ClearITPendingBit
 609                     ; 433      ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
 611  0029 c65400        	ld	a,21504
 612  002c a4f0          	and	a,#240
 613  002e c75400        	ld	21504,a
 614                     ; 434      ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_4);
 616  0031 72145400      	bset	21504,#2
 617                     ; 435      ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
 619  0035 72135401      	bres	21505,#1
 620                     ; 437      read_adc();
 622  0039 cd0000        	call	_read_adc
 624                     ; 438     return;
 627  003c 85            	popw	x
 628  003d bf00          	ldw	c_y,x
 629  003f 320002        	pop	c_y+2
 630  0042 85            	popw	x
 631  0043 bf00          	ldw	c_x,x
 632  0045 320002        	pop	c_x+2
 633  0048 80            	iret	
 658                     ; 461  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 658                     ; 462 {
 659                     	switch	.text
 660  0049               f_TIM4_UPD_OVF_IRQHandler:
 662  0049 8a            	push	cc
 663  004a 84            	pop	a
 664  004b a4bf          	and	a,#191
 665  004d 88            	push	a
 666  004e 86            	pop	cc
 667  004f 3b0002        	push	c_x+2
 668  0052 be00          	ldw	x,c_x
 669  0054 89            	pushw	x
 670  0055 3b0002        	push	c_y+2
 671  0058 be00          	ldw	x,c_y
 672  005a 89            	pushw	x
 675                     ; 463   task_timer();
 677  005b cd0000        	call	_task_timer
 679                     ; 465   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 681  005e a601          	ld	a,#1
 682  0060 cd0000        	call	_TIM4_ClearITPendingBit
 684                     ; 467 }
 687  0063 85            	popw	x
 688  0064 bf00          	ldw	c_y,x
 689  0066 320002        	pop	c_y+2
 690  0069 85            	popw	x
 691  006a bf00          	ldw	c_x,x
 692  006c 320002        	pop	c_x+2
 693  006f 80            	iret	
 716                     ; 475 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 716                     ; 476 {
 717                     	switch	.text
 718  0070               f_EEPROM_EEC_IRQHandler:
 722                     ; 480 }
 725  0070 80            	iret	
 737                     	xref	_read_adc
 738                     	xref	_task_timer
 739                     	xdef	f_EEPROM_EEC_IRQHandler
 740                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 741                     	xdef	f_ADC1_IRQHandler
 742                     	xdef	f_I2C_IRQHandler
 743                     	xdef	f_UART1_RX_IRQHandler
 744                     	xdef	f_UART1_TX_IRQHandler
 745                     	xdef	f_TIM2_CAP_COM_IRQHandler
 746                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 747                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 748                     	xdef	f_TIM1_CAP_COM_IRQHandler
 749                     	xdef	f_SPI_IRQHandler
 750                     	xdef	f_EXTI_PORTE_IRQHandler
 751                     	xdef	f_EXTI_PORTD_IRQHandler
 752                     	xdef	f_EXTI_PORTC_IRQHandler
 753                     	xdef	f_EXTI_PORTB_IRQHandler
 754                     	xdef	f_EXTI_PORTA_IRQHandler
 755                     	xdef	f_CLK_IRQHandler
 756                     	xdef	f_AWU_IRQHandler
 757                     	xdef	f_TLI_IRQHandler
 758                     	xdef	f_TRAP_IRQHandler
 759                     	xref	_TIM4_ClearITPendingBit
 760                     	xref	_ADC1_ClearITPendingBit
 761                     	xref.b	c_x
 762                     	xref.b	c_y
 781                     	end
