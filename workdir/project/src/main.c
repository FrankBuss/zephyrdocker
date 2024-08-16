#include <zephyr/kernel.h>
#include <zephyr/sys/printk.h>

int main(void)
{
    printk("Hello, Zephyr!\n");
    while (1) {
        k_msleep(100);
    }
}
