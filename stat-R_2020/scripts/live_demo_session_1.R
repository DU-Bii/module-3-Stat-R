#!/usr/bin/env Rscript

############################################################################################################
## DU Bii
## R Session - commandes vues ensemble au tableau pour generer un vecteur, une matrice et un dataframe
## Claire Vandiedonck
############################################################################################################


#Creer un vecteur de 12 entiers de 1 à 12 (rappel; non-zero based but 1 based):
myVector <- 1:12

#Regarder la taille puis la dimension:
length(myVector)
dim(myVector)

# Imposer des dim au vecteur:
dim(myVector) <- c(3,4) # possible aussi avec attributes()

#Regarder a quoi ressemble a présent le vecteur: une matrice!
# => Vérifier:
class(myVector)
myMatrix <- myVector
rm(myVector)

#Ajouter une colonne avec un vecteur avec des chaines de caracteres: 
myMatrix2 <- cbind(myMatrix, c("one","two","three"))

# Qu'est-il advenu aux valeurs numeriques?
myMatrix2
     # [,1] [,2] [,3] [,4] [,5]   
# [1,] "1"  "4"  "7"  "10" "one"  
# [2,] "2"  "5"  "8"  "11" "two"  
# [3,] "3"  "6"  "9"  "12" "three"

# Que faire? Un dataframe:
myDataf <- data.frame(myMatrix,c("one","two","three"))
myDataf

# mais renommer les colonnes de A à F avec une constante:
colnames(myDataf) <- LETTERS[1:5]
# notez que les noms de colonnes sont des attributs et ne sont pas affiches avec des ""
attributes(myDataf) # ce sont des attributs de myDataf

str(myDataf)
# quel est le type d'objet dans la colonne E: factor! C'est un recodage : cf. tutorial sur les factors Factors_in_R.html
# pour l'éviter: specifier l'argument stringsAsFactors=F
myDataf <- data.frame(myMatrix,c("one","two","three"), stringsAsFactors=F)
str(myDataf)

# renommer les colonnes
colnames(myDataf) <- LETTERS[1:5]
