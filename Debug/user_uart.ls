   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  47                     ; 3 void init_uart(void)
  47                     ; 4 {
  49                     	switch	.text
  50  0000               _init_uart:
  54                     ; 20 }
  57  0000 81            	ret	
  92                     ; 22 void send_uart(const uint8_t *p)
  92                     ; 23 {
  93                     	switch	.text
  94  0001               _send_uart:
  98                     ; 30 }
 101  0001 81            	ret	
 114                     	xdef	_send_uart
 115                     	xdef	_init_uart
 134                     	end
