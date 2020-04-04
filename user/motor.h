#ifndef __MOTOR_H__
#define __MOTOR_H__

#include "user_pwm.h"
#include "user_adc.h"

#define MOTOR_RELAY_PORT_NUM GPIOA
#define MOTOR_RELAY_PIN_NUM  GPIO_PIN_3

#define gpio_set(a,b)  GPIO_WriteHigh(a, (GPIO_Pin_TypeDef)b)
#define gpio_clr(a,b)  GPIO_WriteLow(a, (GPIO_Pin_TypeDef)b)
#define gpio_toggle(a,b)  GPIO_WriteReverse(a, (GPIO_Pin_TypeDef)b)
#define gpio_dir_out(a,b) GPIO_Init(a, (GPIO_Pin_TypeDef)b, GPIO_MODE_OUT_PP_LOW_FAST);

#define motor_relay_dir()  gpio_dir_out(MOTOR_RELAY_PORT_NUM,MOTOR_RELAY_PIN_NUM)
#define motor_relay_on()   gpio_set(MOTOR_RELAY_PORT_NUM,MOTOR_RELAY_PIN_NUM)
#define motor_relay_off()  gpio_clr(MOTOR_RELAY_PORT_NUM,MOTOR_RELAY_PIN_NUM)
#define motor_invert()     gpio_toggle(MOTOR_RELAY_PORT_NUM,MOTOR_RELAY_PIN_NUM)

void init_motor(void);
void task_motor(void);

#endif
