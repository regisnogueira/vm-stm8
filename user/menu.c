#include "menu.h"
#include "user_eeprom.h"
#include "user_display.h"
#include "user_led.h"

#define _decrement(a) if(a) a--
#define _beep(a) set_buzzer(a,100,50)

extern uint8_t tick;

static const PARAMETER par[] = {MENU_PARAMETERS};
#define PAR_COUNT (sizeof(par) / sizeof(par[0])) - 1

MENU menu;
BUTTON btn[BTN_LEN];

void init_menu(void)
{
#ifdef EN_MENU
    btn_set_dir();
    btn_inc_dir();
    btn_dec_dir();

    EXTI_DeInit();

    disableInterrupts();
    EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
    EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
    ITC_SetSoftwarePriority(ITC_IRQ_PORTC , ITC_PRIORITYLEVEL_3);
    enableInterrupts();

    menu.idx = 0;
    menu.value = get_menu_value(menu.idx);
#endif
}

uint8_t get_menu_value(uint8_t idx)
{
#ifdef EN_MENU
    return (uint8_t)get_eeprom_data(idx);
#else
    return 0;
#endif
}

void set_menu_value(void)
{
#ifdef EN_MENU
    set_eeprom_data(menu.value, menu.idx);
    menu.write = 0;
//    _beep(3);
#endif
}

void tmr_menu(void)
{
#ifdef EN_MENU
    _decrement(menu.tmr);
    _decrement(btn[BTN_SET_IDX].debounce);
    _decrement(btn[BTN_INC_IDX].debounce);
    _decrement(btn[BTN_DEC_IDX].debounce);
#endif
}

static void inc_option(void)
{
#ifdef EN_MENU
    menu.value = get_menu_value(menu.idx);
#endif
}

static void dec_option(void)
{
#ifdef EN_MENU
    menu.value = get_menu_value(menu.idx);
#endif
}

static void inc_value(void)
{
#ifdef EN_MENU
    if (++menu.value > MAX_VALUE)
        menu.value = 0;
#endif
}

static void dec_value(void)
{
#ifdef EN_MENU
    if (menu.value) {
        menu.value--;
    } else {
        menu.value = MAX_VALUE;
    }
#endif
}

void interrupt_buttons(void)
{
#ifdef EN_MENU
//    _beep(1);
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
#endif
}

void process_button(void)
{
#ifdef EN_MENU
    if (btn[BTN_SET_IDX].status == BTN_STAT_PRESSED) {
        btn[BTN_SET_IDX].status = BTN_STAT_FREE;
        if (menu.edit)
            menu.write = 1; 
        //menu.edit = (uint8_t)!menu.edit;
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
#endif
}

void task_menu(void)
{
#ifdef EN_MENU
    static uint8_t option_dp = 0;

    process_button();

    if (!tick)
        return;

    if (menu.write)
        set_menu_value();

    //option_dp = (menu.edit) ? (option_dp^1u) : 0u;
    menu.edit = 1;
    //set_display_option(par[menu.idx].option, option_dp);
    set_display_value(menu.value, 1);//par[menu.idx].dp);
    set_led_period(menu.value);
#endif
}
