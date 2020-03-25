#include "user_uart.h"

void init_uart(void)
{
    UART1_DeInit();
    /* UART1 configuration ------------------------------------------------------*/
    /* UART1 configured as follow:
    - BaudRate = 115200 baud  
    - Word Length = 8 Bits
    - One Stop Bit
    - No parity
    - Receive and transmit enabled
    - UART1 Clock disabled
    */
    UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
    UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
    
    //printf("\n\rvm-stm8");
}

/**
  * @brief Retargets the C library printf function to the UART.
  * @param c Character to send
  * @retval char Character sent
  */
//PUTCHAR_PROTOTYPE
//{
  /* Write a character to the UART1 */
//  UART1_SendData8(c);
  /* Loop until the end of transmission */
//  while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);

//  return (c);
//}
