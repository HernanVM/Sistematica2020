setwd("/Users/Odontodactylus/Desktop/Sist2020/R/")

# número de taxones
n <- 

# árboles enraizados

factorial((2*n)-3)/((2^(n-2))*(factorial(n-2))) #NCR

#árboles sin enraizar
factorial((2*n)-5)/((2^(n-3))*(factorial(n-3))) #NSR

#Grafiquemos esos numeros

taxones <- c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) # número de terminales
NCR<-factorial((2*taxones)-3)/((2^(taxones-2))*(factorial(taxones-2))) # número árboles enraizados
NSR<-factorial((2*taxones)-5)/((2^(taxones-3))*(factorial(taxones-3))) # de árboles sin enraizar

plot(taxones,NCR, type="o", col="red", xlim=c(1,20), log="y") # grafiquemos taxones vs número de árboles con raíz en escala log
lines(taxones,NSR, type="o", col="blue", xlim=c(1,20)) # y agreguemos los árboles sin enraizar
legend("bottomright",c("Con Raíz","Sin Raíz"), lwd=c(1,1), col=c("red","blue"), y.intersp=1.5)

