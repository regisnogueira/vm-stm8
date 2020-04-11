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

#define TIME_HOLD_BUTTON 1500
#define TIME_CHANGE_VALUE 100

#define MAX_VALUE 99 /* ou 9.9 */

#define DP 1 /* com ponto decimal */
#define NO_DP 0 /* sem ponto decimal */

#define MENU_PARAMETERS {'P', NO_DP}, \
                        {'A', DP}, \
                        {'C', DP}, \
                        {'F', NO_DP}, \
                        {'H', NO_DP}, \
                        {'L', DP}, \
                        {'U', NO_DP}, \
                        {'E', DP}

typedef struct
{
    uint8_t status;
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
    uint8_t edit;
    uint8_t write;
    uint16_t tmr;
} MENU;

void init_menu(void);
void tmr_menu(void);
void task_menu(void);

#endif
