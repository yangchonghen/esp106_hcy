#Henry C. Yang, 1/17/2024, wed, esp106 001:

## This is the lab for week 2 (there will be a small addition on Wednesday)
## Add working R code in between the questions
## The chapters refer to the sections in https://rspatial.org/intr/

## Chapter 8  (Functions)

## 1) Write a function 'f' that behaves like this:
## > f('Jim')
## [1] "hello Jim, how are you?"
f=function(name) {
  x= paste("Hello", name,"how are you?")
  return(x)
}
f('Jim')

#it works.

## 2) Write a function 'sumOfSquares' that behaves like this:
sumOfSquares=function(d){d_mean=mean(d)
    d1=d-d_mean
    d2=d1^2
    d2_sum=sum(d2)
    return(d2_sum)}

#it works.

d <- c(1,5,2,4,6,2,4,5)

## [1] 21.875

# To compute the "sum of squares", subtract the mean value of all numbers from each number. 
# Square these numbers and sum them
# (bonus: make a variant that can handle NAs)
?sum
?mean
sumOfSquares2=function(d){d_mean=mean(d, na.rm=TRUE)
d12=d-d_mean
d22=d12^2
d22_sum=sum(d22, na.rm=TRUE)
return(d22_sum)}

sumOfSquares(d)

#it works.

## Chapter 10  (Flow control)

## 4) Write a for loop that adds the numbers 1 to 10
##HINT: you will need one variable that loops through the numbers 1 to 10 and one that keeps count through each loop
b=1:10
a=0
count=0
for(i in b) {
  a= a+i
  count =count+1
}
a
count
#it works.

## 5) Write a for loop that adds the odd numbers between 1 and 10 

a=0
for(i in seq(1,10,by=2)) {
  a=a+i
}
a

#it works.