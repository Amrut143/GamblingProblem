#!/bin/bash 

#@Author: Amrut
#Gambling Use Case 3

STARTING_STAKE=100
BET=1
DAY=1
WIN=0
LOSS=1
PercentStake=$(( 50*$STARTING_STAKE/100 ))
MaxWin=$(( $STARTING_STAKE + $PercentStake ))
MaxLoss=$(( $STARTING_STAKE - $PercentStake ))

echo "Welcome to Gambling"

function gamble()
{
	while [ $STARTING_STAKE -lt $MaxWin ] && [ $STARTING_STAKE -gt $MaxLoss ]
	do
		ran=$(( RANDOM%2 ))

	if [ $ran -eq 0 ]
	then
		STARTING_STAKE=$(( STARTING_STAKE+BET ))
		echo "WIN"
		echo $STARTING_STAKE
	else
		STARTING_STAKE=$(( STARTING_STAKE-BET ))
		echo "LOSS"
		echo $STARTING_STAKE
	fi
	done
}

gamble

echo "Gambler reached to required 50% and resign for the day"

