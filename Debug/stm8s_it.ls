   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  47                     ; 63 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  47                     ; 64 {
  48                     	switch	.text
  49  0000               f_TRAP_IRQHandler:
  53                     ; 68 }
  56  0000 80            	iret	
  78                     ; 74 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  78                     ; 75 {
  79                     	switch	.text
  80  0001               f_TLI_IRQHandler:
  84                     ; 79 }
  87  0001 80            	iret	
 109                     ; 86 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 109                     ; 87 {
 110                     	switch	.text
 111  0002               f_AWU_IRQHandler:
 115                     ; 91 }
 118  0002 80            	iret	
 140                     ; 98 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 140                     ; 99 {
 141                     	switch	.text
 142  0003               f_CLK_IRQHandler:
 146                     ; 103 }
 149  0003 80            	iret	
 172                     ; 110 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 172                     ; 111 {
 173                     	switch	.text
 174  0004               f_EXTI_PORTA_IRQHandler:
 178                     ; 115 }
 181  0004 80            	iret	
 204                     ; 122 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 204                     ; 123 {
 205                     	switch	.text
 206  0005               f_EXTI_PORTB_IRQHandler:
 210                     ; 127 }
 213  0005 80            	iret	
 236                     ; 134 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 236                     ; 135 {
 237                     	switch	.text
 238  0006               f_EXTI_PORTC_IRQHandler:
 242                     ; 139 }
 245  0006 80            	iret	
 268                     ; 146 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 268                     ; 147 {
 269                     	switch	.text
 270  0007               f_EXTI_PORTD_IRQHandler:
 274                     ; 151 }
 277  0007 80            	iret	
 300                     ; 158 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 300                     ; 159 {
 301                     	switch	.text
 302  0008               f_EXTI_PORTE_IRQHandler:
 306                     ; 163 }
 309  0008 80            	iret	
 331                     ; 209 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 331                     ; 210 {
 332                     	switch	.text
 333  0009               f_SPI_IRQHandler:
 337                     ; 214 }
 340  0009 80            	iret	
 363                     ; 221 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 363                     ; 222 {
 364                     	switch	.text
 365  000a               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 369                     ; 226 }
 372  000a 80            	iret	
 395                     ; 233 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 395                     ; 234 {
 396                     	switch	.text
 397  000b               f_TIM1_CAP_COM_IRQHandler:
 401                     ; 238 }
 404  000b 80            	iret	
 427                     ; 270  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 427                     ; 271 {
 428                     	switch	.text
 429  000c               f_TIM2_UPD_OVF_BRK_IRQHandler:
 433                     ; 275 }
 436  000c 80            	iret	
 459                     ; 282  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 459                     ; 283 {
 460                     	switch	.text
 461  000d               f_TIM2_CAP_COM_IRQHandler:
 465                     ; 287 }
 468  000d 80            	iret	
 491                     ; 324  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 491                     ; 325 {
 492                     	switch	.text
 493  000e               f_UART1_TX_IRQHandler:
 497                     ; 329 }
 500  000e 80            	iret	
 523                     ; 336  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 523                     ; 337 {
 524                     	switch	.text
 525  000f               f_UART1_RX_IRQHandler:
 529                     ; 341 }
 532  000f 80            	iret	
 554                     ; 349 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 554                     ; 350 {
 555                     	switch	.text
 556  0010               f_I2C_IRQHandler:
 560                     ; 354 }
 563  0010 80            	iret	
 586                     ; 429  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 586                     ; 430 {
 587                     	switch	.text
 588  0011               f_ADC1_IRQHandler:
 590  0011 8a            	push	cc
 591  0012 84            	pop	a
 592  0013 a4bf          	and	a,#191
 593  0015 88            	push	a
 594  0016 86            	pop	cc
 595  0017 3b0002        	push	c_x+2
 596  001a be00          	ldw	x,c_x
 597  001c 89            	pushw	x
 598  001d 3b0002        	push	c_y+2
 599  0020 be00          	ldw	x,c_y
 600  0022 89            	pushw	x
 603                     ; 436      ADC1_ClearITPendingBit(ADC1_IT_EOC);
 605  0023 ae0080        	ldw	x,#128
 606  0026 cd0000        	call	_ADC1_ClearITPendingBit
 608                     ; 438      ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
 610  0029 c65400        	ld	a,21504
 611  002c a4f0          	and	a,#240
 612  002e c75400        	ld	21504,a
 613                     ; 439      ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_4);
 615  0031 72145400      	bset	21504,#2
 616                     ; 440      ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
 618  0035 72135401      	bres	21505,#1
 619                     ; 442     return;
 622  0039 85            	popw	x
 623  003a bf00          	ldw	c_y,x
 624  003c 320002        	pop	c_y+2
 625  003f 85            	popw	x
 626  0040 bf00          	ldw	c_x,x
 627  0042 320002        	pop	c_x+2
 628  0045 80            	iret	
 653                     ; 465  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 653                     ; 466 {
 654                     	switch	.text
 655  0046               f_TIM4_UPD_OVF_IRQHandler:
 657  0046 8a            	push	cc
 658  0047 84            	pop	a
 659  0048 a4bf          	and	a,#191
 660  004a 88            	push	a
 661  004b 86            	pop	cc
 662  004c 3b0002        	push	c_x+2
 663  004f be00          	ldw	x,c_x
 664  0051 89            	pushw	x
 665  0052 3b0002        	push	c_y+2
 666  0055 be00          	ldw	x,c_y
 667  0057 89            	pushw	x
 670                     ; 467   task_timer();
 672  0058 cd0000        	call	_task_timer
 674                     ; 469   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 676  005b a601          	ld	a,#1
 677  005d cd0000        	call	_TIM4_ClearITPendingBit
 679                     ; 471 }
 682  0060 85            	popw	x
 683  0061 bf00          	ldw	c_y,x
 684  0063 320002        	pop	c_y+2
 685  0066 85            	popw	x
 686  0067 bf00          	ldw	c_x,x
 687  0069 320002        	pop	c_x+2
 688  006c 80            	iret	
 711                     ; 479 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 711                     ; 480 {
 712                     	switch	.text
 713  006d               f_EEPROM_EEC_IRQHandler:
 717                     ; 484 }
 720  006d 80            	iret	
 732                     	xref	_task_timer
 733                     	xdef	f_EEPROM_EEC_IRQHandler
 734                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 735                     	xdef	f_ADC1_IRQHandler
 736                     	xdef	f_I2C_IRQHandler
 737                     	xdef	f_UART1_RX_IRQHandler
 738                     	xdef	f_UART1_TX_IRQHandler
 739                     	xdef	f_TIM2_CAP_COM_IRQHandler
 740                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 741                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 742                     	xdef	f_TIM1_CAP_COM_IRQHandler
 743                     	xdef	f_SPI_IRQHandler
 744                     	xdef	f_EXTI_PORTE_IRQHandler
 745                     	xdef	f_EXTI_PORTD_IRQHandler
 746                     	xdef	f_EXTI_PORTC_IRQHandler
 747                     	xdef	f_EXTI_PORTB_IRQHandler
 748                     	xdef	f_EXTI_PORTA_IRQHandler
 749                     	xdef	f_CLK_IRQHandler
 750                     	xdef	f_AWU_IRQHandler
 751                     	xdef	f_TLI_IRQHandler
 752                     	xdef	f_TRAP_IRQHandler
 753                     	xref	_TIM4_ClearITPendingBit
 754                     	xref	_ADC1_ClearITPendingBit
 755                     	xref.b	c_x
 756                     	xref.b	c_y
 775                     	end
