   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  45                     ; 5 void init_eeprom(void)
  45                     ; 6 {
  47                     	switch	.text
  48  0000               _init_eeprom:
  52                     ; 7     flash_config();
  54  0000 ad46          	call	_flash_config
  56                     ; 17     read_all();
  58  0002 ad01          	call	_read_all
  60                     ; 18 }
  63  0004 81            	ret
 118                     ; 20 void read_all(void)
 118                     ; 21 {
 119                     	switch	.text
 120  0005               _read_all:
 122  0005 5207          	subw	sp,#7
 123       00000007      OFST:	set	7
 126                     ; 23     uint32_t addr = FLASH_DATA_START_PHYSICAL_ADDRESS;
 128  0007 ae4000        	ldw	x,#16384
 129  000a 1f03          	ldw	(OFST-4,sp),x
 130  000c ae0000        	ldw	x,#0
 131  000f 1f01          	ldw	(OFST-6,sp),x
 133                     ; 24     uint8_t *p = (uint8_t *)&eeprom;
 135  0011 ae0000        	ldw	x,#_eeprom
 136  0014 1f06          	ldw	(OFST-1,sp),x
 138                     ; 26     for (i=0; i < sizeof(eeprom); i++, p++) {
 140  0016 0f05          	clr	(OFST-2,sp)
 142  0018               L74:
 143                     ; 27         *p = FLASH_ReadByte(addr++);
 145  0018 96            	ldw	x,sp
 146  0019 1c0001        	addw	x,#OFST-6
 147  001c cd0000        	call	c_ltor
 149  001f 96            	ldw	x,sp
 150  0020 1c0001        	addw	x,#OFST-6
 151  0023 a601          	ld	a,#1
 152  0025 cd0000        	call	c_lgadc
 155  0028 be02          	ldw	x,c_lreg+2
 156  002a 89            	pushw	x
 157  002b be00          	ldw	x,c_lreg
 158  002d 89            	pushw	x
 159  002e cd0000        	call	_FLASH_ReadByte
 161  0031 5b04          	addw	sp,#4
 162  0033 1e06          	ldw	x,(OFST-1,sp)
 163  0035 f7            	ld	(x),a
 164                     ; 26     for (i=0; i < sizeof(eeprom); i++, p++) {
 166  0036 0c05          	inc	(OFST-2,sp)
 168  0038 1e06          	ldw	x,(OFST-1,sp)
 169  003a 1c0001        	addw	x,#1
 170  003d 1f06          	ldw	(OFST-1,sp),x
 174  003f 7b05          	ld	a,(OFST-2,sp)
 175  0041 a10e          	cp	a,#14
 176  0043 25d3          	jrult	L74
 177                     ; 29 }
 180  0045 5b07          	addw	sp,#7
 181  0047 81            	ret
 207                     ; 31 void flash_config(void)
 207                     ; 32 {
 208                     	switch	.text
 209  0048               _flash_config:
 213                     ; 33     FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
 215  0048 4f            	clr	a
 216  0049 cd0000        	call	_FLASH_SetProgrammingTime
 218                     ; 34     FLASH_Unlock(FLASH_MEMTYPE_DATA);
 220  004c a6f7          	ld	a,#247
 221  004e cd0000        	call	_FLASH_Unlock
 224  0051               L76:
 225                     ; 36     while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
 227  0051 a608          	ld	a,#8
 228  0053 cd0000        	call	_FLASH_GetFlagStatus
 230  0056 4d            	tnz	a
 231  0057 27f8          	jreq	L76
 232                     ; 37 }
 235  0059 81            	ret
 316                     	switch	.ubsct
 317  0000               _eeprom:
 318  0000 000000000000  	ds.b	14
 319                     	xdef	_eeprom
 320                     	xdef	_read_all
 321                     	xdef	_flash_config
 322                     	xdef	_init_eeprom
 323                     	xref	_FLASH_GetFlagStatus
 324                     	xref	_FLASH_SetProgrammingTime
 325                     	xref	_FLASH_ReadByte
 326                     	xref	_FLASH_Unlock
 327                     	xref.b	c_lreg
 347                     	xref	c_lgadc
 348                     	xref	c_ltor
 349                     	end
