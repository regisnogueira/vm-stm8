   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 3 void init_menu(void)
  43                     ; 4 {
  45                     	switch	.text
  46  0000               _init_menu:
  50                     ; 6 }
  53  0000 81            	ret
  76                     ; 8 void tmr_menu(void)
  76                     ; 9 {
  77                     	switch	.text
  78  0001               _tmr_menu:
  82                     ; 11 }
  85  0001 81            	ret
  98                     	xdef	_tmr_menu
  99                     	xdef	_init_menu
 118                     	end
