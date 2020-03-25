   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  47                     ; 7 void init_buzzer(void)
  47                     ; 8 {
  49                     	switch	.text
  50  0000               _init_buzzer:
  54                     ; 15 }
  57  0000 81            	ret	
  91                     ; 23 void set_buzzer(uint8_t nbeep, uint16_t ton, uint16_t toff)
  91                     ; 24 {
  92                     	switch	.text
  93  0001               _set_buzzer:
  97                     ; 31 }
 100  0001 81            	ret	
 123                     ; 33 void task_buzzer(void)
 123                     ; 34 {
 124                     	switch	.text
 125  0002               _task_buzzer:
 129                     ; 69 }
 132  0002 81            	ret	
 185                     	switch	.ubsct
 186  0000               _buzzer:
 187  0000 0000000000    	ds.b	5
 188                     	xdef	_buzzer
 189                     	xdef	_task_buzzer
 190                     	xdef	_set_buzzer
 191                     	xdef	_init_buzzer
 211                     	end
