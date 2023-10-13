#!/bin/fish

echo "Running pacman -Qqne > ./driver"
              pacman -Qqne > ./driver
echo "Running pacman -Qqme > ./driver_external"
              pacman -Qqme > ./driver_external
