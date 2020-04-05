   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  44                     ; 3 void init_pressure_sensor(void)
  44                     ; 4 {
  46                     	switch	.text
  47  0000               _init_pressure_sensor:
  51                     ; 6 }
  54  0000 81            	ret
  78                     ; 8 void test_pressure_sensor(void)
  78                     ; 9 {
  79                     	switch	.text
  80  0001               _test_pressure_sensor:
  84                     ; 11 }
  87  0001 81            	ret
 111                     ; 13 void tmr_pressure_sensor(void)
 111                     ; 14 {
 112                     	switch	.text
 113  0002               _tmr_pressure_sensor:
 117                     ; 16 }
 120  0002 81            	ret
 133                     	xdef	_tmr_pressure_sensor
 134                     	xdef	_test_pressure_sensor
 135                     	xdef	_init_pressure_sensor
 154                     	end
