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



## Install knitr package if required
if (!require(knitr)) {
  message("Installing missing package: knitr")
  install.packages("knitr")
}



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
 [1,] -1.41 -0.06  0.19  0.00 -1.73  0.51 -0.83  0.93 -1.42 -0.28
 [2,] -0.96  2.49  0.26 -3.23  0.02  2.28 -4.24 -1.39  1.28 -2.32
 [3,]  2.13  0.73  2.05  1.70 -0.35  1.17  0.06 -3.89 -3.70 -2.16
 [4,]  0.16 -1.49 -2.85  3.69 -1.31 -0.24  3.74  0.65 -1.01  3.66
 [5,] -1.53  1.86 -0.19  2.09  2.00  0.24  1.13 -3.30  2.76 -1.24
 [6,] -0.54  4.35  1.07  1.06 -1.89 -2.93  0.73  2.38 -3.67 -0.85
 [7,] -3.40  1.18  0.09  4.46 -3.21  1.54 -3.74 -1.01  4.50 -0.05
 [8,]  5.25  2.14 -1.61 -2.81  0.33  1.26  2.44  3.33 -1.56 -0.44
 [9,]  0.80  0.05  0.67  3.73  1.59  2.17 -2.57 -0.59  0.54  3.60
[10,] -2.25  4.62  0.55 -3.04 -1.08 -3.81  0.12  4.22 -1.28 -1.28
```


## Exercice 2

2.1. Créez deux vecteurs aléatoires nommés `x1` et `x2`, contenant chacun 1000 valeurs aléatoires respectivement compatibles:

a. avec une loi normale centrée réduite pour `x1`;
b. avec une loi uniforme définie sur l’intervalle $[0, 10]$ pour `x2`.


2.2. Créez une matrice `m1` qui contient les 10 premières valeurs de x1 (colonne 1 de m1) et les 10 dernières valeurs de x2 (colonne 2 de m1).

2.3. Créez une matrice `m2` qui contient les 16ème, 51ème, 79ème, 31ème et 27ème valeurs de x1 (colonne 1 de m2) et les 30ème, 70ème, 12ème, 49ème et 45ème de x2 (colonne 2 de m2).

2.4. Concaténez à la suite (l’une en dessous-de l’autre) les matrices m1 et m2, afin d’obtenir une nouvelle matrice m3. Quelles sont les dimensions (nombre de lignes et de colonnes) de m3?

**Fonctions à utiliser :** `rnorm()`, `runif()`, `cbind()`, `rbind()`, `dim()`, ...

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



## Exercice 3

3.1. Importez dans votre session R les données nommées `WorldPhones` (pré-existantes dans R). Affichez le contenu de la variable `WorldPhones`. Quelle est sa structure et sa classe ?

3.2. Calculez le nombre total de numéros de téléphone attribués :

a. au cours des différentes années (vecteur `nbrTelAn`)
b. pour chaque continent (vecteur `nbrTelCont`)


3.3. Quel est le continent qui a le plus / moins de numéros attribués ?

3.4. Dans combien de continents y a-t-il plus de : 20 000, 50 000 et 200 000 numéros de téléphone attribués ? 


**Fonctions à utiliser :** `data(WorldPhones)`, `str()`, `sum()`, `apply()`, `names()`, `which()`, `max()`, `min()` ...


## Exercice 4

Téléchargez le fichier `test.txt` présent sur moodle. Ouvrez-le avec un éditeur de texte ou un calculateur pour identifier sa structure et les cases non remplies.


- Importez le dans R dans un objet `test.data` et vérifiez sa structure et son contenu.

- Comment les données manquantes ont-elles été lues ? Remplacez-les par NA si elles n’ont pas été lues comme une donnée manquante.

- Déplacer la colonne 1 en dernière colonne

- Renommez les colonnes colA, colB, colC, colD, colE etc…dans le nouvel ordre obtenu

- Supprimez la deuxième ligne

- Ajoutez une colonne de valeurs numériques obtenues en divisant les valeurs de la `colE` par les valeurs de la `colA`

- Dans la `colC`, remplacez les valeurs `toto` par `tata` et vice-versa

- Dans la `colC`, remplacez les lettres `t` par des `m`

- Triez le dataframe par ordre croissant de la colonne `colE`

- Convertissez la colonne `colB` en valeurs numériques

- Dans un vecteur sumcolA, calculer la somme de la `colA`

- Faites un sous-dataframe `test.data2` contenant les lignes pour lesquelles les éléments de la `colE` sont inférieurs ou égaux à ceux de la `colA` 

- Sauvegardez le dataframe test.data2 en fichier texte avec des `;` comme séparateurs de champs.

**Fonctions à utiliser dans l’ordre :** `read.table()`, `str()`, `is.na()`, `paste()`, `gsub()`, `order()`, `as.integer()`, `sum()`, `subset()`, `write.table()`

## Exercice 5

Sauvegardez dans une liste `session2_list` tous les objets créés pendant les exercices 1 à 4 en les mettant dans des sous-listes correspondant à chaque exercice que vous nommerez `exo1`, `exo2`, `exo3` et `exo4`.

**Fonctions à utiliser :** `list()`, `names()`


## Á la maison


- Revoyez toutes les fonctions vues en cours attentivement des sessions 1 et 2.

- Les corrections des exercices de la session 2 seront disponibles le vendredi soir.

- Vous devez terminer l’ensemble des exercices avant la prochaine session, lire et comprendre les corrections, puis refaire par vous-même les exercices sans les corrections.

- Une évaluation QCM aura lieu à la prochaine séance


