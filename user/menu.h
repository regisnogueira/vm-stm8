#ifndef __MENU_H__
#define __MENU_H__

#include "stm8s.h"

#define BTN_PORT GPIOC
#define BTN_SET_PORT_NUM GPIOC
#define BTN_SET_PIN_NUM  GPIO_PIN_3
#define BTN_INC_PORT_NUM GPIOC
#define BTN_INC_PIN_NUM  GPIO_PIN_5
#define BTN_DEC_PORT_NUM GPIOC
#define BTN_DEC_PIN_NUM  GPIO_PIN_4

#undef gpio_read(a,b)
#undef gpio_dir_in(a,b)

#define gpio_read(a,b)   GPIO_ReadInputPin(a, (GPIO_Pin_TypeDef)b)
#define gpio_dir_in(a,b) GPIO_Init(a, (GPIO_Pin_TypeDef)b, GPIO_MODE_IN_PU_IT)

#define btn_set_dir() gpio_dir_in(BTN_SET_PORT_NUM, BTN_SET_PIN_NUM)
#define btn_set()     gpio_read  (BTN_SET_PORT_NUM, BTN_SET_PIN_NUM)

#define btn_inc_dir() gpio_dir_in(BTN_INC_PORT_NUM, BTN_INC_PIN_NUM)
#define btn_inc()     gpio_read  (BTN_INC_PORT_NUM, BTN_INC_PIN_NUM)

#define btn_dec_dir() gpio_dir_in(BTN_DEC_PORT_NUM, BTN_DEC_PIN_NUM)
#define btn_dec()     gpio_read  (BTN_DEC_PORT_NUM, BTN_DEC_PIN_NUM)

#define BTN_DEBOUNCE 50 /* ms */

#define BTN_LEN 3
#define BTN_SET_IDX 0
#define BTN_DEC_IDX 1
#define BTN_INC_IDX 2

#define BTN_STAT_PRESSED 1
#define BTN_STAT_FREE 0

#define MAX_VALUE 99

#define MENU_PARAMETERS {'P', 0}, \
                        {'A', 1}, \
                        {'C', 1}, \
                        {'F', 0}, \
                        {'H', 1}, \
                        {'L', 0}, \
                        {'U', 1}, \
                        {'E', 0}

typedef struct
{
    uint8_t status;
    uint16_t tmr;
    uint16_t debounce;
} BUTTON;

typedef struct {
  uint8_t option;
  uint8_t dp;
} PARAMETER;

typedef struct
{
    uint8_t idx;
    uint8_t value;
    uint8_t dp;
    uint8_t tmr;
    uint8_t edit;
    uint8_t write;
} MENU;

void init_menu(void);
void tmr_menu(void);
void task_menu(void);
uint16_t get_register(uint8_t position);
int8_t set_register(uint8_t position);

#endif
