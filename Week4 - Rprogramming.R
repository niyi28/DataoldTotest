### str function

str(baked_data)  ### Diagnostic function with structure function

summary(baked_data)

str(str)

str(lm)

str(ls)

x = rnorm(100, 2, 4)

str(x)

summary(x)[1]


f = gl(40, 10)

str(f)

summary(f)

head(airquality)

str(airquality)

 m = matrix(rnorm(100), 10, 10)

 str(m) 
m[,1] 

s = split(airquality, airquality$Month)

str(s)

#### Simulation
### d == denstiy
### r == random number generation
### p == cumulative distribution
### q == quantile function

### pnorm(q) = phi(q)
### qnorm(p) = phi^-1(p)

dnorm(x, mean= 0, sd=1, log=FALSE)

pnorm(q, mean=0, sd=1, lower.tail = TRUE, log.p = FALSE) ### lower tail to the left

qnorm(p, mean=0, sd=1, lower.tail = TRUE, log.p = FALSE)## lower tail false, then upper tail

rnorm(n, mean=0, sd=1)

rnorm(10)

rnorm(10, 20, 2)

summary(rnorm(10, 20, 2))

#### set.seed
set.seed(1) ### To derive same random variables

rnorm(5)

rnorm(5)

set.seed(1)
rnorm(5)

set.seed(123)

rnorm(5)

### rpois
rpois(10, 1) ### lambda/rate is roughly the mean of the distribution

rpois(10,2)

rpois(10,20)

### cummlative distribution
ppois(2,2)   ### pr(x<=2) probability that a poisson variable is less/equal to two(given example) if the rate is two

ppois(4,2)

ppois(6,2)


### Simulation linear model
set.seed(20)

x = rnorm(100)
e = rnorm(100, 0, 2)
y = 0.5 + 2 * x + e

summary(y)

plot(x,y)


set.seed(10)

x = rbinom(100, 1 , 0.5)  ## function (n, size, prob) binomial variables, x is not continous but just 0 and 1

e = rnorm(100, 0, 2)

y = 0.5 + 2 *x + e

summary(y)

plot(x,y)


set.seed(1)

x = rnorm(100)

log_mu = 0.5 + 0.3 * x

y = rpois(100, exp(log_mu))

summary(y)

plot(x,y)

### Random sampling
set.seed(1)

sample(1:10, 4) #### without replacement no repeated numbers

sample(1:10, 4)

sample(letters, 5)

sample(1:10) ###permutation

sample(1:10)

sample(1:10, replace = TRUE) #### sample with replacement with numbers repeated


### R profilling
system.time()

ls(globalenv())

system.time(readLines("http://www.jhsph.edu"))

hilbert = function(n) {
  i = 1:n
  1/outer(i-1, i, "+")
}

x = hilbert(1000)

system.time(svd(x))

system.time({
  n = 1000
  r = numeric(n)
  for (i in 1:n){
    x = rnorm(n)
    r[i] = mean(x)
  }
})



x <- 1:9; names(x) <- x
# Multiplication & Power Tables
x %o% x
y <- 1:8; names(y) <- paste(y,":", sep = "")
outer(y, x, "^")

#### Rprofiler
Rprof()

summaryRprof()

x = 1:5
y = 3 *x^2 +4

lmxy = lm(y~x)
Rprof(lmxy)

sample.interval = 10000

set.seed(1)
rpois(5, 2)

set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
plot(x, y)

x1 = rnorm(5)
x2 = rnorm(5)
y = 2*x1 + x2^2
Rprof(fit)
fit <- lm(y ~ x1 + x2)
Rprof(NULL)


rbinom(1, size = 100, prob = 0.7)

my_pois = replicate(100, rpois(5, 10)) ### replicate makes a matrix compared to rep

plot(x =cars$speed, y=cars$dist, xlab = "Speed")

plot(cars, pch =2)

boxplot(formula = mpg~cyl, data = mtcars)
