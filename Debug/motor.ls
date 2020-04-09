   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  42                     ; 13 void init_motor(void)
  42                     ; 14 {
  44                     	switch	.text
  45  0000               _init_motor:
  49                     ; 25 }
  52  0000 81            	ret
  86                     ; 27 void speed_up(uint8_t value)
  86                     ; 28 {
  87                     	switch	.text
  88  0001               _speed_up:
  92                     ; 34 }
  95  0001 81            	ret
 129                     ; 36 void speed_down(uint8_t value)
 129                     ; 37 {
 130                     	switch	.text
 131  0002               _speed_down:
 135                     ; 44 }
 138  0002 81            	ret
 161                     ; 46 void set_position(void) 
 161                     ; 47 {
 162                     	switch	.text
 163  0003               _set_position:
 167                     ; 51 }
 170  0003 81            	ret
 193                     ; 53 void tmr_motor(void) 
 193                     ; 54 {
 194                     	switch	.text
 195  0004               _tmr_motor:
 199                     ; 65 }
 202  0004 81            	ret
 225                     ; 67 void task_motor(void)
 225                     ; 68 {
 226                     	switch	.text
 227  0005               _task_motor:
 231                     ; 88 }
 234  0005 81            	ret
 315                     	xdef	_tmr_motor
 316                     	switch	.ubsct
 317  0000               _motor:
 318  0000 000000000000  	ds.b	12
 319                     	xdef	_motor
 320                     	xdef	_speed_down
 321                     	xdef	_speed_up
 322                     	xdef	_set_position
 323                     	xdef	_task_motor
 324                     	xdef	_init_motor
 344                     	end
