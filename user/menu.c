#include "menu.h"
#include "user_display.h"

extern uint8_t tick;

uint8_t menu_options[]={'A', 'b', 'C', 'd', 'E', 'F', 'H', 'L', 'P', 'U'};
uint8_t num_option = 0;
uint16_t menu_timer;

void init_menu(void)
{
    
}

void tmr_menu(void)
{
    if (menu_timer)
        menu_timer--;
}

void task_menu(void)
{
    if (!tick)
        return;

    if (menu_timer)
        return;

    set_display(menu_options[num_option], 0, 0);
    
    num_option++;
    if (num_option > sizeof(menu_options)-1)
        num_option = 0;
    menu_timer = 1000;
}
