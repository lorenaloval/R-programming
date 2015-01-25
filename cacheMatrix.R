# R - PROGRAMMING
# PROYECTO 2
# Crear una función que calcule la matriz inversa dada una matriz inicial.
# 1º) función 'makeCacheMatrix' crea una lista que contiene
	# el conjunto de valores de la matriz
	# obtener el valor de la matriz
	# conjunto de valores de la matriz inversa
	# obtener el valor de la matriz inversa 

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) inv <<- inverse
	getinverse <- function() inv
	list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

# La siguiente función devuelve la matriz inversa.
# Primero se comprueba si la inversa ya ha sido calculada. En ese caso, se muestra el resultado.
# En caso contrario, se calcula la matriz inversa.

cacheSolve <- function(x, ...) {
	inv <- x$getinverse()
	if(!is.null(inv)) {
		message("getting cached data.")
		return(inv)
	}
	data <- x$get()
	inv <- solve(data)
	x$setinverse(inv)
	inv
}

## Ejempo:
x = rbind(c(1, -2), c(-3, 1))
m = makeCacheMatrix(x)
m$get()
##      [,1] [,2]
## [1,]   1   -2
## [2,]  -3    1

cacheSolve(m)

##       [,1]  [,2]
## [1,]  -0.2  -0.4
## [2,]  -0.6  -0.2

cacheSolve(m)
## getting cached data.
##       [,1]  [,2]
## [1,]  -0.2  -0.4
## [2,]  -0.6  -0.2
