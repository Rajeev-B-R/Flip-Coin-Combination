echo "**********Welcome to Coin Combination Problem**********"

#!/bin/bash -x

declare -A flipCoinCombi

getFlipCoin () {
        numCoins=$1
        combi=""

        for((i=1;i<=$numFlip;i++))
        do
                for((j=1;j<=$numCoins;j++))
                do
                        toss=$(( RANDOM % 2 ))
                        if [ $toss -eq 1 ]
                        then
                                combi=$combi"H"
                        else
			        combi=$combi"T"
                        fi
                done
                flipCoinCombi[$combi]=$(( ${flipCoinCombi[$combi]} + 1 ))
                combi=""
        done
        getWinCombi
}

getWinCombi () {   
	for key in ${!flipCoinCombi[@]}
        do
                val=${flipCoinCombi[$key]}
                echo "$key $(( ($val*100) / $numFlip ))%"
        done | sort -k2 -nr | awk 'NR==1{print $1"           "$2}'
}

read -p "Number of times to flip a coin: " numFlip
while [ true ]
do
        echo -e "1. Singlet Combination \n 2. Doublet Combination \n 3. Triplet Combination"
        read option
        case $option in
                1) getFlipCoin 1
                break
                ;;
                2) getFlipCoin 2
                break
		;;
                3) getFlipCoin 3
                break
                ;;
                *)
                echo "Invalid Input!"
        esac
done
