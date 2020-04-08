#include "menu.h"
#include "user_display.h"

extern uint8_t tick;

uint8_t menu_options[] = {'A', 'b', 'C', 'd', 'E', 'F', 'H', 'L', 'P', 'U'};
uint8_t num_option = 0;
uint16_t menu_timer;
extern uint8_t dp[MAX_DIG_POS];

void init_menu(void)
{
    btn_set_dir();
    btn_inc_dir();
    btn_dec_dir();
    EXTI_DeInit();

    disableInterrupts();
    EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
    EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
    ITC_SetSoftwarePriority(ITC_IRQ_PORTC , ITC_PRIORITYLEVEL_3);
    enableInterrupts();
}

void tmr_menu(void)
{
    if (menu_timer)
        menu_timer--;
}

void handle_buttons(void)
{
    if ((GPIO_ReadInputData(BTN_PORT) & BTN_SET_PIN_NUM) == 0x00) {
        dp[DIG1_POS] = (uint8_t)!dp[DIG1_POS];
    }
    if ((GPIO_ReadInputData(BTN_PORT) & BTN_INC_PIN_NUM) == 0x00) {
        if (++num_option > sizeof(menu_options)-1)
            num_option = 0;
    }
    if ((GPIO_ReadInputData(BTN_PORT) & BTN_DEC_PIN_NUM) == 0x00) {
        if (num_option)
            num_option--;
    }
}

void task_menu(void)
{
    if (!tick)
        return;

    set_option_display(menu_options[num_option]);    
}
