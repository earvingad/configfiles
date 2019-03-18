#!/bin/bash

ESSID=$(iwconfig wlp1s0 | grep ESSID | cut -d '"' -f 2)

echo "$ESSID"
