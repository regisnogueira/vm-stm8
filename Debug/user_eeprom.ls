   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  48                     ; 5 void init_eeprom(void)
  48                     ; 6 {
  50                     	switch	.text
  51  0000               _init_eeprom:
  55                     ; 7     flash_config();
  57  0000 cd00ee        	call	_flash_config
  59                     ; 8     read_eeprom();
  61  0003 ad36          	call	_read_eeprom
  63                     ; 10     if (eeprom.checksum != calc_checksum()) {
  65  0005 cd00c6        	call	_calc_checksum
  67  0008 b112          	cp	a,_eeprom+18
  68  000a 2704          	jreq	L12
  69                     ; 11         set_default();
  71  000c ad03          	call	_set_default
  73                     ; 12         save_eeprom();
  75  000e ad70          	call	_save_eeprom
  77  0010               L12:
  78                     ; 14 }
  81  0010 81            	ret
 105                     ; 16 void set_default(void)
 105                     ; 17 {
 106                     	switch	.text
 107  0011               _set_default:
 111                     ; 18     eeprom.inspiratory_time  = DEFAULT_INSPIRATORY_TIME;
 113  0011 ae03e8        	ldw	x,#1000
 114  0014 bf00          	ldw	_eeprom,x
 115                     ; 19     eeprom.inspiratory_pause = DEFAULT_INSPIRATORY_PAUSE;
 117  0016 5f            	clrw	x
 118  0017 bf02          	ldw	_eeprom+2,x
 119                     ; 20     eeprom.expiratory_time   = DEFAULT_EXPIRATORY_TIME;
 121  0019 ae03e8        	ldw	x,#1000
 122  001c bf04          	ldw	_eeprom+4,x
 123                     ; 21     eeprom.expiratory_pause  = DEFAULT_EXPIRATORY_PAUSE;
 125  001e 5f            	clrw	x
 126  001f bf06          	ldw	_eeprom+6,x
 127                     ; 22     eeprom.peak_pressure     = DEFAULT_PEAK_PRESSURE;
 129  0021 ae01f4        	ldw	x,#500
 130  0024 bf08          	ldw	_eeprom+8,x
 131                     ; 23     eeprom.max_volume        = DEFAULT_MAX_VOLUME;
 133  0026 ae01f4        	ldw	x,#500
 134  0029 bf0a          	ldw	_eeprom+10,x
 135                     ; 24     eeprom.max_position      = DEFAULT_MAX_POSITION;
 137  002b ae03e8        	ldw	x,#1000
 138  002e bf0c          	ldw	_eeprom+12,x
 139                     ; 25     eeprom.min_position      = DEFAULT_MIN_POSITION;
 141  0030 ae0032        	ldw	x,#50
 142  0033 bf0e          	ldw	_eeprom+14,x
 143                     ; 26     eeprom.operation_mode    = DEFAULT_OPERATION_MODE;
 145  0035 ae0001        	ldw	x,#1
 146  0038 bf10          	ldw	_eeprom+16,x
 147                     ; 27 }
 150  003a 81            	ret
 205                     ; 29 void read_eeprom(void)
 205                     ; 30 {
 206                     	switch	.text
 207  003b               _read_eeprom:
 209  003b 5207          	subw	sp,#7
 210       00000007      OFST:	set	7
 213                     ; 32     uint8_t i = 0;
 215  003d 0f05          	clr	(OFST-2,sp)
 217                     ; 33     uint32_t addr = FLASH_DATA_START_PHYSICAL_ADDRESS;
 219  003f ae4000        	ldw	x,#16384
 220  0042 1f03          	ldw	(OFST-4,sp),x
 221  0044 ae0000        	ldw	x,#0
 222  0047 1f01          	ldw	(OFST-6,sp),x
 224                     ; 34     uint8_t *p = (uint8_t *)&eeprom;
 226  0049 ae0000        	ldw	x,#_eeprom
 227  004c 1f06          	ldw	(OFST-1,sp),x
 230  004e 2027          	jra	L56
 231  0050               L16:
 232                     ; 37         *p = FLASH_ReadByte(addr++);
 234  0050 96            	ldw	x,sp
 235  0051 1c0001        	addw	x,#OFST-6
 236  0054 cd0000        	call	c_ltor
 238  0057 96            	ldw	x,sp
 239  0058 1c0001        	addw	x,#OFST-6
 240  005b a601          	ld	a,#1
 241  005d cd0000        	call	c_lgadc
 244  0060 be02          	ldw	x,c_lreg+2
 245  0062 89            	pushw	x
 246  0063 be00          	ldw	x,c_lreg
 247  0065 89            	pushw	x
 248  0066 cd0000        	call	_FLASH_ReadByte
 250  0069 5b04          	addw	sp,#4
 251  006b 1e06          	ldw	x,(OFST-1,sp)
 252  006d f7            	ld	(x),a
 253                     ; 36     for (; i < sizeof(eeprom); i++, p++) {
 255  006e 0c05          	inc	(OFST-2,sp)
 257  0070 1e06          	ldw	x,(OFST-1,sp)
 258  0072 1c0001        	addw	x,#1
 259  0075 1f06          	ldw	(OFST-1,sp),x
 261  0077               L56:
 264  0077 7b05          	ld	a,(OFST-2,sp)
 265  0079 a113          	cp	a,#19
 266  007b 25d3          	jrult	L16
 267                     ; 40 }
 270  007d 5b07          	addw	sp,#7
 271  007f 81            	ret
 327                     ; 42 void save_eeprom(void)
 327                     ; 43 {
 328                     	switch	.text
 329  0080               _save_eeprom:
 331  0080 5207          	subw	sp,#7
 332       00000007      OFST:	set	7
 335                     ; 45     uint8_t i = 0;
 337  0082 0f07          	clr	(OFST+0,sp)
 339                     ; 46     uint32_t addr = FLASH_DATA_START_PHYSICAL_ADDRESS;
 341  0084 ae4000        	ldw	x,#16384
 342  0087 1f03          	ldw	(OFST-4,sp),x
 343  0089 ae0000        	ldw	x,#0
 344  008c 1f01          	ldw	(OFST-6,sp),x
 346                     ; 47     uint8_t *p = (uint8_t *)&eeprom;
 348  008e ae0000        	ldw	x,#_eeprom
 349  0091 1f05          	ldw	(OFST-2,sp),x
 351                     ; 49     eeprom.checksum = calc_checksum();
 353  0093 ad31          	call	_calc_checksum
 355  0095 b712          	ld	_eeprom+18,a
 357  0097 2024          	jra	L321
 358  0099               L711:
 359                     ; 51         FLASH_ProgramByte((addr + i), *p);
 361  0099 1e05          	ldw	x,(OFST-2,sp)
 362  009b f6            	ld	a,(x)
 363  009c 88            	push	a
 364  009d 96            	ldw	x,sp
 365  009e 1c0002        	addw	x,#OFST-5
 366  00a1 cd0000        	call	c_ltor
 368  00a4 7b08          	ld	a,(OFST+1,sp)
 369  00a6 cd0000        	call	c_ladc
 371  00a9 be02          	ldw	x,c_lreg+2
 372  00ab 89            	pushw	x
 373  00ac be00          	ldw	x,c_lreg
 374  00ae 89            	pushw	x
 375  00af cd0000        	call	_FLASH_ProgramByte
 377  00b2 5b05          	addw	sp,#5
 378                     ; 50     for (; i < sizeof(eeprom); i++, p++) {
 380  00b4 0c07          	inc	(OFST+0,sp)
 382  00b6 1e05          	ldw	x,(OFST-2,sp)
 383  00b8 1c0001        	addw	x,#1
 384  00bb 1f05          	ldw	(OFST-2,sp),x
 386  00bd               L321:
 389  00bd 7b07          	ld	a,(OFST+0,sp)
 390  00bf a113          	cp	a,#19
 391  00c1 25d6          	jrult	L711
 392                     ; 54 }
 395  00c3 5b07          	addw	sp,#7
 396  00c5 81            	ret
 450                     ; 56 uint8_t calc_checksum(void)
 450                     ; 57 {
 451                     	switch	.text
 452  00c6               _calc_checksum:
 454  00c6 5204          	subw	sp,#4
 455       00000004      OFST:	set	4
 458                     ; 59     uint8_t i = 0;
 460  00c8 0f02          	clr	(OFST-2,sp)
 462                     ; 60     uint8_t *p = (uint8_t *)&eeprom;
 464  00ca ae0000        	ldw	x,#_eeprom
 465  00cd 1f03          	ldw	(OFST-1,sp),x
 467                     ; 61     uint8_t checksum = 0;
 469  00cf 0f01          	clr	(OFST-3,sp)
 472  00d1 2010          	jra	L161
 473  00d3               L551:
 474                     ; 64         checksum ^= *p;
 476  00d3 1e03          	ldw	x,(OFST-1,sp)
 477  00d5 7b01          	ld	a,(OFST-3,sp)
 478  00d7 f8            	xor	a,(x)
 479  00d8 6b01          	ld	(OFST-3,sp),a
 481                     ; 63     for (; i < sizeof(eeprom); i++, p++) {
 483  00da 0c02          	inc	(OFST-2,sp)
 485  00dc 1e03          	ldw	x,(OFST-1,sp)
 486  00de 1c0001        	addw	x,#1
 487  00e1 1f03          	ldw	(OFST-1,sp),x
 489  00e3               L161:
 492  00e3 7b02          	ld	a,(OFST-2,sp)
 493  00e5 a113          	cp	a,#19
 494  00e7 25ea          	jrult	L551
 495                     ; 66     return checksum;
 497  00e9 7b01          	ld	a,(OFST-3,sp)
 500  00eb 5b04          	addw	sp,#4
 501  00ed 81            	ret
 527                     ; 72 void flash_config(void)
 527                     ; 73 {
 528                     	switch	.text
 529  00ee               _flash_config:
 533                     ; 75     FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
 535  00ee 4f            	clr	a
 536  00ef cd0000        	call	_FLASH_SetProgrammingTime
 538                     ; 76     FLASH_Unlock(FLASH_MEMTYPE_DATA);
 540  00f2 a6f7          	ld	a,#247
 541  00f4 cd0000        	call	_FLASH_Unlock
 544  00f7               L771:
 545                     ; 77     while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
 547  00f7 a608          	ld	a,#8
 548  00f9 cd0000        	call	_FLASH_GetFlagStatus
 550  00fc 4d            	tnz	a
 551  00fd 27f8          	jreq	L771
 552                     ; 79 }
 555  00ff 81            	ret
 657                     	switch	.ubsct
 658  0000               _eeprom:
 659  0000 000000000000  	ds.b	19
 660                     	xdef	_eeprom
 661                     	xdef	_calc_checksum
 662                     	xdef	_save_eeprom
 663                     	xdef	_read_eeprom
 664                     	xdef	_flash_config
 665                     	xdef	_set_default
 666                     	xdef	_init_eeprom
 667                     	xref	_FLASH_GetFlagStatus
 668                     	xref	_FLASH_SetProgrammingTime
 669                     	xref	_FLASH_ReadByte
 670                     	xref	_FLASH_ProgramByte
 671                     	xref	_FLASH_Unlock
 672                     	xref.b	c_lreg
 692                     	xref	c_ladc
 693                     	xref	c_lgadc
 694                     	xref	c_ltor
 695                     	end
