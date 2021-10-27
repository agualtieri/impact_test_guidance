# logistic regression

library(tidyverse)
library(stats)

data(mtcars)


# Logistic Regression
mylogit <- glm(am ~ mpg, mtcars, family = "binomial")
summary(mylogit)

# Exponentiate coefficient with 95% CI
exp(cbind(OR = coef(mylogit), confint(mylogit)))


mtcars$am
