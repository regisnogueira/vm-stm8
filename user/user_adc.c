#include "user_adc.h"

#ifdef EN_USER_ADC  
uint16_t adc_val = 0;
#endif

void init_adc(void)
{
#ifdef EN_USER_ADC    
    GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT );
    ADC1_DeInit();
    ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_6, 
              ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, 
              ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL0, DISABLE );
    
    ADC1_ScanModeCmd(ENABLE);
    //ADC1_DataBufferCmd(ENABLE);
    ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
    ADC1_Cmd(ENABLE);
    
    ADC1_StartConversion();
#endif    
}

uint16_t read_adc(void)
{
#ifdef EN_USER_ADC
    /* In order to detect unexpected events during development,
    it is recommended to set a breakpoint on the following instruction.
    */
    /* Clear interrupt flag */
    ADC1_ClearITPendingBit(ADC1_IT_EOC);
    /* Workaround for ADC ScanMode issue (Reconfig ADC) */
    ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
    ADC1->CSR |= (uint8_t)(ADC1_CHANNEL_3);
    ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
    /* User code */
    adc_val = ADC1_GetConversionValue();
    return adc_val;
#else
    return 0;
#endif    
}
