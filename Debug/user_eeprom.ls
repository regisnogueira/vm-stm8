   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  48                     ; 5 void init_eeprom(void)
  48                     ; 6 {
  50                     	switch	.text
  51  0000               _init_eeprom:
  55                     ; 7     flash_config();
  57  0000 cd010e        	call	_flash_config
  59                     ; 8     read_eeprom();
  61  0003 ad56          	call	_read_eeprom
  63                     ; 10     if (eeprom.checksum != calc_checksum()) {
  65  0005 cd00e6        	call	_calc_checksum
  67  0008 b112          	cp	a,_eeprom+18
  68  000a 2705          	jreq	L12
  69                     ; 11         set_default();
  71  000c ad1f          	call	_set_default
  73                     ; 12         save_eeprom();
  75  000e cd00a0        	call	_save_eeprom
  77  0011               L12:
  78                     ; 14 }
  81  0011 81            	ret
 126                     ; 16 uint16_t get_eeprom_data(uint8_t idx)
 126                     ; 17 {
 127                     	switch	.text
 128  0012               _get_eeprom_data:
 130  0012 89            	pushw	x
 131       00000002      OFST:	set	2
 134                     ; 18     uint16_t *p = (uint16_t *)&eeprom;
 136                     ; 20     return *(p + idx);
 138  0013 5f            	clrw	x
 139  0014 97            	ld	xl,a
 140  0015 58            	sllw	x
 141  0016 ee00          	ldw	x,(_eeprom,x)
 144  0018 5b02          	addw	sp,#2
 145  001a 81            	ret
 200                     ; 23 void set_eeprom_data(uint16_t value, uint8_t idx)
 200                     ; 24 {
 201                     	switch	.text
 202  001b               _set_eeprom_data:
 204  001b 89            	pushw	x
 205  001c 89            	pushw	x
 206       00000002      OFST:	set	2
 209                     ; 25     uint16_t *p = (uint16_t *)&eeprom;
 211                     ; 26     *(p + idx) = value;
 213  001d 7b07          	ld	a,(OFST+5,sp)
 214  001f 905f          	clrw	y
 215  0021 9097          	ld	yl,a
 216  0023 9058          	sllw	y
 217  0025 90ef00        	ldw	(_eeprom,y),x
 218                     ; 27     save_eeprom();
 220  0028 ad76          	call	_save_eeprom
 222                     ; 28 }
 225  002a 5b04          	addw	sp,#4
 226  002c 81            	ret
 250                     ; 30 void set_default(void)
 250                     ; 31 {
 251                     	switch	.text
 252  002d               _set_default:
 256                     ; 32     eeprom.inspiratory_time  = DEFAULT_INSPIRATORY_TIME;
 258  002d ae0001        	ldw	x,#1
 259  0030 bf00          	ldw	_eeprom,x
 260                     ; 33     eeprom.inspiratory_pause = DEFAULT_INSPIRATORY_PAUSE;
 262  0032 ae0002        	ldw	x,#2
 263  0035 bf02          	ldw	_eeprom+2,x
 264                     ; 34     eeprom.expiratory_time   = DEFAULT_EXPIRATORY_TIME;
 266  0037 ae0003        	ldw	x,#3
 267  003a bf04          	ldw	_eeprom+4,x
 268                     ; 35     eeprom.expiratory_pause  = DEFAULT_EXPIRATORY_PAUSE;
 270  003c ae0004        	ldw	x,#4
 271  003f bf06          	ldw	_eeprom+6,x
 272                     ; 36     eeprom.peak_pressure     = DEFAULT_PEAK_PRESSURE;
 274  0041 ae0005        	ldw	x,#5
 275  0044 bf08          	ldw	_eeprom+8,x
 276                     ; 37     eeprom.max_volume        = DEFAULT_MAX_VOLUME;
 278  0046 ae0006        	ldw	x,#6
 279  0049 bf0a          	ldw	_eeprom+10,x
 280                     ; 38     eeprom.max_position      = DEFAULT_MAX_POSITION;
 282  004b ae0007        	ldw	x,#7
 283  004e bf0c          	ldw	_eeprom+12,x
 284                     ; 39     eeprom.min_position      = DEFAULT_MIN_POSITION;
 286  0050 ae0008        	ldw	x,#8
 287  0053 bf0e          	ldw	_eeprom+14,x
 288                     ; 40     eeprom.operation_mode    = DEFAULT_OPERATION_MODE;
 290  0055 ae0001        	ldw	x,#1
 291  0058 bf10          	ldw	_eeprom+16,x
 292                     ; 41 }
 295  005a 81            	ret
 350                     ; 43 void read_eeprom(void)
 350                     ; 44 {
 351                     	switch	.text
 352  005b               _read_eeprom:
 354  005b 5207          	subw	sp,#7
 355       00000007      OFST:	set	7
 358                     ; 46     uint8_t i = 0;
 360  005d 0f05          	clr	(OFST-2,sp)
 362                     ; 47     uint32_t addr = FLASH_DATA_START_PHYSICAL_ADDRESS;
 364  005f ae4000        	ldw	x,#16384
 365  0062 1f03          	ldw	(OFST-4,sp),x
 366  0064 ae0000        	ldw	x,#0
 367  0067 1f01          	ldw	(OFST-6,sp),x
 369                     ; 48     uint8_t *p = (uint8_t *)&eeprom;
 371  0069 ae0000        	ldw	x,#_eeprom
 372  006c 1f06          	ldw	(OFST-1,sp),x
 375  006e 2027          	jra	L531
 376  0070               L131:
 377                     ; 51         *p = FLASH_ReadByte(addr++);
 379  0070 96            	ldw	x,sp
 380  0071 1c0001        	addw	x,#OFST-6
 381  0074 cd0000        	call	c_ltor
 383  0077 96            	ldw	x,sp
 384  0078 1c0001        	addw	x,#OFST-6
 385  007b a601          	ld	a,#1
 386  007d cd0000        	call	c_lgadc
 389  0080 be02          	ldw	x,c_lreg+2
 390  0082 89            	pushw	x
 391  0083 be00          	ldw	x,c_lreg
 392  0085 89            	pushw	x
 393  0086 cd0000        	call	_FLASH_ReadByte
 395  0089 5b04          	addw	sp,#4
 396  008b 1e06          	ldw	x,(OFST-1,sp)
 397  008d f7            	ld	(x),a
 398                     ; 50     for (; i < sizeof(eeprom); i++, p++) {
 400  008e 0c05          	inc	(OFST-2,sp)
 402  0090 1e06          	ldw	x,(OFST-1,sp)
 403  0092 1c0001        	addw	x,#1
 404  0095 1f06          	ldw	(OFST-1,sp),x
 406  0097               L531:
 409  0097 7b05          	ld	a,(OFST-2,sp)
 410  0099 a113          	cp	a,#19
 411  009b 25d3          	jrult	L131
 412                     ; 54 }
 415  009d 5b07          	addw	sp,#7
 416  009f 81            	ret
 472                     ; 56 void save_eeprom(void)
 472                     ; 57 {
 473                     	switch	.text
 474  00a0               _save_eeprom:
 476  00a0 5207          	subw	sp,#7
 477       00000007      OFST:	set	7
 480                     ; 59     uint8_t i = 0;
 482  00a2 0f07          	clr	(OFST+0,sp)
 484                     ; 60     uint32_t addr = FLASH_DATA_START_PHYSICAL_ADDRESS;
 486  00a4 ae4000        	ldw	x,#16384
 487  00a7 1f03          	ldw	(OFST-4,sp),x
 488  00a9 ae0000        	ldw	x,#0
 489  00ac 1f01          	ldw	(OFST-6,sp),x
 491                     ; 61     uint8_t *p = (uint8_t *)&eeprom;
 493  00ae ae0000        	ldw	x,#_eeprom
 494  00b1 1f05          	ldw	(OFST-2,sp),x
 496                     ; 63     eeprom.checksum = calc_checksum();
 498  00b3 ad31          	call	_calc_checksum
 500  00b5 b712          	ld	_eeprom+18,a
 502  00b7 2024          	jra	L371
 503  00b9               L761:
 504                     ; 65         FLASH_ProgramByte((addr + i), *p);
 506  00b9 1e05          	ldw	x,(OFST-2,sp)
 507  00bb f6            	ld	a,(x)
 508  00bc 88            	push	a
 509  00bd 96            	ldw	x,sp
 510  00be 1c0002        	addw	x,#OFST-5
 511  00c1 cd0000        	call	c_ltor
 513  00c4 7b08          	ld	a,(OFST+1,sp)
 514  00c6 cd0000        	call	c_ladc
 516  00c9 be02          	ldw	x,c_lreg+2
 517  00cb 89            	pushw	x
 518  00cc be00          	ldw	x,c_lreg
 519  00ce 89            	pushw	x
 520  00cf cd0000        	call	_FLASH_ProgramByte
 522  00d2 5b05          	addw	sp,#5
 523                     ; 64     for (; i < sizeof(eeprom); i++, p++) {
 525  00d4 0c07          	inc	(OFST+0,sp)
 527  00d6 1e05          	ldw	x,(OFST-2,sp)
 528  00d8 1c0001        	addw	x,#1
 529  00db 1f05          	ldw	(OFST-2,sp),x
 531  00dd               L371:
 534  00dd 7b07          	ld	a,(OFST+0,sp)
 535  00df a113          	cp	a,#19
 536  00e1 25d6          	jrult	L761
 537                     ; 68 }
 540  00e3 5b07          	addw	sp,#7
 541  00e5 81            	ret
 595                     ; 70 uint8_t calc_checksum(void)
 595                     ; 71 {
 596                     	switch	.text
 597  00e6               _calc_checksum:
 599  00e6 5204          	subw	sp,#4
 600       00000004      OFST:	set	4
 603                     ; 73     uint8_t i = 0;
 605  00e8 0f02          	clr	(OFST-2,sp)
 607                     ; 74     uint8_t *p = (uint8_t *)&eeprom;
 609  00ea ae0000        	ldw	x,#_eeprom
 610  00ed 1f03          	ldw	(OFST-1,sp),x
 612                     ; 75     uint8_t checksum = 0;
 614  00ef 0f01          	clr	(OFST-3,sp)
 617  00f1 2010          	jra	L132
 618  00f3               L522:
 619                     ; 78         checksum ^= *p;
 621  00f3 1e03          	ldw	x,(OFST-1,sp)
 622  00f5 7b01          	ld	a,(OFST-3,sp)
 623  00f7 f8            	xor	a,(x)
 624  00f8 6b01          	ld	(OFST-3,sp),a
 626                     ; 77     for (; i < sizeof(eeprom); i++, p++) {
 628  00fa 0c02          	inc	(OFST-2,sp)
 630  00fc 1e03          	ldw	x,(OFST-1,sp)
 631  00fe 1c0001        	addw	x,#1
 632  0101 1f03          	ldw	(OFST-1,sp),x
 634  0103               L132:
 637  0103 7b02          	ld	a,(OFST-2,sp)
 638  0105 a113          	cp	a,#19
 639  0107 25ea          	jrult	L522
 640                     ; 80     return checksum;
 642  0109 7b01          	ld	a,(OFST-3,sp)
 645  010b 5b04          	addw	sp,#4
 646  010d 81            	ret
 672                     ; 86 void flash_config(void)
 672                     ; 87 {
 673                     	switch	.text
 674  010e               _flash_config:
 678                     ; 89     FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
 680  010e 4f            	clr	a
 681  010f cd0000        	call	_FLASH_SetProgrammingTime
 683                     ; 90     FLASH_Unlock(FLASH_MEMTYPE_DATA);
 685  0112 a6f7          	ld	a,#247
 686  0114 cd0000        	call	_FLASH_Unlock
 689  0117               L742:
 690                     ; 91     while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
 692  0117 a608          	ld	a,#8
 693  0119 cd0000        	call	_FLASH_GetFlagStatus
 695  011c 4d            	tnz	a
 696  011d 27f8          	jreq	L742
 697                     ; 93 }
 700  011f 81            	ret
 802                     	switch	.ubsct
 803  0000               _eeprom:
 804  0000 000000000000  	ds.b	19
 805                     	xdef	_eeprom
 806                     	xdef	_calc_checksum
 807                     	xdef	_save_eeprom
 808                     	xdef	_read_eeprom
 809                     	xdef	_flash_config
 810                     	xdef	_set_default
 811                     	xdef	_set_eeprom_data
 812                     	xdef	_get_eeprom_data
 813                     	xdef	_init_eeprom
 814                     	xref	_FLASH_GetFlagStatus
 815                     	xref	_FLASH_SetProgrammingTime
 816                     	xref	_FLASH_ReadByte
 817                     	xref	_FLASH_ProgramByte
 818                     	xref	_FLASH_Unlock
 819                     	xref.b	c_lreg
 839                     	xref	c_ladc
 840                     	xref	c_lgadc
 841                     	xref	c_ltor
 842                     	end
