#include "user_display.h"
#include "user_timer.h"

void test_display(void)
{
    delay(500);
    display_zero();
    delay(500);
    display_one();
    delay(500);
    display_two();
    delay(500);
    display_three();
    delay(500);
    display_four();
    delay(500);
    display_five();
    delay(500);
    display_six();
    delay(500);
    display_seven();
    delay(500);
    display_eight();
    delay(500);
    display_nine();    
    delay(500);
    display_off();
    dp_on();
    delay(500);
    dp_off();
}

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
while(1) {    
    dig1_on();
    dig2_off();
    dig3_off();
    test_display();

    dig1_off();
    dig2_on();
    dig3_off();
    test_display();

    dig1_off();
    dig2_off();
    dig3_on();
    test_display();

/*
    delay(500);
    seg_a_on();
    delay(500);
    seg_a_off();
    seg_b_on();
    delay(500);
    seg_b_off();
    seg_c_on();
    delay(500);
    seg_c_off();
    seg_d_on();
    delay(500);
    seg_d_off();
    //seg_e_on();
    //delay(500);
    //seg_e_off();
    seg_f_on();
    delay(500);
    seg_f_off();
    seg_g_on();
    delay(500);
    seg_g_off();
    dp_on();
    delay(500);
    dp_off();

    dig1_off();
    dig2_on();
    dig3_off();

    delay(500);
    seg_a_on();
    delay(500);
    seg_a_off();
    seg_b_on();
    delay(500);
    seg_b_off();
    seg_c_on();
    delay(500);
    seg_c_off();
    seg_d_on();
    delay(500);
    seg_d_off();
    //seg_e_on();
    //delay(500);
    //seg_e_off();
    seg_f_on();
    delay(500);
    seg_f_off();
    seg_g_on();
    delay(500);
    seg_g_off();
    dp_on();
    delay(500);
    dp_off();

    dig1_on();
    dig2_off();
    dig3_off();

    delay(500);
    seg_a_on();
    delay(500);
    seg_a_off();
    seg_b_on();
    delay(500);
    seg_b_off();
    seg_c_on();
    delay(500);
    seg_c_off();
    seg_d_on();
    delay(500);
    seg_d_off();
    //seg_e_on();
    //delay(500);
    //seg_e_off();
    seg_f_on();
    delay(500);
    seg_f_off();
    seg_g_on();
    delay(500);
    seg_g_off();
    dp_on();
*/
}
#endif    
}
