   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  44                     ; 1 void init_sensor_pressure(void)
  44                     ; 2 {
  46                     	switch	.text
  47  0000               _init_sensor_pressure:
  51                     ; 4 }
  54  0000 81            	ret
  78                     ; 6 void convert_sensor_preesure(void)
  78                     ; 7 {
  79                     	switch	.text
  80  0001               _convert_sensor_preesure:
  84                     ; 9 }
  87  0001 81            	ret
 100                     	xdef	_convert_sensor_preesure
 101                     	xdef	_init_sensor_pressure
 120                     	end
