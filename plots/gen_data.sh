SIN_LOCATION=../../sin/src/sin
DELAY_RATIO_FILE=delay_over_srtf.dat
NUM_UPDATES_FILE=num_market_updates.dat

NUM_TRIALS=1000
START_TIME_DIE_SIZE=40
FLOW_LENGTH_DIE_SIZE=40

echo '"num users" "SRTF" "SIN" "95th SRTF" "95th SIN" "SRTF again" "Rate Sharing" "95th SRTF again" "95th Rate Sharing" ' > $DELAY_RATIO_FILE
echo '"num users" "Mean market updates per packet" "ignore"' > $NUM_UPDATES_FILE
for i in 2 3 4 6 8 16 32;
        do
        echo -n "$i" >> $DELAY_RATIO_FILE
        echo -n "$i" >> $NUM_UPDATES_FILE 
        for user_type in " " "--round-robin-user"
            do
            DATA_LOCATION=data/temp$i$user_type
            TIMES_TO_RUN=$(($NUM_TRIALS*32/$i))
            $SIN_LOCATION --num-users=$i --num-trials=$TIMES_TO_RUN --start-time-die-size=$START_TIME_DIE_SIZE --flow-length-die-size=$FLOW_LENGTH_DIE_SIZE $user_type --vv > $DATA_LOCATION

           cat $DATA_LOCATION | grep "average flow duration for srtf" | sed s/'average flow duration for srtf'/' '/g | tr -d '\n' >> $DELAY_RATIO_FILE
           cat $DATA_LOCATION | grep "average flow duration for trials" | sed s/'average flow duration for trials'/' '/g | tr -d '\n' >> $DELAY_RATIO_FILE

           cat $DATA_LOCATION | grep "average number of market updates per packet" | sed s/'average number of market updates per packet'/' '/g | tr -d '\n' >> $NUM_UPDATES_FILE 

            ./data/95th.sh $DATA_LOCATION >> $DELAY_RATIO_FILE
            done

        echo "" >> $DELAY_RATIO_FILE
        echo "" >> $NUM_UPDATES_FILE 
        done
#rm temp
