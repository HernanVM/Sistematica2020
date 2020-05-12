Utilicen este script de R para poder crear un "nubegrama" o "cloudogram" con los árboles de réplicas de bootstrap de SVDquartets de PAUP
Cámbienle el color a las ramas del nubegrama. **Esta es una actividad extra opcional por si quieren un punto extra en el último parcial.**
Para los que tienen MacOs Catalina y no pueden utilizar la versión GUI de PAUP, usen la versión de comandos de Linux (funciona como MrBayes en su Terminal) y para correr el análisis estos comandos:
```
SVDQuartets taxpartition=snakespecies bootstrap=standard treeFile='/Users/Odontodactylus/Desktop/Sist2020/R/snakes_svdq_boot.tre';
```

El código de R

```
setwd("~/Desktop/Sist2020/R")
library(ape)
library(phangorn)

###### Serpientes Sistrurus de Laura Kubatko
#leer réplicas de bootstrap de SVDquartets
snakesbs<-read.nexus(file='snakes_svdq_boot.tre')

#construye un árbol de consenso de mayoría del 50%
snakescon<-ape::consensus(snakesbs, p=0.5)

#Enraiza el árbol consenso con el grupo externo 
snakesconr<-root(snakescon, "Agkistrodon", resolve.root=TRUE)

#Grafica el árbol para revisar que esté bien
plot(snakesconr)

#enraiza todos los árboles de las réplicas de boostrap con el grupo externo
rsnakesbs <- lapply (snakesbs, root, "Agkistrodon", resolve.root=TRUE)

#salva las réplicas de boostrap enraizadas a un nuevo archivo para que en el futuro carge directamente
write.nexus(rsnakesbs,file='rsnakesbs.tre')

#carga esos árboles salvados y reemplaza los originales
rsnakesbs<-read.nexus(file='rsnakesbs.tre')

#grafica los "nubegramas" con las alturas de los nodos escalados con scaleX=T, usando el árbol consenso de mayoría como guía y con las ramas como cladograma
densiTree(rsnakesbs, type = "cladogram", alpha = 1/10, consensus = snakesconr, optim = FALSE, scaleX = T, col = "blue", width = 1, cex = 0.8)

#similar pero con las ramas cuadradas de un filograma
densiTree(rsnakesbs, type = "phylogram", alpha = 1/10, consensus = snakesconr, optim = FALSE, scaleX = T, col = "grey", width = 1, cex = 0.8)
```


