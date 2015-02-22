## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#makeCacheMatrix is a funciton that creates a special "matrix", which is really a list containing a functoin to
#1. set the value of the matrix
#2. get the value of the matrix
#3. set the vaule of the inverse
#4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    xinv<- NULL #the result of the inversion will be stored here
    set <- function(y) {
        x<<-y #this '<<-' keeps these internal variables from being exposed to the outside environment
        xinv<<-NULL
    }
    get<function() x #returns the input of the matrix
    setinv<-function(inv) xinv<<-inv #sets the inversed matrix
    getinv<-function()xinv #returns the inversed matrix
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## Write a short comment describing this function
#cacheSolve function determines if the inverse has already been created in cache which will save time and resources. 
cacheSolve <- function(x, ...) {
    m<-x$getinv() #gets the inversed matrix from x (if it is uncalculated then NULL is returned)
    if(lis.null(m)){ #if found in cache then message is returned
        message("getting cached data")
        return(m)
    }
    data<-x$get() #if not then x$get is preformed to return the matrix 
    m<-solve(data, ...) #solves
    x$setinv(m) #sets it to the object
    m #returns a matrix that is the inverse of 'x'
        ## Return a matrix that is the inverse of 'x'
}
