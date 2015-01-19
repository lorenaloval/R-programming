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

# PARTE 3
# Escribir una funcion llamada 'complete' que calcule la correlación entre 
# el sulfato y el nitrato.

corr <- function(directory, threshold = 0) {
	source("C:\\Users\\Lorena\\Desktop\\Coursera\\Toolbox Data Science\\R programming\\complete.R")
	completeCases <- complete("C:\\Users\\Lorena\\Desktop\\Coursera\\Toolbox Data Science\\R programming\\semana 2\\specdata")
	casesAboveThreshold <- completeCases[completeCases$nobs > threshold,1]
	allFiles <- list.files(path = "C:\\Users\\Lorena\\Desktop\\Coursera\\Toolbox Data Science\\R programming\\semana 2\\specdata", full.names = TRUE)
	correlations <- rep(NA,length(casesAboveThreshold))
	for (i in casesAboveThreshold) {
	fileData <- (read.csv(allFiles[i]))
	completeCases <- complete.cases(fileData)
	SulfatoData <- fileData[completeCases, 2]
	NitratoData <- fileData[completeCases, 3]
	correlations[i] <- cor(x = SulfatoData, y = NitratoData)
	}
	correlations <- correlations[complete.cases(correlations)]
}

# Ejemplos
cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)

cr <- corr("specdata")
summary(cr)
length(cr)
