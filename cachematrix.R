## The first function creates a cache for a matrix. Cachesolve allows to extract the inverse from cache 
## or invert the matrix 

## The first function creates an empty list for the cache and defines the function solve for setsolve

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
       x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(
         set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Cachesolves first checks if the cache is empty. 
## If the cache is not empty  -> the function extracts the inverse from the cache. 
## If the cache is empty -> the function calculates the inverse 

cacheSolve <- function(x, ...) {
    
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m

}
