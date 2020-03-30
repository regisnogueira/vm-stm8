   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 3 void init_uart(void)
  43                     ; 4 {
  45                     	switch	.text
  46  0000               _init_uart:
  50                     ; 20 }
  53  0000 81            	ret
  88                     ; 22 void send_uart(const uint8_t *p)
  88                     ; 23 {
  89                     	switch	.text
  90  0001               _send_uart:
  94                     ; 30 }
  97  0001 81            	ret
 110                     	xdef	_send_uart
 111                     	xdef	_init_uart
 130                     	end
