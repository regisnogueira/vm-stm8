   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     	bsct
  16  0000               _menu_options:
  17  0000 41            	dc.b	65
  18  0001 62            	dc.b	98
  19  0002 43            	dc.b	67
  20  0003 64            	dc.b	100
  21  0004 45            	dc.b	69
  22  0005 46            	dc.b	70
  23  0006 48            	dc.b	72
  24  0007 4c            	dc.b	76
  25  0008 50            	dc.b	80
  26  0009 55            	dc.b	85
  27  000a               _num_option:
  28  000a 00            	dc.b	0
  57                     ; 10 void init_menu(void)
  57                     ; 11 {
  59                     	switch	.text
  60  0000               _init_menu:
  64                     ; 13 }
  67  0000 81            	ret
  91                     ; 15 void tmr_menu(void)
  91                     ; 16 {
  92                     	switch	.text
  93  0001               _tmr_menu:
  97                     ; 17     if (menu_timer)
  99  0001 be00          	ldw	x,_menu_timer
 100  0003 2707          	jreq	L13
 101                     ; 18         menu_timer--;
 103  0005 be00          	ldw	x,_menu_timer
 104  0007 1d0001        	subw	x,#1
 105  000a bf00          	ldw	_menu_timer,x
 106  000c               L13:
 107                     ; 19 }
 110  000c 81            	ret
 113                     	bsct
 114  000b               L33_dp:
 115  000b 00            	dc.b	0
 152                     ; 21 void task_menu(void)
 152                     ; 22 {
 153                     	switch	.text
 154  000d               _task_menu:
 158                     ; 24     if (!tick)
 160  000d 3d00          	tnz	_tick
 161  000f 2601          	jrne	L35
 162                     ; 25         return;
 165  0011 81            	ret
 166  0012               L35:
 167                     ; 27     set_option_display(menu_options[num_option], dp);
 169  0012 b60b          	ld	a,L33_dp
 170  0014 97            	ld	xl,a
 171  0015 b60a          	ld	a,_num_option
 172  0017 905f          	clrw	y
 173  0019 9097          	ld	yl,a
 174  001b 90e600        	ld	a,(_menu_options,y)
 175  001e 95            	ld	xh,a
 176  001f cd0000        	call	_set_option_display
 178                     ; 28     dp = (uint8_t)!dp;
 180  0022 3d0b          	tnz	L33_dp
 181  0024 2604          	jrne	L21
 182  0026 a601          	ld	a,#1
 183  0028 2001          	jra	L41
 184  002a               L21:
 185  002a 4f            	clr	a
 186  002b               L41:
 187  002b b70b          	ld	L33_dp,a
 188                     ; 30     if (menu_timer)
 190  002d be00          	ldw	x,_menu_timer
 191  002f 2701          	jreq	L55
 192                     ; 31         return;
 195  0031 81            	ret
 196  0032               L55:
 197                     ; 33     num_option++;
 199  0032 3c0a          	inc	_num_option
 200                     ; 34     if (num_option > sizeof(menu_options)-1)
 202  0034 b60a          	ld	a,_num_option
 203  0036 a10a          	cp	a,#10
 204  0038 2502          	jrult	L75
 205                     ; 35         num_option = 0;
 207  003a 3f0a          	clr	_num_option
 208  003c               L75:
 209                     ; 36     menu_timer = 1000;
 211  003c ae03e8        	ldw	x,#1000
 212  003f bf00          	ldw	_menu_timer,x
 213                     ; 37 }
 216  0041 81            	ret
 259                     	switch	.ubsct
 260  0000               _menu_timer:
 261  0000 0000          	ds.b	2
 262                     	xdef	_menu_timer
 263                     	xdef	_num_option
 264                     	xdef	_menu_options
 265                     	xref.b	_tick
 266                     	xref	_set_option_display
 267                     	xdef	_task_menu
 268                     	xdef	_tmr_menu
 269                     	xdef	_init_menu
 289                     	end
