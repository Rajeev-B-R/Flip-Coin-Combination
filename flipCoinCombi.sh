echo "**********Welcome to Flip Coin Combination**********"

#!/bin/bash -x

declare -A coin
read -p "Number of times to flip a coin:" n
echo "Number of times coin to be flipped: $n"

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
echo "h ->" $perc "%"
perc=`echo ${coin[t]} $n |  awk '{print ($1/$2)*100}'`
echo "t ->" $perc "%"
