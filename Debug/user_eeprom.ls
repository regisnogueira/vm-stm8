   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 5 void init_eeprom(void)
  43                     ; 6 {
  45                     	switch	.text
  46  0000               _init_eeprom:
  50                     ; 8 }
  53  0000 81            	ret
 134                     	switch	.ubsct
 135  0000               _eeprom:
 136  0000 000000000000  	ds.b	14
 137                     	xdef	_eeprom
 138                     	xdef	_init_eeprom
 158                     	end
