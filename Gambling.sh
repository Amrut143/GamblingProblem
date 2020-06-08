#!/bin/bash 

#@Author: Amrut
#Gambling Use Case 3

STARTING_STAKE=100
BET=1
DAY=1
WIN=0
LOSS=1
stake=$STARTING_STAKE
PercentStake=$(( 50*$STARTING_STAKE/100 ))
MaxWin=$(( $STARTING_STAKE + $PercentStake ))
MaxLoss=$(( $STARTING_STAKE - $PercentStake ))

echo "Welcome to Gambling"

function gamble()
{
	while [ $stake -lt $MaxWin ] && [ $stake -gt $MaxLoss ]
	do
		ran=$(( RANDOM%2 ))

	if [ $ran -eq 0 ]
	then
		stake=$(( stake+BET ))
		echo "WIN"
		echo $stake
	else
		stake=$(( stake-BET ))
		echo "LOSS"
		echo $stake
	fi
	done
}

gamble

echo "Gambler reached to 50% and resign for the day"

