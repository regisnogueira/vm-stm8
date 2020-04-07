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
 138                     ; 21 void task_menu(void)
 138                     ; 22 {
 139                     	switch	.text
 140  000d               _task_menu:
 144                     ; 23     if (!tick)
 146  000d 3d00          	tnz	_tick
 147  000f 2601          	jrne	L34
 148                     ; 24         return;
 151  0011 81            	ret
 152  0012               L34:
 153                     ; 26     if (menu_timer)
 155  0012 be00          	ldw	x,_menu_timer
 156  0014 2701          	jreq	L54
 157                     ; 27         return;
 160  0016 81            	ret
 161  0017               L54:
 162                     ; 29     set_display(menu_options[num_option], 0, 0);
 164  0017 4b00          	push	#0
 165  0019 b60a          	ld	a,_num_option
 166  001b 5f            	clrw	x
 167  001c 97            	ld	xl,a
 168  001d e600          	ld	a,(_menu_options,x)
 169  001f 5f            	clrw	x
 170  0020 95            	ld	xh,a
 171  0021 cd0000        	call	_set_display
 173  0024 84            	pop	a
 174                     ; 31     num_option++;
 176  0025 3c0a          	inc	_num_option
 177                     ; 32     if (num_option > sizeof(menu_options)-1)
 179  0027 b60a          	ld	a,_num_option
 180  0029 a10a          	cp	a,#10
 181  002b 2502          	jrult	L74
 182                     ; 33         num_option = 0;
 184  002d 3f0a          	clr	_num_option
 185  002f               L74:
 186                     ; 34     menu_timer = 1000;
 188  002f ae03e8        	ldw	x,#1000
 189  0032 bf00          	ldw	_menu_timer,x
 190                     ; 35 }
 193  0034 81            	ret
 236                     	switch	.ubsct
 237  0000               _menu_timer:
 238  0000 0000          	ds.b	2
 239                     	xdef	_menu_timer
 240                     	xdef	_num_option
 241                     	xdef	_menu_options
 242                     	xref.b	_tick
 243                     	xref	_set_display
 244                     	xdef	_task_menu
 245                     	xdef	_tmr_menu
 246                     	xdef	_init_menu
 266                     	end
