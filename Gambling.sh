#!/bin/bash -x

#@Author: Amrut
#Gambling Use Case 6

STARTING_STAKE=100
BET=1
DAY=1
WIN=0
LOSS=1

PercentStake=$(( 50*$STARTING_STAKE/100 ))
MaxWin=$(( $STARTING_STAKE + $PercentStake ))
MaxLoss=$(( $STARTING_STAKE - $PercentStake ))
numOfDays=30
totalWinOrLoss=0
winDays=0
lossDays=0

declare -A eachDay
declare -A totalWinLossDay
echo "Welcome to Gambling"

function gamble()
{
	stake=$STARTING_STAKE
	while [ $stake -lt $MaxWin ] && [ $stake -gt $MaxLoss ]
	do
		ran=$(( RANDOM%2 ))

	if [ $ran -eq 0 ]
	then
		stake=$(( $stake+$BET ))
		echo "WIN"
    echo $stake
	else
		stake=$(( $stake-$BET ))
		echo "LOSS"
		echo $stake
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


	for (( day=1; day<=$numOfDays; day++ ))
	do
		gamble
				if [ $stake -eq $MaxLoss ]
				then
						totalWinOrLoss=$(( $totalWinOrLoss-$PercentStake ))
						eachDay["Day $day"]=-$PercentStake
						totalWinLossDay["Day $day"]=$totalWinOrLoss
						(( lossDays++ ))
				else
						totalWinOrLoss=$(( $totalWinOrLoss+$PercentStake ))
						eachDay["Day $day"]=$PercentStake
						totalWinLossDay["Day $day"]=$totalWinOrLoss
						(( winDays++ ))
				fi
	done
echo "Number of days Win is $winDays by $(($winDays*$PercentStake))" 
echo "Number of days Loss is $lossDays by  $(($lossDays*$PercentStake))"
echo "Total amount of Win Or Loss is $totalWinOrLoss"
echo "${!totalWinLossDay[@]} : ${totalWinLossDay[@]}"
luckyDay=$( printf "%s\n" ${totalWinLossDay[@]} | sort -nr | head -1 )
unluckyDay=$( printf "%s\n" ${totalWinLossDay[@]} | sort -nr | tail -1 )


	for values in "${!totalWinLossDay[@]}"
	do
		if [ ${totalWinLossDay[$values]} -eq $luckyDay ]
		then
			echo "Luckiest Day is::" $values
		elif [ ${totalWinLossDay[$values]} -eq $unluckyDay ]
		then
			echo "Unluckiest Day is::" $values
		fi
	done
