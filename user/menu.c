#include "menu.h"
#include "user_display.h"

#define _decrement(a) if(a) a--

extern uint8_t tick;
extern uint8_t dp[MAX_DIG_POS];

const uint8_t menu_options[] = {'A', 'b', 'C', 'd', 'E', 'F', 'H', 'L', 'P', 'U'};
MENU menu;
BUTTON btn[BTN_LEN];

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
    //_decrement(menu.tmr);
    _decrement(btn[BTN_SET_IDX].debounce);
    _decrement(btn[BTN_INC_IDX].debounce);
    _decrement(btn[BTN_DEC_IDX].debounce);
}

static void inc_option(void)
{
    if (++menu.idx > sizeof(menu_options)-1)
        menu.idx = 0;
}

static void dec_option(void)
{
    if (menu.idx) {
        menu.idx--;
    } else {
        menu.idx = sizeof(menu_options) - 1;
    }
}

void interrupt_buttons(void)
{
    if ((GPIO_ReadInputData(BTN_PORT) & BTN_SET_PIN_NUM) == 0x00) {
        if (!btn[BTN_SET_IDX].debounce) {
            btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
            btn[BTN_SET_IDX].status = BTN_STAT_PRESSED;
        }
    } else
    if ((GPIO_ReadInputData(BTN_PORT) & BTN_INC_PIN_NUM) == 0x00) {
        if (!btn[BTN_INC_IDX].debounce) {
            btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
            btn[BTN_INC_IDX].status = BTN_STAT_PRESSED;
        }
    } else
    if ((GPIO_ReadInputData(BTN_PORT) & BTN_DEC_PIN_NUM) == 0x00) {
        if (!btn[BTN_DEC_IDX].debounce) {
            btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
            btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
        }
    }
}

void process_button(void)
{
    if (btn[BTN_SET_IDX].status == BTN_STAT_PRESSED) {
        btn[BTN_SET_IDX].status = BTN_STAT_FREE;
        dp[DIG1_POS] = (uint8_t)!dp[DIG1_POS];
    }
    if (btn[BTN_INC_IDX].status == BTN_STAT_PRESSED) {
        btn[BTN_INC_IDX].status = BTN_STAT_FREE;
        inc_option();
    }
    if (btn[BTN_DEC_IDX].status == BTN_STAT_PRESSED) {
        btn[BTN_DEC_IDX].status = BTN_STAT_FREE;
        dec_option();
    }
    if (!btn_set()) {
        btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
    }
    if (!btn_inc()) {
        btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
    }
    if (!btn_dec()) {
        btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
    }
}

void task_menu(void)
{
    process_button();
    if (!tick)
        return;
    set_option_display(menu_options[menu.idx]);
}
