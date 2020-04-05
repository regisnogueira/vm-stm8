#include "stm8s.h"
#include "user_timer.h"
#include "user_led.h"
#include "user_buzzer.h"
#include "user_uart.h"
#include "user_adc.h"
#include "user_display.h"
#include "motor.h"

extern uint16_t adc_val;

void main(void)
{
    init_timer();    
    init_buzzer();
    init_uart();
    init_adc();

    init_display();
    init_pwm();

    for (;;) {
        pool_tick();
        set_pwm(adc_val);
        task_display();
    }
}
