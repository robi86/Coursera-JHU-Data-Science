
  ## The function makCacheMatrix creates a special vector that
  ## is a list of four functions: "set", "get", "setinv" and "getinv" 
  ## x is a 4 x 4 matrix of randomly sampled variables that is cached using the "<<". 
  ## This is useful for lexical scoping purposes to cache a time consuming computation 
  ## such as a vector mean  
  
makeCacheMatrix <- function(x = matrix()) {
 inverse_matrix <- NULL
 set <- function(y){
   x <<- y
   inverse_matrix <<- NULL
 }
 get <- function() x
 setInv <- function(inverse) inverse_matrix <<- inverse
 getInv <- function() inverse_matrix
 list(set = set,
      get = get,
      setInv = setInv,
      getInv = getInv)
}

  ## cacheSolve is a function that returns the inverse of the matrix
  ## It first looks to see if the inverse has been calculated. 
  ## If the inverse is not available it inverses the matrix using the Solve function  
  
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse_matrix <- x$getInv()
        if(!is.null(inverse_matrix)){
          message("Getting cached data")
          return (inverse_matrix)
        }
        newmat <- x$get()
        inverse_matrix <- solve(newmat, ...)   
        x$setInv(inverse_matrix)
        inverse_matrix
}
## Test the function using the following values
## makematrix <- makeCacheMatrix(matrix(rnorm(100), 4,4))
## makematrix$get()
## [,1]       [,2]
## [1,]  0.5080843  2.9377464
## [2,] -1.3338866 -0.6961895
## [3,] -0.1678523 -0.2498739
## [4,]  2.5058018 -1.2179172
## [,3]       [,4]
## [1,] 0.7910874  0.7798623
## [2,] 0.2348005  0.5208507
## [3,] 0.4584468  0.4026964
## [4,] 0.1259448 -0.5365863
## > makematrix$getInv()
## NULL

## > cacheSolve(makematrix)
## [,1]       [,2]
## [1,]  0.89970937  2.5693439
## [2,] -0.00595886 -0.9044386
## [3,] -2.79920730 -9.8616974
## [4,]  3.55805782 11.7367295
## [,3]       [,4]
## [1,]  -3.2440092  1.3670559
## [2,]   0.5944968 -0.4404192
## [3,]  13.1073925 -3.8039910
## [4,] -13.4220415  4.6271629

## > makematrix$getInv()
## [,1]       [,2]
## [1,]  0.89970937  2.5693439
## [2,] -0.00595886 -0.9044386
## [3,] -2.79920730 -9.8616974
## [4,]  3.55805782 11.7367295
## [,3]       [,4]
## [1,]  -3.2440092  1.3670559
## [2,]   0.5944968 -0.4404192
## [3,]  13.1073925 -3.8039910
## [4,] -13.4220415  4.6271629