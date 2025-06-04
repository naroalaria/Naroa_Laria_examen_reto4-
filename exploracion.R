library(digest)
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

datos<-read.csv("C:\\Users\\naroa\\Downloads\\netflix.csv")

summary(datos)
desvmin <- sd(datos$Minutes,na.rm=T)
desvseas <- sd(datos$Seasons,na.rm=T)

length(unique(datos$type))
length(unique(datos$country))
length(unique(datos$director))

#por variable
miss_var_summary(datos)

#visualizar
boxplot(datos$Seasons)
boxplot(datos$Minutes)
boxplot(datos$release_year)

#MNAR,MAR,MCAR
vis_miss(datos)

#imputar los NA
imputar <- kNN(datos, k=5)
unique(imputar["Minutes"])
unique(imputar["Seasons"])



