Data <- read.csv("C:/Users/arpol/Downloads/Vision Homes.csv", row.names=1)
View(Data)
install.packages("dplyr")
install.packages("ggpubr")
library(dplyr)
library(ggpubr)
ggdensity(Data$Total,
          main = "Distribution of Leads by month",
          xlab = "Month")
hist(Data$Transformed.data, probability = T) 
lines(density(Data$Total))
shapiro.test(Data$Total)
Summary(Data$Total)
boxplot(Data$Total)
sd(Data$Total)
