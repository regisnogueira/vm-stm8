#ifndef __MENU_H__
#define __MENU_H__

#include "stm8s.h"

#define BTN_PORT GPIOC
#define BTN_SET_PORT_NUM GPIOC
#define BTN_SET_PIN_NUM  GPIO_PIN_3

#undef gpio_read(a,b)
#undef gpio_dir_in(a,b)

#define gpio_read(a,b)   GPIO_ReadInputPin(a, (GPIO_Pin_TypeDef)b)
#define gpio_dir_in(a,b) GPIO_Init(a, (GPIO_Pin_TypeDef)b, GPIO_MODE_IN_PU_IT)

#define btn_set_dir() gpio_dir_in(BTN_SET_PORT_NUM, BTN_SET_PIN_NUM)
#define btn_set()     gpio_read  (BTN_SET_PORT_NUM, BTN_SET_PIN_NUM)

typedef struct
{
    uint8_t pos;
    uint8_t max;
} MENU;

void init_menu(void);
void tmr_menu(void);
void task_menu(void);
uint16_t get_register(uint8_t position);
int8_t set_register(uint8_t position);

#endif
