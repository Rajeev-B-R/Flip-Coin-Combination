echo "**********Welcome to Flip Coin Combination**********"

#!/bin/bash -x

number=$((RANDOM % 2))
if [ $number -eq 1 ]
then
	echo "Heads"
else
	echo "Tails"
fi

