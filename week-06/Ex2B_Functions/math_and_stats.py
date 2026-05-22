import random
import math
import statistics

vals_1_100 = range(1,100)
vals_sample = random.sample(vals_1_100, 75)
vals_choices = random.choices(vals_1_100, k = 200)
radius = random.randint(3, 10)
pi = math.pi

# 75 sample values (w/o replacement)
sum_75 = sum(vals_sample)  # total added up
mean_75 = statistics.mean(vals_sample)  # average of sample; sum / total data points
median_75 = statistics.median(vals_sample)  # middle value

# 200 sample values (w/ replacement)
mean_200 = statistics.mean(vals_choices)
median_200 = statistics.median(vals_choices)
mode_200 = statistics.mode(vals_choices)  # value that appears the most
stdev_200 = statistics.stdev(vals_choices)  # spread of sample from mean
var_200 = statistics.variance(vals_choices)  # average of squared differences from mean

area_circle = pi * (radius ** 2)


print(f"""_Experimenting with a subset of integers 1-100:
Sum of 75 sample values from 1 to 100: {sum_75}
Average of 75 sample values: {mean_75:.2f}
Median of 75 sample values: {median_75}

_Experimenting with a superset of 200 values, integers 1-100: 
Average of 200 values: {mean_200:.2f}
Median of 200 values: {median_200}
Mode of 200 values: {mode_200}
Standard deviation of 200 values: {stdev_200:.2f}
Variance of 200 values: {var_200:.2f}

_Modeling a random circle: 
Radius = {radius}, area = {math.ceil(area_circle)} (rounded up to the nearest integer)
Radius = {radius}, area = {math.floor(area_circle)} (rounded down to the nearest integer)""")