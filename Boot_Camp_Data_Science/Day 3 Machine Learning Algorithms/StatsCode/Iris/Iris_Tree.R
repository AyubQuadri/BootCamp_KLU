# Iris data set classification using decision tree
# install the package tree 

# Packages 
install.packages('tree')
library('tree')
# 1. Load the data set
Iris = iris # load the iris data set to a variable 'iris'
head(Iris, 10)

# 2. Decision tree 
model = tree(Species ~., data =Iris)

# 3. Plot the graph
plot(model, type= 'uniform'); text(model)

# 4. Summary of the model
summary(model)

