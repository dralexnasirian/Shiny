# get() function in R Language is used to return an object with the name specified as argument to the function. 
# This is another method of printing values of the objects just like print function. 
# This function can also be used to copy one object to another.


# R program to illustrate 
# the use of get() Function
  
# Creating vectors
x1 <- c("abc", "cde", "def")
x2 <- c(1, 2, 3)
x3 <- c("M", "F")
  
# Calling get() Function
# for print operation
get("x2")
  
# Assigning to another vector
x4 <- get("x3")
print(x4)
