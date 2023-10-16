#!/bin/fish

echo "Running pacman -Qqnett > ./driver"
              pacman -Qqnett > ./driver
echo "Running pacman -Qqmett > ./driver_external"
              pacman -Qqmett > ./driver_external
