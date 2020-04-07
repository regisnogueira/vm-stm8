#include "user_eeprom.h"

/* Private typedef -----------------------------------------------------------*/

EEPROM_DATA eeprom;

void init_eeprom(void)
{
    uint32_t add = 0;
    uint8_t val = 0x00, val_comp = 0xAA;

    flash_config();

    /* Read a byte at a specified address */
    //add = 0x4000;
    //FLASH_ProgramByte(add, val_comp);
    //val = FLASH_ReadByte(add);

    /* Program complement value (of previous read byte) at previous address + 1 */
    //val_comp = (uint8_t)(~val);
    //FLASH_ProgramByte((add + 1), val_comp);
    read_all();
}

void read_all(void)
{
    uint8_t i;
    uint32_t addr = FLASH_DATA_START_PHYSICAL_ADDRESS;
    uint8_t *p = (uint8_t *)&eeprom;

    for (i=0; i < sizeof(eeprom); i++, p++) {
        *p = FLASH_ReadByte(addr++);
    }
}

void flash_config(void)
{
    FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
    FLASH_Unlock(FLASH_MEMTYPE_DATA);

    while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
}
