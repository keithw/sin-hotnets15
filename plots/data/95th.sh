cat $1 | grep "in srtf schedule" | sed 's/[^0-9]//g' | sort -rn > temp_srtf
NUM_LINES=`wc -l < temp_srtf`
GET_LINE=$(echo "$(echo "$NUM_LINES * .05" | bc) / 1" | bc)
# 95th for srtf is 
echo -n " $(head -n $GET_LINE temp_srtf | tail -1) "

cat $1 | grep "in simulated schedule" | sed 's/[^0-9]//g' | sort -rn > temp_simulated
NUM_LINES=`wc -l < temp_simulated`
GET_LINE=$(echo "$(echo "$NUM_LINES * .05" | bc) / 1" | bc)
# 95th for simulations is 
echo -n "$(head -n $GET_LINE temp_simulated | tail -1)"
