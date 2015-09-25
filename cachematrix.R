## ====================================================================================
## created on 9/25/2015
## The functions makeCacheMatrix and cacheSolve will return the inverse of the matrix.
## Function makeCacheMatrix contains 4 functions. The functions setimatrix and getimatrix inside the makeCacheMatrix
## will be used compute the inverse of the matrix.
## Function cacheSolve will compute the inverse of the matrix if function makeCacheMatrix did not compute it.
## ====================================================================================


## ====================================================================================
## The makeCacheMatrix function will compute the inverse of a matrix using functions - setimatrix
## and getimatrix
makeCacheMatrix <- function(x = matrix()) 
  {
     m <- NULL
  
    # Function 1-------------------------
      set <- function(y) 
      {
        x <<- y
        m <<- NULL
      }
    # Function 2------------------------- 
      get <- function() x
  
    # Function 3------------------------- 
      setimatrix <- function(bozo) m <<- bozo    
         
       
    # Function 4------------------------- 
      getimatrix <- function() 
      { 
        if(!is.null(m))
        {
        sm <- solve(m) 
        sm
        }
      }
       
  
       list(set = set, get = get,
       setimatrix = setimatrix,
       getimatrix = getimatrix)

  }



## ====================================================================================
## The CacheSolve matrix will compute the inverse of the matrix if makeCacheMatrix did
## not compute it.
cacheSolve <- function(g ,... )
  {
    ## Return a matrix that is the inverse of 'x'

      m<-g$getimatrix()

      if(!is.null(m))
      {
        message("getting cached data")
      return(m)
      }
    
    
    ddata<-x$get()
    m<-solve(ddata, ...)
    g$setimatrix(m)
  m
  
  
}


 