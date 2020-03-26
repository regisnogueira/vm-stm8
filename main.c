#include "stm8s.h"
#include "user_timer.h"
#include "user_led.h"
#include "user_buzzer.h"
#include "user_uart.h"
#include "user_adc.h"
#include "user_pwm.h"

void main(void)
{
    uint16_t pwm;

    init_timer();
    init_led();
    init_buzzer();
    init_uart();
    init_adc();
    init_pwm();

    for (;;) {
        delay(5);
#ifdef EN_USER_PWM
        set_pwm(PWM_CH1, pwm);
        set_pwm(PWM_CH2, 1100-pwm);
        if (++pwm >= 1100)
            pwm = 0;
#endif
    }
}
