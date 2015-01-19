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

# PARTE 1
# Escribir una funcion llamada 'polluntmean' que calcule la media de una partícula
# contaminante (sultato o nitrato). La función tomará tres argumentos 'directory', 
# 'pollutant', 'id'. Dado un número de identificación la función deberá devolver la 
# media de la partícula contaminante sin cosiderar los NA.

pollutantmean <- function(directory, pollutant, id = 1:332) {
	allFiles <- list.files(path = "C:\\Users\\Lorena\\Desktop\\Coursera\\Toolbox Data Science\\R programming\\semana 2\\specdata", full.names = TRUE)
	selectedData <- data.frame()
	for (i in id) {
	selectedData <- rbind(selectedData, read.csv(allFiles[i]))
	}
	if (pollutant == 'sulfate') {
	mean(selectedData$sulfate, na.rm = TRUE)
	} else if (pollutant == 'nitrate') {
	mean(selectedData$nitrate, na.rm = TRUE)
	}
}

# Ejemplos
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
