#!/bin/sh

echo 'Initializing west...'
west init zephyrproject || { echo 'West init failed'; exit 1; }

echo 'Updating west workspace...'
cd zephyrproject
west update || { echo 'West update failed'; exit 1; }
cd ..

echo 'Building project...'
export ZEPHYR_BASE=$(pwd)/zephyrproject/zephyr
cd project
rm -rf build && west build -b nrf52840dk/nrf52840 || { echo 'West build failed'; exit 1; }

echo 'Build completed successfully'
