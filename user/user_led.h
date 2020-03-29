#ifndef __USER_LED_H__
#define __USER_LED_H__

#include "stm8s.h"

#define EN_USER_LED

#define LED1_PORT_NUM GPIOA
#define LED1_PIN_NUM  GPIO_PIN_3
#define gpio_set(a,b)  GPIO_WriteHigh(a, (GPIO_Pin_TypeDef)b)
#define gpio_clr(a,b)  GPIO_WriteLow(a, (GPIO_Pin_TypeDef)b)
#define gpio_dir_out(a,b) GPIO_Init(a, (GPIO_Pin_TypeDef)b, GPIO_MODE_OUT_PP_LOW_FAST);

#define led1_dir()  gpio_dir_out(LED1_PORT_NUM,LED1_PIN_NUM)
#define led1_on()   gpio_set(LED1_PORT_NUM,LED1_PIN_NUM)
#define led1_off()  gpio_clr(LED1_PORT_NUM,LED1_PIN_NUM)

#define LED1    0
#define QTD_LED 1

#define LED_ALL_OFF 1
#define LED_NOTHING 2

/* tempo utilizado na função led_task() */
#define LED_PULSE  100
#define LED_ON     0
#define BLINK_SLOW 1000-LED_PULSE
#define LED_OFF    0xFFFF-LED_PULSE

typedef struct _LED_STATE
{
    uint16_t time;
    uint16_t speed;
} LED_STATE;

void init_led(void);
void task_led(void);
void set_led(uint8_t ledx, uint16_t speed);

#endif
