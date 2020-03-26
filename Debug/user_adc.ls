   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  42                     ; 7 void init_adc(void)
  42                     ; 8 {
  44                     	switch	.text
  45  0000               _init_adc:
  49                     ; 24 }
  52  0000 81            	ret
  75                     ; 26 uint16_t read_adc(void)
  75                     ; 27 {
  76                     	switch	.text
  77  0001               _read_adc:
  81                     ; 32     return 0;
  83  0001 5f            	clrw	x
  86  0002 81            	ret
  99                     	xdef	_read_adc
 100                     	xdef	_init_adc
 119                     	end
