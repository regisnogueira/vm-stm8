   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  49                     ; 5 void init_eeprom(void)
  49                     ; 6 {
  51                     	switch	.text
  52  0000               _init_eeprom:
  56                     ; 7     flash_config();
  58  0000 cd00ee        	call	_flash_config
  60                     ; 8     read_eeprom();
  62  0003 ad36          	call	_read_eeprom
  64                     ; 10     if (eeprom.checksum != calc_checksum()) {
  66  0005 cd00c6        	call	_calc_checksum
  68  0008 b112          	cp	a,_eeprom+18
  69  000a 2704          	jreq	L12
  70                     ; 11         set_default();
  72  000c ad03          	call	_set_default
  74                     ; 12         save_eeprom();
  76  000e ad70          	call	_save_eeprom
  78  0010               L12:
  79                     ; 14 }
  82  0010 81            	ret
 106                     ; 16 void set_default(void)
 106                     ; 17 {
 107                     	switch	.text
 108  0011               _set_default:
 112                     ; 18     eeprom.inspiratory_time = DEFAULT_INSPIRATORY_TIME;
 114  0011 ae03e8        	ldw	x,#1000
 115  0014 bf00          	ldw	_eeprom,x
 116                     ; 19     eeprom.inspiratory_pause = DEFAULT_INSPIRATORY_PAUSE;
 118  0016 5f            	clrw	x
 119  0017 bf02          	ldw	_eeprom+2,x
 120                     ; 20     eeprom.expiratory_time = DEFAULT_EXPIRATORY_TIME;
 122  0019 ae03e8        	ldw	x,#1000
 123  001c bf04          	ldw	_eeprom+4,x
 124                     ; 21     eeprom.expiratory_pause = DEFAULT_EXPIRATORY_PAUSE;
 126  001e 5f            	clrw	x
 127  001f bf06          	ldw	_eeprom+6,x
 128                     ; 22     eeprom.peak_pressure = DEFAULT_PEAK_PRESSURE;
 130  0021 ae01f4        	ldw	x,#500
 131  0024 bf08          	ldw	_eeprom+8,x
 132                     ; 23     eeprom.max_volume = DEFAULT_MAX_VOLUME;
 134  0026 ae01f4        	ldw	x,#500
 135  0029 bf0a          	ldw	_eeprom+10,x
 136                     ; 24     eeprom.max_position = DEFAULT_MAX_POSITION;
 138  002b ae03e8        	ldw	x,#1000
 139  002e bf0c          	ldw	_eeprom+12,x
 140                     ; 25     eeprom.min_position = DEFAULT_MIN_POSITION;
 142  0030 ae0032        	ldw	x,#50
 143  0033 bf0e          	ldw	_eeprom+14,x
 144                     ; 26     eeprom.operation_mode = DEFAULT_OPERATION_MODE;
 146  0035 ae0001        	ldw	x,#1
 147  0038 bf10          	ldw	_eeprom+16,x
 148                     ; 27 }
 151  003a 81            	ret
 206                     ; 29 void read_eeprom(void)
 206                     ; 30 {
 207                     	switch	.text
 208  003b               _read_eeprom:
 210  003b 5207          	subw	sp,#7
 211       00000007      OFST:	set	7
 214                     ; 32     uint8_t i = 0;
 216  003d 0f05          	clr	(OFST-2,sp)
 218                     ; 33     uint32_t addr = FLASH_DATA_START_PHYSICAL_ADDRESS;
 220  003f ae4000        	ldw	x,#16384
 221  0042 1f03          	ldw	(OFST-4,sp),x
 222  0044 ae0000        	ldw	x,#0
 223  0047 1f01          	ldw	(OFST-6,sp),x
 225                     ; 34     uint8_t *p = (uint8_t *)&eeprom;
 227  0049 ae0000        	ldw	x,#_eeprom
 228  004c 1f06          	ldw	(OFST-1,sp),x
 231  004e 2027          	jra	L56
 232  0050               L16:
 233                     ; 37         *p = FLASH_ReadByte(addr++);
 235  0050 96            	ldw	x,sp
 236  0051 1c0001        	addw	x,#OFST-6
 237  0054 cd0000        	call	c_ltor
 239  0057 96            	ldw	x,sp
 240  0058 1c0001        	addw	x,#OFST-6
 241  005b a601          	ld	a,#1
 242  005d cd0000        	call	c_lgadc
 245  0060 be02          	ldw	x,c_lreg+2
 246  0062 89            	pushw	x
 247  0063 be00          	ldw	x,c_lreg
 248  0065 89            	pushw	x
 249  0066 cd0000        	call	_FLASH_ReadByte
 251  0069 5b04          	addw	sp,#4
 252  006b 1e06          	ldw	x,(OFST-1,sp)
 253  006d f7            	ld	(x),a
 254                     ; 36     for (; i < sizeof(eeprom); i++, p++) {
 256  006e 0c05          	inc	(OFST-2,sp)
 258  0070 1e06          	ldw	x,(OFST-1,sp)
 259  0072 1c0001        	addw	x,#1
 260  0075 1f06          	ldw	(OFST-1,sp),x
 262  0077               L56:
 265  0077 7b05          	ld	a,(OFST-2,sp)
 266  0079 a113          	cp	a,#19
 267  007b 25d3          	jrult	L16
 268                     ; 40 }
 271  007d 5b07          	addw	sp,#7
 272  007f 81            	ret
 328                     ; 42 void save_eeprom(void)
 328                     ; 43 {
 329                     	switch	.text
 330  0080               _save_eeprom:
 332  0080 5207          	subw	sp,#7
 333       00000007      OFST:	set	7
 336                     ; 45     uint8_t i = 0;
 338  0082 0f07          	clr	(OFST+0,sp)
 340                     ; 46     uint32_t addr = FLASH_DATA_START_PHYSICAL_ADDRESS;
 342  0084 ae4000        	ldw	x,#16384
 343  0087 1f03          	ldw	(OFST-4,sp),x
 344  0089 ae0000        	ldw	x,#0
 345  008c 1f01          	ldw	(OFST-6,sp),x
 347                     ; 47     uint8_t *p = (uint8_t *)&eeprom;
 349  008e ae0000        	ldw	x,#_eeprom
 350  0091 1f05          	ldw	(OFST-2,sp),x
 352                     ; 49     eeprom.checksum = calc_checksum();
 354  0093 ad31          	call	_calc_checksum
 356  0095 b712          	ld	_eeprom+18,a
 358  0097 2024          	jra	L321
 359  0099               L711:
 360                     ; 51         FLASH_ProgramByte((addr + i), *p);
 362  0099 1e05          	ldw	x,(OFST-2,sp)
 363  009b f6            	ld	a,(x)
 364  009c 88            	push	a
 365  009d 96            	ldw	x,sp
 366  009e 1c0002        	addw	x,#OFST-5
 367  00a1 cd0000        	call	c_ltor
 369  00a4 7b08          	ld	a,(OFST+1,sp)
 370  00a6 cd0000        	call	c_ladc
 372  00a9 be02          	ldw	x,c_lreg+2
 373  00ab 89            	pushw	x
 374  00ac be00          	ldw	x,c_lreg
 375  00ae 89            	pushw	x
 376  00af cd0000        	call	_FLASH_ProgramByte
 378  00b2 5b05          	addw	sp,#5
 379                     ; 50     for (; i < sizeof(eeprom); i++, p++) {
 381  00b4 0c07          	inc	(OFST+0,sp)
 383  00b6 1e05          	ldw	x,(OFST-2,sp)
 384  00b8 1c0001        	addw	x,#1
 385  00bb 1f05          	ldw	(OFST-2,sp),x
 387  00bd               L321:
 390  00bd 7b07          	ld	a,(OFST+0,sp)
 391  00bf a113          	cp	a,#19
 392  00c1 25d6          	jrult	L711
 393                     ; 54 }
 396  00c3 5b07          	addw	sp,#7
 397  00c5 81            	ret
 451                     ; 56 uint8_t calc_checksum(void)
 451                     ; 57 {
 452                     	switch	.text
 453  00c6               _calc_checksum:
 455  00c6 5204          	subw	sp,#4
 456       00000004      OFST:	set	4
 459                     ; 58     uint8_t i = 0;
 461  00c8 0f02          	clr	(OFST-2,sp)
 463                     ; 59     uint8_t *p = (uint8_t *)&eeprom;
 465  00ca ae0000        	ldw	x,#_eeprom
 466  00cd 1f03          	ldw	(OFST-1,sp),x
 468                     ; 60     uint8_t checksum = 0;
 470  00cf 0f01          	clr	(OFST-3,sp)
 473  00d1 2010          	jra	L161
 474  00d3               L551:
 475                     ; 63         checksum ^= *p;
 477  00d3 1e03          	ldw	x,(OFST-1,sp)
 478  00d5 7b01          	ld	a,(OFST-3,sp)
 479  00d7 f8            	xor	a,(x)
 480  00d8 6b01          	ld	(OFST-3,sp),a
 482                     ; 62     for (; i < sizeof(eeprom); i++, p++) {
 484  00da 0c02          	inc	(OFST-2,sp)
 486  00dc 1e03          	ldw	x,(OFST-1,sp)
 487  00de 1c0001        	addw	x,#1
 488  00e1 1f03          	ldw	(OFST-1,sp),x
 490  00e3               L161:
 493  00e3 7b02          	ld	a,(OFST-2,sp)
 494  00e5 a113          	cp	a,#19
 495  00e7 25ea          	jrult	L551
 496                     ; 65     return checksum;
 498  00e9 7b01          	ld	a,(OFST-3,sp)
 501  00eb 5b04          	addw	sp,#4
 502  00ed 81            	ret
 528                     ; 68 void flash_config(void)
 528                     ; 69 {
 529                     	switch	.text
 530  00ee               _flash_config:
 534                     ; 70     FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
 536  00ee 4f            	clr	a
 537  00ef cd0000        	call	_FLASH_SetProgrammingTime
 539                     ; 71     FLASH_Unlock(FLASH_MEMTYPE_DATA);
 541  00f2 a6f7          	ld	a,#247
 542  00f4 cd0000        	call	_FLASH_Unlock
 545  00f7               L771:
 546                     ; 73     while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
 548  00f7 a608          	ld	a,#8
 549  00f9 cd0000        	call	_FLASH_GetFlagStatus
 551  00fc 4d            	tnz	a
 552  00fd 27f8          	jreq	L771
 553                     ; 74 }
 556  00ff 81            	ret
 658                     	switch	.ubsct
 659  0000               _eeprom:
 660  0000 000000000000  	ds.b	19
 661                     	xdef	_eeprom
 662                     	xdef	_calc_checksum
 663                     	xdef	_save_eeprom
 664                     	xdef	_read_eeprom
 665                     	xdef	_flash_config
 666                     	xdef	_set_default
 667                     	xdef	_init_eeprom
 668                     	xref	_FLASH_GetFlagStatus
 669                     	xref	_FLASH_SetProgrammingTime
 670                     	xref	_FLASH_ReadByte
 671                     	xref	_FLASH_ProgramByte
 672                     	xref	_FLASH_Unlock
 673                     	xref.b	c_lreg
 693                     	xref	c_ladc
 694                     	xref	c_lgadc
 695                     	xref	c_ltor
 696                     	end
