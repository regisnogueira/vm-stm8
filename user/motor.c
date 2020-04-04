#include "motor.h"

extern uint16_t adc_val;

#define MAX_ADC 1010
#define MIN_ADC 10

void init_motor(void)
{
    motor_relay_dir();
    init_pwm();
    set_pwm(55000);    
}

void task_motor(void)
{
    uint16_t pwm = 0;
    
    pwm = adc_val;

    if (adc_val > MAX_ADC)
        pwm = 1000;
    
    if (adc_val < MIN_ADC)
        pwm = 0;

    set_pwm(pwm*30);
}
