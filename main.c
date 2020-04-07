#include "stm8s.h"
#include "user_timer.h"
#include "user_led.h"
#include "user_buzzer.h"
#include "user_uart.h"
#include "user_adc.h"
#include "user_display.h"
#include "user_eeprom.h"
#include "motor.h"

void main(void)
{
    init_timer();
    init_buzzer();
    init_uart();
    init_adc();

    init_display();
    init_eeprom();

    for (;;) {
        pool_tick();
        task_display();
        task_motor();
    }
}
