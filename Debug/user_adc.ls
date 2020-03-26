   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  47                     ; 7 void init_adc(void)
  47                     ; 8 {
  49                     	switch	.text
  50  0000               _init_adc:
  54                     ; 24 }
  57  0000 81            	ret	
  80                     ; 26 uint16_t read_adc(void)
  80                     ; 27 {
  81                     	switch	.text
  82  0001               _read_adc:
  86                     ; 32     return 0;
  88  0001 5f            	clrw	x
  91  0002 81            	ret	
 104                     	xdef	_read_adc
 105                     	xdef	_init_adc
 124                     	end
