setwd("C:/Users/arpol/Not_Bad/R_packages/Craig_R_Script/My_data/")

library(ape)
library(phytools)
library(geiger)
library(picante)

tree2<-read.tree("My_data/16s_bipartition_2.tree")
tre1<-chronos(tree2)
dat<-read.csv("My_data/Flagella_presents_absence_3.csv",header=TRUE)
rownames(dat)<-dat$Species

dat3<-dat[match(tre1$tip.label,rownames(dat)),]
postscript('fliE_ERmodel.ps')
plotTree (tre1, type="phylogram")
trans<-matrix(c(0,0,0,1,0,0,1,1,0),nrow=3)
flie<-dat3$FliE
FliErec<-ace(flie,tre1,type="discrete",model=trans)
