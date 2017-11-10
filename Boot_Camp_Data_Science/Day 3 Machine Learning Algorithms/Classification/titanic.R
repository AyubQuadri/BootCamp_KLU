rm(list=ls())
setwd()

data <- read.csv("data.csv",header = T,sep = ",")
str(data)


#Need to predict Survived or not

#remove ID and Name
data <- data[-1]
data$Pclass <-as.factor(as.character(data$Pclass))

str(data)

sum(is.na(data$Pclass))
sum(is.na(data$Sex))
sum(is.na(data$Age))
sum(is.na(data$SibSp))
sum(is.na(data$Parch))
sum(is.na(data$Fare))
sum(is.na(data$Survived))
          
#impute data for Age based on KNN
library(DMwR)
data1 <- centralImputation(data)
sum(is.na(data1))

#split the data into Test and Train

library(caTools)
require(caTools)
set.seed(123)
sample = sample.split(data1$Survived, SplitRatio = 0.7)
train = subset(data1,sample==TRUE)
test = subset(data1,sample == FALSE)

# Linar model

lmOut <- glm(Survived ~.,data=train,family=binomial)
summary(lmOut)

#AIC
stepAIC(lmOut)

model_AIC <- glm(formula = Survived ~ Pclass + Sex + Age + SibSp, family = binomial, 
                 data = train)

library(car)

vif(model_AIC)

pred = predict(model_AIC,type = "response")

pred_class <- ifelse(pred>0.5,1,0)

#confusion matrix
Conf.Mat = table(train$Survived,pred_class)


Accuracy <- sum(diag(Conf.Mat)/sum(Conf.Mat))
Accuracy

Precisions <- Conf.Mat[2,2]/sum(Conf.Mat[,2])
Precisions

Recall <- Conf.Mat[2,2]/sum(Conf.Mat[2,])
Recall

#test it on Test data

pred_update1 <- predict(model_AIC, test, type = "response")

pred_class1 <- ifelse(pred_update1>0.5,1,0)

Conf.Mat1 <- table(test$Survived,pred_class1)

Accuracy_test <- sum(diag(Conf.Mat1)/sum(Conf.Mat1))
Accuracy_test

Precisions_test <- Conf.Mat1[2,2]/sum(Conf.Mat1[,2])
Precisions_test

Recall_test <- Conf.Mat1[2,2]/sum(Conf.Mat1[2,])
Recall_test


library(ROCR)
library(ggplot)

predicted <- predict(model_AIC,type = "response")
prob<- prediction(predicted,train$Survived)

tprfpr <- performance(prob,"tpr","fpr")


plot(tprfpr)
str(tprfpr)

cutoff <- data.frame(cut <- tprfpr@alpha.values[[1]],fpr<-tprfpr@x.values[[1]],tpr=tprfpr@y.values[[1]])

cutoff <- cutoff[order(cutoff$tpr,decreasing = TRUE),]

head(cutoff)

plot(tprfpr,colorize= TRUE,print.cutoff.at=seq(0,1,by=0.1),text.adj = c(-0.2,1.7))

tpr<-unlist(slot(tprfpr,"y.values"))
fpr<-unlist(slot(tprfpr,"x.values"))

roc <-data.frame(tpr,fpr)

ggplot(roc)+geom_line(aes(x=fpr,y=tpr))+
  geom_abline(intercept=0,slope=1,color="gray")+
  ylab("sensivitity")+xlab("1-specificity")
