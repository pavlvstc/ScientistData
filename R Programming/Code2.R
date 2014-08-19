getwd()
## set new working dir
# Para portatil
setwd("C:\\Users\\UTPL_IBM\\Dropbox\\Mi Formación\\Data Science Specialization\\R Programming")
# Para PC
setwd("F:\\DropBox\\Dropbox\\Mi Formación\\Data Science Specialization\\R Programming")
dir()


# ESTRUCTURAS DE CONTROL

## IF - ELSE (ELSE IF)

x<-4
if (x>3) {
	y<- 10
} else {
	y<- 0
}
y

# También lo podemos resolver así
y <- if (x>3) {
	15
} else {
	10
}
y


## FOR
for (i in 1:10) {
	print(i)
}

# Presenta elemenos de un vector
x<- c("a", "b", "c", "d")
for (i in 1:4) {
	print(x[i])
}

#En una sola linea por ser una sola instrucción
for (i in 1:4) print(x[i])

# si no conocemos la extensión del vector
for (i in seq_along(x)) {
	print(x[i])
}

#Recorre automaticamente el vector (como foreach) y asigna el valor a la variable
for (letter in x){
	print(letter)
}

#Obtiene el factorial de n
Fact <-1
n<-5
for (i in 1:n) Fact <- Fact * i
Fact

#anidados para recorrer matrices
m <- matrix(1:6,2,3)
for (i in seq_len(nrow(m))) {
	for (j in seq_len(ncol(m)))		#seq_len(ncol(m)) recorre la matriz m desde la primera a la última columna, devuelve el numero de columna 
		print(m[i,j])
}


## WHILE
count <- 0
while(count<10) {
	print(count)
	count <- count + 1
}


z<- 5

while (z>=3 && z<=10) {
	print (z)
	coin <- rbinom(1, 1, 0.5) 	## rbinom(number of experiments, number of observations per experiment, probability of success)
						## To simulate random scenarios that are binomial
						## devuelve valores 1 ó 0
	if (coin ==1) {  ##random walk
		z<- z+1 
	} else {
		z<- z-1
	}
}


## REPEAT

x<- 0
tol <- 1e-8

repeat {
	x1 <- computeEstimate()

	if (abs(x1-x0) < tol) {
		break
	} else {
		x0 <- x1
	}
}


#NEXT and RETURN

for (i in 1:100) {
	if (i<=20) {
		## skip the first 20 interactions
		next
	}
	print(i) ## Presenta solamente los numeros del 21 al 100
}


## FUNCIONES
#Pueden ser pasadas como argumentos a otras funciones
#Pueden ser anidadas
#El valor que regresa de la función es la última función en ser evaluada entro del cuerpo de la función  

#tienen NAMED ARGUMENTS los cuales a su vez tienen DEFAUL VALUES
#argumentos FORMAL se incluyen en la definición de la función
#funciones FORMALS retornan una lista de todos los argumentos FORMAL de la función 
#no todas las funciones disponen de argumentos FORMAL
#los argumentos no tienen un orden explícito al ser llamados (como en el caso de otros lenguajes como C o java), se pueden llamar por su nombre o se autentican basados en el tipo de dato enviado

f <- function (a, b) {
	a^2			# "a" elevado a la "2"
}

f(3)			#ejecuta la función
			#no presenta error a pesar de solamente enviar un parámetro



f <- function (a,b) {
	print(a)
	print(b)
}
f(45)		#presenta un error ya que la función trabaja con los dos parámetros, y los requiere.


Se puede usar como argumentos "..." para omitir los parámetros de una función base a la cual se referencia

myplot <- function(x, y, type = "1", ...) {
	plot(x,y,type=type, ...)
}

lm <- function(x) {x * x}
lm					#presentará el codigo fuente de la función que se le asignó
lm(2)					#presentará la ejecución de la función con el valor 2 en x


search()		# lista a las funciones y paquetes donde el compilador buscará las variables a usar
## The global environmentor the user’s workspace is always the first element of the search list and the basepackage is always the last.
## User’s can configure which packages get loaded on startup so you cannot assume that there will be a set list of packages available.
## When a user loads a package with librarythe namespace of that package gets put in position 2 of the search list (by default) and everything else gets shifted down the list
## Note that R has separate namespaces for functions and non-functions so it’s possible to have an object named c and a function named c.

## ALCANCE (Scoping)

#Alcance Lexico
f<- function (x,y) {
	x^2+y/z
}
## En la función anterior, "z" es una "variable libre", ya que no se ha definido como parámetro o variable de función
## Las reglas de asignación explican como R asigna valores a estas variables

#Lexical scoping <=  los valores de las variables libres son buscados en el "entorno" en el cual la variable fue definida
			#Si el valor no se encuentra en el entorno en el cual fue definida, se busca en el entorno padre (se maneja de una manera parecida a la OO)
			#Continúan así hasta llegar al nivel máximo (Top Level)
			#Si no lo encuentra, intenta en el entorno vacío, luego devuelve un error

# En R se puede definir una función dentro de otra por niveles

make.power <- function(n) {
	pow <- function(x) {
		x^n 
	}
	pow 
}

cube <- make.power(3)		#envía el parámetro "n"
cube(3)				#envía el parámetro "x" y ejecuta la función
square <- make.power(2)		#envía el parámetro "n"
square(3)				#envía el parámetro "x" y ejecuta la función

#veamos que hay en un entorno
ls(environment(cube))		#muestra las variables y funciones de cube
get("n", environment(cube))	#muestra el valor de la variable "n" del entorno de cube
get("pow", environment(cube))	#muestra el valor de la funcion "pow" del entorno de cube

#Ejemplo para medir el alcance de una variable
#poner atención en y

y <- 10

f <- function(x) {
	y <- 2
	y^2+ g(x)		#aquí y = 2
}

g <- function(x) { 
	x*y			#aquí y = 10	
}

f(3)


### DATES
# Dates are represented by the "Date" class and  can  be  coerced  from  a  character  string  using  the "as.Date()" function.
# Dates are stored internally as the number of days since 1970-01-01

x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))
		
## Times are represented using the "POSIXct" or the "POSIXlt" class
# weekdays: give the day of the week
# months: give the month name
# quarters: give the quarter number (“Q1”, “Q2”, “Q3”, or “Q4”)

x <- Sys.time()		# X toma la fecha y hora del sistema
p <- as.POSIXlt(x)	# almacena datos como día de la semana, día del año, mes, día del mes....
names(unclass(p))		# muestra los valores guardados: 
## [1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"   "yday"  
## [9] "isdst"  "zone"   "gmtoff"
p$sec		#muestra los segundos
p$min
p$hour
p$wday	#numero del día de la semana

x <- Sys.time()		#por defecto toma el tipo "POSIXct"
unclass(x)	
x$sec				#esto dará un error de formato
p <- as.POSIXlt(x)
p$sec				#ahí si se puede presentar los segundos


## the "strptime" function in case your dates are written in a different format
datestring <- c("January 10, 2012 10:40", "December 9, 2011 09:34")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
unclass(datestring)

## Operaciones con dates

x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S") 	## esta función está dando error
x <- as.POSIXlt(x)
x-y


#######
QUIZ
####

f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}

z <- 10
f(3)

x <- 5
y <- if(x < 3) {
        NA
} else {
        10
}

y