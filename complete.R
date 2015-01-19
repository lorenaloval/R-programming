# CURSO: R - PROGRAMMING
# PROYECTO 1: AIR POLLUTION

# El archivo zip contiene 332 archivos csv cuyos valores están separados por comas.
# Contiene datos relativos a la vigilancia de la contaminación del aire por partículas
# finas (PM) en 332 localidades en los Estados Unidos. Cada archivo contiene los datos
# de un solo monitor.
# Cada archivo contiene 3 variables:
	# Date: la fecha de la observación en formato YYY-MM-DD
	# sulfate: el nivel de sulfato de PM en el aire (microgramos por metro cúbico)
	# nitrate: el nivel de nitrato de PM en el aire (microgramos por metro cúbico)
# Crear el directorio 'specdata'

# PARTE 2
# Escribir una funcion llamada 'complete' que lea un directorio completo de
# archivos e informe del número de casos completos observados en cada archivo. 
# La función devolverá dos columnas, la primera con el nombre del archivo y
# la segunda con el número de casos completos.

complete <- function(directory, id = 1:332) {
	allFiles <- list.files(path = "C:\\Users\\Lorena\\Desktop\\Coursera\\Toolbox Data Science\\R programming\\semana 2\\specdata", full.names = TRUE)
	selectedData <- data.frame()
	completeCases <- data.frame()
	nobs <- data.frame();
	for (i in id) {
	selectedData <- (read.csv(allFiles[i],header=TRUE))
	nobs <- sum(complete.cases(selectedData))
	completeCases <- rbind(completeCases, data.frame(i,nobs))
	}
	completeCases
}

# Ejemplos
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
