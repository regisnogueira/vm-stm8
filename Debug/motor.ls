   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  47                     ; 13 void init_motor(void)
  47                     ; 14 {
  49                     	switch	.text
  50  0000               _init_motor:
  54                     ; 25 }
  57  0000 81            	ret	
  91                     ; 27 void speed_up(uint8_t value)
  91                     ; 28 {
  92                     	switch	.text
  93  0001               _speed_up:
  97                     ; 34 }
 100  0001 81            	ret	
 134                     ; 36 void speed_down(uint8_t value)
 134                     ; 37 {
 135                     	switch	.text
 136  0002               _speed_down:
 140                     ; 44 }
 143  0002 81            	ret	
 166                     ; 46 void set_position(void) 
 166                     ; 47 {
 167                     	switch	.text
 168  0003               _set_position:
 172                     ; 51 }
 175  0003 81            	ret	
 198                     ; 53 void tmr_motor(void) 
 198                     ; 54 {
 199                     	switch	.text
 200  0004               _tmr_motor:
 204                     ; 65 }
 207  0004 81            	ret	
 230                     ; 67 void task_motor(void)
 230                     ; 68 {
 231                     	switch	.text
 232  0005               _task_motor:
 236                     ; 88 }
 239  0005 81            	ret	
 320                     	xdef	_tmr_motor
 321                     	switch	.ubsct
 322  0000               _motor:
 323  0000 000000000000  	ds.b	12
 324                     	xdef	_motor
 325                     	xdef	_speed_down
 326                     	xdef	_speed_up
 327                     	xdef	_set_position
 328                     	xdef	_task_motor
 329                     	xdef	_init_motor
 349                     	end
