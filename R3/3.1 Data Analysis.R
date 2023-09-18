# Importing the needed libraries
library(ggplot2)
library(tidyverse)
library(lubridate)

# Importing the Tesla stock price data from 2008 to 2018
# https://www.kaggle.com/timoboz/tesla-stock-data-from-2010-to-2020
tsla <- read_csv('./TSLA.csv')
tsla$Date <- ymd(tsla$Date) # Changing type from character to Date

# Housing dataset
housing_df <- read_csv("https://www.dropbox.com/s/tvvtf9dwjufo7os/housing_train.csv?dl=1")

# Exploratory Data Analysis

"
  - Going over the features of the data
  - Examining missing values
  - Trying to see if there are any correlations between different columns within a dataframe
"

# Exercise: Answers the questions for tsla dataset.

# 1. What are the column names in the tsla? 


# 2. How many columns are there? (return the number of columns)


# 3. Are there any missing values within the tsla dataframe? (HINT: Try using "anyNA" function)


# 4. Name 2 columns that are numerical.


# 5. Name 2 columns that are categorical.


# 6. Maximum value in Volume column


# 7. Minimum value in Low column 


# 8. Median of High column



# Augmenting features
"
  - Adding descriptive features to the dataset using other columns within the dataset
  - In stock price analysis, diff represents the difference between the High and Low 
    price each day
"

# Exercise: What are some insights that we can gain from the graph below?



# Exercise: What does the graph below show?


# Exercise: How does the code below differ with the other two code segments?



# Multiple line Graph
"
  - Given that there might be multiple attributes that we are interested in, 
    being able to graph multiple y for the same x is important.
  - In time series analysis, Time is the x value and other features will be the y.
"
tsla %>%
  mutate(diff=abs(High - Low)) %>% # Making the diff column
  ggplot(aes(x=Date)) +
  geom_point(aes(y=High), color='blue') +
  geom_line(aes(y=Low), color='red') +
  geom_line(aes(y=diff), color='green') +
  xlab("Date") + ylab("Attributes")

# Exercise: 
"
  a. Graph the tsla difference between high and low price (high-low) over time 
  where the absolute difference between High and Low is bigger than 30. 
  (HINT: use pipes, abs() function provides absolute value)
" 


# Normalizing     (Reference: https://www.codecademy.com/articles/normalization#:~:text=Min%2Dmax%20normalization%20is%20one,decimal%20between%200%20and%201.&text=That%20data%20is%20just%20as%20squished%20as%20before!)
"
  - Normalizing is a technique used to make data more understandable
  - It is one of the most important preprocessing steps (assuming that is applicable)
"
tsla %>% 
  mutate(open_norm=(Open-mean(Open)) / sd(Open)) %>% # Making norm_open column
  ggplot(aes(x=Date, y=open_norm)) + geom_line()

# Exercise: Using the provided methods, normalize the data.

# 1. Normalize the High column with formula norm(col) = (col - mean(col)) / sd(col)



# 2. Normalize the Volume column with formula norm(col) = (col - mean(col)) / sd(col)


# 3. Make new columns norm_low, norm_high, and norm_vol using columns Low and High with the formula in (1) and Volume with formula in (2). (Hint: use mutate)


# 4. Graph the the normalized columns in one graph using independent geom_lines.


# Missing values
"
  - Data is gathered in various ways which surveying is one of them. 
    When the participants don't answer questions there will be blank entries 
    within the dataframe.
  - The balnk entries within the dataframe are filled with NA
  - They are other reasons into why one entry is filled with NA.
"   
# NA (not available/applicable): We cannot perform any kind of arithmetic or 
# logical operations:
NA + 1
NA > 5 
NA == TRUE 


# Feature Engineering

"The description of features for housing dataset can be found at this link 

https://www.kaggle.com/c/house-prices-advanced-regression-techniques/data 


Case Study: Explore the columns with NA values and talk about why they are 
missing and what are the possible ways to impute them:
  
1. Get the columns with missing values.
2. Count the number of missing values for each column
3. Go over some of the important features and discuss their missing values
"
# 1
missing_cols <- names(housing_df)[sapply(housing_df, anyNA)]

# 2
na_count <- sapply(housing_df[,missing_cols], function(y) sum(length(which(is.na(y)))))
na_count <- data.frame(na_count)
na_count <- arrange(na_count, -na_count)
?which
#3
'
Alley: There are three unique values for the Alley column: Grvl (Gravel), Pave (Paved), and NA (No alley access). 
Hence, it is important to read the data description since in the case of Alley, NA indicates that the house does not have alley access.

LotFrontage: In the description of the data it is written: "Linear feet of street connected to property", it is a discrete variable and NA means that the data is missing because it should have had zero if the property was not connected to the street.

BsmtQual: "Evaluates the height of the basement", NA means that there is no Basement, this is an important information to consider while imputing the data.
'

"Data Imputation: 

- replacing NA with a value to be able to process the data
- Mean: Imputing the NA with mean of the column
- Mode: Imputing the NA with mode of the column
- Constant: Impute the NA with a constant value
- Using algorithms to predict the missing values (k-means, regression)
"

# Impute the LotFrontage column with the column's mean:

# 1. Get the mean
mean_LotFrontage <- mean(housing_df$LotFrontage, na.rm = T)


# 2. Replace it using the replace_na() function of tidyverse
housing_df$LotFrontage <- replace_na(housing_df$LotFrontage, mean_LotFrontage)


# Inquiry Question: Why do we have na.rm in the mean function in step 1?
" Since they are NA values within the entry, if we do not remove them while 
getting the average, we are going to get NA since arithmetics are not defined for NA values"


# Impute GarageYrBlt column with the column's median value

# 1. Get the median
median_GarageYrBlt <- median(housing_df$GarageYrBlt, na.rm = TRUE)


# 2. Replace and rewrite the column
housing_df$GarageYrBlt <- replace_na(housing_df$GarageYrBlt, median_GarageYrBlt)


# Impute the Alley column's NA values with something more meaningful such as 'none'
housing_df$Alley <- replace_na(housing_df$Alley, 'none')



# Exercise

# 1. Use the mean of MasVnrArea column to encode its missing values.

# 2. Impute the missing vales in BsmtFinType1 with 'none'.'

# 3. Replace NA s in the electrical column with median





