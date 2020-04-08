   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  53                     ; 5 void init_eeprom(void)
  53                     ; 6 {
  55                     	switch	.text
  56  0000               _init_eeprom:
  60                     ; 7     flash_config();
  62  0000 cd00d1        	call	_flash_config
  64                     ; 8     read_eeprom();
  66  0003 ad31          	call	_read_eeprom
  68                     ; 10     if (eeprom.checksum != calc_checksum()) {
  70  0005 cd00b1        	call	_calc_checksum
  72  0008 b112          	cp	a,_eeprom+18
  73  000a 2704          	jreq	L12
  74                     ; 11         set_default();
  76  000c ad03          	call	_set_default
  78                     ; 12         save_eeprom();
  80  000e ad5f          	call	_save_eeprom
  82  0010               L12:
  83                     ; 14 }
  86  0010 81            	ret	
 110                     ; 16 void set_default(void)
 110                     ; 17 {
 111                     	switch	.text
 112  0011               _set_default:
 116                     ; 18     eeprom.inspiratory_time  = DEFAULT_INSPIRATORY_TIME;
 118  0011 ae03e8        	ldw	x,#1000
 119  0014 bf00          	ldw	_eeprom,x
 120                     ; 19     eeprom.inspiratory_pause = DEFAULT_INSPIRATORY_PAUSE;
 122  0016 5f            	clrw	x
 123  0017 bf02          	ldw	_eeprom+2,x
 124                     ; 20     eeprom.expiratory_time   = DEFAULT_EXPIRATORY_TIME;
 126  0019 ae03e8        	ldw	x,#1000
 127  001c bf04          	ldw	_eeprom+4,x
 128                     ; 21     eeprom.expiratory_pause  = DEFAULT_EXPIRATORY_PAUSE;
 130  001e 5f            	clrw	x
 131  001f bf06          	ldw	_eeprom+6,x
 132                     ; 22     eeprom.peak_pressure     = DEFAULT_PEAK_PRESSURE;
 134  0021 ae01f4        	ldw	x,#500
 135  0024 bf08          	ldw	_eeprom+8,x
 136                     ; 23     eeprom.max_volume        = DEFAULT_MAX_VOLUME;
 138  0026 bf0a          	ldw	_eeprom+10,x
 139                     ; 24     eeprom.max_position      = DEFAULT_MAX_POSITION;
 141  0028 58            	sllw	x
 142  0029 bf0c          	ldw	_eeprom+12,x
 143                     ; 25     eeprom.min_position      = DEFAULT_MIN_POSITION;
 145  002b ae0032        	ldw	x,#50
 146  002e bf0e          	ldw	_eeprom+14,x
 147                     ; 26     eeprom.operation_mode    = DEFAULT_OPERATION_MODE;
 149  0030 ae0001        	ldw	x,#1
 150  0033 bf10          	ldw	_eeprom+16,x
 151                     ; 27 }
 154  0035 81            	ret	
 209                     ; 29 void read_eeprom(void)
 209                     ; 30 {
 210                     	switch	.text
 211  0036               _read_eeprom:
 213  0036 5207          	subw	sp,#7
 214       00000007      OFST:	set	7
 217                     ; 32     uint8_t i = 0;
 219  0038 0f05          	clr	(OFST-2,sp)
 221                     ; 33     uint32_t addr = FLASH_DATA_START_PHYSICAL_ADDRESS;
 223  003a ae4000        	ldw	x,#16384
 224  003d 1f03          	ldw	(OFST-4,sp),x
 225  003f 5f            	clrw	x
 226  0040 1f01          	ldw	(OFST-6,sp),x
 228                     ; 34     uint8_t *p = (uint8_t *)&eeprom;
 230  0042 ae0000        	ldw	x,#_eeprom
 232  0045 201d          	jra	L56
 233  0047               L16:
 234                     ; 37         *p = FLASH_ReadByte(addr++);
 236  0047 96            	ldw	x,sp
 237  0048 5c            	incw	x
 238  0049 cd0000        	call	c_ltor
 240  004c 96            	ldw	x,sp
 241  004d 5c            	incw	x
 242  004e a601          	ld	a,#1
 243  0050 cd0000        	call	c_lgadc
 246  0053 be02          	ldw	x,c_lreg+2
 247  0055 89            	pushw	x
 248  0056 be00          	ldw	x,c_lreg
 249  0058 89            	pushw	x
 250  0059 cd0000        	call	_FLASH_ReadByte
 252  005c 5b04          	addw	sp,#4
 253  005e 1e06          	ldw	x,(OFST-1,sp)
 254  0060 f7            	ld	(x),a
 255                     ; 36     for (; i < sizeof(eeprom); i++, p++) {
 258  0061 5c            	incw	x
 259  0062 0c05          	inc	(OFST-2,sp)
 260  0064               L56:
 261  0064 1f06          	ldw	(OFST-1,sp),x
 265  0066 7b05          	ld	a,(OFST-2,sp)
 266  0068 a113          	cp	a,#19
 267  006a 25db          	jrult	L16
 268                     ; 40 }
 271  006c 5b07          	addw	sp,#7
 272  006e 81            	ret	
 328                     ; 42 void save_eeprom(void)
 328                     ; 43 {
 329                     	switch	.text
 330  006f               _save_eeprom:
 332  006f 5207          	subw	sp,#7
 333       00000007      OFST:	set	7
 336                     ; 45     uint8_t i = 0;
 338  0071 0f07          	clr	(OFST+0,sp)
 340                     ; 46     uint32_t addr = FLASH_DATA_START_PHYSICAL_ADDRESS;
 342  0073 ae4000        	ldw	x,#16384
 343  0076 1f03          	ldw	(OFST-4,sp),x
 344  0078 5f            	clrw	x
 345  0079 1f01          	ldw	(OFST-6,sp),x
 347                     ; 47     uint8_t *p = (uint8_t *)&eeprom;
 349  007b ae0000        	ldw	x,#_eeprom
 350  007e 1f05          	ldw	(OFST-2,sp),x
 352                     ; 49     eeprom.checksum = calc_checksum();
 354  0080 ad2f          	call	_calc_checksum
 356  0082 b712          	ld	_eeprom+18,a
 358  0084 2022          	jra	L321
 359  0086               L711:
 360                     ; 51         FLASH_ProgramByte((addr + i), *p);
 362  0086 1e05          	ldw	x,(OFST-2,sp)
 363  0088 f6            	ld	a,(x)
 364  0089 88            	push	a
 365  008a 96            	ldw	x,sp
 366  008b 1c0002        	addw	x,#OFST-5
 367  008e cd0000        	call	c_ltor
 369  0091 7b08          	ld	a,(OFST+1,sp)
 370  0093 cd0000        	call	c_ladc
 372  0096 be02          	ldw	x,c_lreg+2
 373  0098 89            	pushw	x
 374  0099 be00          	ldw	x,c_lreg
 375  009b 89            	pushw	x
 376  009c cd0000        	call	_FLASH_ProgramByte
 378  009f 5b05          	addw	sp,#5
 379                     ; 50     for (; i < sizeof(eeprom); i++, p++) {
 381  00a1 0c07          	inc	(OFST+0,sp)
 383  00a3 1e05          	ldw	x,(OFST-2,sp)
 384  00a5 5c            	incw	x
 385  00a6 1f05          	ldw	(OFST-2,sp),x
 387  00a8               L321:
 390  00a8 7b07          	ld	a,(OFST+0,sp)
 391  00aa a113          	cp	a,#19
 392  00ac 25d8          	jrult	L711
 393                     ; 54 }
 396  00ae 5b07          	addw	sp,#7
 397  00b0 81            	ret	
 451                     ; 56 uint8_t calc_checksum(void)
 451                     ; 57 {
 452                     	switch	.text
 453  00b1               _calc_checksum:
 455  00b1 5204          	subw	sp,#4
 456       00000004      OFST:	set	4
 459                     ; 59     uint8_t i = 0;
 461  00b3 0f02          	clr	(OFST-2,sp)
 463                     ; 60     uint8_t *p = (uint8_t *)&eeprom;
 465  00b5 ae0000        	ldw	x,#_eeprom
 466  00b8 1f03          	ldw	(OFST-1,sp),x
 468                     ; 61     uint8_t checksum = 0;
 470  00ba 0f01          	clr	(OFST-3,sp)
 473  00bc 2008          	jra	L161
 474  00be               L551:
 475                     ; 64         checksum ^= *p;
 477  00be f8            	xor	a,(x)
 478  00bf 6b01          	ld	(OFST-3,sp),a
 480                     ; 63     for (; i < sizeof(eeprom); i++, p++) {
 483  00c1 5c            	incw	x
 484  00c2 0c02          	inc	(OFST-2,sp)
 485  00c4 1f03          	ldw	(OFST-1,sp),x
 487  00c6               L161:
 490  00c6 7b02          	ld	a,(OFST-2,sp)
 491  00c8 a113          	cp	a,#19
 492  00ca 7b01          	ld	a,(OFST-3,sp)
 493  00cc 25f0          	jrult	L551
 494                     ; 66     return checksum;
 498  00ce 5b04          	addw	sp,#4
 499  00d0 81            	ret	
 525                     ; 72 void flash_config(void)
 525                     ; 73 {
 526                     	switch	.text
 527  00d1               _flash_config:
 531                     ; 75     FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
 533  00d1 4f            	clr	a
 534  00d2 cd0000        	call	_FLASH_SetProgrammingTime
 536                     ; 76     FLASH_Unlock(FLASH_MEMTYPE_DATA);
 538  00d5 a6f7          	ld	a,#247
 539  00d7 cd0000        	call	_FLASH_Unlock
 542  00da               L771:
 543                     ; 77     while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
 545  00da a608          	ld	a,#8
 546  00dc cd0000        	call	_FLASH_GetFlagStatus
 548  00df 4d            	tnz	a
 549  00e0 27f8          	jreq	L771
 550                     ; 79 }
 553  00e2 81            	ret	
 655                     	switch	.ubsct
 656  0000               _eeprom:
 657  0000 000000000000  	ds.b	19
 658                     	xdef	_eeprom
 659                     	xdef	_calc_checksum
 660                     	xdef	_save_eeprom
 661                     	xdef	_read_eeprom
 662                     	xdef	_flash_config
 663                     	xdef	_set_default
 664                     	xdef	_init_eeprom
 665                     	xref	_FLASH_GetFlagStatus
 666                     	xref	_FLASH_SetProgrammingTime
 667                     	xref	_FLASH_ReadByte
 668                     	xref	_FLASH_ProgramByte
 669                     	xref	_FLASH_Unlock
 670                     	xref.b	c_lreg
 690                     	xref	c_ladc
 691                     	xref	c_lgadc
 692                     	xref	c_ltor
 693                     	end
