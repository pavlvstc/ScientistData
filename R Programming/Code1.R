getwd()
## set new working dir
setwd("F:\\Users\\UTPL_IBM\\Dropbox\\Mi Formación\\Data Science Specialization\\R Programming")
dir()

## Data Types

x<- 1

## presenta el valor de x en la pantalla
print(x)		## explicit printing 
x			## auto-printing occurs
msg <- "hola mundo"

x<- 1:20		## Asigna una secuencia de numeros del 1 al 20
x			## Presenta los valores de x


##Creando vectores

x<- c(0.5,0.6)		## numeric
x<- c(TRUE, FALSE)	## logical
x<- c(T,F)
x<- c("a","b","c")	## character
x<- 9:29			## integer
x<- c(1+0i, 2+4i)		## complex

x<- vector("numeric", length = 10)		## crea un vector entero y lo encera

## coersion en vectores
y <- c(1.7, "a") 	## character
y
y <- c(T, 2) 	## Numeric
y
y <- c("a", T) 	## character
y
y <- c("a", 2) 	## character

class(x)		## muestra el tipo de dato
as.numeric(x)	## muestra la variable como si fuera numerica
as.logical(x)	## muestra la variable como si fuera logica
			## Cuando no tienen sentido retorna NA
as.character(x)	## muestra la variable como si fuera caracter
as.complex(x)	## muestra la variable como si fuera numero complejo

## Vectores
v <- c(2*1:15)
v2 <- c(1:30)
v3 <- seq(from=1, to=30)
seq(-5, 5, by=.2) -> v4
v5 <- seq(length=51, from=-5, by=.2)

v6 <- rep (v5, times=2)

v7 <- v3 > 14
v8 <- v4 == v5
## v9 <- mod(v3,2) == 0

v10 <- paste(c("X","Y","Z"), 1:30, sep="")	## llena una lista con la secuencia X, Y, Z (iterativo) agregando una secuencia numerica del 1 al 30


##Matrices
m<- matrix(nrow=2, ncol =3)		## Llena una matriz de 2 x 3 con valores vacios NA
m
dim(m)		## muestra la dimensión de la matriz
attributes(m)	## muestra los atributos de la matriz m

m<- matrix(1:6, nrow=2, ncol =3) ## llena la matriz de 2 x 3 con la secuencia del 1 al 6
m

## Convertir un vector en matriz
m<-1:10		## vector con elementos del 1 al 10
m
dim(m)<- c(2,5)	## convierte vector de 10 elementos en matriz de 2x5

## Crear una matriz a partir de 2 vectores
x<- 1:3
y<- 10:12
cbind(x,y) -> m		##Une los vectores como columnas de una nueva matriz (nx2)
m
rbind(x,y) -> m		##Une los vectores como filas de una nueva matriz (2xn)
m

## Mas de matrices
m1 <- matrix(1:6,2,3)
m1
m1[1,2]
m1[2,1]
m1[1,]
m1[,2]
m1[1,2, drop=FALSE]
m1[1, , drop=FALSE]


##LIST

x<- list (1, "a", T, 1+4i, matrix(1:6, nrow=2, ncol =3))	##Llena una lista con diferentes tipos  de datos
x		##Muestra toda la lista
x[[5]]	##Presenta la matriz guardada en la posición 5
x[5]


##Subsetting list

l1 <- list(foo=1:4, bar= 0.6)
l1
l1[[1]]
l1$bar
l1[["bar"]]
l1["bar"]

l2 <- list(foo=1:4, bar= 0.6, baz ="hello")
l2[c(1:3)] ##presenta los elementos del 1 al 3. Todos los elementos de las lista
l2[c(1,3)] ##presenta los elementos 1 y 3.
name <- "foo"   ## asigna "foo" a name
l2[[name]]   ## presenta el elemento "foo" asignado a la variable name
l2$foo	 ## el mismo resultado que la sentencia anterior

l3 <- list(a = list(10,12,14), b = c(3.14,2.81))
l3[[c(1,3)]]   ## presenta el elemento de la sublista 1, columna 3
l3[[1]][[3]]   ## el mismo resultado anterior
l3[[c(2,1)]]   ## presenta el primer elemento de la sublista 2) 

l4 <- list(aardvark = 1:5)
l4
l4$a		##presenta los elementos de la lista ubicando solo la primera letra

l5 <- c(1,2,NA,4,NA,5)
l5
bad <- is.na(l5)		## Devuelve una lista con valores lógicos
bad
l5[!bad]			## presenta los valores FALSE de la lista l5 (que no son NA)

l6 <- c(1,2,NA,4,NA,5)
l7 <- c("a","b",NA,"d",NA,"f")
good <- complete.cases(l6, l7)	## completa una lista al comparar los valores entre las listas l6 y l7
good	
l6[good]		##presenta los elememos que en la lista goog resulten verdaderos en la lista 6
l7[good]		##presenta los elememos que en la lista goog resulten verdaderos en la lista 7

airquality[1:6, ]		##parámetros de calidad del aire
good <- complete.cases(airquality)
good
airquality[good,][1:6, ]


#FACTORS
x <- factor(c("yes","yes","no","yes","no"))
x
table(x)		## cuenta las ocurrencias de cada caso en el arreglo
unclass(x)

x <- factor(c("yes","yes","no","yes","no"), levels=c("yes","no","both"))		##también se puede ser explícito en los factores a evaluar
x


## Missing values (valores perdidos)
## NA for mathematicals
## NaN for undefined mathematical operations.

x <- c(1,2,NaN,NA,4)
is.na(x)	## valora si en la lista hay valores NA (los valores NaN también con NA)
is.nan(x)	## valora si en la lista hay valores NaN


##DATA FRAMES
## A special type of list where every element of the list has to have the ##same length
## Data frames can store different classes of objects in each column (just like lists);
## Data frames are usually created by calling read.table()   or   read.csv()
## Data frames also have a special attribute called   row.names
## Can be converted to a matrix by calling   data.matrix()

x <- data.frame(f00 = 1:4, bar = c(T,T,F,F))   ## Crea un Data Frame con dos columnas; cada columna tiene registros (es necesario que todas las columnas tengan igual numero de registros
x
nrow(x) 	## Presenta el numero de registros del Data.Frame
ncol(x)	## Muestra el numero de campos (columnas) del Data.Frame


## NAMES
## Asignar nombres a las columnas de un arreglo, matriz, list o data.frame

x <- 1:3
names(x)
names(x) <- c("col1", "col2", "col3")
x

x<- list(a=1, b=2, c=3)
x

m <- matrix(1:4, nrow=2, ncol=2)
dimnames(m) <- list(c("f1","f2"), c("c1","c2"))
m


###########################
###########################

## READING AND WRITING DATA

## READING DATA
## read.table, read.csv, 	for reading tabular data 
## readLines, 			for reading lines of a text file
## source, 				for reading in R code files (inverse of dump)
## dget, 				for reading in R code files (inverse of dput)
## load, 				for reading in saved workspaces 
## unserialize, 			for reading single R objects in binary form


## WRITING DATA
## write.table
## writeLines
## dump
## dput
## save
## serialize


data <- read.table("foo.txt")

x <- c(4, TRUE)
x
class(x)


########## PRUEBA

#8 Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[1]] give me?
x <- list(2, "a", "b", TRUE)
x[[1]]

#9 Suppose I have a vector x <- 1:4 and a vector y <- 2. What is produced by the expression x + y?
x <- 1:4
y <-2
x+y


#10 Suppose I have a vector x <- c(3, 5, 1, 10, 12, 6) and I want to set all elements of this vector that are less than 6 to be equal to zero. What R code achieves this?
x <- c(3, 5, 1, 10, 12, 6)
x[x <= 5] <- 0
x


data <- read.csv("hw1_data.csv")

#15 What is the value of Ozone in the 47th row?
col <- data[,1]
col[47]

#16 How many missing values are in the Ozone column of this data frame?
table(factor(is.na(col)))

#17 What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
col2 <- col[!is.na(col)]
col2
mean(col2)

#18 Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
data1 <- data[data[4]>90 & data[1]>31,]	## Filtra los datos de la columna 4 que sean mayores a 90,  de la columna 1 mayores a 31. Quedan registros con NA
data1 <- data1[!is.na(data1[1]),]		## Elimina los NA. Como todas las columnas tienen NA en este caso tomo la 1
mean(data1[,2])					## Obtiene el promedio de la segunda columna

#19 What is the mean of "Temp" when "Month" is equal to 6? 
data2 <- data[data[5]==6,]		## Filtra los datos de todos los registros del mes 6
mean(data2[,4])				## Obtiene el promedio de la cuarta columna 

#20 What was the maximum ozone value in the month of May (i.e. Month = 5)?
data3 <- data[data[5]==5,]
data3 <- data3[!is.na(data3[1]),]
max(data3[,1])


myfunction <- function() {
	x<- rnorm(100)
	mean(x)
}

second <- function(x) {
	x = rnorm(length(x))
}