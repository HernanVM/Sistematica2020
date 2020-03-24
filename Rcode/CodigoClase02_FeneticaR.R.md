```
setwd("/Users/Odontodactylus/Desktop/Sist2020/R") # movernos al directorio de la clase
#cambiar la ruta según su sistema particular
#instalar paquetes
install.packages("ape")
install.packages("phangorn")
install.packages("seqinr")
install.packages("vegan")
install.packages("dendextend")
#cargar paquetes
library(ape)
library(phangorn)
library(seqinr)
library(vegan)
library(dendextend)
##### distancias morfométricas de dragones

# leer la matriz de caracteres
dragondist<-read.table(file="dragon.txt", sep="\t", header=TRUE, row.names=1) #la matriz original de la tarea

#calcular matriz de distancias
ddragonDEU <- dist(dragondist, method="euclidean")
ddragonDEUfit <- hclust(ddragonDEU, method="ward.D")
plot(ddragonDEUfit, main="Distancias euclideanas de dragones")

#distancias euclideanas con upgma
EUdragonUPGMA <- upgma(ddragonDEU)
#ver árbol UPGMA
plot(EUdragonUPGMA, main="UPGMA dragon")
axisPhylo(side = 1, root.time = NULL, backward = TRUE) #crear un eje con las distancias
write.tree(EUdragonUPGMA, file="EUdragonUPGMA.tre")

#otros tipos de distancias
dbraydragon = vegdist(dragondist, "bray") 
dgowerdragon = vegdist(dragondist, "gower")
dbraydragonfit <- hclust(dbraydragon, method="ward.D")
plot(dbraydragonfit, main="Distancias Bray-Curtis")
dgowerdragonfit <- hclust(dgowerdragon, method="ward.D")
plot(dgowerdragonfit, main="Distancias de Gower")

#graficar distancias esperadas y observadas
plot(ddragonDEU, cophenetic(ddragonDEUfit), asp=1)
abline(0, 1)
cor(ddragonDEU, cophenetic(ddragonDEUfit))
# 0.701

#graficar distancias Bray Curtis esperadas y observadas
plot(dbraydragon, cophenetic(dbraydragonfit), asp=1)
abline(0, 1)
cor(dbraydragon, cophenetic(dbraydragonfit))
# 0.98

plot(dgowerdragon, cophenetic(dgowerdragonfit), asp=1)
abline(0, 1)
cor(dgowerdragon, cophenetic(dgowerdragonfit))
#0.84

##### datos moleculares, 18s de cefalópodos bajados de Genbank

cephs18s <- read.FASTA("cephalopods18s_aln.fasta", type = "DNA")

#leer alineamiento para phangorn 
cephs18s_phyDat <- phyDat(cephs18s, type = "DNA", levels = NULL)

#calcular frecuencias de las bases
base.freq(cephs18s, freq = FALSE, all = FALSE)

#cambiar a objeto DNAbin
cephsdna <- as.DNAbin(cephs18s_phyDat)

#calcular modelo evolutivo
mtcephs18s <- modelTest(cephs18s_phyDat)
#negative edges length changed to 0!
#[1] "JC+I"
#[1] "JC+G"
#[1] "JC+G+I"
#[1] "F81+I"
#[1] "F81+G"
#[1] "F81+G+I"
#[1] "K80+I"
#[1] "K80+G"
#[1] "K80+G+I"
#[1] "HKY+I"
#[1] "HKY+G"
#[1] "HKY+G+I"
#[1] "SYM+I"
#[1] "SYM+G"
#[1] "SYM+G+I"
#[1] "GTR+I"
#[1] "GTR+G"
#[1] "GTR+G+I"

#calcular distancias
distJCcephs <- dist.ml(cephs18s_phyDat, model="JC69")
distGTRcephs <- dist.dna(cephsdna, model="GG95")
distTNcephs <- dist.dna(cephsdna, model="TN93")
distHKYcephs <- dist.dna(cephsdna, model="F81")
#ver distancias JC
print(distJCcephs)
#salvar distancias JC
writeDist(distJCcephs, "distJCcephs.txt")

#estimar árbol UPGMA
JCcephsUPGMA <- upgma(distJCcephs)
#ver árbol UPGMA, agregar eje, y salvar el arbolito
plot(JCcephsUPGMA, main="JC UPGMA")
axisPhylo(side = 1, root.time = NULL, backward = TRUE)
write.tree(JCcephsUPGMA, file="JCcephsUPGMA.tre")

GTRcephsUPGMA <- upgma(distGTRcephs)
#ver árbol UPGMA
plot(GTRcephsUPGMA, main="GTR UPGMA")
axisPhylo(side = 1, root.time = NULL, backward = TRUE)
write.tree(GTRcephsUPGMA, file="GTRcephsUPGMA.tre")

TNcephsUPGMA <- upgma(distTNcephs)
#ver árbol UPGMA
plot(TNcephsUPGMA, main="TN UPGMA")
axisPhylo(side = 1, root.time = NULL, backward = TRUE)
write.tree(TNcephsUPGMA, file="TNcephsUPGMA.tre")

HKYcephsUPGMA <- upgma(distHKYcephs)
#ver árbol UPGMA
plot(HKYcephsUPGMA, main="HKY UPGMA")
axisPhylo(side = 1, root.time = NULL, backward = TRUE)
write.tree(HKYcephsUPGMA, file="HKYcephsUPGMA.tre")
