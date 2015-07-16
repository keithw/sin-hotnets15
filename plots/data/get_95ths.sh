for i in 8 16 32;
        do
        for user_type in " " "--round-robin-user"
            do
            DATA_LOCATION=temp$i$user_type
            echo "calculating 95th percentiles for $i users $user_type"
            ./95th.sh $DATA_LOCATION
            done
        done
