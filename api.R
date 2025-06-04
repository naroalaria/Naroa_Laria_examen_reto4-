#api
library(digest)
library(ggplot2)
library(discretization)
library(dplyr)
library(EnvStats)
library(fastDummies)
library(naniar)
library(nortest)
library(readxl)
library(smoothmest)
library(VIM)
library(plumber)
datos <- read.csv("C:/Users/naroa/Downloads/netflix.csv")
apiexamen<-"
#*@apiTitle api examen reto 4
#*@apiDescription generar una API con ciertas características
#*@param Minutes
#*@get /True or False
function(Minutes)
datosdeminutos <- as.numeric(datos$Minutes)
datoscontransformacion <- log(datos$Minutes)
return(hist(datos$Minutes))

"
writeLines(apiexamen,"api.R")
r <- plumb("api.R")
r$run(port=8000)

