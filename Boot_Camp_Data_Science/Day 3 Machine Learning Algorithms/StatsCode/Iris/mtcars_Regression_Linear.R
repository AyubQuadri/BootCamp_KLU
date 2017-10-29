# Regression model for mtcars 
# predicting the milage per galon using number of cylinder of a car
# Steps 
  # 1. load the data set mtcars
  # 2. check the head, str, dim, summary 
  # 3. build a linar regression model
  # 4. predict the new value

# 1. load the data set mtcars
data = mtcars

# 2. check the head, str, dim, summary
head(data)
str(data)
dim(data)
summary(data)

# 3. build a linar regression model
model = lm(mpg~cyl, data= data)
summary(model)

# 4. predict the new value
unseen = data.frame(cyl=4)
predict(model,unseen)


