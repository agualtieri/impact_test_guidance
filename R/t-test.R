table(Dataset$`What is the gender of the respondent`)
table(Dataset$`What symptoms would cause members of your community concern of COVID_19`)



why_noseek <- Dataset %>% select("What do you think people would do if they had any of the above symptoms", starts_with("If nothing, why/")) %>%
                          filter(`What do you think people would do if they had any of the above symptoms` == "Nothing")


write.csv(why_noseek, "./output/why_no_seek_check.csv")

library(tidyverse)
data(mtcars) %>% as.data.frame()

mpg.at <- mtcars[mtcars$am ==0,]$mpg
mpg.mt <- mtcars[mtcars$am==1,] $mpg

t.test(mpg.at, mpg.mt)

#ANOV
mtcars_aov <- aov(mtcars$mpg~factor(mtcars$cyl))
summary(mtcars_aov)

TukeyHDS(mtcars_aov)
stats::TukeyHSD(mtcars_aov)


inter_aov <- aov(mtcars$mpg~factor(mtcars$cyl)*factor(mtcars$am))
summary(inter_aov)

two_way_aov <- aov(mtcars$mpg~factor(mtcars$cyl) + factor(mtcars$am))
summary(two_way_aov)

library(AICcmodavg)

model.set <- list(inter_aov, two_way_aov)
model.names <- c("interaction", "no interaction")

aictab(model.set, modnames = model.names)

stats::TukeyHSD(two_way_aov)
