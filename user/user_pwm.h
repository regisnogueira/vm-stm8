#ifndef __PWM_H__
#define __PWM_H__

#include "stm8s.h"

//#define EN_USER_PWM

#define MAX_PWM 30000

void init_pwm(uint16_t period);
void set_pwm(uint16_t val);

#endif
