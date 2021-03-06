##  Below are two functions that are used to create a special object that stores a matrix and cache's its inverse.

## The first function, makeCacheMatrix creates a special "matix", which is really a list containing a function to

##1. set the value of the matrix
##2. get the value of the matrix
##3. set the value of the inverse
##4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      
      get <- function() x
      
      setInverse <- function(inverted) m <<- inverted
      getInverse <- function() m
      
      list(set = set, get = get,
           setInverse = setInverse,
           getInverse = getInverse)  
}


## The following function computes the inverse of a square matrix created with the above function. 
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setInverse function.

cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
      m <- x$getInverse()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      
      m <- solve(x$get(), ...)
      x$setInverse(m)
      m
}