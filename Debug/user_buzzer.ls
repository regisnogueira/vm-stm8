   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 7 void init_buzzer(void)
  43                     ; 8 {
  45                     	switch	.text
  46  0000               _init_buzzer:
  50                     ; 15 }
  53  0000 81            	ret
  87                     ; 23 void set_buzzer(uint8_t nbeep, uint16_t ton, uint16_t toff)
  87                     ; 24 {
  88                     	switch	.text
  89  0001               _set_buzzer:
  93                     ; 31 }
  96  0001 81            	ret
 119                     ; 33 void tmr_buzzer(void)
 119                     ; 34 {
 120                     	switch	.text
 121  0002               _tmr_buzzer:
 125                     ; 69 }
 128  0002 81            	ret
 181                     	xdef	_tmr_buzzer
 182                     	switch	.ubsct
 183  0000               _buzzer:
 184  0000 0000000000    	ds.b	5
 185                     	xdef	_buzzer
 186                     	xdef	_set_buzzer
 187                     	xdef	_init_buzzer
 207                     	end
