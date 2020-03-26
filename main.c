#include "stm8s.h"
#include "user_timer.h"
#include "user_led.h"
#include "user_buzzer.h"
#include "user_uart.h"
#include "user_adc.h"
#include "user_pwm.h"

void main(void)
{
    init_timer();
    init_led();
    //init_buzzer();
    //init_uart();
    //init_adc();
    init_pwm();

    for (;;) {
    }
}
