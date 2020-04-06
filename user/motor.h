#ifndef __MOTOR_H__
#define __MOTOR_H__

#include "user_pwm.h"
#include "user_adc.h"

#define MOTOR_RELAY_PORT_NUM GPIOA
#define MOTOR_RELAY_PIN_NUM  GPIO_PIN_3

#undef gpio_set(a,b)
#undef gpio_clr(a,b)

#define gpio_set(a,b)     GPIO_WriteHigh   (a, (GPIO_Pin_TypeDef)b)
#define gpio_clr(a,b)     GPIO_WriteLow    (a, (GPIO_Pin_TypeDef)b)
#define gpio_toggle(a,b)  GPIO_WriteReverse(a, (GPIO_Pin_TypeDef)b)

#define gpio_dir_out(a,b) GPIO_Init(a, (GPIO_Pin_TypeDef)b, \
                                        GPIO_MODE_OUT_PP_LOW_FAST);

#define motor_relay_dir() gpio_dir_out(MOTOR_RELAY_PORT_NUM,MOTOR_RELAY_PIN_NUM)
#define motor_relay_on()  gpio_set    (MOTOR_RELAY_PORT_NUM,MOTOR_RELAY_PIN_NUM)
#define motor_relay_off() gpio_clr    (MOTOR_RELAY_PORT_NUM,MOTOR_RELAY_PIN_NUM)
#define motor_invert()    gpio_toggle (MOTOR_RELAY_PORT_NUM,MOTOR_RELAY_PIN_NUM)

#define PWM_PERIOD 60000
#define INVERT_MOTOR_TIME 100

#define INVERT_ROTATION (uint16_t)(1 << 0)

typedef struct
{
    uint16_t position;
    uint16_t max_pos;
    uint16_t min_pos;
    uint8_t rotate;
    uint16_t speed;
    uint8_t timer;
    uint16_t flags;
} MOTOR;

void init_motor(void);
void task_motor(void);
void set_position(void);
void speed_up(uint8_t value);
void speed_down(uint8_t value);

#endif

