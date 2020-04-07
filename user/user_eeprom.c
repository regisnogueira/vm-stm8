#include "user_eeprom.h"

EEPROM_DATA eeprom;

void init_eeprom(void)
{
    flash_config();
    read_eeprom();
    
    if (eeprom.checksum != calc_checksum()) {
        set_default();
        save_eeprom();
    }
}

void set_default(void)
{
    eeprom.inspiratory_time = DEFAULT_INSPIRATORY_TIME;
    eeprom.inspiratory_pause = DEFAULT_INSPIRATORY_PAUSE;
    eeprom.expiratory_time = DEFAULT_EXPIRATORY_TIME;
    eeprom.expiratory_pause = DEFAULT_EXPIRATORY_PAUSE;
    eeprom.peak_pressure = DEFAULT_PEAK_PRESSURE;
    eeprom.max_volume = DEFAULT_MAX_VOLUME;
    eeprom.max_position = DEFAULT_MAX_POSITION;
    eeprom.min_position = DEFAULT_MIN_POSITION;
    eeprom.operation_mode = DEFAULT_OPERATION_MODE;
}

void read_eeprom(void)
{
#ifdef EN_USER_EEPROM
    uint8_t i = 0;
    uint32_t addr = FLASH_DATA_START_PHYSICAL_ADDRESS;
    uint8_t *p = (uint8_t *)&eeprom;

    for (; i < sizeof(eeprom); i++, p++) {
        *p = FLASH_ReadByte(addr++);
    }
#endif
}

void save_eeprom(void)
{
#ifdef EN_USER_EEPROM
    uint8_t i = 0;
    uint32_t addr = FLASH_DATA_START_PHYSICAL_ADDRESS;
    uint8_t *p = (uint8_t *)&eeprom;

    eeprom.checksum = calc_checksum();
    for (; i < sizeof(eeprom); i++, p++) {
        FLASH_ProgramByte((addr + i), *p);
    }
#endif
}

uint8_t calc_checksum(void)
{
    uint8_t i = 0;
    uint8_t *p = (uint8_t *)&eeprom;
    uint8_t checksum = 0;

    for (; i < sizeof(eeprom); i++, p++) {
        checksum ^= *p;
    }
    return checksum;
}

void flash_config(void)
{
    FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
    FLASH_Unlock(FLASH_MEMTYPE_DATA);

    while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
}
