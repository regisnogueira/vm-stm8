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
#ifdef EN_MOTOR
    motor_relay_dir();

    motor.max_pos = eeprom.max_position;
    motor.min_pos = eeprom.min_position;
    motor.speed = PWM_PERIOD/2;

    if (motor.max_pos > MAX_POSITION)
        motor.max_pos = MAX_POSITION;

    if (motor.min_pos < MIN_POSITION)
        motor.min_pos = MIN_POSITION;

    init_pwm(PWM_PERIOD);
    set_pwm(motor.speed);
#endif
}

void speed_up(uint8_t value)
{
#ifdef EN_MOTOR
    motor.speed += value;
    if (motor.speed > PWM_PERIOD)
        motor.speed = PWM_PERIOD;
#endif
}

void speed_down(uint8_t value)
{
#ifdef EN_MOTOR
    if (motor.speed >= value)
        motor.speed -= value;
    else
        motor.speed = 0;
#endif
}

void set_position(void) 
{
#ifdef EN_MOTOR
    motor.position = adc_val;
#endif
}

void tmr_motor(void) 
{
#ifdef EN_MOTOR
    motor.tm_to_max++;
    //motor.tm_to_min++;
    /* damos um delay INVERT_MOTOR_TIME antes de inverter a rotacao do motor */
    if (motor.flags & INVERT_ROTATION) {
        motor.timer--;
        if (!motor.timer) {
            motor_invert();
            motor.flags &= ~INVERT_ROTATION;
        }
    }
#endif
}

void task_motor(void)
{
#ifdef EN_MOTOR
    static uint16_t prev_speed = 0;
    motor.position = adc_val;

    /* checamos os limites de posicao do motor para inverter a rotacao 
       - antes de inverter devemos parar e aguardar um tempo */
    if (((motor.position > motor.max_pos) || 
         (motor.position < motor.min_pos)) &&
        !(motor.flags & INVERT_ROTATION)) {
        motor.flags |= INVERT_ROTATION;
        motor.timer = INVERT_MOTOR_TIME;
        motor.speed = 0;
        motor.tm_to_max = 0;
    }

    if (motor.speed != prev_speed)
        set_pwm(motor.speed);
    prev_speed = motor.speed;
#endif
}
