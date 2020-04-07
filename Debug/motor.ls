   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 13 void init_motor(void)
  43                     ; 14 {
  45                     	switch	.text
  46  0000               _init_motor:
  50                     ; 25 }
  53  0000 81            	ret
  87                     ; 27 void speed_up(uint8_t value)
  87                     ; 28 {
  88                     	switch	.text
  89  0001               _speed_up:
  93                     ; 34 }
  96  0001 81            	ret
 130                     ; 36 void speed_down(uint8_t value)
 130                     ; 37 {
 131                     	switch	.text
 132  0002               _speed_down:
 136                     ; 44 }
 139  0002 81            	ret
 162                     ; 46 void set_position(void) 
 162                     ; 47 {
 163                     	switch	.text
 164  0003               _set_position:
 168                     ; 51 }
 171  0003 81            	ret
 194                     ; 53 void tmr_motor(void) 
 194                     ; 54 {
 195                     	switch	.text
 196  0004               _tmr_motor:
 200                     ; 65 }
 203  0004 81            	ret
 226                     ; 67 void task_motor(void)
 226                     ; 68 {
 227                     	switch	.text
 228  0005               _task_motor:
 232                     ; 88 }
 235  0005 81            	ret
 316                     	xdef	_tmr_motor
 317                     	switch	.ubsct
 318  0000               _motor:
 319  0000 000000000000  	ds.b	12
 320                     	xdef	_motor
 321                     	xdef	_speed_down
 322                     	xdef	_speed_up
 323                     	xdef	_set_position
 324                     	xdef	_task_motor
 325                     	xdef	_init_motor
 345                     	end
