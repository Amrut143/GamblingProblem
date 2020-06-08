#!/bin/bash 

#@Author: Amrut
#Gambling Use Case 4

STARTING_STAKE=100
BET=1
DAY=1
WIN=0
LOSS=1
PercentStake=$(( 50*$STARTING_STAKE/100 ))
MaxWin=$(( $STARTING_STAKE + $PercentStake ))
MaxLoss=$(( $STARTING_STAKE - $PercentStake ))
numOfDays=20

echo "Welcome to Gambling"

function gamble()
{
	stake=$STARTING_STAKE
	while [ $stake -lt $MaxWin ] && [ $stake -gt $MaxLoss ]
	do
		ran=$(( RANDOM%2 ))

	if [ $ran -eq 0 ]
	then
		stake=$(( stake+BET ))
		echo "WIN"
	else
		stake=$(( stake-BET ))
		echo "LOSS"
	fi
	done
}

	for (( day=1; day<$numOfDays; day++ ))
	do
		gamble
			if [ $stake -eq $MaxLoss ]
			then
				totalWinOrLoss=$(( totalWinOrLoss-50 ))
			else
				totalWinOrLoss=$(( totalWinOrLoss+50 ))
			fi
		echo "Gambler reached to 50% and resign for the day"
	done
echo $totalWinOrLoss
