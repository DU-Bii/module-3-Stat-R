#!/usr/bin/env Rscript

################################################################################
## M1 MEG option bioiformatique-genomique
## R Session 22/10/2019 - commandes vues pendant le cours RSession3
## Claire Vandiedonck
################################################################################

################################################################################
##------------------------------FIGURES----------------------------------------
################################################################################

#----slide 15
load("/shared/data/projects/dubii2020/data/module3/seance2/dataframe_session1.RData")# ajust with you own path
ls()

#----slide 16
plot(myDataf$weight~myDataf$size)
boxplot(myDataf$weight)
boxplot(myDataf$weight~myDataf$sex)
a <- rnorm(1000)
hist(a,breaks = 20)

#----slide 19
plot(myDataf$weight~myDataf$size)
plot(myDataf$weight~myDataf$size, main = "Weight ~Size") 
plot(myDataf$weight~myDataf$size, main = "Weight ~Size",
     type = "l") 
plot(myDataf$weight~myDataf$size, main = "Weight ~Size",
     type = "b")
plot(myDataf$weight~myDataf$size, main = "Weight ~Size",
     type = "b",
     xlim = c(0,2.5), ylim = c(0,150)) 
hist(a,breaks = 20, add = T)

#----slide 22
plot(myDataf$weight~myDataf$size, main = "Weight ~Size",
        xlim = c(-3,3), ylim = c(0,200),
        type = "n",
        xlab = "Size", ylab = "Weight")
points(myDataf$weight[1:2]~myDataf$size[1:2],
       pch = 6,
       col = "blue")
points(myDataf[3:6,"weight"]~myDataf$size[3:6],
       type = "b", pch = 23,
       col = "magenta", bg = "cyan", cex = 2)
points(seq(0,2.5, 0.5), c(1, 10, 25, 50, 125, 150),
       type = "l") 
lines(-seq(0,2.5, 0.5), c(1, 10, 25, 50, 125, 150),
      lty = "dotdash",
      col = "blue",
      lwd = 3) 
abline(0, -50, lty = 3, col = "red")
abline(v = 0, lty = 2, col = "green")

#----slide 23
mtext("overlap of unrelated graphs", side = 1)
mtext("other text", side = 1, line = 2)
text(-1, 150, "some text here")
axis(side = 4,
     labels = c(0, 20, 80, 160),
     at = c(0, 20, 80, 160),
     tick = T)
legend("topright", c("blue triangles", "diamonds", "red line"),
       pch = c(6, 23, NA),
       col = c("blue", "magenta", "red"),
       pt.bg = c("transparent", "cyan", "transparent"), 
       lty = c(0,0,3))

#----slide 25
#install.packages("RColorBrewer")
library("RColorBrewer")
display.brewer.all(colorblindFriendly = TRUE)

#----slide 26
par()
par()$cex
opar <- par()
par(bg = rgb(0, 51, 102, max = 255), col = "white", mfrow = c(2,3), cex = 1.1)
hist(rnorm(10), col = "white",  border = "blue",
     col.axis = "white", fg = "white", col.lab = "white",
     col.main = "white", main = "histo #1")
hist(rnorm(10), col = "white",  border = "blue",
     col.axis = "white", fg = "white", col.lab = "white",
     col.main = "white", main = "histo #2")
hist(rnorm(10), col = "white",  border = "blue",
     col.axis = "white", fg = "white", col.lab = "white",
     col.main = "white", main = "histo #3")
hist(rnorm(10), col = "white",  border = "blue",
     col.axis = "white", fg = "white", col.lab = "white",
     col.main = "white", main = "histo #4")
hist(rnorm(10), col = "white",  border = "blue",
     col.axis = "white", fg = "white", col.lab = "white",
     col.main = "white", main = "histo #5")
hist(rnorm(10), col = "white",  border = "blue",
     col.axis = "white", fg = "white", col.lab = "white",
     col.main = "white", main = "histo #6")
par(opar)

#----slide 27
png("MyPlot.png")
hist(rnorm(10000, 0, 1), freq = F)
dev.off()


################################################################################
##------------------------------PACKAGES----------------------------------------
################################################################################

#----slide 33
#data from R packages
try(data(package = "rpart"))
data(stagec, package = "rpart")
ls()
head(stagec)
help(stagec,package = "rpart")


#----slides 34-35
#installed R packages
.libPaths()
list.files(.libPaths()[2])
colnames(installed.packages())
head(installed.packages()[,c(1,2,3)])

#----slides 36
#loading installed R packages:
library(MASS)
sessionInfo()

#----slides 37
# what happens if I try to load an uninstalled package?
library(tutu)
require(tutu)
require(tutu) == FALSE

if ( !require("RColorBrewer", quietly = T)) {
        install.packages("RColorBrewer")
}
library(RColorBrewer)

#----slides 39
#installing new R packages:
install.packages("qqman")
#install.packages(c("qqman", "MASS"))
dim(available.packages())[1]

#----slides 42
# example to install a package from the zip source file:
#install.packages("/mypath/qqman/qqman_0.1.2.tar.gz", repos = NULL, lib = "mylibrarypath")

#----slides 45
# using installed R packages
gwasResults <- qqman::gwasResults
qqman::qq(gwasResults$P)

library(qqman)
?qqman
qq(gwasResults$P)
manhattan(gwasResults)

#----slides 46-49
#help on R packages
vignette("qqman")
browseVignettes("qqman")
help.start() ## click on Packages and select the one you are interested in
demo(lm.glm, package = "stats", ask = TRUE)

##----slide 53
#!!!!!!! BioConductor installer for R versions < 3.5 !!!!!!!!!!
# source("https://bioconductor.org/biocLite.R")
# biocLite() # to install the minimum set of bioconductor packages
# # You may have to answer some questions to install or update dependencies
# biocLite("affy")# to install a specific package like "affy"

# !!!!! Bioconductor installer for R versions >=3.5 !!!!!!!!!!
if (!requireNamespace("BiocManager"))
        install.packages("BiocManager")
BiocManager::install()
# insatlling Bioconductor sepcific package:
BiocManager::install("affy")
#
library(affy)
#library(affy,lib.loc = .libPaths()[1])
sessionInfo()

################################################################################
##------------------------------STATS WITH R------------------------------------
################################################################################

#----slide 69
table(myDataf$sex)
table(myDataf$sex, row.names(myDataf))
pie(table(myDataf$sex))
pie(table(row.names(myDataf)))
data(WorldPhones)
tail(WorldPhones)
pie(WorldPhones["1961",])
barplot(WorldPhones["1961",])

#----slide 71
data(faithful)
str(faithful)
?faithful
opar <- par() # to do if on R studio and the other commented rows if you want to overlay the boxplot and the stripchart
par(bg="transparent") # to do if on R studio
stripchart(faithful$waiting,col = "blue", pch = 20)
boxplot(faithful$waiting,horizontal = T, add = T)
# par(opar) # to do if on R studio
rug(faithful$waiting, side = 3)
hist(faithful$waiting,freq = F)
lines(density(faithful$waiting),col = "red")

#----slide 72
range(faithful)
mean(faithful$waiting)
sd(faithful$waiting)
summary(faithful$waiting)
median(faithful$waiting)
quantile(faithful$waiting, probs = 0.5)
quantile(faithful$waiting,0.1)
quantile(faithful$waiting, c(0.1,0.9))
quantile(faithful$waiting, seq(0,1,0.1))

#----slide 77
rbinom(n = 10, size = 3, prob = 0.5)
rpois(10, 0.2)
dbinom(2,3,0.5)
dpois(1,0.2)
pbinom(2,3,0.5)
ppois(3,0.2)


#----slide 78
a <- rnorm(100)
hist(a,freq = F)
lines(density(a), col = "red")
curve(dnorm(x), add = T, col = "cyan")
qnorm(p = c(0.025,0.5), mean = 0, sd = 1,lower.tail = T)
pnorm(c(1.96,0), mean = 0, sd = 1, lower.tail = F)

#----slide 79
faithful$category <- faithful$waiting >= median(faithful$waiting)
boxplot(faithful$waiting ~ faithful$category)
t.test(faithful$waiting ~ faithful$category)
2*pt(-25.605, 189.77,lower.tail = T) 
wilcox.test(faithful$waiting ~ faithful$category)

#----slide 80
plot(faithful$eruptions, faithful$waiting, xlab = "duration of eruption", ylab = "time between eruptions", cex.lab = 1.5)
abline(lm(faithful$waiting~faithful$eruptions), col = "red")
summary(lm(faithful$waiting~faithful$eruptions))

#----slide 81
cor.test(faithful$eruptions, faithful$waiting)
str(cor.test(faithful$eruptions, faithful$waiting))
cor.test(faithful$eruptions, faithful$waiting)$estimate^2 

#----slide 82
cor.test(faithful$eruptions, faithful$waiting, method = "s")

