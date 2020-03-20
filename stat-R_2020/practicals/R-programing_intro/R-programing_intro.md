---
title: "Intro to programming with R"
author: "Claire Vandiedonck & Jacques van Helden"
date: "2020-03-20"
output:
  html_document:
    self_contained: no
    code_folding: hide
    fig_caption: yes
    fig_height: 6
    fig_width: 7
    highlight: tango
    incremental: no
    keep_md: yes
    smaller: yes
    theme: cerulean
    toc: yes
    toc_depth: 3
    toc_float: yes
    widescreen: yes
  beamer_presentation:
    colortheme: dolphin
    fig_caption: yes
    fig_height: 6
    fig_width: 7
    fonttheme: structurebold
    highlight: tango
    incremental: no
    keep_tex: no
    slide_level: 2
    theme: Montpellier
    toc: yes
  pdf_document:
    fig_caption: yes
    highlight: zenburn
    toc: yes
    toc_depth: 3
  revealjs::revealjs_presentation:
    theme: night
    transition: none
    self_contained: no
    code_folding: hide
    css: ../../slides.css
  slidy_presentation:
    font_adjustment: 0   ## set to negative/positive values for smaller/bigger fonts
    duration: 45
    self_contained: no
    code_folding: hide
    fig_caption: yes
    fig_height: 6
    fig_width: 7
    highlight: tango
    incremental: no
    keep_md: yes
    smaller: yes
    theme: cerulean
    toc: yes
    widescreen: yes
  ioslides_presentation:
    self_contained: no
    code_folding: hide
    css: ../../slides.css
    fig_caption: yes
    fig_height: 6
    fig_width: 7
    highlight: tango
    smaller: yes
    toc: yes
    widescreen: yes
font-import: http://fonts.googleapis.com/css?family=Risque
subtitle: DUBii -- Statistics with R
font-family: Garamond
transition: linear
---




#### Solutions

En cas d'urgence poussez sur **Code** pour révéler la solution.


## Exercice 1 : test

- Créez un vecteur de 100 valeurs tirées aléatoirement selon une loi normale de moyenne 4 et d'écart type 5.

- Identifiez les indices des valeurs strictement supérieures à 3 et récupérez les valeurs correspondantes.

- Testez si la somme de ces valeurs est supérieure à 40, à 30 ou à 20 et affichez un message adéquat selon chaque éventualité.


**Fonctions recommandées :** rnorm(), which(),sum(), if(), ifelse(), else(), cat() ou print()


```r
vecRandom <- rnorm(100, mean = 4, sd = 5)
vecAbove3 <- vecRandom[which(vecRandom > 3)]
valSum <- sum(vecAbove3)

if(valSum > 40){
          cat("la somme est > 40 \n")
          }else if(valSum > 30){
          cat("la somme est > 30 mais <= 40 \n")
          }else if(valSum > 20){
          cat("la somme est > 20 mais <= 30 \n")
          }else{
          cat("la somme est < ou egal 20 \n")
}
```

```
la somme est > 40 
```

```r
# vous pouviez aussi obtenir le vecteur vecAbove3 avec la fonction ifelse():
vecRandom[ifelse(vecRandom >3, TRUE, FALSE)]
```

```
 [1]  9.831163  5.097485  7.570858  8.379680  7.895459  4.528030  6.635265 14.148985 10.117416  5.494417  3.660705 10.393903  8.429158  3.941388  7.347816  3.854651  9.439607  3.142791 11.730595  5.937824  6.620842  7.693074  7.000316  3.828263 10.155291  3.378255  5.676205  3.980622  3.260252
[30] 13.804939  9.834127  3.829094  5.077376  7.957962 10.126434  5.872080  4.684765  5.691570  3.313544 10.133535  7.544846  3.565247  4.728646  5.437569  6.419119  6.488190  8.220307  6.595519  4.179922 11.686844  9.236451  4.654276  4.598193  6.463463  8.205123  7.518094  3.128161  7.597151
[59]  4.948454  3.687188  5.554846  9.143727  3.758206
```


## Exercice 2 : création d'une boucle simple

- Créez une boucle de 10 itérations `i` qui affiche à chaque itération l'indice `i`.
- Calculez au fur et à mesure la somme cumulée des indices dans un vecteur.
- Affichez la somme cumulée finale.

**Fonctions recommandées :** for(), cat() ou print()


```r
sumCumul <- 0

for(i in 1:10){
  print(i) # always print the index of the result, we might prefer cat(), see below
  sumCumul <- sumCumul + i
  cat(paste("for i:", i, "  ,the sumCumul is: ", sumCumul, "\n", sep=""))
}
```

```
[1] 1
for i:1  ,the sumCumul is: 1
[1] 2
for i:2  ,the sumCumul is: 3
[1] 3
for i:3  ,the sumCumul is: 6
[1] 4
for i:4  ,the sumCumul is: 10
[1] 5
for i:5  ,the sumCumul is: 15
[1] 6
for i:6  ,the sumCumul is: 21
[1] 7
for i:7  ,the sumCumul is: 28
[1] 8
for i:8  ,the sumCumul is: 36
[1] 9
for i:9  ,the sumCumul is: 45
[1] 10
for i:10  ,the sumCumul is: 55
```

```r
# affichage de la somme cumulee finale
print(sumCumul)
```

```
[1] 55
```



## Exercice 3 : création d'une fonction

- Créez une fonction `calculSomme` qui calcule la somme de deux variables x et y passées en argument.
- Testez la fonction.

**Fonctions recommandées :** function(), return()


```r
calculSomme <- function(x, y){
    return(x + y)
}

# test de la fonction avec par exemple 18 et 35:
calculSomme(x = 18, y = 35)
```

```
[1] 53
```

```r
# pour aller plus loin:
# --------------------

# si vous voulez, vous pouvez definir avant un vecteur qui contiendra le resultat de la somme
sum_xandy <- NULL
calculSomme <- function(x, y){
  sum_xandy <- x+y
  return(sum_xandy)
}
sum_xandy <- calculSomme(x = 18, y = 35) # le resultat est stocke dans l'objet sum_xandy qui n'est plus NULL
sum_xandy # affichez le resultat
```

```
[1] 53
```

```r
# si maintenant, vous voulez repeter l'operation et stocker les resultats dans un vecteur, il faut concatener les resultats dans un vecteur
sum_xandy <- NULL
calculSomme <- function(x, y){
  sum_xandy <- c(sum_xandy, x+y)
  return(sum_xandy)
}
sum_xandy <- calculSomme(x = 18, y = 35)
sum_xandy <- calculSomme(x = 20, y = 35)
sum_xandy <- calculSomme(x = 18, y = 3)
# le resultat est stocke dans l'objet sum_xandy qui n'est plus NULL
sum_xandy
```

```
[1] 53 55 21
```



## Exercice 4: création d'une fonction avec des tests, utilisation de cette fonction de manière itérative

- Ecrivez une fonction `calculTarif` qui prend pour argument  un âge et affiche "demi-tarif" si l'âge est inférieur à 12 ans, "tarif sénior" si l'âge est supérieur ou égal à 60 ans et "plein tarif" sinon.
- Testez votre fonction pour des personnes de 5, 65, 85, 41, 23 et 47 ans.

**Fonctions recommandées :** 

- `function()`, 
- `return()`, 
- `print()`, 
- `c()`
- `if()`
- `else()`
- `ifelse()`
- `for()`



```r
calculTarif <- function(age){
    if(age < 12){
        print("tarif reduit")
    }else if(age >= 60){
        print("tarif senior")
    }else{
        print("plein tarif")
    }
}

# tests de la fonction
for(i in c(5, 65, 85, 41, 23, 47)){
    calculTarif(age = i)
}
```

```
[1] "tarif reduit"
[1] "tarif senior"
[1] "tarif senior"
[1] "plein tarif"
[1] "plein tarif"
[1] "plein tarif"
```


## Exercice 5: création d'une fonction avec compteur de boucle

- Ecrivez une fonction `sumCumul` qui calcule la somme cumulée des nombres entiers compris entre deux bornes $a$ et $b$ que vous mettrez en arguments `start` et `end`.

- De plus, toutes les 10 boucles, vous affichez la valeur de l'entier ajouté, sinon vous affichez un point `.`.

- Testez la fonction avec les entiers entre 3 et 55 par exemple.

- Améliorez la fonction en ajoutant un paramètre `interval` correspondant à l'incrément de boucles entre les affichages des entiers (dans la fonction précédente, cet incrément était de 10)
Testez la fonction avec les entiers entre 3 et 55 et un intervalle de 15 par exemple.

**Fonctions recommandées :** 

- `function()`, 
- `return()`, 
- `cat()`, 
- `seq()`


```r
sumCumul <- function(start,end){
         temp <- 0
         for(i in start:end){
               temp <- temp + i
               if (i %in% seq(start,end,10)){
                  cat(i)
                  }
                  else {cat(".")}
         }            
         cat("\n")
         cat(paste("le total cumule est de: "), temp, "\n",sep="")
         return(temp)
}

res <- sumCumul(3,55)
```

```
3.........13.........23.........33.........43.........53..
le total cumule est de: 1537
```

```r
#3.........13.........23.........33.........43.........53..
#le total cumule est de: 1537
#
# fonction amelioree avec un intervalle en argument:
sumCumul <- function(start,end, interval){
         temp <- 0
         for(i in start:end){
               temp <- temp + i
               if (i %in% seq(start,end,interval)){
                  cat(i)
                  }
                  else {cat(".")}
         }            
         cat("\n")
         cat(paste("le total cumule est de: "), temp, "\n",sep="")
         return(temp)
}

res <- sumCumul(3,55,15)
```

```
3..............18..............33..............48.......
le total cumule est de: 1537
```

