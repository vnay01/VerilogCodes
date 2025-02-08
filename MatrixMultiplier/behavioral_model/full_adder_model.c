#include <stdint.h>

void fullAdder8Bit(uint8_t a, uint8_t b, uint8_t* sum, uint8_t* overflow) {
    uint16_t tempSum = a + b;
    *sum = (uint8_t)tempSum;
    *overflow = (tempSum > 0xFF) ? 1 : 0;
}
