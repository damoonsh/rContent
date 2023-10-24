# Setup  #start at 7:15 pm
library(ggplot2)
library(tidyverse)

# Creating dataframes using data.frame() object
courses <- c("ECN340", "MTH108", "CPS109", "ECN702", "ITM320")
rates <- c(9.7, 5.4, 7.8, 6.5, 8.9)
# Course Rating dataframe
d <- data.frame(courses, rates)

housing_df <- read_csv("https://www.dropbox.com/s/tvvtf9dwjufo7os/housing_train.csv?dl=1")
playground <- read_csv("https://www.dropbox.com/s/1zz4a82514avdeq/playground_injuries.csv?dl=1")


" 1. Select
  - function used for subsetting
  - easier to apply logical statements
  - alternative to previous methods
  - select(df, A, B ,C) -> get columns A, B, and C from the dataframe df
  - select(df, A:C): Select all variables from A to C from df dataset.
  - select(df, A:F, -C): All columns from to A to F excluding C
  - select(df, contains(str)) -> Columns that contain str in their name
"

# Selecting "SalePrice" and "MSSubClass" columns

# Selecting columns from MSSubClass to LotFrontage

# Selecting columns from MSSubClass to LotFrontage excluding MSZoning

# Selecting all the columns where there contain bsmt in their name

# Various combinations of these options are possible
# Exercise: Use selection to get the following subsets of housing_df

# 1: 7th to 12th Column


# 2: 7th to 12th Column excluding columns 8 and Alley


# 3: Columns GarageType to GarageCond


# 4: Columns GarageType to GarageCond exclusive (excluding GarageType and GarageCond)


# 5: Columns with bsmt in their names (try not to look at the prior example)



" 2. filter(df, condition):
      - df: dataset used to filter the data
      - condition: Condition used to filter the data
    
    multiple conditions:
        - filter(df, condition1 | condition2)
        - filter(df, condition1 & condition2)
    
    Note: Negation is also possible within this notation.
"
# Filter for houses with over a 3 in overall quality


# Filter for houses with above median sale prices


# Exercise 1: filter for rows with MSSubclass of higher than 20 (HINT: Make sure the variable name is correct)


# Exercise 2: MSSubclass of higher than 20 and SalePrice below average



# Exercise 3: MSSubclass anything but 60, not a Low LandContour (HINT: To see exact spelling of low use unique function)



# Exercise 4: Entries where SalePrice is higher than average or Neighborhood is BrDale




# ------------------------------------------------------
"  3. Mutate: Mutating entries within the dataframe
      - mutate(df, new_column=operation(column1, column2, ...))
"
# Adding log_sale_price column which is the log of the SalePrice columns
housing_df <- mutate(housing_df, log_sale_price = log(SalePrice))
# Create a new column in housing_df called **total_sf** which adds the square feet the basement, first, and second floor.
housing_df <- mutate(housing_df, total_sf =  TotalBsmtSF + `1stFlrSF`  + `2ndFlrSF`)
# ---------------------------------------------------------
"  4.Pipes: 
  Run the series of commands below to obtain a dataframe containing columns 
  SalePrice ,log_SalePrice, and MSZoning Where the SalePrice values are greater 
  than the average of SalePrice value.
"
# 3 steps:
# Select SalePrice and MSZoning columns
step1 <- select(df, SalePrice, MSZoning) 
# Keep rows where SalePrice is higher than the average
step2 <- filter(step1, SalePrice > mean(SalePrice)) 
# Make a new column called log_SalePrice where it is the log of SalePrice column
step3 <- mutate(step2, log_SalePrice=log(SalePrice)) 

# Notice: Each time you are passing the preceding dataframe (first df, then step1...)
step3

pipe_way <- housing_df %>%
  select(SalePrice, MSZoning) %>%
  filter(SalePrice > mean(SalePrice)) %>%
  mutate(log_SalePrice=log(SalePrice))
pipe_way
"
      - Breaking down the sequence of actions in one expression/statement
      - It is convenient to use the pipeline operator when you have more than one step.
      
    Case Study: We are interested to know the effect of remodeling the house
    on the houses higher than 123e3 price value:
        1. Getting the rows with price higher than 123e3
        2. Add new column called years_since_remodel
        3. Plot two variables
"



" 5. Arrange: Sort dataframe based on given columns
    - arrange(A): Ascending sort of variable A
    - arrange(A, B): Ascending sort of variable A and B
    - arrange(desc(A), B)/arrange(-A, B): Descending sort of variable A and 
      ascending sort of B
"

# Ascending sort of housing dataframe based on sale_price
housing_df %>% arrange(SalePrice) # Sorting housing dataframe based on descending sale_price
housing_df %>% arrange(-SalePrice)


read.csv(file.choose())



