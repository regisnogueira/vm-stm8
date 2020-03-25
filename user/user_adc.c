#include "user_adc.h"

void init_adc(void)
{
    ADC1_DeInit();
    ADC1_Init(ADC1_CONVERSIONMODE_SINGLE,
        ADC1_CHANNEL_4,
        ADC1_PRESSEL_FCPU_D4,
        ADC1_EXTTRIG_TIM,
        ENABLE,
        ADC1_ALIGN_RIGHT,
        ADC1_SCHMITTTRIG_CHANNEL0,
        DISABLE);
    ADC1_ScanModeCmd(ENABLE);
    ADC1_DataBufferCmd(ENABLE);
    ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
    ADC1_Cmd(ENABLE);
}
