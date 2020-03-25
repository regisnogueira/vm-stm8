#ifndef __USER_TIMER_H__
#define __USER_TIMER_H__

#include "stm8s.h"

void init_timer(void);
void pool_tick(void);
void delay(__IO uint32_t nTime);
void TimingDelay_Decrement(void);
void CLK_Config(void);
void TIM4_Config(void);

#endif
