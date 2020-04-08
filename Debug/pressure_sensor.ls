   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  48                     ; 3 void init_pressure_sensor(void)
  48                     ; 4 {
  50                     	switch	.text
  51  0000               _init_pressure_sensor:
  55                     ; 6 }
  58  0000 81            	ret	
  82                     ; 8 void test_pressure_sensor(void)
  82                     ; 9 {
  83                     	switch	.text
  84  0001               _test_pressure_sensor:
  88                     ; 11 }
  91  0001 81            	ret	
 115                     ; 13 void tmr_pressure_sensor(void)
 115                     ; 14 {
 116                     	switch	.text
 117  0002               _tmr_pressure_sensor:
 121                     ; 16 }
 124  0002 81            	ret	
 137                     	xdef	_tmr_pressure_sensor
 138                     	xdef	_test_pressure_sensor
 139                     	xdef	_init_pressure_sensor
 158                     	end
