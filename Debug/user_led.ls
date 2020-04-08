   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  47                     ; 9 void init_led(void)
  47                     ; 10 {
  49                     	switch	.text
  50  0000               _init_led:
  54                     ; 15 }
  57  0000 81            	ret	
  80                     ; 17 void tmr_led(void)
  80                     ; 18 {
  81                     	switch	.text
  82  0001               _tmr_led:
  86                     ; 29 }
  89  0001 81            	ret	
 123                     ; 31 void set_led(uint8_t ledx, uint16_t speed)
 123                     ; 32 {
 124                     	switch	.text
 125  0002               _set_led:
 129                     ; 36 }
 132  0002 81            	ret	
 145                     	xdef	_tmr_led
 146                     	xdef	_set_led
 147                     	xdef	_init_led
 166                     	end
