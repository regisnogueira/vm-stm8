#ifndef __USER_EEPROM_H__
#define __USER_EEPROM_H__

#include "stm8s.h"

typedef struct
{
    uint16_t inspiration_time; /* 0-65535 ms */
    uint16_t expiration_time;  /* 0-65535 ms */
    uint16_t peak_pressure;    /* 0-1023 adc */
    uint16_t max_volume;       /* 0-1023 adc */
    uint16_t max_position;     /* 0-1023 adc */
    uint16_t min_position;     /* 0-1023 adc */
    uint16_t operation_mode;   /* see application.h */
} EEPROM_DATA;

void init_eeprom(void);

#endif
