## Chi-Squares
library(tidyverse)
library(stats)
library(corrplot)
library(chisq.posthoc.test)

data("mtcars")

## we will perform a chi-square test on number of cylinders and number of carburetors
unique(mtcars$cyl) # three levels: 4,6, and 8 cylinders
unique(mtcars$carb) # six levels: 1, 2, 3, 4, 6, and 8 carburetors

## save as table
table <- as.data.frame(unclass(table(mtcars$carb, mtcars$cyl)))

chi.sqr <- suppressWarnings(chisq.test(table))
chi.sqr

chi.sqr$observed
chi.sqr$expected

round(chi.sqr$residuals, 3)

corrplot(chi.sqr$residuals, is.corr = FALSE)

contrib <- 100*chi.sqr$residuals^2/chi.sqr$statistic
round(contrib, 3)

corrplot(contrib, is.cor = FALSE)

## Post Hoc test
library(chisq.posthoc.test)
chi.sqr$stdres

suppressWarnings(chisq.posthoc.test(table,method = "none"))





?chisq.posthoc.test
