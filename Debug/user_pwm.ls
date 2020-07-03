   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  53                     ; 3 void init_pwm(uint16_t period)
  53                     ; 4 {
  55                     	switch	.text
  56  0000               _init_pwm:
  60                     ; 14 }
  63  0000 81            	ret
  97                     ; 16 void set_pwm(uint16_t ccrx_val)
  97                     ; 17 {
  98                     	switch	.text
  99  0001               _set_pwm:
 103                     ; 22 }
 106  0001 81            	ret
 119                     	xdef	_set_pwm
 120                     	xdef	_init_pwm
 139                     	end
