# Data set
install.packages("mlbench")
library(mlbench)
data("PimaIndiansDiabetes")
View(PimaIndiansDiabetes)

# Improving the data set name
dataset <- PimaIndiansDiabetes
View(dataset)

#? + function name -> helps to understand anything in R language
?dim

# Dimensions and data types
dim(dataset)
str(dataset)
# data frame means table
# observations = lines inside the data set
# variables = columns inside the data set

summary(dataset)
# using $ allows to get a specific variable(column)
summary(dataset$age)

# MEAN
# MEAN of a variable = sum of values divided by data count
mean(dataset$age)
# Take care about missing values in the data set
mean(dataset$age, na.rm = TRUE)
is.na(dataset$age)

# MEDIAN
# MEDIAN of a variable = middle value, when the data set is sorted in ascending order.
median(dataset$age)

# QUARTILE
# Information about the limits of the data
# The first quartile or lower quartile = represents the value that cuts off the first 25% 
# when data is sorted in ascending order
# The second quartile or median = represents the value that cuts off the first 50%
# The third quartile or higher quartile = represents the value that cuts off the first 75%
quantile(dataset$age)
# When I need to calculate the percentile 
# c is a R function creates a vector
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
# The correlation coefficient of two variables in a data set is equal to their covariance 
# divided by the product of their individual standard-deviations. It's the normalized measure of how linearly
# they are related. The values range from -1 to +1. Values close to zero indicate that there is no correlation.
# The value of -1 indicates strong negative correlation and +1 strong positive correlation.
cor(dataset$age, dataset$glucose)
# Calculate the correlation among several observations(columns)
correlations <- cor(dataset[,1:8])
print(correlations)

# Creating a graph to show the correlations among all observations in the data set
install.packages("corrplot")
library(corrplot)
corrplot(correlations, method = "circle")
