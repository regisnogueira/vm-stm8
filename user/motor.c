#include "motor.h"
#include "user_eeprom.h"

/* user_adc.c */
extern uint16_t adc_val;
/* user_timer.c */
extern uint8_t tick;
/* user_eeprom.c */
extern EEPROM_DATA eeprom;

MOTOR motor;

void init_motor(void)
{
    motor_relay_dir();

    motor.max_pos = eeprom.max_position;
    motor.max_pos = eeprom.min_position;
    motor.speed = 0;

    init_pwm(PWM_PERIOD);
    set_pwm(motor.speed);
}

void speed_up(uint8_t value)
{
    motor.speed += value;
    if (motor.speed > PWM_PERIOD)
        motor.speed = PWM_PERIOD;
}

void speed_down(uint8_t value)
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
    /* damos um delay antes de inverter a rotacao do motor */
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

    /* checamos os limites de posicao do motor para inverter a rotacao 
       - antes de inverter devemos parar e aguardar um tempo */
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
