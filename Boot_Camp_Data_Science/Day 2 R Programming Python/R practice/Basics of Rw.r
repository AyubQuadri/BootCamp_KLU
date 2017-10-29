##### Mathematical Operations #####
# Addition, substraction, Multiplication, Division, Modulo 
	3+2
	3-2
	3*2
	3/2
	3%%2 # gives you the remainder 1

## Assignment Operator ###

	x <- 5
	Y <- 6
	z <- x+Y 

	z 
	print(z)

## Data Types 

## 1. Vectors
	# Create a vector of length 10
		x <- vector("numeric", length = 10)
		x
	
	# The c() function can be used to create vectors of objects.
		x <- c(0.5, 0.6) ## numeric
		x <- c(TRUE, FALSE) ## logical
		x <- c(T, F) ## logical
		x <- c("a", "b", "c") ## character
		x <- 9:29 ## integer
		x <- c(1+0i, 2+4i) ## complex
	  class(x)
	# subset of a vector
	
		x <- c(2,4,6,8,10)
		x[1]
		x[1:4]
		x[x>4]
		u <- x>4
		u 
		x[u]
		
## 2. Lists ##

		x <- list(c(1,2), "a", TRUE)
		x


## 3. Matrix creation & operations ##

	# create matrix
		m <- matrix( nrow =2 , ncol = 3)
		m
		dim(m)

	# assign values 
 
		m <- matrix(1:6, nrow =2, ncol=3) # by default column wise filling

		m <- matrix(1:6, nrow= 2, ncol=3, byrow = TRUE) # parameter is only byrow
	
	# Selecting subset of matrix
	
		m[1, ]  # selects the entire first row
		m[, 2]  # selects the entire second column
		
		# Select specific element of matrix
		m[1,2]  # selects first row second column element
	
	# c-bind r-bind operations
		# c-bind adds values to the column of a matrix
			dim(m)
			m <- cbind(m,c(7,8))
		# r-bind adds values to the row of a matrix
			
			m <- rbind(m, c(10,20,30,40))
	# Matrix operations
		x <- matrix(1:4, 2, 2) 
		y <- matrix(rep(10,4), 2,2)
		
		# element wise operations
				
				x * y
				x / y
		# True Matrix Multiplication
				
				x %*% y 
				

## 4. Factors  ##
x <- factor(c("yes", "yes", "no", "yes", "no"))
x

## 5. Data Frames   ##

x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x

x <- x[3,1]

dim(x)
nrow(x)
ncol(x)

## 6. strings ##
x <- 'welcome to R Programming'
y <- "R is a statistical tool"

str(x)

##  Explicit Coercion ##
		x <- 0:6
		class(x)
		as.numeric(x)
		as.logical(x)
		as.character(x)
		