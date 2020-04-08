#include "menu.h"
#include "user_display.h"

extern uint8_t tick;

uint8_t menu_options[] = {'A', 'b', 'C', 'd', 'E', 'F', 'H', 'L', 'P', 'U'};
uint8_t num_option = 0;
uint16_t menu_timer;

void init_menu(void)
{
    btn_set_dir();
    EXTI_DeInit();
    EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
    EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
    //btn_inc_dir();
    //btn_dec_dir();
    enableInterrupts();
}

void tmr_menu(void)
{
    if (menu_timer)
        menu_timer--;
}

void handle_buttons(void)
{
    if (!btn_set()) {
        num_option++;
    }
    
    if (num_option > sizeof(menu_options)-1)
        num_option = 0;
}

void task_menu(void)
{
    static uint8_t dp = 0;

    if (!tick)
        return;

    set_option_display(menu_options[num_option], dp);
    
    //if (menu_timer)
    //    return;
    
    //if (!btn_set())
    //    num_option++;
    //if (btn_dec())
    //    num_option--;
    //if (!btn_set())
    //    dp = (uint8_t)!dp;
        
    
    //menu_timer = 1000;
}
