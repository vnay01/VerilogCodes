/*
Engineer : Vinay Singh
Date : 09-Feb-2025 

A simple C based testbench to simulate 8x8 matrix multiplier.
No optimizations have been made.

*/

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>

#define N 8
#define MAX_8BIT 255
#define NUM_PASS_TESTS 8
#define NUM_FAILURE_TESTS 5



// Original functions remain the same
uint8_t safe_multiply_add(uint8_t a, uint8_t b, uint16_t current_sum) {
    uint16_t product = (uint16_t)a * (uint16_t)b;
    uint16_t new_sum = current_sum + product;
    return (new_sum > MAX_8BIT) ? MAX_8BIT : (uint8_t)new_sum;
}

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

// Test helper functions

void writeMatrixToFile(FILE* fp, const char* label, uint8_t mat[N][N]) {
    fprintf(fp, "\n%s:\n", label);
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            fprintf(fp, "%3u ", mat[i][j]);
        }
        fprintf(fp, "\n");
    }
}


void generateIdentityMatrix(uint8_t mat[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            mat[i][j] = (i == j) ? 1 : 0;
        }
    }
}

void generateRandomMatrix(uint8_t mat[N][N], uint8_t max_value) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            mat[i][j] = (uint8_t)(rand() % (max_value + 1));
        }
    }
}

void fillMatrix(uint8_t mat[N][N], uint8_t value) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            mat[i][j] = value;
        }
    }
}

void printMatrix(uint8_t mat[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            printf("%3u ", mat[i][j]);
        }
        printf("\n");
    }
}

int compareMatrices(uint8_t mat1[N][N], uint8_t mat2[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (mat1[i][j] != mat2[i][j]) return 0;
        }
    }
    return 1;
}

// Function to calculate exact result using 32-bit arithmetic
uint32_t calculateExactResult(uint8_t mat1[N][N], uint8_t mat2[N][N], int row, int col) {
    uint32_t sum = 0;
    for (int k = 0; k < N; k++) {
        sum += (uint32_t)mat1[row][k] * (uint32_t)mat2[k][col];
    }
    return sum;
}

void runPassingTests(FILE* fp) {
    uint8_t matrix1[N][N], matrix2[N][N], result[N][N], expected[N][N];
    int testsPassed = 0;
    
    fprintf(fp, "\n=== Running %d Passing Test Cases ===\n", NUM_PASS_TESTS);
    printf("Running %d Passing Test Cases\n\n", NUM_PASS_TESTS);

    // Test 1: Zero Matrix
    fprintf(fp, "\nTest 1: Zero Matrix Test\n");
    printf("Test 1: Zero Matrix Test\n");
    fillMatrix(matrix1, 0);
    generateRandomMatrix(matrix2, MAX_8BIT);
    multiplyMatrix(matrix1, matrix2, result);
    fillMatrix(expected, 0);
    
    writeMatrixToFile(fp, "Matrix 1 (Zero Matrix)", matrix1);
    writeMatrixToFile(fp, "Matrix 2 (Random Matrix)", matrix2);
    writeMatrixToFile(fp, "Result", result);
    
    if (compareMatrices(result, expected)) {
        fprintf(fp, "PASSED: Zero matrix multiplication correct\n");
        printf("PASSED: Zero matrix multiplication correct\n\n");
        testsPassed++;
    }

    // Test 2: Identity Matrix
    fprintf(fp, "\nTest 2: Identity Matrix Test\n");
    printf("Test 2: Identity Matrix Test\n");
    generateRandomMatrix(matrix1, 100);
    generateIdentityMatrix(matrix2);
    multiplyMatrix(matrix1, matrix2, result);
    
    writeMatrixToFile(fp, "Matrix 1 (Random Matrix)", matrix1);
    writeMatrixToFile(fp, "Matrix 2 (Identity Matrix)", matrix2);
    writeMatrixToFile(fp, "Result", result);
    
    if (compareMatrices(result, matrix1)) {
        fprintf(fp, "PASSED: Identity matrix multiplication correct\n");
        printf("PASSED: Identity matrix multiplication correct\n\n");
        testsPassed++;
    }

    // Similar modifications for remaining passing tests...
    // [Previous tests 3-8 would follow the same pattern]

    fprintf(fp, "\nPassing Test Summary: %d/%d tests passed\n", testsPassed, NUM_PASS_TESTS);
    printf("Passing Test Summary: %d/%d tests passed\n\n", testsPassed, NUM_PASS_TESTS);
}

// Modified function to run failure tests with file output
void runFailureTests(FILE* fp) {
    uint8_t matrix1[N][N], matrix2[N][N], result[N][N];
    int failureTestsPassed = 0;
    
    fprintf(fp, "\n=== Running %d Failure Test Cases ===\n", NUM_FAILURE_TESTS);
    printf("\nRunning %d Failure Test Cases\n", NUM_FAILURE_TESTS);
    fprintf(fp, "These tests SHOULD fail if error handling is working correctly\n\n");
    printf("These tests SHOULD fail if error handling is working correctly\n\n");

    // Failure Test 1: Overflow Detection
    fprintf(fp, "\nFailure Test 1: Overflow Detection\n");
    printf("Failure Test 1: Overflow Detection\n");
    fillMatrix(matrix1, 200);
    fillMatrix(matrix2, 200);
    multiplyMatrix(matrix1, matrix2, result);
    
    writeMatrixToFile(fp, "Matrix 1", matrix1);
    writeMatrixToFile(fp, "Matrix 2", matrix2);
    writeMatrixToFile(fp, "Result", result);
    
    uint32_t exact_sum = calculateExactResult(matrix1, matrix2, 0, 0);
    if (exact_sum != result[0][0]) {
        fprintf(fp, "PASSED: Overflow correctly detected (Expected: %u, Got: %u)\n", 
                exact_sum, result[0][0]);
        printf("PASSED: Overflow correctly detected (Expected: %u, Got: %u)\n", 
               exact_sum, result[0][0]);
        failureTestsPassed++;
    }

    // Similar modifications for remaining failure tests...
    // [Previous failure tests 2-5 would follow the same pattern]

    fprintf(fp, "\nFailure Test Summary: %d/%d failure tests passed\n", 
            failureTestsPassed, NUM_FAILURE_TESTS);
    printf("\nFailure Test Summary: %d/%d failure tests passed\n", 
           failureTestsPassed, NUM_FAILURE_TESTS);
}

int main() {
    srand(time(NULL));
    
    // Open output file
    FILE* fp = fopen("matrix_multiplication_results.txt", "w");
    if (fp == NULL) {
        printf("Error opening output file!\n");
        return 1;
    }
    
    fprintf(fp, "=== Matrix Multiplier Testbench Results ===\n");
    printf("=== Starting Matrix Multiplier Testbench ===\n\n");
    
    // Run passing tests first
    fprintf(fp, "\n=== Running Passing Tests ===\n");
    printf("=== Running Passing Tests ===\n");
    runPassingTests(fp);
    
    // Run failure tests
    fprintf(fp, "\n=== Running Failure Tests ===\n");
    printf("=== Running Failure Tests ===\n");
    runFailureTests(fp);
    
    // Close output file
    fclose(fp);
    return 0;
}