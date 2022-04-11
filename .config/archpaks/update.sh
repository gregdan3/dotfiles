#!/bin/fish

echo "Running pacman -Qqne > ./driver"
              pacman -Qqne > ./driver
echo "Running pacman -Qqme > ./external"
              pacman -Qqme > ./external
echo "Running pipx list | grep - | sed 's/.* - //g' > ./pipx"
              pipx list | grep - | sed 's/.* - //g' > ./pipx
