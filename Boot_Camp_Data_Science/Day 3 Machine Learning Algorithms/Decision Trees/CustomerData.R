rm(list = ls())

setwd("F:/Sessions/Boot_Camp_Data_Science/Day 3 Machine Learning Algorithms/Decision Trees")

Data <- read.csv("CustomerData.csv", header = T, sep = ",")
str(Data)

CustData <- Data[-1]

#preprocessing
  sapply(CustData, function(x) sum(is.na(x)))
  CustData$City<- as.factor(as.character(CustData$City))
  CustData$NoOfChildren<- as.factor(as.character(CustData$NoOfChildren))
  CustData$MinAgeOfChild<- as.factor(as.character(CustData$MinAgeOfChild))
  CustData$MaxAgeOfChild<- as.factor(as.character(CustData$MaxAgeOfChild))
  
  CustData$FrequencyOFPlay<- as.factor(as.character(CustData$FrequencyOFPlay))
  CustData$NoOfGamesPlayed<- as.factor(as.character(CustData$NoOfGamesPlayed))
  CustData$NoOfGamesBought<- as.factor(as.character(CustData$NoOfGamesBought))
  
  levels(CustData$FrequencyOFPlay)
#Impute using KNN
  library(DMwR)
  CustData<-knnImputation(CustData,scale=T,k=5) #KNN Imputation
  sapply(CustData, function(x) sum(is.na(x)))
  str(CustData)
  
#convert back to int
  CustData$City<- as.integer(as.character(CustData$City))
  CustData$NoOfChildren<- as.integer(as.character(CustData$NoOfChildren))
  CustData$MinAgeOfChild<- as.integer(as.character(CustData$MinAgeOfChild))
  CustData$MaxAgeOfChild<- as.integer(as.character(CustData$MaxAgeOfChild))
  
  CustData$FrequencyOFPlay<- as.integer(as.character(CustData$FrequencyOFPlay))
  CustData$NoOfGamesPlayed<- as.integer(as.character(CustData$NoOfGamesPlayed))
  CustData$NoOfGamesBought<- as.integer(as.character(CustData$NoOfGamesBought))
  
#Revenue int Bin Regular(0) and Premium(1) customers
  CustData$Revenue <- ifelse(CustData$Revenue<150,"Regular","Premium")  
  CustData$Revenue <- as.factor(as.character(CustData$Revenue))

#Split the data into Test and Train 
  
  require(caTools)
  set.seed(123) 
  sample = sample.split(CustData$Revenue, SplitRatio = .70)
  train = subset(CustData, sample == TRUE)
  test = subset(CustData, sample == FALSE)
  
# C50 Model
  #install.packages('c50')
  library(C50)
  DT_C50 <- C5.0(Revenue~.,data = train)
  
#Predict on Train and Test data
  
  Pred_Train <- predict(DT_C50, newdata = train,type="class")
  Pred_Test <- predict(DT_C50, newdata = test,type="class")

#Generate Confusion matrix for actual and predicted 
  
  Conf_Mat_Train = table(train$Revenue,Pred_Train)
  Conf_Mat_Test = table(test$Revenue,Pred_Test)
  
  Conf_Mat_Train
  Conf_Mat_Test
  
#Accuracy, Specificity, 
  Acc_Train <- sum(diag(Conf_Mat_Train)/sum(Conf_Mat_Train))
  Acc_Test <- sum(diag(Conf_Mat_Test)/sum(Conf_Mat_Test))
 
  Acc_Train
  Acc_Test 

#Importance of attributes
  C5imp(DT_C50,pct = TRUE)
  

#Classification using rpart
  install.packages('rpart')
  library(rpart)
  DT_rpart_class <- rpart(Revenue~.,data = train, method = "class")
  
#predict using rpart on test and train
  pred_rpart_train <- predict(DT_rpart_class,newdata = train,type = "class")
  pred_rpart_test <-predict(DT_rpart_class,newdata = test,type = "class")

#Confusion Matrix
  Conf_Mat_rpart_Train <- table(train$Revenue,pred_rpart_train)
  Conf_Mat_rpart_Test <- table(test$Revenue,pred_rpart_test)
  
  Conf_Mat_rpart_Train
  Conf_Mat_rpart_Test

  #Accuracy, Specificity, 
  Acc_rpart_Train <- sum(diag(Conf_Mat_rpart_Train)/sum(Conf_Mat_rpart_Train))
  Acc_rpart_Test <- sum(diag(Conf_Mat_rpart_Test)/sum(Conf_Mat_rpart_Test))
  
  Acc_rpart_Train
  Acc_rpart_Test 

  