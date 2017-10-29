## How Clear the R data environment
	
	rm(list=c("m","x","y")) # if you want to selectively remove m, x, y 
	rm(list = ls()) # removes all the data 
	
## How to set working Directory

	setwd("")   # shortcut Ctrl + shift + h
	
	setwd("F:/Sessions/Boot_Camp_Data_Science/Day 2 R Programming Python/R practice")

## How to read the files into R ##
  data <- read.csv(file.choose())
  data <- read.csv(file="dataMerged.csv",header=TRUE, sep=",") 
  str(data)
  
## Missing values

  ##To count the number of missing values
  sum(is.na(data)) ##Gives the number of missing values in the data. What to do with the missing values
  sapply(data, function(x)sum(is.na(x)))
  
  #option1. Omit all records with NA values
  data1<-na.omit(data)  ##it omits all the records which has atleast one NA value in it
  data2<-data[complete.cases(data),]  ##another way
  
  #Option2. If the missing values are a few, then we can impute these missing values
  library(DMwR)
  data3<-centralImputation(data) #Cenral Imputation
  sum(is.na(data3))
  
  data4<-knnImputation(data[,-c(1,4,5)],scale=T,k=5) #KNN Imputation
  sum(is.na(data4))
  
##Randomly split  the data into two
  rows<-seq(1,nrow(data),1)
  set.seed(1234)
  trainrows<-sample(rows,0.7*nrow(data))
  Train<-data[trainrows,]
  Test<-data[-trainrows,]
	
##By using a package caTools
  install.packages('caTools')
	require(caTools)
	set.seed(123) 
	sample = sample.split(data3$loan, SplitRatio = .70)
	train = subset(data, sample == TRUE)
	test = subset(data, sample == FALSE)
	
	
## histogram
	hist(data3$age)
	hist(data3$family)

## Boxplot
	boxplot(data3$age)
	barplot(data3$age)

## ggplot
	library(ggplot2)
	p1 <- ggplot(data3, aes(x=age,y= loan))
	
	p1 + geom_point(color="blue")
	p1 + geom_point(color="blue") + geom_line()                           
	p1 + geom_point(color="red") + geom_smooth(method = "lm", se = TRUE)