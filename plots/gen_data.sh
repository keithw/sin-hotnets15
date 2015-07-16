SIN_LOCATION=../../sin/src/sin
DELAY_RATIO_FILE=delay_over_srtf.dat
NUM_ROUNDTRIPS_FILE=num_roundtrips.dat

NUM_TRIALS=100
START_TIME_DIE_SIZE=40
FLOW_LENGTH_DIE_SIZE=40

echo '"num users" "Optimal" "SIN" "ignore me" "Rate Sharing"' > $DELAY_RATIO_FILE
echo '"num users" "Mean market round trips per user" "ignore"' > $NUM_ROUNDTRIPS_FILE
for i in 2 3 4 6 8 16 32;
        do
        echo -n "$i" >> $DELAY_RATIO_FILE
        echo -n "$i" >> $NUM_ROUNDTRIPS_FILE 
        for user_type in " " "--round-robin-user"
            do
            DATA_LOCATION=data/temp$i$user_type
            $SIN_LOCATION --num-users=$i --num-trials=$NUM_TRIALS --start-time-die-size=$START_TIME_DIE_SIZE --flow-length-die-size=$FLOW_LENGTH_DIE_SIZE $user_type --vv > $DATA_LOCATION

           cat $DATA_LOCATION | grep "average flow duration for srtf" | sed s/'average flow duration for srtf'/' '/g | tr -d '\n' >> $DELAY_RATIO_FILE
           cat $DATA_LOCATION | grep "average flow duration for trials" | sed s/'average flow duration for trials'/' '/g | tr -d '\n' >> $DELAY_RATIO_FILE

           cat $DATA_LOCATION | grep "average number of roundtrips per user" | sed s/'average number of roundtrips per user'/' '/g | tr -d '\n' >> $NUM_ROUNDTRIPS_FILE 
            done

        echo "" >> $DELAY_RATIO_FILE
        echo "" >> $NUM_ROUNDTRIPS_FILE 
        done
#rm temp
