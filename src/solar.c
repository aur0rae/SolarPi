#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/gpio.h"
#include "hardware/adc.h"

/* Set up variables for servo and measurement pins */
unsigned int servo0 = 0, servo1 = 1;
unsigned int adc0 = 26, adc1 = 27;

/* Set up variables for interrupt and on-board LED */
unsigned int inter = 2;
unsigned int led = 25;

/* Function prototypes */
void gpio_callback(unsigned int inter, uint32_t events);
void mvservo(unsigned int pos, unsigned int servo);

/* Main function */
int main(void) {
    /* Initialize the GPIO */
    stdio_init_all();
    adc_init();

    /* Create an array to initialize pins cleaner */
    unsigned int gpio[] = {servo0, servo1, led};
    unsigned int adc[] = {adc0, adc1};

    /* Initialize the main GPIO pins */
    for(unsigned int i = 0; i < sizeof(gpio) / sizeof(gpio[0]); i++) {
        gpio_init(gpio[i]);
        gpio_set_dir(gpio[i], GPIO_OUT);
    }

    /* Initialize both ADC channels */
    for(unsigned int i = 0; i < sizeof(adc) / sizeof(adc[0]); i++) {
        adc_gpio_init(adc[i]);
    }

    /* Initialize the interrupt pin */
    gpio_set_irq_enabled_with_callback(inter, GPIO_IRQ_EDGE_RISE, true, &gpio_callback);

    /* Just to check the status of main for troubleshooting */
    while(1) {
        printf("%s", "Running as intended (PROCESS - MAIN)...\n");
        sleep_ms(10000);
    }
}

/* Function to handle interrupts */
void gpio_callback(unsigned int inter, uint32_t events) {
    /* Blink an LED forever until reboot */
    printf("%s", "INTERRUPT! Halting...");

    while(1) {
        gpio_put(led, 1);
        busy_wait_us_32(500000);

        gpio_put(led, 0);
        busy_wait_us_32(500000);
    }
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
        while(1) {
            /* LED purgatory */
            gpio_put(led, 1);
        }
    }
}
