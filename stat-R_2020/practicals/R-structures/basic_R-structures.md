---
title: "Basic data structures in R -- matrices, data frames and lists"
author: "Claire Vandiedonck & Jacques van Helden"
date: "2020-03-04"
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





## Exercice 1

- Créez la matrice identité `matIdentite` de dimension 10 lignes x 10 colonnes contenant uniquement le chiffre 0. Puis remplacez uniquement les valeurs de la diagonale par le chiffre $1$. Imprimez la matrice à l'écran.

- Créez une matrice `matAleatoire` contenant des valeurs tirées aléatoirement de dimension 10 lignes x 10 colonnes, dont les éléments suivent une loi normale de moyenne 0 et de variance $5$. Imprimez la matrice à l'écran en arrondissant à 2 décimales. 



### Astuce

- Fonctions: `matrix()`, `diag()`, `print()`, rnorm()`, `round() 

### Solutions

En cas d'urgence poussez sur **Code** pour révéler la solution.


```r
matIdentite <- matrix(ncol = 10, nrow = 10, data = 0)
diag(matIdentite) <- 1
print(matIdentite)
```

```
      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
 [1,]    1    0    0    0    0    0    0    0    0     0
 [2,]    0    1    0    0    0    0    0    0    0     0
 [3,]    0    0    1    0    0    0    0    0    0     0
 [4,]    0    0    0    1    0    0    0    0    0     0
 [5,]    0    0    0    0    1    0    0    0    0     0
 [6,]    0    0    0    0    0    1    0    0    0     0
 [7,]    0    0    0    0    0    0    1    0    0     0
 [8,]    0    0    0    0    0    0    0    1    0     0
 [9,]    0    0    0    0    0    0    0    0    1     0
[10,]    0    0    0    0    0    0    0    0    0     1
```

#### Matrice de nombres aléatoires


```r
## Generatre a 10x10 matrix with random normal numbers
matAleatoire <- matrix(
  nrow = 10, 
  ncol = 10, 
  data = rnorm(n = 100, 
               mean = 0, 
               sd = sqrt(5)))

## Print the results rounded at 2 decimals
print(round(matAleatoire, digits = 2))
```

```
       [,1]  [,2]  [,3]  [,4]  [,5]  [,6]  [,7]  [,8]  [,9] [,10]
 [1,]  2.15 -1.40  0.47 -2.01  1.74 -4.17  1.02 -0.78  4.08  4.15
 [2,]  1.34  0.16 -0.20  1.21  0.92 -0.34 -0.01  0.55 -4.24 -2.79
 [3,]  5.52  2.47 -1.49 -4.23 -2.44 -1.85  1.80  0.41  1.50  1.64
 [4,]  1.64 -2.67 -2.73 -6.40 -1.23 -2.83  1.63  0.72  0.41 -2.67
 [5,]  1.74  4.83 -2.23 -5.41  0.62  0.08 -0.71  5.75 -1.20 -0.86
 [6,]  1.86 -1.00  0.91  1.07  0.33 -1.07 -0.76  2.87 -0.82 -2.53
 [7,] -0.53 -2.23 -1.21  3.15 -4.40  1.48 -0.51  1.27 -2.50 -3.89
 [8,]  2.24  0.36  1.72 -1.22 -2.55 -3.23 -1.09 -0.86  1.28  5.51
 [9,] -1.87  1.30  0.59 -2.96  1.76 -0.75 -0.43 -0.40 -2.47 -5.50
[10,] -0.92 -3.18  1.03  0.91 -2.06  1.23  0.92  3.66 -0.79 -3.42
```


## Exercice 2.1

Créez deux vecteurs aléatoires nommés `x1` et `x2`, contenant chacun $n = 10.000$ valeurs aléatoires respectivement compatibles:

a. avec une loi normale centrée réduite pour `x1`;
b. avec une loi uniforme définie sur l’intervalle $[0, 10]$ pour `x2`.

Vérifiez la distribution empirique de ces échantillons en dessinant des histogrammes. 

Vérifiez si les paramètres de vos échantillons aléatoires correspondent à vos attentes (et à leur *espérance statistique*). 


**Fonctions à utiliser :** `rnorm()`, `runif()`, `cbind()`, `rbind()`, `dim()`, `mean()`, `var()`, `min()`, `max()`, `summary()`, ...

### Solutions



```r
n <- 10000 ## define vector sizes
x1 <- rnorm(n = n, mean = 0, sd = 1) ## normal random
x2 <- runif(n = n, min = 0, max = 10) ## uniform random 
```



```r
hist(x = x1, breaks = 100)
```

<div class="figure" style="text-align: center">
<img src="figures/data-structures_rnorm_hist_simple-1.png" alt="(too) simple istogram of normally distributed random numbers." width="60%" />
<p class="caption">(too) simple istogram of normally distributed random numbers.</p>
</div>



```r
hist(x = x1, breaks = 100, 
     las = 1, 
     col = "palegreen",
     main = "Random normal numbers",
     xlab = "Value"
     )
```

<div class="figure" style="text-align: center">
<img src="figures/data-structures_rnorm_hist-1.png" alt="Histogram of normally distributed random numbers. " width="60%" />
<p class="caption">Histogram of normally distributed random numbers. </p>
</div>



```r
hist(x = x2, breaks = 10, 
     las = 1, 
     col = "cyan",
     main = "Uniformly distributed random numbers",
     xlab = "Value"
     )
```

<div class="figure" style="text-align: center">
<img src="figures/data-structures_runif_hist-1.png" alt="Histogram of uniformly distributed random numbers. " width="60%" />
<p class="caption">Histogram of uniformly distributed random numbers. </p>
</div>



```r
summary(x1)
```

```
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
-3.926108 -0.681550 -0.007686 -0.006920  0.675514  3.781480 
```

## Exercice 2.2

Créez une matrice `m1` qui contient les 10 premières valeurs de `x1` (colonne 1 de `m1`) et les 10 dernières valeurs de `x2` (colonne 2 de `m1`).

### Solution


```r
## Prepare an empty matrix
m1 <- matrix(nrow = 10, ncol = 2)

## Assign values to the first column
m1[, 1] <- head(x = x1, n = 10)

## Assign values to the second column
m1[, 2] <- tail(x = x1, n = 10)

## Print the result rounded to 3 decimals
print(round(m1, digits = 3))
```

```
        [,1]   [,2]
 [1,] -1.027 -0.489
 [2,] -0.210  0.286
 [3,]  0.887 -1.740
 [4,] -0.765  0.594
 [5,]  1.572  1.031
 [6,] -0.281  0.362
 [7,]  0.839  0.991
 [8,]  0.375  0.054
 [9,] -0.210  1.361
[10,] -1.869 -0.761
```


## Exercice 2.3

Créez une matrice `m2` qui contient 

- les 16ème, 51ème, 79ème, 31ème et 27ème valeurs de `x1` (colonne 1 de `m2`) et
- les 30ème, 70ème, 12ème, 49ème et 45ème de `x2` (colonne 2 de `m2`).

### Solutions


```r
m2 <- matrix(nrow = 5, ncol = 2)

## Assign values
m2[, 1] <- x1[c(16, 51, 79, 31, 27)]
m2[, 2] <- x2[c(30, 70, 12, 49, 45)]

## Print the result
print(m2)
```

```
           [,1]     [,2]
[1,]  0.3257754 5.916157
[2,] -0.4303759 9.748914
[3,] -0.5627509 2.911025
[4,]  0.4613393 3.611581
[5,]  0.4460625 6.276195
```

## Exercice 2.4

Concaténez à la suite (l’une en dessous-de l’autre) les matrices `m1` et `m2`, afin d’obtenir une nouvelle matrice `m3`. Quelles sont les dimensions (nombre de lignes et de colonnes) de `m3` ?

**Fonctions : ** `rbind()`, `cbind()`, `dim()`, `ncol()`, `nrow()`

### Solutions


```r
m3 <- rbind(m1, m2)
dim(m3)
```

```
[1] 15  2
```

```r
nrow(m3)
```

```
[1] 15
```

```r
ncol(m3)
```

```
[1] 2
```



## Exercice 3.1

Importez dans votre session R les données nommées `WorldPhones` (pré-existantes dans R). Affichez le contenu de la variable `WorldPhones`. Quelle est sa structure et sa classe ?



## Exercice 3.2

Calculez le nombre total de numéros de téléphone attribués :

a. au cours des différentes années (vecteur `nbrTelAn`)
b. pour chaque continent (vecteur `nbrTelCont`)

## Exercice 3.3

Quel est le continent qui a le plus / moins de numéros attribués ?

## Exercice 3.4

Dans combien de continents y a-t-il plus de : 20.000, 50.000 et 200.000 numéros de téléphone attribués ? 

**Fonctions à utiliser :** 

-`data(WorldPhones)`, 
- `class()`, 
- `dim()`, 
- `rownames()`, 
- `colnames()`, 
- `str()`, 
- `sum()`, 
- `apply()`, 
- `names()`, 
- `max()`, 
- `min()`,
- `which()`, 
- `which.max()`,
- `which.min()`
- ...

## Solutions exercice 3


```r
data("WorldPhones")
print(WorldPhones)
```

```
     N.Amer Europe Asia S.Amer Oceania Africa Mid.Amer
1951  45939  21574 2876   1815    1646     89      555
1956  60423  29990 4708   2568    2366   1411      733
1957  64721  32510 5230   2695    2526   1546      773
1958  68484  35218 6662   2845    2691   1663      836
1959  71799  37598 6856   3000    2868   1769      911
1960  76036  40341 8220   3145    3054   1905     1008
1961  79831  43173 9053   3338    3224   2005     1076
```

```r
class(WorldPhones)
```

```
[1] "matrix"
```

```r
dim(WorldPhones)
```

```
[1] 7 7
```

```r
rownames(WorldPhones)
```

```
[1] "1951" "1956" "1957" "1958" "1959" "1960" "1961"
```

```r
colnames(WorldPhones)
```

```
[1] "N.Amer"   "Europe"   "Asia"     "S.Amer"   "Oceania"  "Africa"   "Mid.Amer"
```



```r
## Marginal sums per year
nbrTelAn <- apply(WorldPhones, 1, sum)
print(nbrTelAn)
```

```
  1951   1956   1957   1958   1959   1960   1961 
 74494 102199 110001 118399 124801 133709 141700 
```

```r
## Marginal sums per continent
nbrTelCont <- apply(WorldPhones, 2, sum)
print(nbrTelCont)
```

```
  N.Amer   Europe     Asia   S.Amer  Oceania   Africa Mid.Amer 
  467233   240404    43605    19406    18375    10388     5892 
```



```r
names(which.max(nbrTelCont))
```

```
[1] "N.Amer"
```

```r
names(which.min(nbrTelCont))
```

```
[1] "Mid.Amer"
```

```r
## Another way: with head and tail
tail(sort(nbrTelCont), n = 1)
```

```
N.Amer 
467233 
```

```r
head(sort(nbrTelCont), n = 1)
```

```
Mid.Amer 
    5892 
```


```r
sum(nbrTelCont > 20000)
```

```
[1] 3
```

```r
sum(nbrTelCont > 50000)
```

```
[1] 2
```

```r
sum(nbrTelCont > 200000)
```

```
[1] 2
```



## Exercice 4

- Téléchargez le fichier [minitable1.tsv](data/minitable1.txt). 

- Ouvrez-le avec un éditeur de texte ou un calculateur pour identifier sa structure et les cases non remplies.

- Importez le dans R dans un objet `test.data` et vérifiez sa structure et son contenu.

- Comment les données manquantes ont-elles été lues ? Remplacez-les par NA si elles n’ont pas été lues comme une donnée manquante.

- Déplacez la colonne 1 en dernière colonne.

- Renommez les colonnes colA, colB, colC, colD, colE... dans le nouvel ordre obtenu.

- Supprimez la deuxième ligne.

- Ajoutez une colonne de valeurs numériques obtenues en divisant les valeurs de la `colE` par les valeurs de la `colA`.

- Dans la `colC`, remplacez les valeurs `toto` par `tata` et vice-versa.

- Dans la `colC`, remplacez les lettres $t$ par des $m$.

- Triez le dataframe par ordre croissant de la colonne `colE`.

- Convertissez la colonne `colB` en valeurs numériques.

- Dans un vecteur sumcolA, calculer la somme de la `colA`.

- Faites un sous-dataframe `test.data2` contenant les lignes pour lesquelles les éléments de la `colE` sont inférieurs ou égaux à ceux de la `colA`.

- Sauvegardez le data frame `test.data2` en fichier texte avec des `;` comme séparateurs de champs.

**Fonctions à utiliser dans l’ordre :** `read.table()`, `str()`, `is.na()`, `paste()`, `gsub()`, `order()`, `as.integer()`, `sum()`, `subset()`, `write.table()`

## Exercice 5

Sauvegardez dans une liste `session2_list` tous les objets créés pendant les exercices 1 à 4 en les mettant dans des sous-listes correspondant à chaque exercice que vous nommerez `exo1`, `exo2`, `exo3` et `exo4`.

**Fonctions à utiliser :** `list()`, `names()`



