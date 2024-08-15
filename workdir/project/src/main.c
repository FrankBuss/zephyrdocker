#include <zephyr/kernel.h>

void main(void)
{
    printk("Hello, Zephyr!\n");
    while (1) {
        k_msleep(100);
    }
}
