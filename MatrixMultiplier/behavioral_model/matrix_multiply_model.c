/*
    C model for an 8x8 matrix multiplier
    This model will be used as the golden reference.
*/

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>

// Parameter definitions
#define N 8
#define MAX_8BIT 255


// Helper functions
uint8_t safe_multiply_add(uint8_t a, uint8_t b, uint16_t current_sum) {
    uint16_t product = (uint16_t)a * (uint16_t)b;
    uint16_t new_sum = current_sum + product;
    return (new_sum > MAX_8BIT) ? MAX_8BIT : (uint8_t)new_sum;
}

// Matrix multiplier function
void multiplyMatrix(uint8_t mat1[N][N], uint8_t mat2[N][N], uint8_t result[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            uint16_t temp_sum = 0;
            for (int k = 0; k < N; k++) {
                temp_sum = safe_multiply_add(mat1[i][k], mat2[k][j], temp_sum);
            }
            result[i][j] = (uint8_t)temp_sum;
        }
    }
}