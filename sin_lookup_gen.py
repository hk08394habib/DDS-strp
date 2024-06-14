#!/usr/bin/env python3
import math
import matplotlib.pyplot as plt

shifted_sin_values = []
direct_sin_values = []

min_freq = 1e3
max_period = 1/min_freq #what we want in total, the interface we will be presenting
N = 8 # bits of precision

maximum_value = int(2**N / 4) #Pick up one quarter of the samples (possible addresses) we get from phase accumulator. So if we have 8 bit addresses, internally we only store 6bit addresses and compute the rest on the fly
for i in range(maximum_value): #You generate a quarter of the sin lookup values
    val = i * max_period/2**N #sample the quarter period
    sin_val = round(math.sin(2 * math.pi * min_freq * val),20)

    sin_val = abs(sin_val)
    calculated_sin = int((sin_val+1)*100)
    string = "6'b" + bin(i)[2:] + ": " + "intermediate_value = 8'd" + str(calculated_sin) +  ";"
    print(string)
    shifted_sin_values.append((val, calculated_sin))
    direct_sin_values.append((val, sin_val))


unwrapped_list = [(x[0], (x[1])/100 - 1) for x in shifted_sin_values]
#plt.scatter(*zip(*unwrapped_list))
plt.scatter(*zip(*shifted_sin_values))
plt.show()



#plt.scatter(*zip(*shifted_sin_values))
#plt.show()
