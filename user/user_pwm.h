#ifndef __PWM_H__
#define __PWM_H__

#include "stm8s.h"

#define EN_USER_PWM

enum {
    PWM_CH1 = 0,
    PWM_CH2
};

void init_pwm(void);
void set_pwm(uint8_t channel, uint16_t val);

#endif
