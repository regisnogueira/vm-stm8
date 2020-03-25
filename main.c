#include "stm8s.h"
#include "user_timer.h"
#include "user_led.h"
#include "user_buzzer.h"

void main(void)
{
    init_timer();
    init_led();
    init_buzzer();

    for (;;) {
        delay(1000);
    }
}
