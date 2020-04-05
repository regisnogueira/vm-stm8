#include "user_display.h"
#include "user_timer.h"

#define DELAY_DISPLAY_TEST 500
#define EN_DISPLAY_TEST

/* user_timer.c */
extern int tick;

/* user_adc.h */
extern uint16_t adc_val;

#ifdef EN_DISPLAY_TEST
uint8_t display_test = 1;
#endif

uint8_t display_num[MAX_DIG_POS] = {0, 0, 0};

uint8_t dec2bcd(uint8_t val)
{
  return (uint8_t)((val/10*16) + (val%10));
}

void set_display(uint8_t option, uint8_t value, uint8_t decimal)
{
    uint8_t bcd;

    bcd = (uint8_t)dec2bcd(value);

    if (option > MAX_DISPLAY_OPTION)
        option = MAX_DISPLAY_OPTION;
    if (value > MAX_DISPLAY_VALUE)
        value = MAX_DISPLAY_VALUE;

    display_num[DIG1_POS] = option;
    display_num[DIG2_POS] = (uint8_t)(bcd >> 4);
    display_num[DIG3_POS] = (uint8_t)(bcd & 0x0F);
}

void wr_digit(uint8_t dig_pos)
{
    switch (display_num[dig_pos]) {
    case 0x00:
        display_zero();
        break;
    case 0x01:
        display_one();
        break;
    case 0x02:
        display_two();
        break;
    case 0x03:
        display_three();
        break;
    case 0x04:
        display_four();
        break;
    case 0x05:
        display_five();
        break;
    case 0x06:
        display_six();
        break;
    case 0x07:
        display_seven();
        break;
    case 0x08:
        display_eight();
        break;
    case 0x09:
        display_nine();
        break;
    }
}

void task_display(void)
{
    if (!tick)
        return;
    set_display(0, (uint8_t)((float)adc_val*3/100), 0);
}

void tmr_display(void)
{
    static uint8_t dig_pos = DIG1_POS;

#ifdef EN_DISPLAY_TEST
    if (display_test)
        return;
#endif

    if (dig_pos > MAX_DIG_POS)
        dig_pos = DIG1_POS;

    dig1_off();
    dig2_off();
    dig3_off();

    switch (dig_pos) {
    case DIG1_POS:
        dig1_on();
        break;
    case DIG2_POS:
        dig2_on();
        break;
    case DIG3_POS:
        dig3_on();
        break;
    }

    wr_digit(dig_pos);
    dig_pos++;
}

#ifdef EN_DISPLAY_TEST
void test_display(void)
{
    delay(DELAY_DISPLAY_TEST);
    display_zero();
    delay(DELAY_DISPLAY_TEST);
    display_one();
    delay(DELAY_DISPLAY_TEST);
    display_two();
    delay(DELAY_DISPLAY_TEST);
    display_three();
    delay(DELAY_DISPLAY_TEST);
    display_four();
    delay(DELAY_DISPLAY_TEST);
    display_five();
    delay(DELAY_DISPLAY_TEST);
    display_six();
    delay(DELAY_DISPLAY_TEST);
    display_seven();
    delay(DELAY_DISPLAY_TEST);
    display_eight();
    delay(DELAY_DISPLAY_TEST);
    display_nine();    
    delay(DELAY_DISPLAY_TEST);
    display_off();
    dp_on();
    delay(DELAY_DISPLAY_TEST);
    dp_off();
}
#endif

void init_display(void)
{
    uint8_t i;

#ifdef EN_USER_DISPLAY
    seg_a_dir();
    seg_b_dir();
    seg_c_dir();
    seg_d_dir();
    seg_e_dir();
    seg_f_dir();
    seg_g_dir();
    dp_dir();
    dig1_dir();
    dig2_dir();
    dig3_dir();

#ifdef EN_DISPLAY_TEST
    dig1_on();
    dig2_on();
    dig3_on();

    display_all();
    delay(2*DELAY_DISPLAY_TEST);
    display_off();
    delay(DELAY_DISPLAY_TEST);
    display_all();
    delay(2*DELAY_DISPLAY_TEST);
    display_off();
    delay(DELAY_DISPLAY_TEST);
    display_all();
    delay(2*DELAY_DISPLAY_TEST);
    display_off();

    display_test = 0;
#endif

    dig1_off();
    dig2_off();
    dig3_off();

#endif
}
