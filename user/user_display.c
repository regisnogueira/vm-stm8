#include "user_display.h"
#include "user_timer.h"

#define DELAY_DISPLAY_TEST 250
#define EN_DISPLAY_TEST

/* user_timer.c */
extern uint8_t tick;

/* user_adc.h */
extern uint16_t adc_val;

#ifdef EN_DISPLAY_TEST
uint8_t display_test = 1;
#endif

/* A b C d E F H L P U */
uint8_t display_num[MAX_DIG_POS] = {'A', 0, 0};
uint8_t dp[MAX_DIG_POS] = {0, 0 ,0};

uint8_t dec2bcd(uint8_t val)
{
    return (uint8_t)((val/10*16) + (val%10));
}

void set_display_value(uint8_t value, uint8_t _dp)
{
#ifdef EN_USER_DISPLAY
    uint8_t bcd;

    bcd = (uint8_t)dec2bcd(value);

    display_num[DIG2_POS] = (uint8_t)(bcd >> 4);
    display_num[DIG3_POS] = (uint8_t)(bcd & 0x0F);
    
    dp[DIG2_POS] = _dp;
#endif
}

void set_display_option(uint8_t option)
{
#ifdef EN_USER_DISPLAY
    display_num[DIG1_POS] = option;
#endif
}

void wr_digit(uint8_t dig_pos)
{
#ifdef EN_USER_DISPLAY

    if (dp[dig_pos]) {
        dp_on();
    } else {
        dp_off();
    }
        
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
    case 'A':
        display_a();
        break;
    case 'b':
        display_b();
        break;
    case 'C':
        display_c();
        break;
    case 'd':
        display_d();
        break;
    case 'E':
        display_e();
        break;
    case 'F':
        display_f();
        break;
    case 'H':
        display_h();
        break;
    case 'L':
        display_l();
        break;
    case 'P':
        display_p();
        break;
    case 'U':
        display_u();
        break;
    }
#endif
}

void task_display(void)
{
#ifdef EN_USER_DISPLAY
    if (!tick)
        return;
    //set_display(0, (uint8_t)((float)adc_val*3/100), 0);
#endif
}

void tmr_display(void)
{
#ifdef EN_USER_DISPLAY
    static uint8_t dig_pos = DIG1_POS;

#ifdef EN_DISPLAY_TEST
    if (display_test)
        return;
#endif

    if (dig_pos >= MAX_DIG_POS)
        dig_pos = DIG1_POS;

    switch (dig_pos) {
    case DIG1_POS:
        dig1_on();
        dig2_off();
        dig3_off();
        break;
    case DIG2_POS:
        dig1_off();
        dig2_on();
        dig3_off();
        break;
    case DIG3_POS:
        dig1_off();
        dig2_off();
        dig3_on();
        break;
    }

    wr_digit(dig_pos);
    dig_pos++;
#endif
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
