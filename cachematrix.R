## These fuctions create a special matrix object that can cache a copy of its
## own inverse, allowing for faster use of the inverse instead of computing each
## time it is needed

## replaces the "matrix" command

makeCacheMatrix <- function(x = matrix()) {
     xinv=NULL
     set <- function(y) { # create the matrix
          x<<- y
          xinv <<- NULL 
          
     }
     get <- function() x # returns the matrix
     setinv <- function(xinverse)  xinv<<- xinverse
     getinv <- function() xinv
     list(set=set,get=get,setinv=setinv,getinv=getinv)
     

}


## solves for the inverse, or gets from cahe

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
     xinv = x$getinv()
     if (!is.null(xinv)) {
          message("getting inverse from cache")
          return(xinv)
     }
     data <- x$get()
     xinv=solve(data)
     x$setinv(xinv)
     xinv
}
