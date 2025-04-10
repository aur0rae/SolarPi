#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/gpio.h"

unsigned int servo1 = 0;  /* Servo handling horizontal rotation     */
unsigned int servo2 = 1;  /* Servo handling vertical positioning    */
unsigned int inter = 2;   /* Interrupt pin to shut down the program */
unsigned int led = 25;    /* Built-in LED - no connection           */

/* Function prototypes */
void gpio_callback(unsigned int inter, uint32_t events);
void mvservo(unsigned int pos, unsigned int servo);
void error(void);

/* Main function */
int main(void) {
    /* Initialize the GPIO */
    stdio_init_all();

    /* Create an array to initialize pins cleaner */
    unsigned int arr[] = {led, servo1, servo2};

    for(unsigned int i = 0; i < sizeof(arr) / sizeof(arr[0]); i++) {
        gpio_init(arr[i]);
        gpio_set_dir(arr[i], GPIO_OUT);
    }

    /* Initialize the interrupt pin */
    gpio_set_irq_enabled_with_callback(inter, GPIO_IRQ_EDGE_RISE, true, &gpio_callback);

    /* Loop to go from position 0 - 180 */
    while(1) {
        for(unsigned int i = 0; i < 180; i++) {
            mvservo(i, servo1);
        }
    }
}

/* Function to handle interrupts */
void gpio_callback(unsigned int inter, uint32_t events) {
    error();
}

/* Function to move a servo to a specific position */
void mvservo(unsigned int pos, unsigned int servo) {
    /* Make sure the value passed in is within range 0 - 180 */
    if(pos <= 180) {
        /* Scale the ontime from 550us to 2400us based on position variable */
        unsigned int ontime = ((pos / 3) * 40) + 550;

        /* Send a few pulses to make sure it reads right */
        for(unsigned int c = 0; c < 5; c++) {
            /* Set position via duty cycle */
            gpio_put(servo, 1);
            sleep_us(ontime);

            gpio_put(servo, 0);
            sleep_us(20000 - ontime);
        }
    }

    else {
        error();
    }
}

/* Function to handle errors and lock up until reboot */
void error(void) {
    while(1) {
        for(unsigned int i = 0; i < 2; i++) {
            gpio_put(led, i);
            busy_wait_us_32(500000);
        }
    }
}
