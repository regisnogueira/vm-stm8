#include "user_display.h"
#include "user_timer.h"

#define DELAY_DISPLAY_TEST 500

uint8_t display_num[MAX_DIG_POS] = {1, 2, 3};

uint8_t dec2bcd(uint8_t val)
{
  return ((val/10*16) + (val%10));
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
    static uint8_t dig_pos = DIG1_POS;

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

void wr_display(uint8_t pos, uint8_t val)
{
    uint8_t bcd = dec2bcd(val);
    uint8_t dig[2];
    uint8_t i;
    uint8_t len=2;
    
    dig[1] = bcd >> 4;
    dig[0] = bcd & 0x0F;

    len = (len > 9) ? 2 : 1;

    for (i=0; i < len; i++) {
        if (i==0) {
            dig1_off();
            dig2_on();
            dig3_off();
        } else {
            dig1_off();
            dig2_off();
            dig3_on();
        }
        switch (dig[len-1-i]) {
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
}

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
/*
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
*/
    dig1_off();
    dig2_off();
    dig3_off();

    //for (i=0; i<=99; i++) {
    //    wr_display(2, i);
    //    delay(DELAY_DISPLAY_TEST);
    //}
    
#endif    
}
