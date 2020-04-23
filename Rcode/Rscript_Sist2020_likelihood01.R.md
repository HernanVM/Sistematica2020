```
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

#cambiar log="y" por "xy"

#cargar paquetes
library(ape)
library(phangorn)
library(seqinr)

#leer alineamiento
#cephs18s <- read.FASTA("cephalopods18s_aln.fasta", type = "DNA")
cephs18s <- read.FASTA("cephalopods18s_aln.fasta", type = "DNA")

#leer alineamiento para phangorn 
cephs18s_phyDat <- phyDat(cephs18s, type = "DNA", levels = NULL)

#calcular frecuencias de las bases
base.freq(cephs18s, freq = FALSE, all = FALSE)

#cambiar a objeto DNAbin
cephsdna <- as.DNAbin(cephs18s_phyDat)

#calcular modelo evolutivo
mtcephs18s <- modelTest(cephs18s_phyDat)

#ver la lista de modelos y su máxima verosimilitud
print(mtcephs18s)

#calcular distancias
distJCcephs <- dist.ml(cephs18s_phyDat, model="JC69")
distGTRcephs <- dist.dna(cephsdna, model="GG95")
distTNcephs <- dist.dna(cephsdna, model="TN93")
distHKYcephs <- dist.dna(cephsdna, model="F81")
#ver distancias JC
print(distJCcephs)
#salvar distancias JC
writeDist(distJCcephs, "distJCcephs.txt")
#convertir distancias en vector
JCcephsv <- as.vector(distJCcephs)
GTRcephsv <- as.vector(distGTRcephs)
TNcephsv <- as.vector(distTNcephs)
HKYcephsv <- as.vector(distHKYcephs)

#estimar densidades
densJC<-density(JCcephsv, adjust=5)
plot(densJC, xlim=c(-1,1),ylim=range(0,2), xlab="Distancia", main="Modelos de sustitucion")
coldensJC<-adjustcolor("purple", alpha.f = 0.3)
polygon(densJC, col=coldensJC, border="purple", lwd=2)
densGTR<-density(GTRcephsv, adjust=5)
densTN<-density(TNcephsv, adjust=5)
densHKY<-density(HKYcephsv, adjust=5)
coldensGTR<-adjustcolor("green", alpha.f = 0.3)
polygon(densGTR, col=coldensGTR, border="green", lwd=2)
coldensTN<-adjustcolor("orange", alpha.f = 0.3)
polygon(densTN, col=coldensTN, border="orange", lwd=2)
coldensHKY<-adjustcolor("magenta", alpha.f = 0.3)
polygon(densHKY, col=coldensHKY, border="magenta", lwd=2)

#estimar árbol UPGMA
JCcephsUPGMA <- upgma(distJCcephs)
#ver árbol UPGMA
plot(JCcephsUPGMA, main="UPGMA")
axisPhylo(side = 1, root.time = NULL, backward = TRUE)
write.tree(JCcephsUPGMA, file="JCcephsUPGMA.tre")

GTRcephsUPGMA <- upgma(distGTRcephs)
#ver árbol UPGMA
plot(GTRcephsUPGMA, main="UPGMA")
axisPhylo(side = 1, root.time = NULL, backward = TRUE)
write.tree(GTRcephsUPGMA, file="GTRcephsUPGMA.tre")

TNcephsUPGMA <- upgma(distTNcephs)
#ver árbol UPGMA
plot(TNcephsUPGMA, main="UPGMA")
axisPhylo(side = 1, root.time = NULL, backward = TRUE)
write.tree(TNcephsUPGMA, file="TNcephsUPGMA.tre")

HKYcephsUPGMA <- upgma(distHKYcephs)
#ver árbol UPGMA
plot(HKYcephsUPGMA, main="UPGMA")
axisPhylo(side = 1, root.time = NULL, backward = TRUE)
write.tree(HKYcephsUPGMA, file="HKYcephsUPGMA.tre")

#estimar árbol NJ
JCcephsNJ <- NJ(distJCcephs)
#ver árbol NJ
plot(JCcephsNJ, main="NJ")
axisPhylo(side = 1, root.time = NULL, backward = TRUE)
write.tree(JCcephsNJ, file="JCcephsNJ.tre")
JCcephsNJr <-root(JCcephsNJ, "AY145384_Nautilus_pompilius")
plot(JCcephsNJr, main="NJ enraizado")

GTRcephsNJ <- NJ(distGTRcephs)
#ver árbol NJ
plot(GTRcephsNJ, main="NJ")
axisPhylo(side = 1, root.time = NULL, backward = TRUE)
write.tree(GTRcephsNJ, file="GTRcephsNJ.tre")

TNcephsNJ <- NJ(distTNcephs)
#ver árbol NJ
plot(TNcephsNJ, main="NJ")
axisPhylo(side = 1, root.time = NULL, backward = TRUE)
write.tree(TNcephsNJ, file="TNcephsNJ.tre")

HKYcephsNJ <- NJ(distHKYcephs)
#ver árbol NJ
plot(HKYcephsNJ, main="NJ")
axisPhylo(side = 1, root.time = NULL, backward = TRUE)
write.tree(HKYcephsNJ, file="HKYcephsNJ.tre")

##ML in R
fitNJ <- pml(JCcephsNJr, cephs18s_phyDat)

print(fitNJ)

fitJC <- optim.pml(fitNJ, model = "JC", rearrangement = "stochastic")

logLik(fitJC)

bs <- bootstrap.pml(fitJC, bs=100, optNni=TRUE, multicore=TRUE, control = pml.control(trace=0))

plotBS(midpoint(fitJC$tree), bs, p = 50, type="p")

######Graficar arbolito de IQtree

par(mfrow=c(1,1))
####### Leer árbol
cephs18sml <- read.tree('cephalopods18s_aln.fasta.treefile')
cephs18smlr <-root(cephs18sml, "AY145384_Nautilus_pompilius") #enraizar el árbol con el grupo externo
plot(ladderize(cephs18smlr),cex=0.95,  edge.width = 1.7, direction="r",show.node.label=TRUE,no.margin=FALSE); #ver árbol
cephs18sml$node.label<-as.numeric(cephs18sml$node.label) #cambiar valores de nodos a números
bs.ml<-as.numeric(c(cephs18sml$node.label)) #asegurarse que sean valores numéricos
b <- character(length(bs.ml)) #hacer una matriz b con el tamaño de elementos necesarios
bs.ml[is.na(bs.ml)] <- 0 # cambiar nados faltantes por cero
co<-c(col="black","gray70","red") #indicar colores
b[bs.ml >= 99] <- co[1]; #color alto
b[bs.ml < 99 & bs.ml >= 70] <- co[2]; # color medio
b[bs.ml < 70] <- co[3]; #color bajo
plot(ladderize(cephs18smlr),cex=0.95,  edge.width = 1.7, direction="r",show.node.label=FALSE,no.margin=FALSE); # graficar árbol
nodelabels(pch=21,bg=b,cex=0.90); # agregar nodos
legend("bottomright", legend=expression(99 <= BP, 70 <= BP * " < 99", BP < 70), pch=21, pt.bg=co, pt.cex=0.80,bty="n");
add.scale.bar(ask=TRUE) ##el cursor aparecerá donde uno quiera poner la escala
```
