#ifndef __APPLICATION_H__
#define __APPLICATION_H__

#include "stm8s.h"

enum /* status */
{
    STAND_BY = 0,
    TESTING,
    RUNNING,
    STAT_ERROR
};

enum /* operation_mode */
{
    SELF_TEST = 1,
    START_ON_POWER,
    WAIT_ON_POWER
};

typedef struct
{
    uint16_t status;
    uint8_t operation_mode;
} APPLICATION;

#endif
