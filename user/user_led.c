#include "user_led.h"

extern int tick;

LED_STATE led[QTD_LED];

void init_led(void)
{
    led1_dir();
    set_led(LED1, BLINK_SLOW);
}

void task_led(void)
{
    if (++led[LED1].time < led[LED1].speed) {
        led1_off();
    } else {
        led1_on();
        if (led[LED1].time > led[LED1].speed + LED_PULSE) {
            led[LED1].time = 0;
        }
    }
}

void set_led(uint8_t ledx, uint16_t speed)
{
    led[ledx].speed = speed;
}
