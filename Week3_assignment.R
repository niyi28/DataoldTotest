makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

makeVector(x=3)



cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}
x= 1:20
arrayval <- makeVector(x) 
cachemean(arrayval)

x =1:3
cachemean(x)

search()


makePower <- function(n) {
               pow <- function(x) {
                              x^n 
                         }
                 pow 
}

ls(environment(cube))

get("n", environment(cube))

 cube <- make.power(3)
 square <- make.power(2)
 cube(3)
 
 
 y <- 10
 f <- function(x) {
            y <- 2
         y^2 + g(x)
                 }
   g <- function(x) { 
        x*y
        }

f(3)

 ## Fix 'mu' to be equalt o 1
 nLL <- make.NegLogLik(normals, c(1, FALSE))  
 x <- seq(1.7, 1.9, len = 100)
 
         ## Evaluate 'nLL()' at every point in 'x'
         y <- sapply(x, nLL)    
 plot(x, exp(-(y - min(y))), type = "l")

 x = matrix(rnorm(16), 4, byrow=TRUE)
 
 matinv =matlib::inv(x)

 solvinv = solve(x) 

 identical(matinv, solvinv)
 
 
 makeCacheMatrix <- function(x = matrix()) {
         MatrixM <- NULL
         set <- function(y) {
                 x <<- y
                 MatrixM <<- NULL
         }
         get <- function() x
         
         setSolve <- function(solve) MatrixM <<- solve
         
         getSolve <- function() MatrixM
         list(set = set, get = get,
              setSolve = setSolve,
              getSolve = getSolve)
 }

 cacheSolve <- function(x, ...) {
         MatrixM <- x$getSolve()
         if(!is.null(MatrixM)) {
                 message("getting cached inverse data")
                 return(MatrixM)
         }
         data <- x$get()   
         if (isTRUE(sqrt(nrow(data) * ncol(data))==nrow(data))){
                 MatrixM <- solve(data, ...)
         }
         
         x$setSolve(MatrixM)
         MatrixM
 } 
 