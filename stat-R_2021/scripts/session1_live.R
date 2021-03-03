#!/usr/bin/env Rscript


## exercices sur les vecteurs
# ----------------------------

#1. Créer un vecteur avec: 5 4 3 2 1 et 0. J’attends 3 façons possibles.
5:0
rev(0:5)
seq(0,5,1)
c(5,4,3,2,1,0)


#2. Créer un vecteur avec: 1_impair, 2_pair, 3_impair, 4_pair, 5_impair, 6_pair
paste(1:6, c("impair", "pair"), sep="_")
paste(1:6, rep(c("impair", "pair"),3), sep="_")


#3. Ecrire dans R « Il y a 26 lettres dans l’alphabet » en codant la valeur 26
cat("Il y a", length(letters),"lettres dans l’alphabet\n")

#4. Comptez le nombre de caractères de la phrase
nchar(paste("Il y a", length(letters),"lettres dans l’alphabet", sep=" "))

#5. Ecrire la même phrase en lettres capitales.
toupper(paste("Il y a", length(letters),"lettres dans l’alphabet"))

#6. Créez un vecteur x contenant 100 valeurs tirées aléatoirement à partir des valeurs -10 à 10 et de 10 valeurs manquantes.
x <- sample(c(-10:10, rep(NA,10)), size=100, replace=TRUE)
x

#7. Quelle commande vous permet de compter le nombre de données manquantes dans x?
sum(is.na(x))
length(which(is.na(x))

#8. Calculez la moyenne sur les 80 1ères valeurs
mean(x, na.rm=TRUE)


## exercices sur les matrices
# ----------------------------

#1. Creer un vecteur de 12 entiers de 1 à 12 (rappel; non-zero based but 1 based):
myVector <- 1:12

#2. Regarder la taille puis la dimension:
length(myVector)
dim(myVector)

#3. Imposer des dim au vecteur:
dim(myVector) <- c(3,4) # possible aussi avec attributes()

#4. Regarder à quoi ressemble a présent le vecteur: une matrice!
# => Vérifier:
class(myVector)
myMatrix <- myVector
rm(myVector)

#5. Ajouter une colonne avec un vecteur avec des chaines de caractères: 
myMatrix2 <- cbind(myMatrix, c("one","two","three"))

#6. Qu'est-il advenu aux valeurs numeriques?
print(myMatrix2)
     # [,1] [,2] [,3] [,4] [,5]   
# [1,] "1"  "4"  "7"  "10" "one"  
# [2,] "2"  "5"  "8"  "11" "two"  
# [3,] "3"  "6"  "9"  "12" "three"

# Que faire? Un dataframe:
myDataf <- data.frame(myMatrix,c("one","two","three"))
print(myDataf)

# mais renommer les colonnes de A à F avec une constante:
colnames(myDataf) <- LETTERS[1:5]
# notez que les noms de colonnes sont des attributs et ne sont pas affiches avec des ""
attributes(myDataf) # ce sont des attributs de myDataf

str(myDataf)
# note dans r<4, le type d'objet dans la colonne E est un  factor! C'est un recodage : cf. tutorial sur les factors Factors_in_R.html
# pour l'éviter: specifier l'argument stringsAsFactors=F = par défaut dans R>4
myDataf <- data.frame(myMatrix,c("one","two","three"), stringsAsFactors=F)
str(myDataf)


## exercices sur les dataframes
# ----------------------------

#1. How to create a dataframe:
# avec data.frame()
# en convertissant une matrice() avec as.data.frame()
# ou en important un fichier texte dans R avec read.table() par exemple

#2. Which are the three methods to slice a dataframe?
# avec l'index des cases/colonnes/lignes
# avec le nom des variables/colonnes entre ""
# avec le nom des variables/colonnes précédées de $

#3. commandes pour extraire les cellules en bleu proposées avec les indices:
dataframe1[-1,3]
dataframe2[2, 2:4]
dataframe3[,c(2,4)]
dataframe3[,seq(2,ncol(dataframe3),1)] 

