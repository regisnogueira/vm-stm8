#ifndef __USER_EEPROM_H__
#define __USER_EEPROM_H__

#include "stm8s.h"

#define EN_USER_EEPROM

#define _MSB(a) (a >> 8)
#define _LSB(a) (a & 0xFF)

#define DEFAULT_INSPIRATORY_TIME  1
#define DEFAULT_INSPIRATORY_PAUSE 2
#define DEFAULT_EXPIRATORY_TIME   3
#define DEFAULT_EXPIRATORY_PAUSE  4
#define DEFAULT_PEAK_PRESSURE     5
#define DEFAULT_MAX_VOLUME        6
#define DEFAULT_MAX_POSITION      7
#define DEFAULT_MIN_POSITION      8
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
uint16_t get_eeprom_data(uint8_t idx);
void set_eeprom_data(uint16_t value, uint8_t idx);
void set_default(void);
void flash_config(void);
void read_eeprom(void);
void save_eeprom(void);
uint8_t calc_checksum(void);

#endif
