echo "**********Welcome to Flip Coin Combination**********"

#!/bin/bash -x

declare -A coin
read -p "Number of times to flip a coin:" n
echo "Number of times coin to be flipped: $n"

sortCombi () {
	for i in ${!coin[@]}
        do
                if [[ ${coin[$i]} -ge $flag ]]
        then
                flag=$((${coin[$i]}))
                winCombi=$i
                fi
        done
        coin[perc]=`echo $flag $n | awk '{print ($1/$2)*100}'`
        echo "$winCombi is the winning combination. Percent: ${coin[perc]} %"
}

echo -e "1.Singlet Combination\n2.Doublet Combination\n3.Triple Combination"
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
	sortCombi
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
	sortCombi
	;;
	3)
	for((i=0; i<$n; i++))
        do
                number=$((RANDOM % 8 + 1))
                case $number in
                                1) coin[ttt]=$((${coin[ttt]} + 1))
                                ;;
                                2) coin[tth]=$((${coin[tth]} + 1))
                                ;;
                                3) coin[tht]=$((${coin[tht]} + 1))
                                ;;
                                4) coin[thh]=$((${coin[thh]} + 1))
                                ;;
				5) coin[htt]=$((${coin[htt]} + 1))
                                ;;
                                6) coin[hth]=$((${coin[hth]} + 1))
                                ;;
                                7) coin[hht]=$((${coin[hht]} + 1))
                                ;;
                                8) coin[hhh]=$((${coin[hhh]} + 1))
                                ;;
                esac
        done
	echo "TTT count: ${coin[ttt]}"
        echo "TTH count: ${coin[tth]}"
        echo "THT count: ${coin[tht]}"
        echo "THH count: ${coin[thh]}"
	echo "HTT count: ${coin[htt]}"
        echo "HTH count: ${coin[hth]}"
        echo "HHT count: ${coin[hht]}"
        echo "HHH count: ${coin[hhh]}"
	perc=`echo ${coin[ttt]} $n | awk '{print ($1/$2)*1oo}'`
        echo "TTT ->" $perc "%"
        perc=`echo ${coin[tth]} $n | awk '{print ($1/$2)*1oo}'`
        echo "TTH ->" $perc "%"
        perc=`echo ${coin[tht]} $n | awk '{print ($1/$2)*1oo}'`
        echo "THT ->" $perc "%"
        perc=`echo ${coin[thh]} $n | awk '{print ($1/$2)*1oo}'`
        echo "THH ->" $perc "%"
	perc=`echo ${coin[htt]} $n | awk '{print ($1/$2)*1oo}'`
        echo "HTT ->" $perc "%"
        perc=`echo ${coin[hth]} $n | awk '{print ($1/$2)*1oo}'`
        echo "HTH ->" $perc "%"
        perc=`echo ${coin[hht]} $n | awk '{print ($1/$2)*1oo}'`
        echo "HHT ->" $perc "%"
        perc=`echo ${coin[hhh]} $n | awk '{print ($1/$2)*1oo}'`
        echo "HHH ->" $perc "%"
	sortCombi
	;;
esac
