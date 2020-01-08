#! /usr/local/bin/R
###################################################################
##### 1. Begin here, load libraries, tree and data, organize  #####
###################################################################




library(ape)
library(phytools)
library(geiger)
library(picante)


# read tree as newick
tree1<-read.tree("02_tree.tre")

#make ultrametric with nprs
tre<-chronos(tree1)

# plot tree (optional)
plot(tre)

# read data as .csv ### need to be in same row order as tree!
dat<-read.csv("genes.csv",header=TRUE)

# check data (optional)
dat

# Set rows to be the species names, in 1st column of data file
rownames(dat)<-dat$Species

# reorder the data rows to match the order of tree tips.  CRUCIAL!!!
#dat<-dat[match(tre$tip.label,rownames(dat)),]

## set a model in which only changes from 0-->1 or 0-->2 ar allowed, each at cost = 1
## this will create a 3x3 cost state change matrix, allowing no reversals
trans<-matrix(c(0,0,0,1,0,0,1,1,0),nrow=3)

## check the transition rate model (optional)
trans



###################################################################
##### 2. Plot tree here and determine which model to choose  ######
###################################################################


## specify a file to save in pdf format
postscript('photo_ERmodel.ps')


# plot tree as ultrametric phylogram
plotTree (tre, type="phylogram")

# set first data column as a vector, where dat = dataset and $photo = the data column of interest
photo<-dat$photo

# optional - check the data to verify correct order
photo
##

##

##

##

##


###################################################################
##### 3. Reconstruct ancestral states, save pdf output       ######
###################################################################



### KEY POINT ### if there are only 2 characters, (i.e. 0,1, but not 2 here), then you must define a new model
ER<-matrix(c(1,1,1,1),nrow=2)
trans2<-matrix(c(0,0,1,0),nrow=2)
#trans3<-matrix(c(0,0,2,0),nrow=2)
trans4<-matrix(c(0,1,0,0),nrow=2)

# use ACE to reconstruct ancestral states under the model 'trans', your trait, and the tree

### for the 3 state model (commented out here)
#photorec<-ace(photo,tre,type="discrete",model=trans)

## for the 2-state model (0,1), only pseudogenes
#photorec<-ace(photo,tre,type="discrete",model=trans2)

## for a 2 state, equal rates model (ER)
photorER<-ace(photo,tre,type="discrete",model=ER)


## for the 2-state model (0,2), only losses
#photorec<-ace(photo,tre,type="discrete",model=trans3)


#################################################################
# diagnostics for the reconstruction
photorec


#plot tip and node pie charts for trait reconstruction

#Set color palette
cols<-setNames(palette()[1:length(unique(photo))],sort(unique(photo)))

# plot tip labels as circles
tiplabels(pie=to.matrix(photo,sort(unique(photo))),piecol=cols,cex=0.3)

# finally, polt ancestral values at nodes as pie charts
nodelabels(node=1:tre$Nnode+Ntip(tre), pie=photorec$lik.anc,piecol=cols,cex=0.5)

# actually save the pdf file
dev.off()


###############################################################################
############# 4. Testing among alternative character state rate models ########
###############################################################################


### fit an equal rates, all rates different, and 2 irreversible models models

#### In ACE, test equal, symmetris, different, loss-only, and gain-only models

ER <- ace(photo, tre, type="discrete", model="ER")
SYM <- ace(photo, tre, type="discrete", model="SYM")
ARD <- ace(photo, tre, type="discrete", model="ARD")
loss <- ace(photo, tre, type="discrete", model=trans2)
gain<- ace(photo, tre, type="discrete", model=trans4)


install.pakages("qpcR")
library(qpcR)


AICc(ER)
#[1] 15.57792
AICc(ARD)
#[1] 17.57791
AICc(gain)
#[1] 15.64311
AICc(loss)
#[1] 21.40819

# get akaike weights
akaike.weights(c(15.58,17.58,15.64,21.41))

$deltaAIC
[1] 0.00 2.00 0.06 5.83

$rel.LL
[1] 1.00000000 0.36787944 0.97044553 0.05420403

$weights
[1] 0.41796776 0.15376175 0.40561495 0.02265554



###############################################################################
######## 5. PAgel's Lambda, Blomberg's KEY

phylosig(tre, photo, method="lambda", test=TRUE, nsim=999)






