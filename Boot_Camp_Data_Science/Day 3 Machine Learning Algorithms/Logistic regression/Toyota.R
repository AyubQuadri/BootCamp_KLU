rm(list = ls())

#Need to predict Price of toyota 
#Price = (Model + AGE) factors 
# as Model is categorical we drop that in model so 
# Price = 26210.577 - 172.073* Age 

setwd("F:/Sessions/Boot_Camp_Data_Science/Day 3 Machine Learning Algorithms/Logistic regression")

#read data

Cars<- read.csv("Toyota_SimpleReg.csv",header = T, sep = ",")
str(Cars)

#Drop the Col ID
Cars <- Cars[-1]

#check for Null values
sapply(Cars,function(x) sum(is.na(x)))

#correlation between price and age
cor(Cars$Price,Cars$Age_12_16)

#split the data into test and train
library(caTools)

set.seed(123) 
sample = sample.split(Cars$Price, SplitRatio = .70)
train = subset(Cars, sample == TRUE)
test = subset(Cars, sample == FALSE)

#Linear Regression model

LmOut <- lm(Price~Age_12_16,data = train)
summary(LmOut)

#predicted value VS Actual values
library(DMwR)

#Error verification on train data
regr.eval(train$Price, LmOut$fitted.values) 

#Error verification on test data
Pred<-predict(LmOut,test)
regr.eval(test$Price, Pred)


#OutPut

# linear regression model
# y = mx + C
# Price = 26210.577 - 172.073* Age 
# with Mean Abs Error % of 12.57% on train & 11.12 % on test data