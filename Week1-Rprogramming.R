myfunction = function(){
  x = rnorm(100)
  xMean = mean(x)
return(x)
  }

secondfunction = function(x){
  x = rnorm(length(x))

  return(x)
  }

library(datasets)

cor(datasets::airquality)

#### Vector


vector(mode = "character", length = 2)

x <- cbind(a = 1:3, pi = pi)
attributes(x) <- NULL
h =6


#### List
x = list(1:3, "a",TRUE, 1+4i)
attributes(h) = NULL


##### First constructs column wise
m = matrix(1:8, nrow = 2, ncol = 4)
dim(m) = c(4,2)

newm = 1:10

dim(newm) = c(5,2)

attributes(m)

cbind(1:3, 5:3)

rbind(1:3, 5:3)

###Factors represent categorical data

factorX = factor(c("yes", "yes", "no","yes", "no"), levels = c("yes", "no"))

table(factorX)

unclass(factorX)
tables =table(c("yes", "no", "yes", "no"))

naX = c(1:5, NA, 10, 3)
is.na(naX)
is.nan(naX)

nanX = c(1:3, NaN, NA, 4,6)
is.nan(nanX)
is.na(nanX)


frameX = data.frame(foo = 1:4, bar = c(T,T,F,T), row.names = c("F", "T", "G", "J"))

nrow(frameX)

ncol(frameX)

arrayX = 1:3
names(arrayX)

names(arrayX) = c("fufu", "tao", "eba")

data.frame(arrayX)

tibble::tibble(arrayX)

list(1,3,4)

list(a=1, b=3, c=4)

matrixreloaded = matrix(1:4, nrow = 2, ncol  = 2)
dimnames(matrixreloaded) = list(c("bisi", "hj"), c("kilo", "ole"))


### Reading data in Rstudio
#### source runs the entire script, remember


y = data.frame(a =1, b = "a")

dput(y)

dput(y, file = "strangey.R")

new.y = dget("strangey.R")

x = "foo"
y = data.frame(a =1, b = "a")
dump(c("x", "y"), file = "fakedata.R")

rm(x,y)

source("fakedata.R")
file("foo.txt", "r")

con =url("http://www.jhsph.edu", "r")
xn = readLines(con)

head(xn)

xmen = c("a", "b", "c", "c", "d", "a")

u = xmen > "a"

xmen[u]

xlist = list(foo = 1:4, bar = 0.6)

xlist[1]

xlist[[1]]

xlist$bar

xlist[["bar"]]


dfnew = data.frame(x =1:4, y = 5:8)

dfnew[["x"]]

englishData = url("https://datahub.io/sports-data/english-premier-league")

head(readLines(englishData))


x = list(foo = 1:4, bar =0.6, baz = "hello")

x[c(1,3)]

x = list(foo = 1:4, bar = 0.6, baz = "hello")

name = "foo"

x[[name]]

x$foo

x = list(a = list(10,12,14), b= c(3.14, 2.81))

x[[c(2,2)]]

x[[1]][[2]]

x[[2]][[2]]

x = matrix(1:6, 2,3, byrow = TRUE)

x[1,2]

x[2,1]

x[1,]

x[,3]

x[1,2]

x[1,2, drop = FALSE]

x[1, , drop = FALSE] ##### Double comma

x = matrix(1:6, 2,3)

x[1,]

x[1, ,drop = FALSE]


####Partial matching
x = list(aardvark = 1:5, adobe =3:8)

x$aa

x[["aa"]]

x = c(1,2,NA, 4, NA, 5)

is.na(x) = NULL

x[["a", exact = FALSE]]

bad = is.na(x)

x[!bad]

y = c("a", "b","c", "d", NA, "f")

good = complete.cases(x, y)

y[good]

x = 1:4
y = 6:9
 x + y
x>2

y >= 8

x*y

x/y


x = matrix(1:4, 2,2)
y = matrix(rep(10,4), 2, 2)

x * y

x/y
 
x %*% y #### True matrix application

x = c(2,4,5,6,6,5,4,3)

x[x>5] = 0

hw1_data <- read.csv("C:/Users/Peter/Music/Rprojects/DataoldTotest/Data/hw1_data.csv")

colnames(hw1_data)

head(hw1_data, -2)

nrow(hw1_data)

tail(hw1_data, 2)

length(which(is.na(hw1_data$O)))

mean(hw1_data$O, na.rm = TRUE)

Oz = hw1_data$Ozone



good = complete.cases(hw1_data$Ozone>31, hw1_data$Temp >90)

mean(hw1_data$Solar.R[hw1_data$Ozone>31& hw1_data$Temp >90], na.rm = TRUE)

mean(hw1_data$Temp[hw1_data$Month==6], na.rm = TRUE)

max(hw1_data$Ozone[hw1_data$Month==5], na.rm = TRUE)
