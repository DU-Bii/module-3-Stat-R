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
 [1,]  1.42  3.93 -0.66 -0.01 -2.08  1.67  3.34  4.18  3.36  1.07
 [2,] -0.17 -1.70 -3.76  0.21  2.71 -3.25  1.15 -2.46  1.93  5.42
 [3,]  0.37  2.81 -1.27 -2.07  0.30  1.68  0.08  0.30 -0.40 -0.92
 [4,] -0.23  2.60  1.13  1.35  2.32  0.94 -0.04 -0.44  6.78 -1.53
 [5,] -1.87 -1.32 -3.48 -1.43  1.62  3.37 -1.70  2.89  1.05  4.83
 [6,] -0.93  1.61  0.69 -0.04 -1.82 -3.44  3.80 -1.68  0.99  0.64
 [7,]  2.03  2.11 -0.83 -6.29  1.63  0.86 -0.91 -1.45  2.58  0.58
 [8,] -4.73 -6.58  0.94  1.49 -0.58  1.85  0.51  0.30  2.30 -1.27
 [9,]  1.37 -2.16  3.74 -4.84  0.35  2.39 -2.03  0.33  0.50  1.16
[10,] -0.39  0.67  3.22  0.36  1.27 -0.56  2.09 -4.46 -0.50 -2.79
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
-3.863202 -0.656094  0.001648  0.005911  0.672342  3.978091 
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
 [1,] -0.593  0.558
 [2,]  0.206  1.801
 [3,]  2.030  1.733
 [4,]  0.425  0.382
 [5,]  0.359 -0.283
 [6,]  1.062  1.158
 [7,]  1.074  1.342
 [8,]  0.491 -0.847
 [9,] -1.043  0.950
[10,] -0.935 -0.386
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
[1,]  1.5066232 8.131907
[2,] -0.5333567 8.522819
[3,]  0.9047095 4.380366
[4,]  0.9588557 7.799391
[5,]  0.1326172 6.933438
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



