   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  42                     ; 7 void init_buzzer(void)
  42                     ; 8 {
  44                     	switch	.text
  45  0000               _init_buzzer:
  49                     ; 15 }
  52  0000 81            	ret
  86                     ; 23 void set_buzzer(uint8_t nbeep, uint16_t ton, uint16_t toff)
  86                     ; 24 {
  87                     	switch	.text
  88  0001               _set_buzzer:
  92                     ; 31 }
  95  0001 81            	ret
 118                     ; 33 void tmr_buzzer(void)
 118                     ; 34 {
 119                     	switch	.text
 120  0002               _tmr_buzzer:
 124                     ; 69 }
 127  0002 81            	ret
 180                     	xdef	_tmr_buzzer
 181                     	switch	.ubsct
 182  0000               _buzzer:
 183  0000 0000000000    	ds.b	5
 184                     	xdef	_buzzer
 185                     	xdef	_set_buzzer
 186                     	xdef	_init_buzzer
 206                     	end
