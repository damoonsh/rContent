install.packages('Metrics')
install.packages('tidyverse')
install.packages('gapminder')

library(gapminder)
library(tidyverse)
library(Metrics)

plc <- read_csv('./Placement_Data_Full_Class.csv')

gapminder$gdpPercap <- log(gapminder$gdpPercap)# - mean(gapminder$gdpPercap)) / sd(gapminder$gdpPercap)
gapminder$lifeExp <- (gapminder$lifeExp - mean(gapminder$lifeExp)) / sd(gapminder$lifeExp)

p <- lm(gdpPercap ~ poly(lifeExp, 2, raw = TRUE), data = gapminder)
p2 <- lm(gdpPercap ~ poly(lifeExp, 5, raw = TRUE) + poly(year, 5, raw = TRUE), data = gapminder)

plot(predict(p, gapminder), gapminder$lifeExp)

#fit regression model
fit <- lm(gdpPercap ~ lifeExp, data = gapminder)

#create scatterplot
plot(gdpPercap ~ lifeExp, data=gapminder)

#add fitted regression line to scatterplot
abline(p)

# Model fitting in R, the Basics:

# Predicting gdpPerCap

# a. x = lifeExp

model1 <- lm( gdpPercap ~ lifeExp, data = gapminder)

summary(model1)

# b. x = pop

model2 <- lm( gdpPercap ~ pop, data = gapminder)

summary(model2)

# c. x = [year, pop, gdpPercap]

model3 <- lm(gdpPercap ~ pop + year + lifeExp, data = gapminder)

summary(model3)


# Making predictions

# The predict() function
preidctions <- predict(model1, gapminder)

# Validating models

# Making the prediction
model1_pred <- predict(model1, gapminder)
model2_pred <- predict(model2, gapminder)
model3_pred <- predict(model3, gapminder)

# getting the errors for each model
error <- c("MAE", "RMSE", "MSE")
error_model1 <- c(mae(model1_pred, gapminder$gdpPercap), rmse(model1_pred, gapminder$gdpPercap), mse(model1_pred, gapminder$gdpPercap))
error_model2 <- c(mae(model2_pred, gapminder$gdpPercap), rmse(model2_pred, gapminder$gdpPercap), mse(model2_pred, gapminder$gdpPercap))
error_model3 <- c(mae(model3_pred, gapminder$gdpPercap), rmse(model3_pred, gapminder$gdpPercap), mse(model3_pred, gapminder$gdpPercap))

errors <- data.frame(error, error_model1, error_model2, error_model3)
head(errors)


# Exercises: Run the following linear models on the given dataframe
plc <- read_csv('./Placement_Data_Full_Class.csv')


# 1. Run linear model with x = ssc_p and y = etest_p, then get the coefficients for each one.

# 2. Run linear model with x = ssc_p and y = mba_p, then get the coefficients for each one.

# 3. Run linear model with x = [ssc_p, etest_p] and y = mba_p, then get the coefficients for each one.

# 4. Run linear model with x = [hsc_p, etest_p] and y = degree_p, then get the coefficients for each one.

# 5. Run linear model with x = [hsc_p, etest_p, mba_p] and y = degree_p, then get the coefficients for each one.


