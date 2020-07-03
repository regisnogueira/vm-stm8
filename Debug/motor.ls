   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  42                     ; 13 void init_motor(void)
  42                     ; 14 {
  44                     	switch	.text
  45  0000               _init_motor:
  49                     ; 31 }
  52  0000 81            	ret
  86                     ; 33 void speed_up(uint8_t value)
  86                     ; 34 {
  87                     	switch	.text
  88  0001               _speed_up:
  92                     ; 40 }
  95  0001 81            	ret
 129                     ; 42 void speed_down(uint8_t value)
 129                     ; 43 {
 130                     	switch	.text
 131  0002               _speed_down:
 135                     ; 50 }
 138  0002 81            	ret
 161                     ; 52 void set_position(void) 
 161                     ; 53 {
 162                     	switch	.text
 163  0003               _set_position:
 167                     ; 57 }
 170  0003 81            	ret
 193                     ; 59 void tmr_motor(void) 
 193                     ; 60 {
 194                     	switch	.text
 195  0004               _tmr_motor:
 199                     ; 73 }
 202  0004 81            	ret
 225                     ; 75 void task_motor(void)
 225                     ; 76 {
 226                     	switch	.text
 227  0005               _task_motor:
 231                     ; 96 }
 234  0005 81            	ret
 329                     	xdef	_tmr_motor
 330                     	switch	.ubsct
 331  0000               _motor:
 332  0000 000000000000  	ds.b	16
 333                     	xdef	_motor
 334                     	xdef	_speed_down
 335                     	xdef	_speed_up
 336                     	xdef	_set_position
 337                     	xdef	_task_motor
 338                     	xdef	_init_motor
 358                     	end
