   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  14                     .const:	section	.text
  15  0000               L3_par:
  16  0000 50            	dc.b	80
  17  0001 00            	dc.b	0
  18  0002 41            	dc.b	65
  19  0003 01            	dc.b	1
  20  0004 43            	dc.b	67
  21  0005 01            	dc.b	1
  22  0006 46            	dc.b	70
  23  0007 00            	dc.b	0
  24  0008 48            	dc.b	72
  25  0009 00            	dc.b	0
  26  000a 4c            	dc.b	76
  27  000b 01            	dc.b	1
  28  000c 55            	dc.b	85
  29  000d 00            	dc.b	0
  30  000e 45            	dc.b	69
  31  000f 01            	dc.b	1
  60                     ; 18 void init_menu(void)
  60                     ; 19 {
  62                     	switch	.text
  63  0000               _init_menu:
  67                     ; 36 }
  70  0000 81            	ret
 104                     ; 38 uint8_t get_menu_value(uint8_t idx)
 104                     ; 39 {
 105                     	switch	.text
 106  0001               _get_menu_value:
 110                     ; 43     return 0;
 112  0001 4f            	clr	a
 115  0002 81            	ret
 138                     ; 47 void set_menu_value(void)
 138                     ; 48 {
 139                     	switch	.text
 140  0003               _set_menu_value:
 144                     ; 54 }
 147  0003 81            	ret
 170                     ; 56 void tmr_menu(void)
 170                     ; 57 {
 171                     	switch	.text
 172  0004               _tmr_menu:
 176                     ; 64 }
 179  0004 81            	ret
 202                     ; 66 static void inc_option(void)
 202                     ; 67 {
 203                     	switch	.text
 204  0005               L16_inc_option:
 208                     ; 73 }
 211  0005 81            	ret
 234                     ; 75 static void dec_option(void)
 234                     ; 76 {
 235                     	switch	.text
 236  0006               L37_dec_option:
 240                     ; 85 }
 243  0006 81            	ret
 266                     ; 87 static void inc_value(void)
 266                     ; 88 {
 267                     	switch	.text
 268  0007               L501_inc_value:
 272                     ; 93 }
 275  0007 81            	ret
 298                     ; 95 static void dec_value(void)
 298                     ; 96 {
 299                     	switch	.text
 300  0008               L711_dec_value:
 304                     ; 104 }
 307  0008 81            	ret
 330                     ; 106 void interrupt_buttons(void)
 330                     ; 107 {
 331                     	switch	.text
 332  0009               _interrupt_buttons:
 336                     ; 131 }
 339  0009 81            	ret
 362                     ; 133 void process_button(void)
 362                     ; 134 {
 363                     	switch	.text
 364  000a               _process_button:
 368                     ; 174 }
 371  000a 81            	ret
 394                     ; 176 void task_menu(void)
 394                     ; 177 {
 395                     	switch	.text
 396  000b               _task_menu:
 400                     ; 194 }
 403  000b 81            	ret
 536                     	xdef	_process_button
 537                     	xdef	_interrupt_buttons
 538                     	switch	.ubsct
 539  0000               _btn:
 540  0000 000000000000  	ds.b	9
 541                     	xdef	_btn
 542  0009               _menu:
 543  0009 000000000000  	ds.b	6
 544                     	xdef	_menu
 545                     	xdef	_task_menu
 546                     	xdef	_tmr_menu
 547                     	xdef	_set_menu_value
 548                     	xdef	_get_menu_value
 549                     	xdef	_init_menu
 569                     	end
