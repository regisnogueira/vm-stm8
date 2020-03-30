#include "motor.h"

extern uint16_t adc_val;

void init_motor(void)
{
    init_pwm();
}

void task_motor(void)
{
    set_pwm(PWM_CH1, adc_val);
    set_pwm(PWM_CH2, adc_val);
}
