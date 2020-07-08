echo "**********Welcome to Flip Coin Combination**********"

#!/bin/bash -x

declare -A coin
read -p "Number of times to flip a coin:" n
echo "Number of times coin to be flipped: $n"
echo -e "1.Singlet Combination\n2.Doublet Combination"
read -p "Enter option:" option
case $option in
	1)
	for (( i=0; i<$n; i++ ))
	do
		number=$((RANDOM % 2))
		if [ $number -eq 1 ]
		then
			coin['h']=$((${coin[h]} + 1))
		else
			coin['t']=$((${coin[t]} + 1))
		fi
	done
	echo "Head count: ${coin[h]}"
	echo "Tail count: ${coin[t]}"
	perc=`echo ${coin[h]} $n |  awk '{print ($1/$2)*100}'`
	echo "H ->" $perc "%"
	perc=`echo ${coin[t]} $n |  awk '{print ($1/$2)*100}'`
	echo "T ->" $perc "%"
	;;
	2)
	for((i=0; i<$n; i++))
        do
		number=$((RANDOM % 4 + 1))
		case $number in
				1) coin[tt]=$((${coin[tt]} + 1))
				;;
				2) coin[th]=$((${coin[th]} + 1))
				;;
				3) coin[ht]=$((${coin[ht]} + 1))
				;;
				4) coin[hh]=$((${coin[hh]} + 1))
				;;
		esac
	done
	echo "TT count: ${coin[tt]}"  
	echo "TH count: ${coin[th]}"
	echo "HT count: ${coin[ht]}"
	echo "HH count: ${coin[hh]}"
        perc=`echo ${coin[tt]} $n | awk '{print ($1/$2)*1oo}'`
        echo "TT ->" $perc "%"
        perc=`echo ${coin[th]} $n | awk '{print ($1/$2)*1oo}'`
        echo "TH ->" $perc "%"
        perc=`echo ${coin[ht]} $n | awk '{print ($1/$2)*1oo}'`
        echo "HT ->" $perc "%"
        perc=`echo ${coin[hh]} $n | awk '{print ($1/$2)*1oo}'`
        echo "HH ->" $perc "%"
esac
