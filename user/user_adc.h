#ifndef __USER_ADC_H__
#define __USER_ADC_H__

#include "stm8s.h"

//#define EN_USER_ADC

#define LEN_ADC_CHANNEL 2

void init_adc(void);
void read_adc(void);

#endif
