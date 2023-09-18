# Introduction to Dataframes 
d <- data.frame(courses=c("ECN340", "MTH108", "CPS109", "ECN702", "ITM320"),
                rates=c(9.7, 5.4, 7.8, 6.5, 8.9))
d

dataframe[row, col]


d[1, 1]


d[1:3, ]


d[1:4,2]

# Run the following line of code to assign this dataset to a variable name "housing_df"
library(tidyverse)
housing_df <- read_csv("https://www.dropbox.com/s/tvvtf9dwjufo7os/housing_train.csv?dl=1")

# Indexing Exercises:

# 1. Retrieve rows 10-15 of the first 5 columns in housing_df
housing_df[10:15, 0:5]

# 2. Display the value in the thirty-fifth row of the eighteenth column of housing_df
housing_df[35, 18]


unique(d$courses)

sd(d$rates, na.rm = T)

sd(housing_df$LotFrontage, na.rm = T)

mean(housing_df$LotFrontage, na.rm = T)

nrow(housing_df)
ncol(housing_df)

nchar("Michael")
("M", "I", "C")

# Exploring Dataframes Exercises:

# 1. What is the average of SalePrice column in housing_df?
mean(housing_df$SalePrice, na.rm = T)
# 2. How many rows and columns does the housing_df have?
nrow(housing_df)
ncol(housing_df)

dim(housing_df)
# 3. How many unique values are in the MSSubClass column? 
#(CHALLENGE: Try and see if you can use a second function to sell you the total number instead of counting
length(unique(housing_df$MSSubClass))



