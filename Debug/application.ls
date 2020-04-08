   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  47                     ; 3 void init_application(void)
  47                     ; 4 {
  49                     	switch	.text
  50  0000               _init_application:
  54                     ; 6 }
  57  0000 81            	ret	
  80                     ; 8 void self_test(void)
  80                     ; 9 {
  81                     	switch	.text
  82  0001               _self_test:
  86                     ; 11 }
  89  0001 81            	ret	
 102                     	xdef	_self_test
 103                     	xdef	_init_application
 122                     	end
