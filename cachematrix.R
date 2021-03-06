## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# This function creates a special matrix object that can cache its inverse 
# 
# A primeira função retorna uma lista que precisa conter o seguinte:
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of the inverse
# 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv 
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function
# This function computs the inverse of the special matrix returned by makeCacheMatrix. If the inverse has 
# already been calculate and the matrix has not changed, than the cacheSolve should retrieve the inverse
# from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}

# Teste
B <- matrix(c(1,2,3,4),2,2)
B

solve(B)

B1 <- makeCacheMatrix(B)
B1

cacheSolve(B1)
