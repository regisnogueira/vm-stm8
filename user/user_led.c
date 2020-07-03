#include "user_led.h"

extern int tick;

#ifdef EN_USER_LED
LED_STATE led;
#endif

void init_led(void)
{
#ifdef EN_USER_LED
    led1_dir();
    led.time = 0;
//    set_led(BLINK_SLOW);
#endif    
}

void tmr_led(void)
{
#ifdef EN_USER_LED
    if (++led.time < (led.speed - LED_PULSE)) {
        led1_off();
    } else {
        led1_on();
        if (led.time >= led.speed) {
            led.time = 0;
            led1_off();
        }
    }
#endif
}

void set_led_period(uint16_t speed)
{
#ifdef EN_USER_LED
    led.speed = speed*100;
#endif
}
