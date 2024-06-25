# Exercise
# Considering the dataset below, calculate the elementary statistics and make the
# interpretation of skewness and kurtosis.

# dataset
set.seed(140)
data <- rnorm(n = 10000, mean = 55, sd = 4.5)
View(data)

# convert the data to a dataframe to facilitate manipulation
# Tip: always, in R and Python, put the data into a dataframe
dataset <- data.frame(data)
View(dataset)

#Rename column
colnames(dataset) <- c("Measure")
View(dataset)

# Elementary statistics
mean(dataset$Measure)
median(dataset$Measure)
var(dataset$Measure)
sd(dataset$Measure)

# Mode
# The mode is the value that appears most frequently in a data set. It is a measure of central tendency, 
# like the mean and median, but it specifically identifies the most common value
table(as.vector(dataset$Measure))
# this function round the values to be possible to calculate the mode
mode <- table(as.vector(round(dataset$Measure)))
# Catching the max value = mode
names(mode)[mode == max(mode)]


summary(dataset)

library(e1071)

skewness(data)
hist(data)
# In this case the mean is greater than the median. We have a symmetrical distribution of the data around the mean

kurtosis(data)
# We have a normal distribution of the data

# Important: -> Data distribution is symmetrical when the mean, median and mode values coincide.

# Using 'describe' function
# This function provides the calculation of all elementary statistics for my dataset model.
install.packages("psych")
library(psych)
describe(data)

#Histogram
library(ggplot2)

# Plot
ggplot(dataset, aes(x = dataset$Measure),binwidth = 20)+
  geom_histogram(aes(y = ..density..), fill = 'red', alpha = 0.5)+
  geom_density(colour = 'blue')+ xlab(expression(bold('Example Data')))+
  ylab(expression(bold('Density')))

# The histogram shows a Gaussian (Normal) Distribution
# It is a continuous probability distribution characterized by its bell-shaped curve. 
# It is symmetric about the mean, with the shape of the curve defined by two parameters: the mean (µ) and 
# the standard deviation (σ).