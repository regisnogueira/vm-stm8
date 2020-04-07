   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  74                     ; 7 void init_eeprom(void)
  74                     ; 8 {
  76                     	switch	.text
  77  0000               _init_eeprom:
  79  0000 5206          	subw	sp,#6
  80       00000006      OFST:	set	6
  83                     ; 9     uint32_t add = 0;
  85                     ; 10     uint8_t val = 0x00, val_comp = 0xAA;
  89                     ; 12     flash_config();
  91  0002 ad41          	call	_flash_config
  93                     ; 22     read_all();
  95  0004 ad03          	call	_read_all
  97                     ; 23 }
 100  0006 5b06          	addw	sp,#6
 101  0008 81            	ret
 156                     ; 25 void read_all(void)
 156                     ; 26 {
 157                     	switch	.text
 158  0009               _read_all:
 160  0009 5207          	subw	sp,#7
 161       00000007      OFST:	set	7
 164                     ; 28     uint32_t addr = FLASH_DATA_START_PHYSICAL_ADDRESS;
 166  000b ae4000        	ldw	x,#16384
 167  000e 1f04          	ldw	(OFST-3,sp),x
 168  0010 ae0000        	ldw	x,#0
 169  0013 1f02          	ldw	(OFST-5,sp),x
 171                     ; 29     uint8_t *p = (uint8_t *)&eeprom;
 173  0015 ae0000        	ldw	x,#_eeprom
 174  0018 1f06          	ldw	(OFST-1,sp),x
 176                     ; 31     for (i=0; i < sizeof(eeprom); i++) {
 178  001a 0f01          	clr	(OFST-6,sp)
 180  001c               L56:
 181                     ; 32         *p = FLASH_ReadByte(addr);
 183  001c 1e04          	ldw	x,(OFST-3,sp)
 184  001e 89            	pushw	x
 185  001f 1e04          	ldw	x,(OFST-3,sp)
 186  0021 89            	pushw	x
 187  0022 cd0000        	call	_FLASH_ReadByte
 189  0025 5b04          	addw	sp,#4
 190  0027 1e06          	ldw	x,(OFST-1,sp)
 191  0029 f7            	ld	(x),a
 192                     ; 33         p++;
 194  002a 1e06          	ldw	x,(OFST-1,sp)
 195  002c 1c0001        	addw	x,#1
 196  002f 1f06          	ldw	(OFST-1,sp),x
 198                     ; 34         addr++;        
 200  0031 96            	ldw	x,sp
 201  0032 1c0002        	addw	x,#OFST-5
 202  0035 a601          	ld	a,#1
 203  0037 cd0000        	call	c_lgadc
 206                     ; 31     for (i=0; i < sizeof(eeprom); i++) {
 208  003a 0c01          	inc	(OFST-6,sp)
 212  003c 7b01          	ld	a,(OFST-6,sp)
 213  003e a10e          	cp	a,#14
 214  0040 25da          	jrult	L56
 215                     ; 36 }
 218  0042 5b07          	addw	sp,#7
 219  0044 81            	ret
 245                     ; 38 void flash_config(void)
 245                     ; 39 {
 246                     	switch	.text
 247  0045               _flash_config:
 251                     ; 40     FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
 253  0045 4f            	clr	a
 254  0046 cd0000        	call	_FLASH_SetProgrammingTime
 256                     ; 41     FLASH_Unlock(FLASH_MEMTYPE_DATA);
 258  0049 a6f7          	ld	a,#247
 259  004b cd0000        	call	_FLASH_Unlock
 262  004e               L501:
 263                     ; 43     while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
 265  004e a608          	ld	a,#8
 266  0050 cd0000        	call	_FLASH_GetFlagStatus
 268  0053 4d            	tnz	a
 269  0054 27f8          	jreq	L501
 270                     ; 44 }
 273  0056 81            	ret
 354                     	switch	.ubsct
 355  0000               _eeprom:
 356  0000 000000000000  	ds.b	14
 357                     	xdef	_eeprom
 358                     	xdef	_read_all
 359                     	xdef	_flash_config
 360                     	xdef	_init_eeprom
 361                     	xref	_FLASH_GetFlagStatus
 362                     	xref	_FLASH_SetProgrammingTime
 363                     	xref	_FLASH_ReadByte
 364                     	xref	_FLASH_Unlock
 384                     	xref	c_lgadc
 385                     	end
