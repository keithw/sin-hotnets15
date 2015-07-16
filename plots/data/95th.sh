cat $1 | grep "in srtf schedule" | sed 's/[^0-9]//g' | sort -rn > temp
NUM_LINES=`wc -l < temp`
GET_LINE=$(echo "$(echo "$NUM_LINES * .05" | bc) / 1" | bc)
echo "95th for srtf is $(head -n $GET_LINE temp | tail -1)"

cat $1 | grep "in simulated schedule" | sed 's/[^0-9]//g' | sort -rn > temp
NUM_LINES=`wc -l < temp`
GET_LINE=$(echo "$(echo "$NUM_LINES * .05" | bc) / 1" | bc)
echo "95th for simulations is $(head -n $GET_LINE temp | tail -1)"
