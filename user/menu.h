#ifndef __MENU_H__
#define __MENU_H__

#include "stm8s.h"

#define MAX_OPTION 16

/**

**/

typedef struct
{
    uint8_t pos;
    uint8_t max;
    uint16_t flag;
    uint16_t reg[MAX_OPTION];
} MENU;

void init_menu(void);
void tmr_menu(void);
uint16_t get_register(uint8_t position);
int8_t set_register(uint8_t position);

#endif
