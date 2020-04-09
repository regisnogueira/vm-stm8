   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  42                     ; 9 void init_adc(void)
  42                     ; 10 {
  44                     	switch	.text
  45  0000               _init_adc:
  49                     ; 27 }
  52  0000 81            	ret
  75                     ; 29 void read_adc(void)
  75                     ; 30 {
  76                     	switch	.text
  77  0001               _read_adc:
  81                     ; 44 }
  84  0001 81            	ret
  97                     	xdef	_read_adc
  98                     	xdef	_init_adc
 117                     	end
