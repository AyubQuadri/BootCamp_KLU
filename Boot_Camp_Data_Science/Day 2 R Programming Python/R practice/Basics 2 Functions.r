## functions in R

"
function_name <- function(arg_1, arg_2, ...) {
   Function body 
}
"

	#Built-in
		#To calculate sum of numbers in R
		v<-c(1,2,3,4,5)
		
		#return the sum of the numbers in v
		  sum(v)
		  
		#returns the average value of the numbers in v
		  mean(v)
		  
		  
	##Custom functions
		#To write a customized function for squaring
		square<-function(x){
		  return(x^2)
		}
		#Try out the following and observe the output
		square(FALSE)
		v<-c(1,2,3,4,5)
		square(v)
		y<-data.frame(A=c(1,2,3,4),B=c(5,6,7,8))
		square(y)

# some of the useful functions in data manipulations ##
# Apply:
# Lapply: to use apply on a vector and return a list 
# Tapply: gives a table wrt to a categorical attribute
# Sapply

#1. Apply function 
		
		m <- matrix(c(1:10, 11:20), nrow = 10, ncol = 2)
		dim(m)
	  m	
	  # find mean of the row
	  apply(m,1,mean)
	  
	  # find mean of the column
	  apply(m,2, mean)
	  
	  # divide entire matrix by 2 
	  apply(m, 1:2, function(x) x/2)

#2. lapply
	  
	  # Crate a list of 2 elements 
	     l <- list(a= (1:10),b= (21:30))
	     l
	  #mean of values in each element
	     lapply(l, mean)
	    
	  # sum of values in each element using lapply function
	     lapply(l,sum)

# 3. Sapply   
	     x <- list(a = 1, b = 1:3, c = 10:100)
	     x
	     #Compare with above; a named vector, not a list 
	     sapply(x, FUN = length) 
	     
	     sapply(x, FUN = sum) 

	     ??sapply   
# 4. mapply
	     l1 <- list(a = c(1:10), b = c(11:20))
	     l2 <- list(c = c(21:30), d = c(31:40))
	     # sum the corresponding elements of l1 and l2
	     l1$a
	     l1$b
	     l2$c
	     l2$d
	     mapply(sum, l1$a, l1$b, l2$c, l2$d)
	    
	## sum of a[1]+b[1]+c[1]+d[1] = 1+11+21+31 = 64
	     
# 5. tapply
      
	     attach(iris) 
	     data = iris
       str(iris) 
	     # Let us calculate the mean of the Sepal Length
       mean(iris$Sepal.Length)
	     
	     # calculate the mean of the Sepal Length but broken by the Species
	     tapply(iris$Sepal.Length,iris$Species, mean)
	     
	     
	     	    
# Example with MtCars		
	attach(mtcars)
	data <- mtcars
	
	##Want to find max value for each column
		apply(data,2,min) #This generates the min values for each numeric attribute

		apply(data,1,max)
	##writing this to a data frame
	
		A<-apply(data[,2:11],2,min)
		A<-data.frame(min=apply(data[,2:11],2,min))
		B<-apply(data[,2:11],2,max)
	##We can find the stats for each of the variable separately

		##If we want to have all the stats in a data frame we can write a customize function for this
			stat<-function(x){
			  "Mean"=mean(x)
			  "Min"=min(x)
			  "Max"=max(x)
			  A<-data.frame(Min,Mean,Max)
			  return(A)
			}
			
			stats<-apply(data[,2:11],2,FUN=stat) ##Observe the ouptput of apply.. it is a list
			result<-do.call(rbind,stats)


##Subsetting##
	##This might form an important aspect in Data analysis where we might want to work on a subset of data

		##Subset on vectors
			v<-c(1,2,3,4,5)
			v[v>3]  #Output all elements greater than 3

		##Subset on matrices and data frames
			#a. Calling by cell positions
			library(dplyr)

			data1<-data[,2:11]
			data1<-data[1:10,2:11]

		#b. By using column names
			data1<-data[,c("mpg","cyl")]

			name<-c("mpg","cyl","disp","hp")
			data1<-data[names(data)%in% name] ## %in% comes in handy for subsetting

			select(data,mpg,cyl,disp,hp)

		#c. Using a subset function ##from help identify the argument to be given
			data1<-subset(data,mpg>25,select=mpg:carb) #From data extracts all the records whose mpg>25 and all columns

		#d. The same dataframe can be obtained in another way
			data1<-data[mpg>25,]

		#e. The same dataframe can be obtained in another way using dplyr
			x<-filter(data,mpg>25)
			x
			x <- 1:100
			filter(x, rep(1, 3))
		# check filter

##Multiple conditions can be given using "&" or "|"
			data2<-data[mpg>25 & hp>75,]
			data2<-subset(data,mpg>25 | gear==5,select=mpg:carb)
			filter(data,mpg>25 | gear==5)

		##Using which.max
			data[which.max(mpg),]

		##Using which.min
			data[which.min(mpg),]

			##Using which
			data[which(data$mpg==max(data$mpg)),]
			data[which(row.names(data) %in% c("Mazda RX4","Datsun 710")),]
				