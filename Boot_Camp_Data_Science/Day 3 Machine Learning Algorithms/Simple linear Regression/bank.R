rm(list=ls())
setwd("F:/Sessions/Boot_Camp_Data_Science/Day 3 Machine Learning Algorithms/Simple linear Regression")
getwd()

Bank <- read.table("bank.txt",header = T,sep = ";")
str(Bank)

Bank$Outcome = ifelse(Bank$y == "yes",1,0)
#removing y column
Bank <- Bank[,-17]

#spliting the data
library(caTools)

require(caTools)
set.seed(123) 
sample = sample.split(Bank$Outcome, SplitRatio = .70)
train = subset(Bank, sample == TRUE)
test = subset(Bank, sample == FALSE)


# Linear model 
lmOut <- glm(Outcome ~ ., data = train, family = binomial)

pred <-predict(lmOut,type = "response")

prid_class <- ifelse(pred >0.5,1,0)

#confusion matrix
Conf.Mat<-table(train$Outcome,prid_class)

Accuracy <- sum(diag(Conf.Mat)/sum(Conf.Mat))
Accuracy

Precisions <- Conf.Mat[2,2]/sum(Conf.Mat[,2])
Precisions

Recall <- Conf.Mat[2,2]/sum(Conf.Mat[2,])
Recall

#Recall is very less so apply AIC

library("MASS")
require("MASS")

Model_AIC <- stepAIC(lmOut)

lmOut_update <- glm(Outcome ~ marital + housing + loan + contact + day + month + 
  duration + campaign + pdays + poutcome, data = train, family=binomial)
summary(lmOut_update)

library(car)
install.packages('car')
#vif(lmOut_update)

pred_update = predict(lmOut_update,type = "response")

pred_class <- ifelse(pred_update>0.5,1,0)

Conf.Mat1 = table(train$Outcome,pred_class)
Conf.Mat1
#pridict on test data

pred_update1 <- predict(lmOut_update, test, type = "response")

pred_class1 <- ifelse(pred_update1>0.5,1,0)

Conf.Mat1 <- table(test$Outcome,pred_class1)

Accuracy_test <- sum(diag(Conf.Mat1)/sum(Conf.Mat1))
Accuracy_test

Precisions_test <- Conf.Mat1[2,2]/sum(Conf.Mat1[,2])
Precisions_test

Recall_test <- Conf.Mat1[2,2]/sum(Conf.Mat1[2,])
Recall_test

#ROCR 

library(ROCR)
library(ggplot)

predicted <- predict(lmOut_update,type = "response")
prob<- prediction(predicted,train$Outcome)

tprfpr <- performance(prob,"tpr","fpr")


plot(tprfpr)
str(tprfpr)

cutoff <- data.frame(cut <- tprfpr@alpha.values[[1]],fpr<-tprfpr@x.values[[1]],tpr=tprfpr@y.values[[1]])

cutoff <- cutoff[order(cutoff$tpr,decreasing = TRUE),]

head(cutoff)
