   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 3 void init_pressure_sensor(void)
  43                     ; 4 {
  45                     	switch	.text
  46  0000               _init_pressure_sensor:
  50                     ; 6 }
  53  0000 81            	ret
  77                     ; 8 void test_pressure_sensor(void)
  77                     ; 9 {
  78                     	switch	.text
  79  0001               _test_pressure_sensor:
  83                     ; 11 }
  86  0001 81            	ret
 110                     ; 13 void tmr_pressure_sensor(void)
 110                     ; 14 {
 111                     	switch	.text
 112  0002               _tmr_pressure_sensor:
 116                     ; 16 }
 119  0002 81            	ret
 132                     	xdef	_tmr_pressure_sensor
 133                     	xdef	_test_pressure_sensor
 134                     	xdef	_init_pressure_sensor
 153                     	end
