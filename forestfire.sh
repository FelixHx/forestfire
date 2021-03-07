#!/bin/sh

LINES=`tput lines` # Number of rows x
COLS=`tput cols`   # Number of columns y
F="0.0001"        # Probability for burning tree
P="0.001"          # Probability for growing tree

clear

./forestfire.awk $LINES $COLS $F $P

