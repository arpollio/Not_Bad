setwd("C:/Users/arpol/Not_Bad/R_packages/Craig_R_Script/")

library(ape)
library(phytools)
library(geiger)
library(picante)

tree1<-read.tree("02_tree.tre")
tre<-chronos(tree1)
#builds and inserts the information for substitutions per site

plot(tre)
#everything before this point visualizes the tree

dat<-read.csv("genes_2.csv",header=TRUE)
rownames(dat)<-dat$Species
dat<-dat[match(tre$tip.label,rownames(dat)),]

trans<-matrix(c(0,0,0,1,0,0,1,1,0),nrow=3)
#to this point I have the completed matrix for my model. and I have the tree and data in the same order
#from here forward is doing the analysis

postscript('photo_ERmodel.ps')
plotTree (tre, type="phylogram")
photo<-dat$photo

#analysis

photorec<-ace(photo,tre,type="discrete",model=trans)
