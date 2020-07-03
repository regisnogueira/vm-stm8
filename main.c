#include "stm8s.h"
#include "user_timer.h"
#include "user_led.h"
#include "user_display.h"
#include "user_eeprom.h"
#include "motor.h"
#include "menu.h"

void main(void)
{
    init_timer();
    init_display();
    init_eeprom();
    init_menu();
    init_led();

    for (;;) {
        pool_tick();
        task_menu();
        //task_motor();
    }
}
