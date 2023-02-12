#!/bin/bash

if [ $# -lt 2 ]; then
echo "usage: $0 [color][text]"
elif [ "$1" == "-r" ]; then
echo -e "\033[1;31m$2\033[0m"
elif [ "$1" == "-g" ]; then
echo -e "\033[1;32m$2\033[0m"
elif [ "$1" == "-b" ]; then
echo -e "\033[1;34m$2\033[0m"
elif [ "$1" == "-y" ]; then
echo -e "\033[1;33m$2\033[0m"
elif [ "$1" == "-dg" ]; then
echo -e "\033[1;30m$2\033[0m"
elif [ "$1" == "-w" ]; then
echo -e "$2"
elif [ "$1" == "-lg" ]; then
echo -e "\033[0;37m$2\033[0m"
elif [ "$1" == "-p" ]; then
echo -e "\033[1;35m$2\033[0m"
fi

