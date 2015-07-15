#\bin\bash
SIN_LOCATION=../../sin/src/sin
DELAY_RATIO_FILE=delay_over_srtf.dat
SRTF_RATIO_FILE=percent_match_srtf.dat

NUM_TRIALS=1000
DIE_SIZE=10

echo '"num users" "Market" "Ideal TCP"' > $DELAY_RATIO_FILE
echo "#num users | ratio of srtf matching scenarios" > $SRTF_RATIO_FILE
for i in `seq 2 10`;
        do
        echo -n $i >> $DELAY_RATIO_FILE
        echo -n $i >> $SRTF_RATIO_FILE
        for user_type in " " "--round-robin-user"
            do
            $SIN_LOCATION --num-users=$i --num-trials=$NUM_TRIALS --die-size=$DIE_SIZE $user_type > temp

            cat temp | grep "average delay" | sed s/'average delay ratio'/' '/g | tr -d '\n' >> $DELAY_RATIO_FILE
            cat temp | grep "scenarios matched" | cut -d "(" -f2 | cut -d ")" -f1 >>$SRTF_RATIO_FILE
            done

        echo "" >> $DELAY_RATIO_FILE
        echo "" >> $SRTF_RATIO_FILE
        done
rm temp
