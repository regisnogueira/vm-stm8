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
 585                     ; 429  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 585                     ; 430 {
 586                     	switch	.text
 587  0011               f_ADC1_IRQHandler:
 591                     ; 435     return;
 594  0011 80            	iret	
 619                     ; 458  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 619                     ; 459 {
 620                     	switch	.text
 621  0012               f_TIM4_UPD_OVF_IRQHandler:
 623  0012 8a            	push	cc
 624  0013 84            	pop	a
 625  0014 a4bf          	and	a,#191
 626  0016 88            	push	a
 627  0017 86            	pop	cc
 628  0018 3b0002        	push	c_x+2
 629  001b be00          	ldw	x,c_x
 630  001d 89            	pushw	x
 631  001e 3b0002        	push	c_y+2
 632  0021 be00          	ldw	x,c_y
 633  0023 89            	pushw	x
 636                     ; 460   task_timer();
 638  0024 cd0000        	call	_task_timer
 640                     ; 462   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 642  0027 a601          	ld	a,#1
 643  0029 cd0000        	call	_TIM4_ClearITPendingBit
 645                     ; 464 }
 648  002c 85            	popw	x
 649  002d bf00          	ldw	c_y,x
 650  002f 320002        	pop	c_y+2
 651  0032 85            	popw	x
 652  0033 bf00          	ldw	c_x,x
 653  0035 320002        	pop	c_x+2
 654  0038 80            	iret	
 677                     ; 472 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 677                     ; 473 {
 678                     	switch	.text
 679  0039               f_EEPROM_EEC_IRQHandler:
 683                     ; 477 }
 686  0039 80            	iret	
 698                     	xref	_task_timer
 699                     	xdef	f_EEPROM_EEC_IRQHandler
 700                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 701                     	xdef	f_ADC1_IRQHandler
 702                     	xdef	f_I2C_IRQHandler
 703                     	xdef	f_UART1_RX_IRQHandler
 704                     	xdef	f_UART1_TX_IRQHandler
 705                     	xdef	f_TIM2_CAP_COM_IRQHandler
 706                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 707                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 708                     	xdef	f_TIM1_CAP_COM_IRQHandler
 709                     	xdef	f_SPI_IRQHandler
 710                     	xdef	f_EXTI_PORTE_IRQHandler
 711                     	xdef	f_EXTI_PORTD_IRQHandler
 712                     	xdef	f_EXTI_PORTC_IRQHandler
 713                     	xdef	f_EXTI_PORTB_IRQHandler
 714                     	xdef	f_EXTI_PORTA_IRQHandler
 715                     	xdef	f_CLK_IRQHandler
 716                     	xdef	f_AWU_IRQHandler
 717                     	xdef	f_TLI_IRQHandler
 718                     	xdef	f_TRAP_IRQHandler
 719                     	xref	_TIM4_ClearITPendingBit
 720                     	xref.b	c_x
 721                     	xref.b	c_y
 740                     	end
