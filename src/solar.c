#include <stdio.h>
#include <stdbool.h>
#include "pico/stdlib.h"
#include "hardware/gpio.h"
#include "hardware/adc.h"

/* Set up variables for servo and measurement pins */
unsigned const int servo0 = 0;
unsigned const int servo1 = 1;
unsigned const int adc0 = 26;
unsigned const int adc1 = 27;

/* Set up variables for interrupt and on-board LED */
unsigned const int inter = 2;
unsigned const int led = 25;

/* Function prototypes */
void gpio_callback(unsigned int inter, uint32_t events);
int mvservo(unsigned int servo, unsigned int adc);

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
    unsigned int n = 0;
    float pos = 0;

    while(true) {
        /* Move servo 0 (horizontal) */
        bool adjh = mvservo(servo0, adc0);
        if(adjh) {
            return(1);
        }

        /* Move servo 1 (vertical) */
        bool adjv = mvservo(servo0, adc0);
        if(adjv) {
            return(1);
        }
    }
}

/* Function to handle interrupts */
void gpio_callback(unsigned int inter, uint32_t events) {
    /* Blink an LED forever until reboot */
    while(true) {
        gpio_put(led, 1);
        busy_wait_us_32(500000);

        gpio_put(led, 0);
        busy_wait_us_32(500000);
    }
}

/* Function to move a servo to a specific position */
int mvservo(unsigned int servo, unsigned int adc) {
    /* Testing threshold values for 12 bit ADC - 0-4095 */
    unsigned const int high = 3071;
    unsigned const int low = 1023;

    /* Create variables to track the ontime of each servo */
    static unsigned int ontime0;
    static unsigned int ontime1;

    /* Create temporary variable that points to the selected servo */
    unsigned int *ontime;
    if(servo == 0) {
        ontime = &ontime0;
    }
    else if(servo == 1) {
        ontime = &ontime1;
    }
    else {
        return(1);
    }

    /* Verify the servo is in range */
    if(*ontime <= 3200 && *ontime >= 400) {
        /* PWM the servo */
        gpio_put(servo, 1);
        sleep_us(*ontime);

        gpio_put(servo, 0);
        sleep_us(20000 - *ontime);

        /* Collect input from the desired ADC */
        adc_select_input(adc);
        unsigned int temp = adc_read();

        /* Adjust the value of the ontime for selected servo */
        if(temp >= high) {
            *ontime--;
        }
        else if(temp <= low) {
            *ontime++;
        }
        else {
            return(0);
        }
    }

    /* Reset to halfway - this is a temporary solution */
    else {
        gpio_put(servo, 1);
        sleep_us(1800);

        gpio_put(servo, 1);
        sleep_us(18200);
    }
}
