# Unsupervised Learning using K-means 

# Cluster into 2 different classes
# The cars data frame is pre-loaded

# Set random seed. Don't remove this line
set.seed(1)

# Group the dataset into two clusters: km_cars
km_cars <- kmeans(cars, 2)

# Add code: color the points in the plot based on the clusters
plot(cars, col= km_cars$cluster)

# Print out the cluster centroids
km_cars$centers

# Replace the ___ part: add the centroids to the plot
points(km_cars$centers, pch = 22, bg = c(1, 2), cex = 2)


# Cluster into 3 different classes 

# The cars data frame is pre-loaded

# Set random seed. Don't remove this line.
set.seed(1)

# Explore the cars dataset
mtcars
cars = subset(mtcars, select=c(hp,wt))
str(cars)
summary(cars)

# Group the dataset into two clusters: km_cars
km_cars = kmeans(cars,3)

# Print out the contents of each cluster
km_cars

# Add code: color the points in the plot based on the clusters
plot(cars, col= km_cars$cluster)

# Print out the cluster centroids
km_cars$centers

# Replace the ___ part: add the centroids to the plot
points(km_cars$centers, pch = 22, bg = c(1, 2), cex = 2)


