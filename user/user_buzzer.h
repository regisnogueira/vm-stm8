#ifndef __USER_BUZZER_H__
#define __USER_BUZZER_H__

#include "stm8s.h"

//#define EN_USER_BUZZER

#define BUZ_PORT_NUM (GPIOA)
#define BUZ_PIN_NUM  (GPIO_PIN_3)

#define gpio_set(a,b)  GPIO_WriteHigh(a, (GPIO_Pin_TypeDef)b)
#define gpio_clr(a,b)  GPIO_WriteLow(a, (GPIO_Pin_TypeDef)b)
#define gpio_dir_out(a,b) GPIO_Init(a, (GPIO_Pin_TypeDef)b, GPIO_MODE_OUT_PP_LOW_FAST);

#define buz_dir() gpio_dir_out(BUZ_PORT_NUM,BUZ_PIN_NUM)

#define buz_on()  gpio_clr(BUZ_PORT_NUM,BUZ_PIN_NUM)
#define buz_off() gpio_set(BUZ_PORT_NUM,BUZ_PIN_NUM)

typedef struct _BUZZER
{
    uint8_t nbeep; /**< quantidade de beeps */
    uint16_t ton;  /**< tempo do beep       */
    uint16_t toff; /**< tempo entre beep    */
} BUZZER;

void init_buzzer(void);
void set_buzzer(uint8_t nbeep, uint16_t ton, uint16_t toff);
void task_buzzer(void);

#endif
