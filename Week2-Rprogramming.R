
names(hw1_data)

name = "Ozone"

hw1_data[["Ozone"]][1:10]

install.packages("compute.es")

##### if loop

x= 3

if (x>3){
        y = 10
} else{
        y = 0
}

y = if( x > 3){
        10
} else if( x ==3){
        17
}else{
        0
}


### for loop
i_array = c()
for ( i in 1:10){
        print(i)
        i_array= append(i_array, i)
}

x= c("a", "b", "c", "d")

x_array = c()
for (i in 1:4){
        print(x[i])
        x_array = append(x_array, x[i])
}

for (i in seq_along(x)){
        print(x[i])
}

for (letter in x){
        print(letter)
}

for (buns in x){ ##### not necessary with the use of letter, any word can be used
        print(buns)
}

for (i in 1:4) print(x[i])


#### Nested for loop

x = matrix(1:6, 2,3)

for (i in seq_len(nrow(x))) {
        for (j in seq_len(ncol(x))){
                print(x[i, j])
        }
}

for (i in seq_len(nrow(x))) {
        
        print(x[i])
}
for (j in seq_len(ncol(x))){
        print(x[j])
}

### While loop
count = 0

while(count <= 10) {
        print(count)
        count = count +1
}

z = 5

#rbinom(no of observations, no of trials, probability of success eg 0.5 - coin)

while( z >= 3 && z <= 10){
        print(z)
        coin = rbinom(1,1, 0.5)
        
        if (coin == 1){ ### Random walk
                z = z+1
        } else {
                z = z-1
        }
}


#### Control structures: repeat, next and break
x0 = 1
tol = 1e-8 ####tolerance

repeat{
        x1 = 1
        
        if(abs(x1 - x0) < tol) {
                break
        } else {
                x0 = x1
        }
}

for (i in 1:100) {
        if (i <= 20) {
                ### Skip the first 20 iterations
                next
        }
        ### Do something here
}

### Functions
add2 = function(x, y){
        x+y
}

add2(3,5)

above10 = function(x){
        x[x>10]
}

above10(3:15)

above = function(x, n =10){
        x[x>n]
}

above(1:7, 5)

columnmean = function(df_data, removeNa = TRUE){
        mean_df = numeric(ncol(df_data))
        for (i in seq_len(ncol(df_data))){
                mean_df[i] = mean(df_data[,i], na.rm = removeNa)  ###[,i] for columns
        }
        mean_df
}

columnmean(airquality, FALSE)

mydata = rnorm(100)

sd(mydata)

sd(x = mydata)

sd(x = mydata, na.rm = FALSE)

sd(na.rm = FALSE, x = mydata)

sd(na.rm = FALSE, mydata)

sd(c(rnorm(100), NA), TRUE)

args(lm)

lm(data = mydata, y~x, model = FALSE, 1:100)
lm(y~x, mydata, 1:100, model = FALSE)

args(plot)

f = function(a, b =1, c =2, d =NULL){
        
}

f = function(a, b){
        a ^2
}
f(2)

f = function(a, b){
        print(a)
        print(b)
}

f(45)


myplot = function(x, y, type = "l", ...){
        plot(x, y, type = type, ...)
}

paste("hallo everyone", rnorm(1), sep = " > ")

paste("a", "b", sep = ":")

paste("a", "b", se =":")


lm = function(x) {
        x *X
}

f = function(x,y){
        x^2 + y/z
        
}

make.power = function(n){
        pow = function(x){
                x^n
        }
        pow
}

quadriple = make.power(4)
quadriple(5)

square = make.power(2)
square(2)

ls(environment(square))

get("n", environment(quadriple))

get("n", environment(square))

y = 10

f = function(x){
        y = 2
        y*2 + g(x)
        
}

g = function(x){
        x*y
}

f(3)

g = function(x) {
        a = 3
        x +a +y 
}
y =3
g(2)


####Optmization
make.NegLogLik = function(data, fixed =c(FALSE, FALSE)){
        params = fixed
        function(p){
                params[!fixed] = p
                mu = params[1]
                sigma = params[2]
                a = -0.5 * length(data) * log(2*pi*sigma^2)
                b = -0.5 * sum((data-mu)^2)/(sigma^2)
                -(a + b)
        }
}

set.seed(1) ;normals = rnorm(100, 1,2)
nLL = make.NegLogLik(normals)

ls(environment(nLL)) #### fREE VARIABLES

optim(c(mu =0, sigma=1), nLL)$par

### Fixing sd = 2
nLL = make.NegLogLik(normals, c(FALSE, 2))
optimize(nLL, interval = c(-1,3))$minimum

###fixing mean = 1

nLL  = make.NegLogLik(normals, c(1, FALSE))
optimise(nLL, interval = c(-1,3))$minimum

nLL = make.NegLogLik(normals, c(1,FALSE))
x = seq(1.7, 1.9, len = 100)
y = sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")

nLL = make.NegLogLik(normals, c(FALSE,2))
x = seq(0.5, 1.5, len = 100)
y = sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")


# fixed = c(FALSE,2)
# params = fixed
# p =2
# params[!fixed] = p To replace one of them
# mu = params[1]
# sigma = params[2]
# a = -0.5 * length(data) * log(2*pi*sigma^2)
# b = -0.5 * sum((data-mu)^2)/(sigma^2)
# -(a + b)

### Dates and Time
x = as.Date("1970-01-01")

unclass(x)

unclass(as.Date("1970-01-02")) ### One day  after 1970-01-01
weekdays(x)
months(x)
quarters(x)

x =Sys.time()   #### x already in 'POSIXct' format

p = as.POSIXlt(x)

names(unclass(p))

p$sec

datestring = c("January 10, 2012 10:40", "December 9, 2011 9:10")
x = strptime(datestring, "%B %d, %Y %H:%M")

class(x)

x = as.Date("2012-01-01")
y = strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y

x = as.POSIXlt(x)

as.numeric(x-y)

x = as.Date("2012-03-01")
y = as.Date("2012-02-28")

x -y

x = as.POSIXct("2012-10-25 01:00:00")
y = as.POSIXct("2012-10-25 06:00:00", tz ="GMT")

y-x

identical() ### Tells if both data are identical

colnames(my_data) <- cnames ## column names