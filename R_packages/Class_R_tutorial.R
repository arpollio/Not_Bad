getwd() #get working directory
setwd("C:/Users/arpol/Not_bad") #set working directory
getwd() #verify check
"Hello world" #print string
print("Hello world") #also print's string
1+1 #math works too
log(8) #it can do more complicated math
0.1 + 0.2 #somehow regular math works too. AHHHH
print(0.2+0.1, digits = 18) #this gets the math stuff right
x = 1+1 #Make a variable
x #verify the variable value
x <- 42 #change variable value
y <- 22 #add aditional variable
rm(y) # removes variable
setwd("C:/Users/arpol/wvu_gda/instructor/R_tutorial") #changes the working directory to the gitread
Tutorial_genes = read.csv("R_tut.genes.txt") #makes this .csv into a variable
str(Tutorial_genes) #view statistics and information layout of data
summary(Tutorial_genes) #gives mathmatic statistics that help you to understand information quickly about your data.frame
head(Tutorial_genes) #shows first 6 rows by default
head(Tutorial_genes, n=10) #shows 10 rows by default
names(Tutorial_genes) #shows column names
help("read.csv") #open manual for the specific command
write.csv(Tutorial_genes, "gene.output.txt") #writes a new file
barplot(Tutorial_genes$liver) #makes barplot
#be aware variable $ column name uses all the data points in that column
hist(Tutorial_genes$liver) #makes a histogram to identify if the data is normally distributed
plot(Tutorial_genes$liver) #makes a huge scatter plot
hist(Tutorial_genes$brain) #see liver example
plot(Tutorial_genes$gut, Tutorial_genes$liver) #compare data vs other data from variable
boxplot(Tutorial_genes[0:4])#makes a boxplot for all of the individual variable data
plot(Tutorial_genes)#makes a corrolation matrix shows a mirror plot
library()#tells what are available
library("ballgown")
