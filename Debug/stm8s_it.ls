   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  42                     ; 58 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  42                     ; 59 {
  43                     	switch	.text
  44  0000               f_TRAP_IRQHandler:
  48                     ; 63 }
  51  0000 80            	iret
  73                     ; 69 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  73                     ; 70 {
  74                     	switch	.text
  75  0001               f_TLI_IRQHandler:
  79                     ; 74 }
  82  0001 80            	iret
 104                     ; 81 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 104                     ; 82 {
 105                     	switch	.text
 106  0002               f_AWU_IRQHandler:
 110                     ; 86 }
 113  0002 80            	iret
 135                     ; 93 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 135                     ; 94 {
 136                     	switch	.text
 137  0003               f_CLK_IRQHandler:
 141                     ; 98 }
 144  0003 80            	iret
 167                     ; 105 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 167                     ; 106 {
 168                     	switch	.text
 169  0004               f_EXTI_PORTA_IRQHandler:
 173                     ; 110 }
 176  0004 80            	iret
 199                     ; 117 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 199                     ; 118 {
 200                     	switch	.text
 201  0005               f_EXTI_PORTB_IRQHandler:
 205                     ; 122 }
 208  0005 80            	iret
 231                     ; 129 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 231                     ; 130 {
 232                     	switch	.text
 233  0006               f_EXTI_PORTC_IRQHandler:
 237                     ; 134 }
 240  0006 80            	iret
 263                     ; 141 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 263                     ; 142 {
 264                     	switch	.text
 265  0007               f_EXTI_PORTD_IRQHandler:
 269                     ; 146 }
 272  0007 80            	iret
 295                     ; 153 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 295                     ; 154 {
 296                     	switch	.text
 297  0008               f_EXTI_PORTE_IRQHandler:
 301                     ; 158 }
 304  0008 80            	iret
 326                     ; 204 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 326                     ; 205 {
 327                     	switch	.text
 328  0009               f_SPI_IRQHandler:
 332                     ; 209 }
 335  0009 80            	iret
 358                     ; 216 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 358                     ; 217 {
 359                     	switch	.text
 360  000a               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 364                     ; 221 }
 367  000a 80            	iret
 390                     ; 228 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 390                     ; 229 {
 391                     	switch	.text
 392  000b               f_TIM1_CAP_COM_IRQHandler:
 396                     ; 233 }
 399  000b 80            	iret
 422                     ; 265  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 422                     ; 266 {
 423                     	switch	.text
 424  000c               f_TIM2_UPD_OVF_BRK_IRQHandler:
 428                     ; 270 }
 431  000c 80            	iret
 454                     ; 277  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 454                     ; 278 {
 455                     	switch	.text
 456  000d               f_TIM2_CAP_COM_IRQHandler:
 460                     ; 282 }
 463  000d 80            	iret
 486                     ; 319  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 486                     ; 320 {
 487                     	switch	.text
 488  000e               f_UART1_TX_IRQHandler:
 492                     ; 324 }
 495  000e 80            	iret
 518                     ; 331  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 518                     ; 332 {
 519                     	switch	.text
 520  000f               f_UART1_RX_IRQHandler:
 524                     ; 336 }
 527  000f 80            	iret
 549                     ; 344 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 549                     ; 345 {
 550                     	switch	.text
 551  0010               f_I2C_IRQHandler:
 555                     ; 349 }
 558  0010 80            	iret
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
 599                     ; 431      ADC1_ClearITPendingBit(ADC1_IT_EOC);
 601  0023 ae0080        	ldw	x,#128
 602  0026 cd0000        	call	_ADC1_ClearITPendingBit
 604                     ; 433      ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
 606  0029 c65400        	ld	a,21504
 607  002c a4f0          	and	a,#240
 608  002e c75400        	ld	21504,a
 609                     ; 434      ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_4);
 611  0031 72145400      	bset	21504,#2
 612                     ; 435      ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
 614  0035 72135401      	bres	21505,#1
 615                     ; 437      read_adc();
 617  0039 cd0000        	call	_read_adc
 619                     ; 438     return;
 622  003c 85            	popw	x
 623  003d bf00          	ldw	c_y,x
 624  003f 320002        	pop	c_y+2
 625  0042 85            	popw	x
 626  0043 bf00          	ldw	c_x,x
 627  0045 320002        	pop	c_x+2
 628  0048 80            	iret
 653                     ; 461  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 653                     ; 462 {
 654                     	switch	.text
 655  0049               f_TIM4_UPD_OVF_IRQHandler:
 657  0049 8a            	push	cc
 658  004a 84            	pop	a
 659  004b a4bf          	and	a,#191
 660  004d 88            	push	a
 661  004e 86            	pop	cc
 662  004f 3b0002        	push	c_x+2
 663  0052 be00          	ldw	x,c_x
 664  0054 89            	pushw	x
 665  0055 3b0002        	push	c_y+2
 666  0058 be00          	ldw	x,c_y
 667  005a 89            	pushw	x
 670                     ; 463   task_timer();
 672  005b cd0000        	call	_task_timer
 674                     ; 465   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 676  005e a601          	ld	a,#1
 677  0060 cd0000        	call	_TIM4_ClearITPendingBit
 679                     ; 467 }
 682  0063 85            	popw	x
 683  0064 bf00          	ldw	c_y,x
 684  0066 320002        	pop	c_y+2
 685  0069 85            	popw	x
 686  006a bf00          	ldw	c_x,x
 687  006c 320002        	pop	c_x+2
 688  006f 80            	iret
 711                     ; 475 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 711                     ; 476 {
 712                     	switch	.text
 713  0070               f_EEPROM_EEC_IRQHandler:
 717                     ; 480 }
 720  0070 80            	iret
 732                     	xref	_read_adc
 733                     	xref	_task_timer
 734                     	xdef	f_EEPROM_EEC_IRQHandler
 735                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 736                     	xdef	f_ADC1_IRQHandler
 737                     	xdef	f_I2C_IRQHandler
 738                     	xdef	f_UART1_RX_IRQHandler
 739                     	xdef	f_UART1_TX_IRQHandler
 740                     	xdef	f_TIM2_CAP_COM_IRQHandler
 741                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 742                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 743                     	xdef	f_TIM1_CAP_COM_IRQHandler
 744                     	xdef	f_SPI_IRQHandler
 745                     	xdef	f_EXTI_PORTE_IRQHandler
 746                     	xdef	f_EXTI_PORTD_IRQHandler
 747                     	xdef	f_EXTI_PORTC_IRQHandler
 748                     	xdef	f_EXTI_PORTB_IRQHandler
 749                     	xdef	f_EXTI_PORTA_IRQHandler
 750                     	xdef	f_CLK_IRQHandler
 751                     	xdef	f_AWU_IRQHandler
 752                     	xdef	f_TLI_IRQHandler
 753                     	xdef	f_TRAP_IRQHandler
 754                     	xref	_TIM4_ClearITPendingBit
 755                     	xref	_ADC1_ClearITPendingBit
 756                     	xref.b	c_x
 757                     	xref.b	c_y
 776                     	end
