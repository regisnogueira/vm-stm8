#include "user_eeprom.h"

/* Private typedef -----------------------------------------------------------*/
typedef enum { FAILED = 0, PASSED = !FAILED} TestStatus;
/* Private define ------------------------------------------------------------*/
#define BLOCK_OPERATION    0    /* block 0 in data eeprom memory: address is 0x4000 */
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
uint8_t GBuffer[FLASH_BLOCK_SIZE];
__IO TestStatus OperationStatus;

#ifdef _RAISONANCE_
/* needed by memcpy for raisonance */
 #include <string.h>
 extern int __address__FLASH_EraseBlock;
 extern int __size__FLASH_EraseBlock;
 extern int __address__FLASH_ProgramBlock;
 extern int __size__FLASH_ProgramBlock;
#endif /*_RAISONANCE_*/

/* Private function prototypes -----------------------------------------------*/
/* Declare _fctcpy function prototype as it is packaged by default in the Cosmic
   machine library */
#ifdef _COSMIC_
 int _fctcpy(char name);
#endif /*_COSMIC_*/

static void FLASH_Config(void);

EEPROM_DATA eeprom;

void init_eeprom(void)
{
    uint32_t add = 0;
    uint8_t val = 0x00, val_comp = 0xAA;

    flash_config();

    /* Read a byte at a specified address */
    add = 0x4000;
    FLASH_ProgramByte(add, val_comp);
    val = FLASH_ReadByte(add);

    /* Program complement value (of previous read byte) at previous address + 1 */
    val_comp = (uint8_t)(~val);
    FLASH_ProgramByte((add + 1), val_comp);
}

void flash_config(void)
{
    /* Define flash programming Time*/
    FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
    
    //FLASH_Unlock(FLASH_MEMTYPE_PROG);
    /* Wait until Flash Program area unlocked flag is set*/
    //while (FLASH_GetFlagStatus(FLASH_FLAG_PUL) == RESET);
    
    /* Unlock flash data eeprom memory */
    FLASH_Unlock(FLASH_MEMTYPE_DATA);
    /* Wait until Data EEPROM area unlocked flag is set*/
    while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
}
