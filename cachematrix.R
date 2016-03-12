# This file contians makeCacheMatrix and cacheSolve functions 
# Create a Cache Matrix that can get and set the matrix, 
# and can get inverse and set inverse of the matrix 
makeCacheMatrix <- function(cacheMatrix = matrix()) {
    inverse <- NULL
    set <- function(matrixNewValue) {
        cacheMatrix <<- matrixNewValue
        inverse <<- NULL
    }

    get <- function() cacheMatrix
        setInverse <- function(newInverse) inverse <<- newInverse
        getInverse <- function() inverse
        list(set = set, get = get,
            setInverse = setInverse,
            getInverse = getInverse)
}

# cacheSolve take a matrix as input and returns an inverse of the input
# matrix. If the matrix inverse is never cached, we use solve to get the
# inverse matrix and cache the inverse. If the inverse of the 
# input matrix exists in the cache, the cached inverse matrix is returned. 
cacheSolve <- function(aMatrix, ...) {
    # Return a matrix that is the inverse of 'aMatrix'
    inverseCacheMatrix <- aMatrix$getInverse()
    if(!is.null(inverseCacheMatrix)) {
        message("Getting cached matrix inverse...")
            return(inverseCacheMatrix)
    }
    # Get the input matrix 
    data <- aMatrix$get()
    liveInverseMatrix <- solve(data, ...)
    aMatrix$setInverse(liveInverseMatrix)
    liveInverseMatrix
}
