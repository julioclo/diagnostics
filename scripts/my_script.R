# install ggfortify
library(ggfortify)
library(tidyverse)

my_cars_data <- read_csv("./data/my_data.csv")

mod1 <- lm(mpg ~ wt, data = mtcars)
summary(mod1)


# 1.
# the regression model is linear in parameters
# Eyeball it

mtcars %>%
  ggplot(., aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = lm, formula = y ~ poly(x, 2))

# 2.
# the mean of residulas is zero
# check model summary and test manually
mean(mod1$residuals)
# it is pretty close to 0.
summary(mod1)

# 3.
# Homoskedasticity of residuals or equal variance
# left side plots
autoplot(mod1, which = c(1, 3))


# 4. no autocorrelations of residuals
acf(mod1$residuals) # visual inspection
lmtest::dwtest(mod1) # formal test: Durbin-Watson test # (package::function)

# 6. normality of the residuals
autoplot(mod1, which = 2)

autoplot(mod1)

# data import
getwd()
my_df <- mtcars
write_csv(x = my_df, path = "./data/my_data.csv")
