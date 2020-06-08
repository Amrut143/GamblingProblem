#!/bin/bash 

#@Author: Amrut
#Gambling Use Case 7

STARTING_STAKE=100
BET=1
DAY=1
WIN=0
LOSS=1
FLAG=true
numOfDays=30
LastLoss=0

PercentStake=$(( 50*$STARTING_STAKE/100 ))
MaxWin=$(( $STARTING_STAKE + $PercentStake ))
MaxLoss=$(( $STARTING_STAKE - $PercentStake ))
totalWinOrLoss=0
winDays=0
lossDays=0

declare -A eachDay
declare -A monthWinLoss
echo "Welcome to Gambling"

function dailyBet()
{
	stake=$STARTING_STAKE
	while [ $stake -lt $MaxWin ] && [ $stake -gt $MaxLoss ]
	do
		ran=$(( RANDOM%2 ))

	if [ $ran -eq 0 ]
	then
		stake=$(( $stake+$BET ))
	else
		stake=$(( $stake-$BET ))
	fi
	done
}
function monthlyBet() {

	for (( day=1; day<=$numOfDays; day++ ))
	do
		dailyBet
				if [ $stake -eq $MaxLoss ]
				then
						totalWinOrLoss=$(( $totalWinOrLoss-$PercentStake ))
						eachDay["Day $day"]=-$PercentStake
						monthWinLoss["Day $day"]=$totalWinOrLoss
						(( lossDays++ ))
				else
						totalWinOrLoss=$(( $totalWinOrLoss+$PercentStake ))
						eachDay["Day $day"]=$PercentStake
						monthWinLoss["Day $day"]=$totalWinOrLoss
						(( winDays++ ))
				fi
	done
echo "Number of days Win is $winDays by $(($winDays*$PercentStake))" 
echo "Number of days Loss is $lossDays by  $(($lossDays*$PercentStake))"
echo "Total amount of Win Or Loss is $totalWinOrLoss"
echo "${!monthWinLoss[@]} : ${monthWinLoss[@]}"

luckyDay=$( printf "%s\n" ${monthWinLoss[@]} | sort -nr | head -1 )
unluckyDay=$( printf "%s\n" ${monthWinLoss[@]} | sort -nr | tail -1 )


	for values in "${!monthWinLoss[@]}"
	do
		if [ ${monthWinLoss[$values]} -eq $luckyDay ]
		then
			echo "Luckiest Day is:: $values $luckyDay"
		elif [ ${monthWinLoss[$values]} -eq $unluckyDay ]
		then
			echo "Unluckiest Day is:: $values $unluckyDay"
		fi
	done
}

#flag for continue or stop playing
while [ $FLAG ]
do
	monthlyBet
	if [ $totalWinOrLoss -lt $LastLoss ]
	then
		echo "You lost, can't play"
		break
	else
		echo "you won $totalWinOrLoss, Continue playing"
		echo " "
	fi
done
