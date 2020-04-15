#### Loop functions
x = list(a = 1:5, b = rnorm(10))

lapply(x, mean) ####Always returns a list

x = c( a = 1:5, b = rnorm(10)) #Returns a1, a2, and the rest

x = list(a=1:4, b = rnorm(10), c =rnorm(20,1), d = rnorm(100, 5))

lapply(x, mean)

x = 1:4

lapply(x, runif)

lapply(x, runif, min =0, max = 10)

x = list(a = matrix(1:4, 2,2), b = matrix(1:6, 3,2))

lapply(x, function(elt) elt[,1]) ###first column

sapply(x, mean)

mean(x)

str(apply)


#### apply function
x = matrix(rnorm(200), 20, 10)
apply(x, 2, mean)

apply(x, 1, mean) ####Preserve all the rows and collapse all the columns

apply(x, 1, sum)

apply(iris, 2, mean)

apply(iris[,1:4], 2, mean)

rowMeans(iris[,1:4]) #### ==apply(iris[,1:4], 1, mean)

apply(iris[,1:4], 1, mean)


rowSums = apply(x, 1, sum) ## rowSums(x)
rowMeans = apply(x, 1, mean) ##rowMeans(x)
colSums = apply(x, 2, sum)  ##colSums(x)
colMeans = apply(x, 2, mean) ##colMeans(x)

x = matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75))

a = array(rnorm(2*2*10), c(2,2,10))
apply(a, c(1,2), mean)

rowMeans(a, dims=2)

######## mapply
str(mapply)

x = list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))

t =mapply(rep, 1:4, 4:1)

y =mapply(rep, times = 4:1, x=1:4)

identical(t, y)

noise = function(n, mean, sd){
        rnorm(n, mean, sd)
}

noise(5,1,2)

rnorm(5,1,2)

noise(1:5, 1:5, 2)

mapply(noise, 1:5, 1:5, 1:5)

list(noise(1,1,2), noise(2,2,2),
     noise(3,3,2), noise(4,4,2),
     noise(5,5,2))


###### tapply
str(tapply)

x = c(rnorm(10), runif(10), rnorm(10,1), rnorm(10, 2, 0.5))
f = gl(4,10) #### generate factors ?gl

tapply(x, f, mean)

tapply(x, f, mean, simplify = FALSE)

tapply(x, f, range)

##### split
str(split)

x = c(rnorm(10), runif(10), rnorm(10,1), rnorm(10, 2, 0.5))
f = gl(4,10)

split(x,f)

sapply(split(x,f), mean)

lapply(split(x,f), mean)

library(datasets)

head(airquality)

split(airquality[["Ozone"]],airquality[["Month"]])

sapply(split(airquality[["Ozone"]],airquality[["Month"]]), mean, na.rm =TRUE)

sapply(split(iris[["Sepal.Length"]],iris[["Species"]]), mean, na.rm =TRUE)


splitDf = split(airquality, airquality$Month)

sapply(splitDf, function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

sapply(splitDf, function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

lapply(splitDf, function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
# split.data.frame(airquality, airquality[["Month"]])  Same as with just split


x = rnorm(10)
f1 = gl(2,5)
f2 = gl(5,2)
f3 = gl(5,2)

interaction(f1, f2, f3)

str(split(x, list(f1, f2), drop = TRUE)) ###list same as interactive 

#### Debugging
log(-1)

printMessage = function(x){
  if (x>0)
    print("x is greater than zero")
  else 
    print("x is less than or equal to zero")
  
  invisible(x) ###invisible prevents auto printing
}

printMessage(1)

printMessage(-2)

printMessage(NA)

printMessage2 = function(x) {
  if(is.na(x))
    print("x is a missing value")
  else if (x >0)
    print("x is greater than zero")
   else if (x<0)
    print("x is lower than zero")
  invisible(x)
}

printMessage2(NA)

x = log(-1)

printMessage2(x)

#### traceback
 mean(x)

data.frame(mean(x))

traceback()

lm(y ~ x)

traceback()

### debug
debug(lm)

lm(y~x)

debug: m <- match(c("formula", "data", "subset", "weights", 
                    "na.action", "offset"), names(mf), 0L)

### recover

options(error = recover)

read.csv("nosuchfile")



##### Test
mpg


lapply(mtcars, mean)


tapply(mtcars$cyl, mtcars$mpg, mean)


sapply(split(mtcars$mpg, mtcars$cyl), mean)


sapply(mtcars, cyl, mean)


tapply(mtcars$mpg, mtcars$cyl, mean)


apply(mtcars, 2, mean)


mean(mtcars$mpg, mtcars$cyl)


split(mtcars, mtcars$cyl)


with(mtcars, tapply(mpg, cyl, mean))


debug(ls)
ls()


apply(iris[,1:4], 2, mean)

mean(iris$Sepal.Length)

colMeans(iris)


apply(iris, 2, mean)


apply(iris, 1, mean)


rowMeans(iris[, 1:4])


apply(iris[, 1:4], 2, mean)


apply(iris[, 1:4], 1, mean)



