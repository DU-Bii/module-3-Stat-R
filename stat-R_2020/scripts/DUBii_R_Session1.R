#!/usr/bin/env Rscript

################################################################################
## DU Bii - module 3 "R et statistiques"
## commandes du diaporama de la Session 1
## Claire Vandiedonck
################################################################################

#sessionInfo()
#setwd()

#---- tuto Start-R.html
load("Prerequis.RData")## specify correct path
ls()
rm(a, my_vector, myData, myData3, newmatrix, s, x, zz)
myData2
class(myData2)
str(myData2)

#---- slide15
myDataf <- data.frame(weight, size, bmi)
myDataf
class(myDataf)
str(myDataf)
dim(myDataf)

#---- slide16
gender <- c("Man","Man","Woman","Woman","Man","Woman")
gender
myDataf$sex <- gender
myDataf$sex
myDataf
str(myDataf)

#---- slide17
d <- data.frame()
d
dim(d)
class(myData2)
class(as.data.frame(myData2)) 
d <- as.data.frame(matrix(NA,2,3))
d
dim(d)
str(d)
d <- data.frame(matrix(NA,2,3))
str(d)
d2 <- as.data.frame(cbind(1:2, 10:11))
str(d2)
                    

#---- slide18
row.names(d)
names(d)

#---- slide19
myDataf[,2]
myDataf[,"size"]
myDataf$size

#---- slide20
myDataf
myDataf[2,]
myDataf["Pierre",]
class(myDataf["Pierre",])

#---- slide22
which(myDataf$sex == "Woman") 
myDataf[which( myDataf$sex == "Woman") , ] 
str(myDataf[ which( myDataf$sex == "Woman") , ])
which(myDataf$sex != "Man")
which(!myDataf$sex == "Man")

#---- slide23
grep("Wom", myDataf$sex)
grep("Woman", myDataf$sex)
myDataf[grep("Woman", myDataf$sex), ] 
grep("a", row.names(myDataf))
myDataf[grep("a", row.names(myDataf)),]

#---- slide24
WomenDataf <- subset(myDataf, sex == "Woman")
WomenDataf

#---- slide25
filteredData <- myDataf[which(myDataf$sex == "Woman" & myDataf$weight < 80 & myDataf$bmi > 20), ]
filteredData
subset( myDataf, sex == "Woman" & weight < 80 & bmi > 20)

#--slide26: commands commented -> on your own
#install.packages("swirl")## only if not installed yet
# library(swirl)
#swirl()


#--silde 27 : examples of commands are provided but the objects are not in the session so I comment them
# my_dataframe$new_variable <- my_variable
# mynew_dataframe <- data.frame(data.frame1, data.frame2)
# mynew_dataframe <- cbind(data.frame1, data.frame2)## consider adding the argument stringsAsFactors=F

#---- slides28/29
myDataf$index <- 1:6
myDataf
OtherData <- data.frame(c(1:5, 7),rep(c("right-handed","left-handed"),3))
names(OtherData) <- c("ID","handedness")
OtherData

#---- slide31
myMergedDataf <- merge(myDataf, OtherData, by.x = "index", by.y = "ID", all.x = T, all.y = T, sort = F)
myMergedDataf

#---- slide32
#temperatures <- read.table("Temperatures.txt", sep = "\t", header = T, stringsAsFactors = F)
temperatures <- read.table("/shared/data/projects/dubii2020/data/module3/seance1/Temperatures.txt",
                           sep = "\t", header = T, stringsAsFactors = FALSE)
temperatures
str(temperatures)

#---- slide33
#temperatures <- read.table("Temperatures.txt", sep = "\t", header = T)
temperatures <- read.table("/shared/data/projects/dubii2020/data/module3/seance1/Temperatures.txt",
                           sep = "\t", header = T, stringsAsFactors = TRUE)
str(temperatures)
levels(temperatures$Month)

#---- slide36
write.table(myDataf, file = "bmi_data.txt", sep = "\t", quote = F, col.names = T)



#------------------------------------------ 
## next slides (38-44) on lists your own:
#------------------------------------------

#---- slide39
str(myData2)

#---- slide40
L0 <- list()
class(L0)
x <- c("A", "B", "C")
y <- 8:15
L1 <- list(x, y)
str(L1)
L1	

#---- slide41
names(L1)
names(L1) <- c("ID1","ID2")
L1
L2 <- list("ID1" = x,"ID2" = y)
L2

#---- slide42
L1[[2]]
L1[["ID2"]]
L1$ID2

#---- slide43
L1[[3]] <- matrix(1:4,2,2)
L1

L1[["m1"]] <- matrix(1:4,2,2)
L1$m2 <- matrix(1:4,2,2)

#---- slide44
L1[[3]] <- NULL
L1
#-----------------------------
# end of lists
#-----------------------------



#-------------------------------------------------------- 
## next slides (46-51) on  conditional executions your own:
#--------------------------------------------------------
a <- 0
if (a == 0) {
  print ("hello")
}

if (a != 0) {
  print ("a is different from zero")
}

a <- 3
if (a < 3.14) {
  print("a is < 3.14 ")
} else {
  print("a is > 3.14")
} 

a <- 3.14
if (a < 3.14) {
  print("a is < 3.14 ")
} else if (a > 3.14) {
  print("a is > 3.14")
} else {print("a is equal to 3.14")
} 

a <- 11
if ( (a < 2) & (a < 10) ) {
  print("both conditions are true")
} else if ( (a < 2) | (a < 10) ) {
  print("one of the two conditions is true")
} else {
  print("none of the conditions is verified")		
}

a <- 6
if ( (a < 2) & (a < 10) ) {
  print("both conditions are true")
} else if ( (a < 2) | (a < 10) ) {
  print("one of the two conditions is true")
} else {
  print("none of the conditions is verified")	
}

a <- 1
if ( (a < 2) & (a < 10) ) {
  print("both conditions are true")
} else if ( (a < 2) | (a < 10) ) {
  print("one of the two conditions is true")
} else {
  print("none of the conditions is verified")		
}

a <- 1
if ( (a < 2) | (a < 10) ) {
  print("one of the two conditions is true")
} else if ( (a < 2) & (a < 10) ) {
  print("both conditions are true")  
} else {
  print("none of the conditions is verified")	
}

a <- 3
ifelse(a == 3.14, "a is equal to pi", "a is different from pi" )
a <- 3.14
ifelse(a == 3.14, "a is equal to pi", "a is different from pi" )

norm_values <- rnorm(10, 0, 1)
below_median <- ifelse(norm_values < median(norm_values), TRUE, FALSE)
table(below_median)
#-------------------------------------------------------- 
## end of slides on  conditional executions
#--------------------------------------------------------


# loops
########################

#---- slide53
for (i in 1:6) {
  print(i)
}

counter <- 0
for (i in seq(5,8)) {
  counter <- counter + i
  cat(counter, "\n")
}

teachers <- c("Pierre","Claire")
for (t in teachers) {
  cat(t,"was one of my bioinformatics teachers \n")
}

#---- slide54
i <- 0
while (i < 5) {
  i  <- i + 1
  print(i)
}


# vectorization
########################

#---- slide56
weight <- c(60, 72, 57, 90, 95, 72)
size <- c(1.75, 1.8, 1.65, 1.9, 1.74, 1.91)

bmi <- numeric(length(weight))
for (i in 1:length(bmi)) {
  bmi[i] <- weight[i] / size[i]^2
} 
bmi

bmi <- weight/size^2
bmi

#---- slide57
for (i in 1:length(bmi)){
  if (bmi[i] > 30) {
    bmi[i] <- "obesity"
  } else if ( bmi[i] < 25) {
    bmi[i] <- "normal"
  } else (bmi[i] <- "overweight")
}
bmi


bmi <- weight/size^2
bmi[which(bmi > 30)] <- "obesity"
bmi[which(bmi < 25)] <- "normal"
bmi[which(bmi <= 30 & bmi >= 25 )] <- "overweight"
bmi



# writing your own functions
########################

#---- slide61
# not to do!!!
# mean <- function(x) {
#   return(x^2)
# }
# mean(c(3,4))
# rm(mean) # if above commands were run
# mean(c(3,4)) # to check you get 3.5 as it should!

#---- slide62
rm(a)
func <- function(x) {
  x <- x + a
  return(x^2)
}
func(2)

a <- 2
func <- function(x) {
  x <- x + a
  return(x^2)
}
func(2)
func(c(2,3,10))

#---- slide63
a <- 2
func2 <- function(x, a) {
  x <- x + a
  return(x^2)
}
func2(2,3)       
func2(2,10)
func2(2)

#---- slide64
func3 <- function(x, a) {
  x <- x + 2*a
  return(x^2)
}
func3(2,5)
func3(x = 2, a = 5)
func3(a = 5, x = 2)
func3(5,2)

#---- slide65
func4 <- function(x, a = 4) {
  x <- x + a
  return(x^2)
}
func4(2,5)
func4(2)

#---- slide66
func <- function(x) {
  x^2
}
func(2)

func <- function(x) {
  temp <- x^2
  return(temp)
}
func(2)

func <- function(x) {
  temp1 <- x^2
  temp2 <- temp1^x
  results <- list(res1 = temp1, res2 = temp2)
  return(results)
}
func(2)

#---- slide67
rm(list = ls())
f1 <- function(a,b) {
  Op <- a + b
}
f1(a = 6, b = 20) # the result is not shown
ls()

rm(list = ls())
f1 <- function(a,b) {
  Op <- a + b
  return(Op)
}
f1(a = 6, b = 20)
ls()

rm(list = ls())
f1 <- function(a,b){
  Op <- a + b
  return(Op)
}
res1 <- f1(a = 6, b = 20)
ls()
res1

#---- slide68
rm(list = ls())
a <- 27
f1 <- function(a, b){
  Op <- a + b
  return(Op)
}
f1(a = 6, b = 20)
ls()
a

rm(list = ls())
a <- 27
f1 <- function(a=22, b){
  Op <- a + b
  return(Op)
}
f1(a, b = 20)
f1(b = 20)




