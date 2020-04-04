#include "stm8s.h"
#include "user_timer.h"
#include "user_led.h"
#include "user_buzzer.h"
#include "user_uart.h"
#include "user_adc.h"
#include "user_display.h"
#include "motor.h"

void main(void)
{
    init_timer();    
    init_buzzer();
    init_uart();
    init_adc();
    
    init_display();
    init_motor();

    for (;;) {
        set_pwm(55000);
        delay(1000);
        set_pwm(0);
        delay(100);
        motor_invert();
        delay(100);
    }
}
