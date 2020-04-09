   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  42                     ; 3 void init_application(void)
  42                     ; 4 {
  44                     	switch	.text
  45  0000               _init_application:
  49                     ; 6 }
  52  0000 81            	ret
  75                     ; 8 void self_test(void)
  75                     ; 9 {
  76                     	switch	.text
  77  0001               _self_test:
  81                     ; 11 }
  84  0001 81            	ret
  97                     	xdef	_self_test
  98                     	xdef	_init_application
 117                     	end
