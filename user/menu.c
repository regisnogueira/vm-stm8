#include "menu.h"
#include "application.h"
#include "user_eeprom.h"
#include "user_display.h"

#define _decrement(a) if(a) a--

extern uint8_t tick;
extern uint8_t dp[MAX_DIG_POS];

static const PARAMETER par[] = {MENU_PARAMETERS};

#define PAR_COUNT (sizeof(par) / sizeof(par[0])) - 1

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

uint8_t get_menu_value(uint8_t idx)
{
    uint8_t value;

    value = (uint8_t)get_eeprom_data(idx);

    return value;
}

void set_menu_value(void)
{
    set_eeprom_data(menu.value, menu.idx);
    menu.write = 0;
}

void tmr_menu(void)
{
    _decrement(menu.tmr);
    _decrement(btn[BTN_SET_IDX].debounce);
    _decrement(btn[BTN_INC_IDX].debounce);
    _decrement(btn[BTN_DEC_IDX].debounce);
}

static void inc_option(void)
{
    if (++menu.idx > PAR_COUNT)
        menu.idx = 0;
    menu.value = get_menu_value(menu.idx);
}

static void dec_option(void)
{
    if (menu.idx) {
        menu.idx--;
    } else {
        menu.idx = PAR_COUNT;
    }
    menu.value = get_menu_value(menu.idx);
}

static void inc_value(void)
{
    if (++menu.value > MAX_VALUE)
        menu.value = 0;
}

static void dec_value(void)
{
    if (menu.value) {
        menu.value--;
    } else {
        menu.value = MAX_VALUE;
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
            menu.tmr = TIME_HOLD_BUTTON;
        }
    } else
    if ((GPIO_ReadInputData(BTN_PORT) & BTN_DEC_PIN_NUM) == 0x00) {
        if (!btn[BTN_DEC_IDX].debounce) {
            btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
            btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
            menu.tmr = TIME_HOLD_BUTTON;
        }
    }
}

void process_button(void)
{
    if (btn[BTN_SET_IDX].status == BTN_STAT_PRESSED) {
        btn[BTN_SET_IDX].status = BTN_STAT_FREE;
        if (menu.edit)
            menu.write = 1; 
        menu.edit = (uint8_t)!menu.edit;
    }
    if (btn[BTN_INC_IDX].status == BTN_STAT_PRESSED) {
        btn[BTN_INC_IDX].status = BTN_STAT_FREE;
        if (!menu.edit)
            inc_option();
        else
            inc_value();
    }
    if (btn[BTN_DEC_IDX].status == BTN_STAT_PRESSED) {
        btn[BTN_DEC_IDX].status = BTN_STAT_FREE;
        if (!menu.edit)
            dec_option();
        else
            dec_value();
    }
    if (!btn_set()) {
        btn[BTN_SET_IDX].debounce = BTN_DEBOUNCE;
    }
    if (!btn_inc()) {
        btn[BTN_INC_IDX].debounce = BTN_DEBOUNCE;
        if (!menu.tmr) {
            btn[BTN_INC_IDX].status = BTN_STAT_PRESSED;
            menu.tmr = TIME_CHANGE_VALUE;
        }
    }
    if (!btn_dec()) {
        btn[BTN_DEC_IDX].debounce = BTN_DEBOUNCE;
        if (!menu.tmr) {
            btn[BTN_DEC_IDX].status = BTN_STAT_PRESSED;
            menu.tmr = TIME_CHANGE_VALUE;
        }
    }
}

void task_menu(void)
{
    process_button();

    if (!tick)
        return;

    if (menu.write)
        set_menu_value();

    if (menu.edit) {
        dp[DIG1_POS] = (uint8_t)!dp[DIG1_POS];    
    } else {
        dp[DIG1_POS] = 0;
    }

    set_display_option(par[menu.idx].option);
    set_display_value(menu.value, par[menu.idx].dp);
}
