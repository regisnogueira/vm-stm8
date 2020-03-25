   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  42                     ; 63 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  42                     ; 64 {
  43                     	switch	.text
  44  0000               f_TRAP_IRQHandler:
  48                     ; 68 }
  51  0000 80            	iret
  73                     ; 74 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  73                     ; 75 {
  74                     	switch	.text
  75  0001               f_TLI_IRQHandler:
  79                     ; 79 }
  82  0001 80            	iret
 104                     ; 86 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 104                     ; 87 {
 105                     	switch	.text
 106  0002               f_AWU_IRQHandler:
 110                     ; 91 }
 113  0002 80            	iret
 135                     ; 98 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 135                     ; 99 {
 136                     	switch	.text
 137  0003               f_CLK_IRQHandler:
 141                     ; 103 }
 144  0003 80            	iret
 167                     ; 110 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 167                     ; 111 {
 168                     	switch	.text
 169  0004               f_EXTI_PORTA_IRQHandler:
 173                     ; 115 }
 176  0004 80            	iret
 199                     ; 122 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 199                     ; 123 {
 200                     	switch	.text
 201  0005               f_EXTI_PORTB_IRQHandler:
 205                     ; 127 }
 208  0005 80            	iret
 231                     ; 134 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 231                     ; 135 {
 232                     	switch	.text
 233  0006               f_EXTI_PORTC_IRQHandler:
 237                     ; 139 }
 240  0006 80            	iret
 263                     ; 146 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 263                     ; 147 {
 264                     	switch	.text
 265  0007               f_EXTI_PORTD_IRQHandler:
 269                     ; 151 }
 272  0007 80            	iret
 295                     ; 158 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 295                     ; 159 {
 296                     	switch	.text
 297  0008               f_EXTI_PORTE_IRQHandler:
 301                     ; 163 }
 304  0008 80            	iret
 326                     ; 209 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 326                     ; 210 {
 327                     	switch	.text
 328  0009               f_SPI_IRQHandler:
 332                     ; 214 }
 335  0009 80            	iret
 358                     ; 221 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 358                     ; 222 {
 359                     	switch	.text
 360  000a               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 364                     ; 226 }
 367  000a 80            	iret
 390                     ; 233 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 390                     ; 234 {
 391                     	switch	.text
 392  000b               f_TIM1_CAP_COM_IRQHandler:
 396                     ; 238 }
 399  000b 80            	iret
 422                     ; 270  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 422                     ; 271 {
 423                     	switch	.text
 424  000c               f_TIM2_UPD_OVF_BRK_IRQHandler:
 428                     ; 275 }
 431  000c 80            	iret
 454                     ; 282  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 454                     ; 283 {
 455                     	switch	.text
 456  000d               f_TIM2_CAP_COM_IRQHandler:
 460                     ; 287 }
 463  000d 80            	iret
 486                     ; 324  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 486                     ; 325 {
 487                     	switch	.text
 488  000e               f_UART1_TX_IRQHandler:
 492                     ; 329 }
 495  000e 80            	iret
 518                     ; 336  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 518                     ; 337 {
 519                     	switch	.text
 520  000f               f_UART1_RX_IRQHandler:
 524                     ; 341 }
 527  000f 80            	iret
 549                     ; 349 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 549                     ; 350 {
 550                     	switch	.text
 551  0010               f_I2C_IRQHandler:
 555                     ; 354 }
 558  0010 80            	iret
 580                     ; 429  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 580                     ; 430 {
 581                     	switch	.text
 582  0011               f_ADC1_IRQHandler:
 586                     ; 435     return;
 589  0011 80            	iret
 614                     ; 458  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 614                     ; 459 {
 615                     	switch	.text
 616  0012               f_TIM4_UPD_OVF_IRQHandler:
 618  0012 8a            	push	cc
 619  0013 84            	pop	a
 620  0014 a4bf          	and	a,#191
 621  0016 88            	push	a
 622  0017 86            	pop	cc
 623  0018 3b0002        	push	c_x+2
 624  001b be00          	ldw	x,c_x
 625  001d 89            	pushw	x
 626  001e 3b0002        	push	c_y+2
 627  0021 be00          	ldw	x,c_y
 628  0023 89            	pushw	x
 631                     ; 460   task_timer();
 633  0024 cd0000        	call	_task_timer
 635                     ; 462   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 637  0027 a601          	ld	a,#1
 638  0029 cd0000        	call	_TIM4_ClearITPendingBit
 640                     ; 464 }
 643  002c 85            	popw	x
 644  002d bf00          	ldw	c_y,x
 645  002f 320002        	pop	c_y+2
 646  0032 85            	popw	x
 647  0033 bf00          	ldw	c_x,x
 648  0035 320002        	pop	c_x+2
 649  0038 80            	iret
 672                     ; 472 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 672                     ; 473 {
 673                     	switch	.text
 674  0039               f_EEPROM_EEC_IRQHandler:
 678                     ; 477 }
 681  0039 80            	iret
 693                     	xref	_task_timer
 694                     	xdef	f_EEPROM_EEC_IRQHandler
 695                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 696                     	xdef	f_ADC1_IRQHandler
 697                     	xdef	f_I2C_IRQHandler
 698                     	xdef	f_UART1_RX_IRQHandler
 699                     	xdef	f_UART1_TX_IRQHandler
 700                     	xdef	f_TIM2_CAP_COM_IRQHandler
 701                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 702                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 703                     	xdef	f_TIM1_CAP_COM_IRQHandler
 704                     	xdef	f_SPI_IRQHandler
 705                     	xdef	f_EXTI_PORTE_IRQHandler
 706                     	xdef	f_EXTI_PORTD_IRQHandler
 707                     	xdef	f_EXTI_PORTC_IRQHandler
 708                     	xdef	f_EXTI_PORTB_IRQHandler
 709                     	xdef	f_EXTI_PORTA_IRQHandler
 710                     	xdef	f_CLK_IRQHandler
 711                     	xdef	f_AWU_IRQHandler
 712                     	xdef	f_TLI_IRQHandler
 713                     	xdef	f_TRAP_IRQHandler
 714                     	xref	_TIM4_ClearITPendingBit
 715                     	xref.b	c_x
 716                     	xref.b	c_y
 735                     	end
