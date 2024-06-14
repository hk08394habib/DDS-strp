#!/usr/bin/env python3
import math

min_freq = 1e3
N = 8 # bits of precision

maximum_value = int(2**N / 4) #Pick up one quarter
for i in range(maximum_value): #You generate a quarter of the sin lookup values
    val = i * 90/2**N #You increment each time by 90/2**N
    sin_val = round(math.sin(2 * math.pi * max_freq * val), 3)
    if (sin_val >= 0):
        sign = ""

    else:
        sign = "-"

    sin_val = abs(sin_val)
    string = "8'b" + bin(i)[2:] + ": " + sign + "8'sd" + str(int(sin_val * 1000)) + ";"
    print(string)





