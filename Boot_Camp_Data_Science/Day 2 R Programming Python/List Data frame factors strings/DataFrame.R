# Data Frame is same as matrix but it deferes as it can hold different data types
# where as in matrix only one type of data can be stored

# 1. Create a Data Frame
# 2. Initilize the dataframe
# 3. Access the elements of a data frame


# operations

# 1. Access the top elements 
# 2. Access the bottom elements
# 3. rowMean(), colMean()
# 4. rbind, cbind
#################################################

# 1. Create a Data Frame
  data = data.frame()
  data

# 2. Initilize the dataframe
  data = data.frame(name ='Abc', salary=25000, DOB = '28th Nov', State = 'Telangana', Phone = '9666531814')
  data
  
  data = data.frame( name =c('Abc','xyz'), salary=c(25000,12345), DOB = c('28th Nov','abc'), State = c('Telangana','Karnataka'), Phone = c('9666531814','123456789'))
  data


# 3. Access the elements of a data frame
  data$name
  
  a= data.matrix(data)
  a
  a[1,]
  a[2,]
  data[c(2,3)] # select only column
  data[c(2,4),]
    
  class(data)
  data



# Operations on Data frame
  # 1. Access the top elements 
  head(data)
  
  # 2. Access the bottom elements
  tail(data)
  
  # 3. rowMean(), colMean()
  colMeans(data[2]) # average of particular column
  
  # 4. rbind, cbind
  data
  data = cbind(data, sex=c('M','F','M','F') )
  data

  a = data.frame(cbind(c(1,2,3,4,5,6),c(7,8,9,10,11,12)),stringsAsFactors = F)
  a  
  rbind(a, c(7,13))
  
  cbind(a, time=c(10,20,30,40,50,60))
  
# Factors: When the data is in categorical format we use Factors to understand its levels. Eg: Gender
  
  gender <- c('M',"F","F","M")
  factor(gender) 
  
# Strings
  
  str = "Welcome to R programming"
  str1 = "Hello Ayub "
  

  # concatinate using paste 
  msg = paste(str1, str)
  
  # concatinate using 
  # concatinate using merge but it gives u a list with elements better use paste
  msg = merge(str1,  str)
  