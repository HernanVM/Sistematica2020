````
# Introducción a R
# Abrir y leer código de R en Sublime 3
# Todo esto es lo que vimos en clase virtual
# el hashtag # sirve para hacer comentarios y notas, R se lo brinca

# R sirve para todo tipo de cuestiones estadísticas, desde aritmética, hasta genómica
3+4
# [1] 7 resultado
7-3
# [1] 4
sqrt(81)
# [1] 9
560-180-130
# [1] 250

# para meter datos a R usamos vectores (más de un dato) con la fórmula nombre <- c(dato1,dato2,datoN)
edades1<-c(18,18,18,18,18,19,20,19,18,18,21,19,19,18,18,18,18,18,19,55,19,21,19)

560-180-130
# [1] 250
length(edades1) #elementos en un vector edades1
# [1] 23
mean(edades1) # promedio de los elementos en el vector
# [1] 20.26087
median(edades1) # mediana
# [1] 18

# la moda se puede sacar con una función, que es una serie de ecuaciones y órdenes para R
getmode <- function(v) {
   uniqv <- unique(v) #selecciona los valores únicos de un vector v
   uniqv[which.max(tabulate(match(v, uniqv)))] # encuentra en v los valores únicos, tabúlalos y encuentra el que ocurra más
}

getmode(edades1) #moda de los elementos del vector
# [1] 18

sd(edades1) # desviación estándar del vector 
# [1] 7.628996

# para qué sirve sd()
promedio1<-c(9,9,9,9,9,9,9,9,9,9)
promedio2<-c(10,10,10,10,10,8,8,8,8,8)
mean(promedio1)
# [1] 9
mean(promedio2) #mismo promedio
# [1] 9
sd(promedio1)
# [1] 0
sd(promedio2) # muy distinta sd
# [1] 1.054093
hist(edades1) # histograma edades 

edades2<-c(18,18,18,18,18,19,20,19,18,18,21,19,19,18,18,18,18,18,19,19,21,19) # sin datos de los profesores
edades2
 # [1] 18 18 18 18 18 19 20 19 18 18 21 19 19 18 18 18 18 18
[19] 19 19 21 19
mean(edades2)
# [1] 18.68182
mean(edades1)-mean(edades2) #aritmética con dos funciones de promedios
# [1] 1.579051
mediaedades1 <- mean(edades1) # se pueden guardar los resultados en otro objeto (vector de un solo elemento)
mediaedades1
# [1] 20.26087
mediaedades2 <- mean(edades2) # guardamos otro promedio
mediaedades1 - mediaedades2 # y se pueden hacer cualquier tipo de cuentas
# [1] 1.579051
mediaedades1 * mediaedades2
# [1] 378.5099
mediaedades1 / mediaedades2
# [1] 1.084523
mediaedades1 ^ mediaedades2
# [1] 2.574831e+24

mediaedades1 * exp (mediaedades2)
# [1] 2630683670
hist(edades2) # histogramas con sus diferentes opciones
hist(edades2,main="gráfica de histograma")
hist(edades2,main="gráfica de histograma", xlab="Edades", border="blue", col="green", xlim=c(0,25), las=1, breaks=5)
hist(edades2,main="gráfica de histograma", xlab="Edades", border="blue", col="green", xlim=c(15,25), las=1, breaks=10)

install.packages("RColorBrewer") # para instalar paquetes en R, el nombre del mismo debe de ir en ""
library(RColorBrewer) # el paquete, o biblioteca de funciones, se carga sin su nombre en comillas

# vamos a hacer cabezuelas de girasoles en R con series de Fibonacci y el número áureo
library(RColorBrewer)
golden.ratio = (sqrt(5) + 1)/2 # número aureo
fibonacci.angle=360/(golden.ratio^2) # ángulo de Fibonacci
c=1 #valor de inicio
num_points=630 # número de inflorescencias
x=rep(0,num_points) # creamos un vector x para meter los datos
y=rep(0,num_points) # y otro y para posicionar las inflorescencias en ejes x.y

for (n in 1:num_points) {   # un asa para calcular las vueltas de la cabezuela usando funciones de senos y cosenos
    r=c*sqrt(n)
    theta=fibonacci.angle*(n)
    x[n]=r*cos(theta)
    y[n]=r*sin(theta)
}

plot(x,y,axes=FALSE,ann=FALSE,pch=19,cex=1)  # y graficamos en blanco y negro, color sólido (pch=19), con tamaño de 1 (cex)

#Ahora a pintarlo de colores
colp <- brewer.pal(9, "Purples") # selección de paleta de 9 colores morados de RColorBrewer
colp
# [1] "#FCFBFD" "#EFEDF5" "#DADAEB" "#BCBDDC" "#9E9AC8" los colores del vector colp
# [6] "#807DBA" "#6A51A3" "#54278F" "#3F007D"
palp <- colorRampPalette(colp) # rampa de colores

plot(x,y,axes=FALSE,ann=FALSE,pch=19,cex=1,col = palp(num_points)) # misma grñafica pero con color de rampa de morados

# lo mismo pero con 11 colores espectrales
cols <- brewer.pal(11, "Spectral")
pals <- colorRampPalette(cols)
plot(x,y,axes=FALSE,ann=FALSE,pch=19,cex=1,col = pals(num_points))


# fibonacci.angle=360/(golden.ratio^2)+0.01 si le sumamos a esta línea algo de ángulo (0.01) cambia la orientación de las flores

# Intenten cambiar ese ángulo de Fibonacci y ver cómo cambia la orientacion de las flores en la cabezuela
