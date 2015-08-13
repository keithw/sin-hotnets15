#!/usr/bin/env python
from collections import defaultdict
import numpy as np
import sys

with open(sys.argv[1], 'r') as input_file:
    simulated_dict = defaultdict(list)
    for line in input_file:
        srtf = False
        simulated = line.count("cost+flow_size") > 0
        if srtf or simulated:
            nums = []
            for word in line.split():
                try:
                    nums.append(float(word))
                except ValueError:
                    pass

            assert( len( nums ) == 2 )
            assert( not srtf or not simulated )
            if simulated:
                simulated_dict[int(nums[1])].append(nums[0])
    with open("excess_costs.csv", 'w') as output_file:
        output_file.write("\"flow size\", \"Market extra cost\"\n")
        for i in range(1,41):
            output_file.write(str(i) + ", " + str(np.mean(simulated_dict[i])) + "\n")
