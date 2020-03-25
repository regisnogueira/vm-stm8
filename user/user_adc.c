#include "user_adc.h"

uint16_t adc_val = 0;

void init_adc(void)
{
    GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
    ADC1_DeInit();
    ADC1_DeInit();
    ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_4, 
              ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, 
              ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL0, DISABLE );
    
    ADC1_ScanModeCmd(ENABLE);
    //ADC1_DataBufferCmd(ENABLE);
    ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
    ADC1_Cmd(ENABLE);
    
    ADC1_StartConversion();
}

uint16_t read_adc(void)
{
    adc_val = ADC1_GetConversionValue();
    return adc_val;
}
