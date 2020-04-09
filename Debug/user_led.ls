   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  42                     ; 9 void init_led(void)
  42                     ; 10 {
  44                     	switch	.text
  45  0000               _init_led:
  49                     ; 15 }
  52  0000 81            	ret
  75                     ; 17 void tmr_led(void)
  75                     ; 18 {
  76                     	switch	.text
  77  0001               _tmr_led:
  81                     ; 29 }
  84  0001 81            	ret
 118                     ; 31 void set_led(uint8_t ledx, uint16_t speed)
 118                     ; 32 {
 119                     	switch	.text
 120  0002               _set_led:
 124                     ; 36 }
 127  0002 81            	ret
 140                     	xdef	_tmr_led
 141                     	xdef	_set_led
 142                     	xdef	_init_led
 161                     	end
