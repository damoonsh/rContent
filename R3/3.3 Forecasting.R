library('fpp2')

# Simple Exponential Smoothing
oildata <- window(oil, start=1996)

autoplot(oildata) +
  ylab("Oil (millions of tonnes)") + xlab("Year")

# Estimate parameters
fc <- ses(oildata, h=5)

# Accuracy of one-step-ahead training errors
round(accuracy(fc),2)

autoplot(fc) +
  autolayer(fitted(fc), series="Fitted") +
  ylab("Oil (millions of tonnes)") + xlab("Year")

# Trend Methods
# Holt's models:
# 1. Holt's Linear trend method
# 2. Damped Holt's trend method

air <- window(ausair, start=1990)


fc <- holt(air, h=15)
fc2 <- holt(air, damped=TRUE, phi = 0.9, h=15)

autoplot(air) +
  autolayer(fc, series="Holt's method", PI=FALSE) +
  autolayer(fc2, series="Damped Holt's method", PI=FALSE) +
  ggtitle("Forecasts from Holt's method") + xlab("Year") +
  ylab("Air passengers in Australia (millions)") +
  guides(colour=guide_legend(title="Forecast"))

# Exercise: Change the value for phi, what happens when this value increases or decreases?


autoplot(livestock) +
  xlab("Year") + ylab("Livestock, sheep in Asia (millions)")

e1 <- tsCV(livestock, ses, h=1)
e2 <- tsCV(livestock, holt, h=1)
e3 <- tsCV(livestock, holt, damped=TRUE, h=1)
# Compare MAE:
mean(abs(e1), na.rm=TRUE)
mean(abs(e2), na.rm=TRUE)
mean(abs(e3), na.rm=TRUE)

c <- holt(livestock, damped=TRUE)
# Estimated parameters:
fc[["model"]]

autoplot(fc) +
  xlab("Year") + ylab("Livestock, sheep in Asia (millions)")


# Holt-Winter's Models
# 1. Multiplicative Seasonal
# 2. Additive Seasonal
aust <- window(austourists,start=2005)
fit1 <- hw(aust,seasonal="additive")
fit2 <- hw(aust,seasonal="multiplicative")
autoplot(aust) +
  autolayer(fit1, series="HW additive forecasts", PI=FALSE) +
  autolayer(fit2, series="HW multiplicative forecasts",
            PI=FALSE) +
  xlab("Year") +
  ylab("Visitor nights (millions)") +
  ggtitle("International visitors nights in Australia") +
  guides(colour=guide_legend(title="Forecast"))

# Daily Data
fc <- hw(subset(hyndsight,end=length(hyndsight)-35),
         damped = TRUE, seasonal="multiplicative", h=35)
autoplot(hyndsight) +
  autolayer(fc, series="HW multi damped", PI=FALSE)+
  guides(colour=guide_legend(title="Daily forecasts"))