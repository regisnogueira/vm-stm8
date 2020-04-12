#include "user_pwm.h"

void init_pwm(uint16_t period)
{
#ifdef EN_USER_PWM
    /* Time base configuration */
    TIM2_TimeBaseInit(TIM2_PRESCALER_1, period);

    TIM2_ARRPreloadConfig(ENABLE);
    
    /* TIM2 enable counter */
    TIM2_Cmd(ENABLE);
#endif    
}

void set_pwm(uint16_t ccrx_val)
{
#ifdef EN_USER_PWM
    TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ccrx_val, TIM2_OCPOLARITY_HIGH);
    TIM2_OC1PreloadConfig(ENABLE);
#endif
}
