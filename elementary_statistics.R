# Data set
install.packages("mlbench")
library(mlbench)
data("PimaIndiansDiabetes")
View(PimaIndiansDiabetes)

# Improving the dataset name
dataset <- PimaIndiansDiabetes
View(dataset)

#? + function name -> helps to understand anything in R language
?dim

# Dimensions and data types
dim(dataset)
str(dataset)
# data frame means table
# observations = lines 
# variables = columns 

summary(dataset)
# using $ allows to get a specific variable(column)
summary(dataset$age)

# MEAN
# MEAN of a variable = sum of values divided by data count
mean(dataset$age)
# Take care about missing values in the dataset
# na.rm remove all missing values
mean(dataset$age, na.rm = TRUE)
is.na(dataset$age)

# MEDIAN
# MEDIAN of a variable = middle value, when the dataset is sorted in ascending order.
median(dataset$age)

# QUARTILE
# Information about the limits of the data
# The first quartile or lower quartile = represents the value that cuts off the first 25% 
# when data is sorted in ascending order
# The second quartile or median = represents the value that cuts off the first 50%
# The third quartile or higher quartile = represents the value that cuts off the first 75%
quantile(dataset$age)

# When I need to calculate the percentile, c is a R function creates a vector
quantile(dataset$age, c(.32, .57, .98))

# RANGE(interval)
# Range of a variable is the difference of the biggest and lowest data values
# It's the measure of how far the data spreads
range(dataset$age)

# INTERQUARTILE RANGE
# Inerquartile range is the difference of the highest and lowest quartiles
# It's the measure of how far the average part of data spreads
IQR(dataset$age)

# VARIANCE
# It's the numeric average of how the data values are distributed around the mean
var(dataset$age)

# STANDARD DEVIATION
# Standard deviation of a variable is the square root of its variance
# Standard deviation measure the dispersion of its data(how far the data is from the mean)
# The greater the standard deviation, the greater the dispersion of the data (i.e. the further the data is from the mean)
# The smaller the standard deviation, the smaller the dispersion of the data (i.e. the closer the data is from the mean)
sd(dataset$age)

# COVARIANCE
# The covariance of two variables x and y in a data set, measures how the variables are linearly related
# A positive covariance indicates a positive linear relationship between the variables, and a negative variance indicates 
# the opposite.
cov(dataset$age, dataset$glucose)

# CORRELATION COEFFICIENT
# The correlation coefficient of two variables in a dataset is equal to their covariance 
# divided by the product of their individual standard-deviations. It's the normalized measure of how linearly
# they are related. The values range from -1 to +1. Values close to zero indicate that there is no correlation.
# The value of -1 indicates strong negative correlation and +1 strong positive correlation.
cor(dataset$age, dataset$glucose)
# Calculate the correlation among several observations(columns)
correlations <- cor(dataset[,1:8])
print(correlations)

# Creating a graph to show the correlations among all observations in the dataset
install.packages("corrplot")
library(corrplot)
corrplot(correlations, method = "circle")

# Skewness & Kurtosis
install.packages("e1071")
library(e1071)

# Statistical Term: Skewness specifically refers to the measure of asymmetry in a statistical distribution.
# Direction of Tail: Skewness indicates whether the data tails off more to the left or the right.
# Positive Skewness (Right-Skewed): The tail on the right side of the distribution is longer or fatter than 
# the left side. The mean is typically greater than the median.
# Negative Skewness (Left-Skewed): The tail on the left side of the distribution is longer or fatter than the 
# right side. The mean is typically less than the median.

# Skewness Interpretation
# Highly Skewed (|Skewness| > 1): Significant asymmetry with long tails.(highly distorted data distribution)
# Examples: <-1 (Highly negatively skewed), >1 (Highly positively skewed).

# Moderately Skewed (|Skewness| between 0.5 and 1): Noticeable asymmetry but less extreme.
# Examples: -1 to -0.5 (Moderately negatively skewed), 0.5 to 1 (Moderately positively skewed).

# Approximately Symmetrical (|Skewness| between -0.5 and 0.5): Relatively balanced distribution of the data around the mean.
# Examples: -0.5 to 0.5 (Symmetrical distribution).

# Direction of Tail: Skewness indicates whether the data tails off more to the left or the right.
# Positive Skewness (Right-Skewed): The tail on the right side of the distribution is longer or fatter than the left side.
# # The mean is typically greater than the median.
# Negative Skewness (Left-Skewed): The tail on the left side of the distribution is longer or fatter than the right side. 
# # The mean is typically less than the median.

# Important: -> Data distribution is symmetrical when the mean, median and mode values coincide.
?skewness
skewness(dataset$age)
hist(dataset$age)

skewness(dataset$pressure)
hist(dataset$pressure)
summary(dataset$pressure)

# Kurtosis
# kurtosis is a valuable measure for understanding the distribution of data, particularly in terms of the likelihood and 
# impact of extreme values or outliers.

# #Types of Kurtosis
# Mesokurtic (Kurtosis ≈ 3):
# Description: This is the kurtosis of a normal distribution. A mesokurtic distribution has tails similar to a normal distribution.
# Implication: Data is distributed in a way that the likelihood of extreme values (outliers) is similar to that of a normal distribution.
# Example: Standard normal distribution.

# Leptokurtic (Kurtosis > 3):
# Description: A leptokurtic distribution has a higher peak and fatter tails than a normal distribution.
# Implication: There is a higher probability of extreme values (outliers). The data clusters more around the mean and also has more pronounced tails.
# Example: Distributions of asset returns in finance, where there are frequent small changes and occasional large swings.

# Platykurtic (Kurtosis < 3):
# Description: A platykurtic distribution has a lower peak and thinner tails than a normal distribution.
# Implication: There is a lower probability of extreme values (outliers). The data is more evenly spread around the mean, indicating a more uniform distribution.
# Example: Uniform distribution, where each outcome is equally likely.

# #Interpreting Kurtosis
# Excess Kurtosis: Often, kurtosis is reported as "excess kurtosis," which is the kurtosis value minus 3 (the kurtosis of a normal distribution). This standardizes the interpretation:
# Excess Kurtosis > 0: Leptokurtic distribution, indicating fatter tails.
# Excess Kurtosis = 0: Mesokurtic distribution, similar to a normal distribution.
# Excess Kurtosis < 0: Platykurtic distribution, indicating thinner tails.

# #Importance in Data Analysis
# Risk Assessment: In finance, higher kurtosis indicates a higher risk of extreme returns (both positive and negative).
# Model Fit: Understanding kurtosis helps in determining how well a distribution fits the data. Data with high kurtosis may require different statistical models compared to data with low kurtosis.
# Outlier Detection: High kurtosis can signal the presence of outliers, which might need special attention in data analysis.
kurtosis(dataset$age)
hist(dataset$age)

kurtosis(dataset$pressure)
hist(dataset$pressure)

# END