#!/bin/bash -x

#@Author: Amrut
#Gampling Use Case 2

STARTING_STAKE=100
BET=1
DAY=1
WIN=0
LOSS=1

echo "Welcome to Gambling"

function gamble()
{
	ran=$(( RANDOM%2 ))

	if [ $ran -eq 0 ]
	then
		STARTING_STAKE=$(( STARTING_STAKE+BET ))
		echo "WIN"
	else
		STARTING_STAKE=$(( STARTING_STAKE-BET ))
		echo "LOSS"
	fi
}

gamble

echo $STARTING_STAKE

