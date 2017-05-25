## The two functions belows are used to calculate the inverse of a matrix and
## for caching the inverse of a Matrix which can be costly in computation
##when one calculates it repeaditly. Some examples are given at the end. 


## Write a short comment describing this function

## set the value, get the value, set the inverse and gets the inverse 
##of the special matrix

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set <- function(y){
x <<- y
m <<- NULL
}
get <- function() x
setinverse <- function(inverse) m <<- inverse
getinverse <- function() m
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Write a short comment describing this function

## calculates the inverse of the special matrix retruned by 
##the eval of makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
m <- x$getinverse()
if(!is.null(m)){
message("getting cached data")
return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinverse(m)
m
}

## Here are some examples

## Example 1

## c1<--1:0
## c2<-2:3
## mat2<-cbind(c1,c2)
## matrix2 <- makeCacheMatrix(mat2)
## mat2
##     c1 c2
##[1,] -1  2
##[2,]  0  3
## cacheSolve(matrix2)
##   [,1]      [,2]
##c1   -1 0.6666667
##c2    0 0.3333333
 
## Example 2

## mat=matrix(1:4,nrow=2,ncol=2)
## matrix <- makeCacheMatrix(mat)
## mat
##     [,1] [,2]
##[1,]    1    3
##[2,]    2    4
## cacheSolve(matrix)
##     [,1] [,2]
##[1,]   -2  1.5
##[2,]    1 -0.5

