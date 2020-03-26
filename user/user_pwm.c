#include "user_pwm.h"

#ifdef EN_USER_PWM
uint16_t CCR1_Val = 500;
uint16_t CCR2_Val = 250;
uint16_t CCR3_Val = 125;
#endif

void init_pwm(void)
{
#ifdef EN_USER_PWM
    /* Time base configuration */
    TIM2_TimeBaseInit(TIM2_PRESCALER_1, 999);
    
    /* PWM1 Mode configuration: Channel1 */ 
    TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,CCR1_Val, TIM2_OCPOLARITY_HIGH);
    TIM2_OC1PreloadConfig(ENABLE);
    
    /* PWM1 Mode configuration: Channel2 */ 
    TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,CCR2_Val, TIM2_OCPOLARITY_HIGH);
    TIM2_OC2PreloadConfig(ENABLE);
    
    /* PWM1 Mode configuration: Channel3 */         
    TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,CCR3_Val, TIM2_OCPOLARITY_HIGH);
    TIM2_OC3PreloadConfig(ENABLE);
    
    TIM2_ARRPreloadConfig(ENABLE);
    
    /* TIM2 enable counter */
    TIM2_Cmd(ENABLE);
#endif    
}
