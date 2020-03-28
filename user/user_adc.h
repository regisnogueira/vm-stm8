#ifndef __USER_ADC_H__
#define __USER_ADC_H__

#include "stm8s.h"

//#define EN_USER_ADC

void init_adc(void);
uint16_t read_adc(void);

#endif
