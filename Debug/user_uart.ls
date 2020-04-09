   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  42                     ; 3 void init_uart(void)
  42                     ; 4 {
  44                     	switch	.text
  45  0000               _init_uart:
  49                     ; 20 }
  52  0000 81            	ret
  87                     ; 22 void send_uart(const uint8_t *p)
  87                     ; 23 {
  88                     	switch	.text
  89  0001               _send_uart:
  93                     ; 30 }
  96  0001 81            	ret
 109                     	xdef	_send_uart
 110                     	xdef	_init_uart
 129                     	end
