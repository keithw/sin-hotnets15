#\bin\bash
SIN_LOCATION=../../sin/src/sin
DELAY_RATIO_FILE=delay_over_srtf.dat
#SRTF_RATIO_FILE=percent_match_srtf.dat

NUM_TRIALS=5
DIE_SIZE=40

echo '"num users" "SRTF" "Market" "Ideal TCP"' > $DELAY_RATIO_FILE
#echo '"num users" "Market" "Ideal TCP"' > $SRTF_RATIO_FILE
for i in 2 3 4 6 8 16 32;
        do
        echo -n "$i 1" >> $DELAY_RATIO_FILE
        for user_type in " " "--round-robin-user"
            do
            DATA_LOCATION=data/temp$i$user_type
            $SIN_LOCATION --num-users=$i --num-trials=$NUM_TRIALS --die-size=$DIE_SIZE $user_type --v > $DATA_LOCATION

            cat $DATA_LOCATION | grep "average delay" | sed s/'average delay ratio'/' '/g | tr -d '\n' >> $DELAY_RATIO_FILE
            done

        echo "" >> $DELAY_RATIO_FILE
        done
#rm temp
