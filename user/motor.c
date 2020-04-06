#include "motor.h"

/* user_adc.c */
extern uint16_t adc_val;
/* user_timer.c */
extern uint8_t tick;

#define MAX_ADC 1010
#define MIN_ADC 10

MOTOR motor;

void init_motor(void)
{
    motor_relay_dir();
    init_pwm(PWM_PERIOD);
    motor.speed = 0;
}

void stop_motor(void)
{

}

void inc_speed(uint8_t value)
{
    motor.speed += value;
    if (motor.speed > PWM_PERIOD)
        motor.speed = PWM_PERIOD;
}

void dec_speed(uint8_t value)
{
    if (motor.speed >= value)
        motor.speed -= value;
    else
        motor.speed = 0;
}

void set_position(void) 
{
    motor.position = adc_val;
}

void tmr_motor(void) 
{
    if (motor.flags & INVERT_ROTATION) {
        motor.timer--;
        if (!motor.timer) {
            motor_invert();
            motor.flags &= ~INVERT_ROTATION;
        }
    }
}

void task_motor(void)
{
    motor.position = adc_val;

    if (((motor.position > motor.max_pos) || 
         (motor.position < motor.min_pos)) &&
        !(motor.flags & INVERT_ROTATION)) {
        motor.flags |= INVERT_ROTATION;
        motor.timer = INVERT_MOTOR_TIME;
        motor.speed = 0;
        set_pwm(motor.speed);
    }

    if (!tick)
        return;

    set_pwm(motor.speed);
}
