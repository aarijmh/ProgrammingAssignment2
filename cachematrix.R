## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This functions sets the getters and setters of the matrix 'x' and it's inverse, and return them in a list
## the getter of x is get, the setter of x is set, the getter of inverse is getinverse, the setter of inverse is setinverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## This function calls the getInverse function of the list 'x' if the inverse is present it will use the cached
## inverse, otherwise, it will calculate the inverse and 
## store it in the inverse setter of the list 'x'

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  print(class(data))
  m <- solve(data)
  x$setinverse(m)
  m
}

