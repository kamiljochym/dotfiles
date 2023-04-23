#!/bin/bash
# checks if pavucontrol is open and then either closes it or opens a new instance
if [[ $(ps -e | grep "pavucontrol") ]] 
then
    pkill pavucontrol
else
    pavucontrol
fi