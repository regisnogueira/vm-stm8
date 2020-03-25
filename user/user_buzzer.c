#include "user_buzzer.h"

extern int tick;

BUZZER buzzer;

void init_buzzer(void)
{
    buz_dir();
    buz_off();
    buz_on();
    set_buzzer(3,1000,500);
}

/**
 * configura acionamento do buzzer
 * @param nbeep   quantidade de beeps
 * @param ton     tempo c/ beep acionado
 * @param toff    tempo c/ beep desativado
 */
void set_buzzer(uint8_t nbeep, uint16_t ton, uint16_t toff)
{
    buzzer.nbeep = nbeep;
    buzzer.ton   = ton;
    buzzer.toff  = toff;
    buz_on();
}

void task_buzzer(void)
{
    static uint8_t state=0;
    static uint16_t ton=0, toff=0;

    if (ton) {
        buz_on();
        --ton;
        return;
    }

    if (toff) {
        buz_off();
        --toff;
        return;
    }

    if (!buzzer.nbeep) {
        buz_off();
        return;
    }

    if (!ton && !state) {
        ton = buzzer.ton;
        buz_on();
        state = 1;
    }

    if (!toff && state) {
        toff = buzzer.toff;
        buz_off();
        state = 0;
        --buzzer.nbeep;
    }
}
