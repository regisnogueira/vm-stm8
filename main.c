#include "stm8s.h"
#include "user_timer.h"
#include "user_led.h"
#include "user_buzzer.h"
#include "user_uart.h"

void main(void)
{
    init_timer();
    init_led();
    init_buzzer();
    init_uart();

    for (;;) {

    }
}
