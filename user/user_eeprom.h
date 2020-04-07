#ifndef __USER_EEPROM_H__
#define __USER_EEPROM_H__

#include "stm8s.h"

#define _MSB(a) (a >> 8)
#define _LSB(a) (a & 0xFF)

#define DEFAULT_INSPIRATORY_TIME  1000
#define DEFAULT_INSPIRATORY_PAUSE 0
#define DEFAULT_EXPIRATORY_TIME   1000
#define DEFAULT_EXPIRATORY_PAUSE  0
#define DEFAULT_PEAK_PRESSURE     500
#define DEFAULT_MAX_VOLUME        500
#define DEFAULT_MAX_POSITION      1000
#define DEFAULT_MIN_POSITION      50
#define DEFAULT_OPERATION_MODE    0x01

typedef struct
{
    uint16_t inspiratory_time;  /* 0-65535 ms */
    uint16_t inspiratory_pause; /* 0-65535 ms */
    uint16_t expiratory_time;   /* 0-65535 ms */
    uint16_t expiratory_pause;  /* 0-65535 ms */
    uint16_t peak_pressure;     /* 0-1023 adc */
    uint16_t max_volume;        /* 0-1023 adc */
    uint16_t max_position;      /* 0-1023 adc */
    uint16_t min_position;      /* 0-1023 adc */
    uint16_t operation_mode;    /* see application.h */
    uint8_t  checksum;
} EEPROM_DATA;

void init_eeprom(void);
void set_default(void);
void flash_config(void);
void read_eeprom(void);
void save_eeprom(void);
uint8_t calc_checksum(void);

#endif
