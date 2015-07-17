#!/usr/bin/env python
from collections import defaultdict
import numpy as np
import sys

with open(sys.argv[1], 'r') as input_file:
    srtf_dict = defaultdict(list)
    simulated_dict = defaultdict(list)
    for line in input_file:
        srtf = line.count("in srtf schedule") > 0
        simulated = line.count("in simulated schedule") > 0
        if srtf or simulated:
            nums = []
            for word in line.split():
                try:
                    nums.append(float(word))
                except ValueError:
                    pass

            assert( len( nums ) == 2 )
            assert( not srtf or not simulated )
            if srtf:
                srtf_dict[int(nums[0])].append(nums[1])
            if simulated:
                simulated_dict[int(nums[0])].append(nums[1])
    with open("flow_benefits.dat", 'w') as output_file:
        output_file.write("\"flow size\" \"SRTF\" \"Market\"\n")
        for i in range(1,41):
            output_file.write(str(i) + " " + str(np.mean(srtf_dict[i])) + " " + str(np.mean(simulated_dict[i])) + "\n")
