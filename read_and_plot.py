import matplotlib.pyplot as plt

f = open('log.txt', "r")
sin_vals = []
indices = []
i = 0
for line in f:
    try:
        val = int(line.strip('\n'))
        decoded = int(val)/100
        sin_vals.append( decoded - 1)
        indices.append(i)
        i = i + 1
    except:
        pass

rounded = [round(x,2) for x in sin_vals]
print(rounded)
plt.plot(indices,sin_vals)
plt.show()
