#ifndef __SENSOR_PRESSURE_H__
#define __SENSOR_PRESSURE_H__

#include "stm8s.h"

/* 1 cmH2O = 0.735559 mmHg */

typedef struct
{
    uint16_t raw;
    uint16_t max;
    uint16_t min;
    uint16_t peak;
} PRESSURE;

void init_pressure_sensor(void);
void test_pressure_sensor(void);
void tmr_pressure_sensor(void);

#endif
