# List is one of the data types of R which can hold any value

# 1. Create a list
# 2. initializing a list
# 3. Check the tags and values of a List
# 4. Accessing the elements of a list
# 5. Deleting elements of a list

# Operations on Lists

  # 1. Find the length of the list
  # 2. cancatinate two lists

# 1. Crate a list
l = list()
class(l)

# 2. Initialize a list
l = list(name ='Ayub', ID=304788, Salary = 25000, State = 'Telangana')
l

# 3. Tags & Values of a list
  # get the Tages
  names(l)
  # get the values
  unlist(l)
  
  # check the type of unlisted items
  class(unlist(l))

# 3. Accessing the elements of the list
  # Accessing can be done using $, [] -> single list, [[]] -> list of list
  l
  # using Tags if you know them
  l$name
  l$State
  

  # using the index position
  l[2]
  
  # using the index start and end positions
  l[2:3]
  l[1:3]
  
  #list of list operation & accesing
  data = list(name= c('abc','xyz'), age =c(20,25))
  data1 = list(sex =c('M','F'))
  c = list(data,data1)
  c
  c[[1]][2]
  c[[2]]

# 4. Adding/updating elements to a list
  # using $ and position index
  l$DOB = '28th Nov'
  l
  
  l[6]='abc'
  l
  
  l[6] ='string'
  names(l)
  unlist(l)
  
  #update the exsiting value
  l$name='Quadri'
  l
  unlist(l)

# 5. Deleting the elements of list
  l[6] = NULL
  names(l)  
  l
  unlist(l)
  
  l$ID = NULL  
  l
  
#Operations on lists
  
  # find the lenght of a list
  length(l)
  
  # recursive operation -> list within list or list of list
  
  a = list('abc','pqr',123,456,TRUE,0)
  b = list('xyz',789)
  c = list(a,b)
  x = merge(a,b)
  x
  ??merge
  c
  
  # accessing the list of list elements
    c[[2]]
    c[[1]][[2]]
    c[[2]][[1]]
  
  
  