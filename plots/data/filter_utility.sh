cat $1 | grep "had fake utility" | sed 's/[^0-9 .-]//g' | sort -rn > temp_srtf

cat $1 | grep "had utility" | sed 's/[^0-9 .-]//g' | sort -rn > temp_simulated
