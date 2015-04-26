## Cache a matrix and potentially time-consuming computations.

## Create a caching wrapper for a matrix and potentially
## time-consuming computations, including inverse (solve).
makeCacheMatrix <- function(origMatrix = matrix()) {
  
  ## Cache
  cacheMatrix <- origMatrix
  cacheSolve <- NULL
  
  ## Private methods
  
  # Execute solve and cache the result
  execSolve <- function() {
    cacheSolve <<- solve(cacheMatrix)
  }
  
  ## Public methods
  
  # Cache a new matrix
  set <- function(newMatrix) {
    cacheMatrix <<- newMatrix
    cacheSolve <<- NULL
  }
  
  # Get the cached matrix
  get <- function() cacheMatrix
  
  # Get the cached solve
  getSolve <- function() {
    # Calculate and cache if not already cached
    if (is.null(cacheSolve)) execSolve()
    cacheSolve
  }
  
  ## Return
  list(set = set,
       get = get,
       getSolve = getSolve)
}


## Get the solve result of a cached matrix.
cacheSolve <- function(x, ...) {
  x$getSolve()
}
