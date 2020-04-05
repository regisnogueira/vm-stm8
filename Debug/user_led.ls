   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 9 void init_led(void)
  43                     ; 10 {
  45                     	switch	.text
  46  0000               _init_led:
  50                     ; 15 }
  53  0000 81            	ret
  76                     ; 17 void tmr_led(void)
  76                     ; 18 {
  77                     	switch	.text
  78  0001               _tmr_led:
  82                     ; 29 }
  85  0001 81            	ret
 119                     ; 31 void set_led(uint8_t ledx, uint16_t speed)
 119                     ; 32 {
 120                     	switch	.text
 121  0002               _set_led:
 125                     ; 36 }
 128  0002 81            	ret
 141                     	xdef	_tmr_led
 142                     	xdef	_set_led
 143                     	xdef	_init_led
 162                     	end
