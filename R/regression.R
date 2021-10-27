## Regressions
library(tidyverse)
library(stats)

data(mtcars)

# plot the data
plot(mpg ~ wt, data = mtcars, col=2)

# simple linear regression
l.reg <- lm(mpg ~ wt, data = mtcars)
summary(l.reg)


# multiple linear regression

m.reg <- lm(mpg~am + cyl + wt + hp, data = mtcars)
summary(m.reg)
