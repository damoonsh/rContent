library(tidyverse)
library(ggplot2)

y_true <- rnorm(10, 0, 5)
y_pred <- y_true + rnorm(10, 1, 5e-1)

error <- y_true - y_pred

data.frame(y_true, y_pred, error)


# MAE
mae <- function(y_true, y_pred) {
  sum(abs(y_true - y_pred)) / NROW(y_true)
}

# MSE
mse <- function(y_true, y_pred) {
  sum((y_true - y_pred) ** 2 / NROW(y_true))
}

# RMSE
rmse <- function(y_true, y_pred) {
  sqrt(sum((y_true - y_pred) ** 2 / NROW(y_true)) )
}

data.frame(mae=mae(y_true, y_pred), mse=mse(y_true, y_pred), rmse=rmse(y_true, y_pred))



x1 <- rnorm(100, 1, 1e-2)
x2 <- rnorm(100, 2, 1)
x3 <- rnorm(100, 3, 1e-1)
y_true <- x1 * 2 + x2 * 5 - 3 * x3 + rnorm(100, 1, 0.5)

d <- data.frame(x1,x2,x3,y_true)

write.csv(d, file='Sample.csv')

s <- read_csv('./Sample.csv')

y_pred_1 <- 1 * x1 + 1 * x2 + 1 * x3
y_pred_2 <- 2 * x1 + 2 * x2 - 1 * x3
y_pred_3 <- 3 * x1 + 3 * x2 - 2 * x3
y_pred_4 <- 2 * x1 + 5 * x2 - 3 * x3

preds <- data.frame(s$y_true, y_pred_1,y_pred_2,y_pred_3,y_pred_4)
head(preds, 5)


error <- c("MAE", "MSE", "RMSE")
pred_1_error <- c(mae(s$y_true, y_pred_1), mse(s$y_true, y_pred_1), rmse(s$y_true, y_pred_1))
pred_2_error <- c(mae(s$y_true, y_pred_2), mse(s$y_true, y_pred_2), rmse(s$y_true, y_pred_2))
pred_3_error <- c(mae(s$y_true, y_pred_3), mse(s$y_true, y_pred_3), rmse(s$y_true, y_pred_3))
pred_4_error <- c(mae(s$y_true, y_pred_4), mse(s$y_true, y_pred_4), rmse(s$y_true, y_pred_4))

errors <- data.frame(error, pred_1_error, pred_2_error, pred_3_error, pred_4_error)
head(errors, 10)

