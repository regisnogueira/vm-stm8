#include "user_led.h"

extern int tick;

#ifdef EN_USER_LED
LED_STATE led[QTD_LED];
#endif

void init_led(void)
{
#ifdef EN_USER_LED
    led1_dir();
    set_led(LED1, BLINK_SLOW);
#endif    
}

void tmr_led(void)
{
#ifdef EN_USER_LED
    if (++led[LED1].time < led[LED1].speed) {
        led1_off();
    } else {
        led1_on();
        if (led[LED1].time > led[LED1].speed + LED_PULSE) {
            led[LED1].time = 0;
        }
    }
#endif
}

void set_led(uint8_t ledx, uint16_t speed)
{
#ifdef EN_USER_LED
    led[ledx].speed = speed;
#endif
}
