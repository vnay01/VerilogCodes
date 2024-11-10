/*
@vinay  Dated: 09-Nov-2024
    Code to toggle on-board leds present on BASYS3
*/
#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "xil_types.h"
#include <xgpio_l.h>
// #include "xintc.h"
#include "xil_exception.h"
 
// Get device IDs from xparameters.h
// #define BTN_ID XPAR_AXI_GPIO_BUTTONS_DEVICE_ID
#define LED_ID XPAR_AXI_GPIO_0_BASEADDR
#define INTC_DEVICE_ID XPAR_INTC_0_DEVICE_ID

#define BTN_CHANNEL 1
#define LED_CHANNEL 1
#define LED_MASK 0xFF
#define CLK_FREQ 1000000000
#define RST_REG_BASE_ADDRESS 0x400000000

// Global variables
XGpio led_device;
// XIntc intc;


/* Function prototypes */
void delay_1s();
void delay_60ms();
void debounce_delay();
void ButtonInterruptHandler(void *CallbackRef);



/* Funtion definitions */
void delay_60ms() {
    volatile int i;
    for (i = 0; i < 6000000; i++);  // Adjust if necessary for accurate 60 ms delay
}

// Delay function for approximately 1 second
void delay_1s() {
    volatile int i;
    for (i = 0; i < 10000000; i++);  // Adjust this value if delay is too short or too long
}

// debounce delay
void debounce_delay() {
    volatile int i;
    for (i = 0; i < 1000000; i++);  // Short delay for debounce
}
// Delay function for approximately 5 ms
void delay_5ms() {
    volatile int i;
    for (i = 0; i < 500000; i++);  // Adjust this value if delay is too short or too long
}
// LED toggle routine with 5 ms delay
void toggle_leds_5ms(XGpio *led_device) {
    u32 led_data = 0xFFFF;  // Initialize LEDs to ON state
    for (int i = 0; i < 2; i++) {  // Toggle twice for a total of 5 ms (approx. 2.5 ms on, 2.5 ms off)
        XGpio_DiscreteWrite(led_device, LED_CHANNEL, led_data);
        led_data = ~led_data;  // Toggle LED state
        delay_5ms();
    }
}

// Interrupt handler for button press

int main() {

    /* Variable declarations */
	XGpio_Config *cfg_ptr;
	u32 led_data=0xFFFF;
    u32 reg_value;

    
	xil_printf("Entered function main\r\n");
 
	// Initializations 
    // LED GPIOs
	cfg_ptr = XGpio_LookupConfig(LED_ID);
	XGpio_CfgInitialize(&led_device, cfg_ptr, cfg_ptr->BaseAddress);

    
	// Set LED directions
	XGpio_SetDataDirection(&led_device, LED_CHANNEL, 0X0);

    // Logic to toggle leds
    // Logic to toggle LEDs
    while(1) {

        // Read the monitored register value
        reg_value = *((volatile u32 *)RST_REG_BASE_ADDRESS);

               // Check if register value is 1
        if (reg_value != 1) {
            // Call the toggle routine for 5 ms
            toggle_leds_5ms(&led_device);
            // Reset the register to 0 after toggling
            *((volatile u32 *)RST_REG_BASE_ADDRESS) = 1;            
        }
    }
    return 0;

}