   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  45                     ; 3 void init_motor(void)
  45                     ; 4 {
  47                     	switch	.text
  48  0000               _init_motor:
  52                     ; 5     init_pwm();
  54  0000 cd0000        	call	_init_pwm
  56                     ; 8     set_pwm(PWM_CH1, 50);
  58  0003 ae0032        	ldw	x,#50
  59  0006 89            	pushw	x
  60  0007 4f            	clr	a
  61  0008 cd0000        	call	_set_pwm
  63  000b 85            	popw	x
  64                     ; 9     set_pwm(PWM_CH2, 50);
  66  000c ae0032        	ldw	x,#50
  67  000f 89            	pushw	x
  68  0010 a601          	ld	a,#1
  69  0012 cd0000        	call	_set_pwm
  71  0015 85            	popw	x
  72                     ; 10 }
  75  0016 81            	ret
  88                     	xdef	_init_motor
  89                     	xref	_set_pwm
  90                     	xref	_init_pwm
 109                     	end
