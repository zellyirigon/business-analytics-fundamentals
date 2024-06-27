# Descriptive Analysis in R

setwd("D/business_analytics/BA_fundamentals")
getwd()

# Loading data
# stringsAsFactors = False, prevents the R interpreter from changing categorical 
# variables to numerical automatically
cars <- read.csv('data/cars.csv', stringsAsFactors = FALSE)

# Summary dataset structure
str(cars)
names(cars) <- c('Year', 'Model', 'Price', 'Mileage', 'Colour','Transmission')

### Exploring Numerical Variables ###

# Summary
summary(cars$Year)
str(cars)
cars$Year <- as.character(cars$Year) # changing the Year variable to type character
summary(cars$Year)
# summary for more than one column at the same time
summary(cars[c('Price','Mileage')])

# Mean
mean(cars$Price)
mean(cars$Mileage)

# Median
median(cars$Price)

# Range - Min and Max
range(cars$Price)

# Range difference (Max - Min)
diff(range(cars$Price))

# IQR - Interquantile Range
IQR(cars$Price)

# Quantile
quantile(cars$Price)

# Percentile 1% and 99%
quantile(cars$Price, probs = c(0.01, 0.99))

# Percentile with range of 20
quantile(cars$Price, seq(from = 0, to =1, by = 0.20))

# Boxplot - graph for one variable
# Good to identify outliers in the dataset
boxplot(cars$Price, main = 'Boxplot Prices', ylab = 'Price(R$)')
boxplot(cars$Mileage, main = 'Boxplot Mileage',ylab = 'Mileage(km)')

# Histograms 
hist(cars$Price, main = 'Histogram Prices', xlab = 'Price(R$)')
hist(cars$Mileage, main = 'Histogram Mileage', xlab = 'Mileage(km)')

#  Skewness & Kurtosis of Price variable
library(e1071)
skewness(cars$Price)
kurtosis(cars$Price)

# Variance and Standard Variation
mean(cars$Price)
var(cars$Price)
sd(cars$Price) # data dispersion

mean(cars$Mileage)
var(cars$Mileage)
sd(cars$Mileage)

# Exploring the relationship between the numerical variables

# Scatter Plot - Dispersion Graph
# To show more than one variable in the same time
plot(x = cars$Mileage, y = cars$Price,
     main = 'Scatterplot Mileage x Price',
     xlab = 'Mileage (km)',
     ylab = 'Price (R$)')

# Calculating the correlation coefficient
cor(cars$Mileage, cars$Price)
# Strong negative correlation

# Aggregation
?aggregate
str(cars$Year)
# Price mean by year
aggregate(cars$Price ~ cars$Year, FUN = mean, data = cars)

### Exploring Categorical Variables ###

# Frequency table - count of observations/elements from the dataset for each category of the selected variable
str(cars)
table(cars$Year)
table(cars$Model)
table(cars$Colour)

# Frequency table proportions - show the numbers in percentage
model_table <- table(cars$Model)
prop.table(model_table)

year_table <- table(cars$Year)
prop.table(year_table)

# Adjustment of results of proportions - Showing the frequency table in other format
colour_table <- table(cars$Colour)
colour_pct <- prop.table(colour_table) * 100
round(colour_pct, digits = 1)

year_table <- table(cars$Year)
year_pct <- prop.table(year_table) * 100
round(year_pct, digits = 2)

# Graphic summary and relationship between categorical variables
library(ggplot2)

# Total vehicles by transmission type
ggplot(data = cars, aes(x = as.factor(Transmission)))+
  geom_bar(aes(y = (..count..)))+ #count the elements in each category
  labs(x = 'Transmission', y = 'Count of Cars by Transmission Type')

str(cars)

# Proportion of Vehicles by Transmission Type and Colour 
ggplot(cars, aes(x = as.factor(Transmission))) +
  geom_bar(aes(y = (..count..)/sum(..count..))) +
  xlab('Transmission') +
  scale_y_continuous(labels = scales::percent, name = 'Proportion') +
  facet_grid(~Colour) + #divided the graph in pieces (in this case, by colour)
  theme(axis.text.x = element_text(angle = 45, hjust = 1))




