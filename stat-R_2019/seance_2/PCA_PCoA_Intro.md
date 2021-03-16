---
title: |
  | Module 3  
  | Analyse statistique avec R  
  | Séance 2 : L'analyse en composantes principales
author: "Magali Berland"
date: 07/02/2019
output:
  slidy_presentation:
    smart: no
    slide_level: 2
    self_contained: yes
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
  revealjs::revealjs_presentation:
    theme: night
    transition: none
    self_contained: true
    css: ../slides.css
  ioslides_presentation:
    slide_level: 2
    self_contained: no
    colortheme: dolphin
    fig_caption: yes
    fig_height: 6
    fig_width: 7
    fonttheme: structurebold
    highlight: tango
    smaller: yes
    toc: yes
    widescreen: yes
  html_document:
    self_contained: no
    fig_caption: yes
    highlight: zenburn
    theme: cerulean
    toc: yes
    toc_depth: 3
    toc_float: yes
  pdf_document:
    fig_caption: yes
    highlight: zenburn
    toc: yes
    toc_depth: 3
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
font-import: http://fonts.googleapis.com/css?family=Risque
subtitle: DUBii 2019
font-family: Garamond
transition: linear
---



## Analyse en Composantes Principales

Objectif : décrire sans a priori un tableau de données constitué exclusivement de variables quantitatives. 

<!-- ![](img/data1.png){height=300px} ![](img/data2.png){height=300px} -->

![](img/data3.png){height=400px} 


Cette méthode permet de résumer l'information et d'en réduire la dimensionnalité. 

## Analyse en Composantes Principales

* L’ACP permet de déterminer les espaces de dimension inférieure à l’espace initial :

    + où la projection du nuage de points initial est la moins déformée possible, 
    + qui conserve le plus d’information c’est-à-dire de variabilité.

* L'ACP permet de conserver au mieux la structure de corrélation entre les variables initiales

    + Lorsque plusieurs variables sont corrélées, les composantes principales = combinaison de ces variables 
    + Permet de représenter les observations avec une perte d’information minimale 
    + L’ACP est particulièrement utile lorsque les variables sont fortement corrélées (réduction de dimension)

## Analyse en Composantes Principales

Le principe de l'ACP : 

- Trouver un axe ( = la première composante principale), 
- Issu d'une combinaison linéaire des variables initiales, 
- Tel que la variance du nuage autour de cet axe soit maximale. 
- Réitérer ce processus dans des directions orthogonales pour déterminer les composantes principales suivantes.

![](img/ACP1.png){width=600px}

## Analyse en Composantes Principales

![](img/poisson.png){width=900px}


- L’ACP suppose que les directions avec les plus grandes variances sont les plus “importantes”
- La quantité de variance expliquée par chaque composante principale est mesurée par ce que l’on appelle valeur propre.


## Standardisation des données

- Pour faire une ACP, les variables sont souvent normalisées 
- Particulièrement recommandé lorsque les variables sont mesurées dans différentes unités 
- L’objectif est de rendre les variables comparables. 

<img src="figures/PCA_PCoA_intro_unnamed-chunk-2-1.png" style="display: block; margin: auto;" />


## Standardisation des données

- Centrer et réduire = soustraire à chaque valeur la moyenne de la variable et diviser par l’écart-type (fonction scale()) : $\frac{x_{i} - mean(x)}{sd(x)}$


<img src="figures/PCA_PCoA_intro_unnamed-chunk-3-1.png" style="display: block; margin: auto;" />
- L’ACP appliquée à ces données transformées est appelée ACP normée.


## Code R

```r
library("FactoMineR")
library("factoextra")
```



```r
PCA(X, scale.unit = TRUE, ncp = 5, graph = TRUE)
```


- X : jeu de données de type data frame. Les lignes sont des individus et les colonnes sont des variables numériques
- scale.unit : une valeur logique. Si TRUE, les données sont standardisées/normalisées avant l’analyse.
- ncp : nombre de dimensions conservées dans les résultats finaux.
- graph : une valeur logique. Si TRUE un graphique est affiché.


```r
data(decathlon2)
res.pca = PCA(decathlon2[, 1:10], graph = FALSE)
```

## Code R
Le résultat de la fonction PCA() est une liste, contenant les éléments suivants :


```r
res.pca
```

```
**Results for the Principal Component Analysis (PCA)**
The analysis was performed on 27 individuals, described by 10 variables
*The results are available in the following objects:

   name               description                          
1  "$eig"             "eigenvalues"                        
2  "$var"             "results for the variables"          
3  "$var$coord"       "coord. for the variables"           
4  "$var$cor"         "correlations variables - dimensions"
5  "$var$cos2"        "cos2 for the variables"             
6  "$var$contrib"     "contributions of the variables"     
7  "$ind"             "results for the individuals"        
8  "$ind$coord"       "coord. for the individuals"         
9  "$ind$cos2"        "cos2 for the individuals"           
10 "$ind$contrib"     "contributions of the individuals"   
11 "$call"            "summary statistics"                 
12 "$call$centre"     "mean of the variables"              
13 "$call$ecart.type" "standard error of the variables"    
14 "$call$row.w"      "weights for the individuals"        
15 "$call$col.w"      "weights for the variables"          
```

## Valeurs propres / Variances

- Les valeurs propres (eigenvalues en anglais) mesurent la quantité de variance expliquée par chaque axe principal. 
- Elles sont grandes pour les premiers axes et petites pour les axes suivants. 
- Les premiers axes correspondent aux directions portant la quantité maximale de variation contenue dans le jeu de données. 
- On peut examiner les valeurs propres pour déterminer le nombre de composantes principales à prendre en compte. 

## Valeurs propres / Variances


```r
eig.val = get_eigenvalue(res.pca)
eig.val
```

Les valeurs propres peuvent être utilisées pour déterminer le nombre d’axes principaux à conserver.

- Une valeur propre > 1 : la composante principale (PC) concernée représente plus de variance par rapport à une seule variable d’origine, lorsque les données sont standardisées. 
- On peut regarder le nombre d’axes qui représente une certaine fraction de la variance totale. Par exemple, le nombre d’axe qui permet de parvenir à 70% de la variance totale expliquée. 

## Valeurs propres / Variances


```r
fviz_eig(res.pca, addlabels = TRUE, ylim = c(0, 50))
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-9-1.png" style="display: block; margin: auto;" />

## Étude des variables

L'ACP permet d'étudier les liaisons linéaires entre les variables. 

Les objectifs sont de résumer la matrice des corrélations et de chercher des variables synthétiques : peut-on résumer les observations par un petit nombre de variables ?
    
> Dans notre exemple : les variables représentent les performances des athlètes dans chaque discipline

## Graphiques des variables

```r
var = get_pca_var(res.pca)
var
```

```
Principal Component Analysis Results for variables
 ===================================================
  Name       Description                                    
1 "$coord"   "Coordinates for the variables"                
2 "$cor"     "Correlations between variables and dimensions"
3 "$cos2"    "Cos2 for the variables"                       
4 "$contrib" "contributions of the variables"               
```

Les composants de get_pca_var() peuvent être utilisés dans le graphique des variables comme suit :

- var$coord : coordonnées des variables pour représenter le nuage de points.
- var\$cos2 : cosinus carré des variables. Représente la qualité de représentation des variables sur le graphique de l’ACP. Il est calculé comme étant les coordonnées au carré : $var.cos^2 = var.coord * var.coord$.
- var\$contrib : contient les contributions (en pourcentage), des variables, aux composantes principales. La contribution d’une variable (var) à une composante principale donnée : $(var.cos^2 \times 100) / (\sum_{composante} cos^2)$.

## Graphiques des variables

```r
# Coordonnées
var$coord[1:3, 1:4]
```

```
               Dim.1      Dim.2        Dim.3       Dim.4
X100m     -0.8189521  0.3427787  0.100864539  0.10134200
Long.jump  0.7588985 -0.3814931 -0.006261254 -0.18542415
Shot.put   0.7150783  0.2821167  0.473854591  0.03610404
```

```r
# Cos2: qualité de répresentation
var$cos2[1:3, 1:4]
```

```
              Dim.1      Dim.2        Dim.3       Dim.4
X100m     0.6706825 0.11749725 0.0101736553 0.010270201
Long.jump 0.5759270 0.14553701 0.0000392033 0.034382115
Shot.put  0.5113370 0.07958983 0.2245381732 0.001303502
```

```r
# Contributions aux composantes principales
var$contrib[1:3, 1:4]
```

```
             Dim.1    Dim.2        Dim.3     Dim.4
X100m     17.88500 6.732718  0.670277238 0.9949816
Long.jump 15.35817 8.339426  0.002582856 3.3309545
Shot.put  13.63575 4.560583 14.793387670 0.1262838
```

## Le cercle de corrélation

```r
fviz_pca_var(res.pca, col.var = "black")
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-12-1.png" style="display: block; margin: auto;" />

- Plus une variable est proche du cercle de corrélation, meilleure est sa représentation et elle est plus importante pour interpréter les composantes principales en considération 
- Les variables qui sont proche du centre du graphique sont moins importantes pour interpréter les composantes. 

## Qualité de représentation

```r
corrplot(var$cos2, is.corr=FALSE)
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-13-1.png" style="display: block; margin: auto;" />

- Un $cos^2$ élevé = bonne représentation de la variable sur les axes principaux     
$\rightarrow$ la variable est positionnée à proximité du bord du cercle de corrélation. 
- Un faible $cos^2$ =  la variable n’est pas bien représentée par les axes principaux    
$\rightarrow$ la variable est proche du centre du cercle. 

## Qualité de représentation

```r
# Cos2 total des variables sur Dim.1 et Dim.2
fviz_cos2(res.pca, choice = "var", axes = 1:2)
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-14-1.png" style="display: block; margin: auto;" />

  + Si une variable est parfaitement représentée par les deux 1ères composantes principales, les variables seront positionnées sur le cercle de corrélation.
  + Pour certaines des variables, plus de 2 axes peuvent être nécessaires pour représenter parfaitement les données.

## Qualité de représentation

```r
# Cos2 total des variables sur Dim.1 et Dim.2
fviz_cos2(res.pca, choice = "var", axes = 1:5)
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-15-1.png" style="display: block; margin: auto;" />

- Pour une variable donnée, la somme des $cos^2$ sur toutes les composantes principales est égale à 1.


## Qualité de représentation

```r
# Colorer en fonction du cos2 : qualité de représentation
fviz_pca_var(res.pca, col.var = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE # Évite le chevauchement de texte
             )
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-16-1.png" style="display: block; margin: auto;" />


## Contributions des variables aux axes principaux

```r
head(var$contrib, 4)
```

```
             Dim.1     Dim.2        Dim.3     Dim.4    Dim.5
X100m     17.88500  6.732718  0.670277238 0.9949816  7.81996
Long.jump 15.35817  8.339426  0.002582856 3.3309545 11.25620
Shot.put  13.63575  4.560583 14.793387670 0.1262838 12.56616
High.jump  9.87378 21.416504  0.001397716 0.4917303 14.62394
```

- Plus la valeur de la contribution est importante, plus la variable contribue à la composante principale en question.
- Les contributions des variables sont exprimées en pourcentage. 
- Les variables corrélées avec PC1 (i.e., Dim.1) et PC2 (i.e., Dim.2) sont les plus importantes pour expliquer la variabilité dans le jeu de données.
- Les variables qui ne sont pas en corrélation avec un axe ou qui sont corrélées avec les derniers axes sont des variables à faible apport et peuvent être supprimées pour simplifier l’analyse globale.

## Contributions des variables aux axes principaux

```r
corrplot(var$contrib, is.corr=FALSE)
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-18-1.png" style="display: block; margin: auto;" />


## Contributions des variables aux axes principaux

```r
# Contributions des variables à PC1
fviz_contrib(res.pca, choice = "var", axes = 1, top = 10)
# Contributions des variables à PC2
fviz_contrib(res.pca, choice = "var", axes = 2, top = 10)
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-20-1.png" style="display: block; margin: auto;" />



Contribution moyenne attendue : Une variable avec une contribution supérieure à ce seuil pourrait être considérée comme importante pour contribuer à la composante.

## Contributions des variables aux axes principaux

La contribution totale à PC1 et PC2 est obtenue avec le code R suivant :


```r
fviz_contrib(res.pca, choice = "var", axes = 1:2, top = 10)
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-21-1.png" style="display: block; margin: auto;" />


## Contributions des variables aux axes principaux

```r
fviz_pca_var(res.pca, col.var = "contrib",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07")
             )
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-22-1.png" style="display: block; margin: auto;" />


## Description des dimensions
La fonction dimdesc() peut être utilisée pour identifier les variables les plus significativement associées avec une composante principale donnée :

```r
res.desc = dimdesc(res.pca, axes = c(1,2), proba = 0.05)
# Description de la dimension 1
res.desc$Dim.1
```

```
$quanti
             correlation         p.value
Long.jump      0.7588985 0.0000044696655
Discus         0.7168881 0.0000258693448
Shot.put       0.7150783 0.0000277085025
High.jump      0.6084933 0.0007579915942
X400m         -0.6438482 0.0002904661206
X110m.hurdle  -0.7164203 0.0000263340399
X100m         -0.8189521 0.0000001769961
```

```r
# Description de la dimension 2
res.desc$Dim.2
```

```
$quanti
           correlation      p.value
High.jump    0.6113542 0.0007043348
Long.jump   -0.3814931 0.0495907675
X1500m      -0.5681197 0.0019922408
Pole.vault  -0.7375479 0.0000113643
```

Les variables sont triées en fonction de la p-value de la corrélation.

## Ajout de variables supplémentaires pour aider à l'interprétation

```r
res.pca = PCA(decathlon2[, 1:12], quanti.sup = 11:12, graph = FALSE)
fviz_pca_var(res.pca, col.var = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             col.quanti.sup = "blue",
             repel = TRUE # Évite le chevauchement de texte
             )
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-24-1.png" style="display: block; margin: auto;" />


## Étude des individus

On peut également étudier la variabilité entre individus. 

Y a-t-il des similarités entre les individus pour toutes les variables ? Peut-on établir des profils d'individus ? Peut-on opposer un groupe d'individus à un autre ?

> Dans notre exemple : les individus sont les athlètes : deux athlètes sont proches s'ils ont des résultats similaires.

## Graphique des individus

```r
ind = get_pca_ind(res.pca)
ind
```

Pour accéder aux différents éléments, utilisez ceci :

```r
# Coordonnées des individus
ind$coord[1:3, 1:4]
```

```
             Dim.1      Dim.2     Dim.3      Dim.4
SEBRLE   0.2779582 -0.5364345 1.5852390  0.1058225
CLAY     0.9048536 -2.0942803 0.8406848  1.8507178
BERNARD -1.3722659 -1.3481155 0.9619317 -1.4930718
```

```r
# Qualité des individus
ind$cos2[1:3, 1:4]
```

```
             Dim.1      Dim.2      Dim.3       Dim.4
SEBRLE  0.01544651 0.05753138 0.50241310 0.002238865
CLAY    0.06557423 0.35127414 0.05660346 0.274319687
BERNARD 0.23223664 0.22413434 0.11411498 0.274925838
```

```r
# Contributions des individus
ind$contrib[1:3, 1:4]
```

```
             Dim.1     Dim.2    Dim.3       Dim.4
SEBRLE  0.07630746 0.6107062 6.132015  0.04018174
CLAY    0.80865774 9.3082618 1.724567 12.29002506
BERNARD 1.85987901 3.8570314 2.257887  7.99896372
```

## Graphique : qualité et contribution

```r
fviz_pca_ind (res.pca, col.ind = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE) # Évite le chevauchement de texte
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-27-1.png" style="display: block; margin: auto;" />

## Graphique : qualité et contribution

```r
fviz_pca_ind (res.pca, pointsize = "cos2",
             pointshape = 21, fill = "#E7B800",
             repel = TRUE) # Évite le chevauchement de texte
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-28-1.png" style="display: block; margin: auto;" />

## Graphique : qualité et contribution

```r
# Contribution totale sur PC1 et PC2
fviz_contrib(res.pca, choice = "ind", axes = 1:2)
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-29-1.png" style="display: block; margin: auto;" />

## Lien entre les variables et les observations

Permet de répondre à la question : peut-on caractériser des groupes d'individus par des variables ?


## Le biplot : représenter les individus et les variables en même temps

```r
fviz_pca_biplot(res.pca, repel = TRUE,
                col.var = "#2E9FDF", # Couleur des variables
                col.ind = "#696969") # Couleur des individues
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-30-1.png" style="display: block; margin: auto;" />

  > Le biplot n’est utile que s’il existe un faible nombre de variables et d’individus dans le jeu de données
  
  > Les coordonnées des individus et des variables ne sont pas construites dans le même espace.    
  $\rightarrow$ se concentrer sur la direction des variables mais pas sur leurs positions absolues sur le graphique. 
  
## Le biplot : représenter les individus et les variables en même temps

```r
fviz_pca_biplot(res.pca, repel = TRUE,
                col.var = "#2E9FDF", # Couleur des variables
                col.ind = "#696969") # Couleur des individues
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-31-1.png" style="display: block; margin: auto;" />

  > Un individu qui se trouve du même côté d’une variable donnée a une valeur élevée pour cette variable ; 
  
  > Un individu qui se trouve sur le côté opposé d’une variable donnée a une faible valeur pour cette variable. 



## Colorer par groupes (variable qualitative)

```r
fviz_pca_ind(res.pca,
             geom.ind = "point", # Montre les points seulement (mais pas le label)
             col.ind = decathlon2$Competition, # colorer by groups
             addEllipses = TRUE, # Ellipses de concentration
             ellipse.level = 0.5,
             legend.title = "Compétition")
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-32-1.png" style="display: block; margin: auto;" />

## Colorer par groupes (variable qualitative)


```r
fviz_pca_ind(res.pca,
             col.ind = decathlon2$Competition, # colorer by groups
             addEllipses = TRUE, # Ellipses de concentration
             ellipse.level = 0.5,
             legend.title = "Compétition")
```

<img src="figures/PCA_PCoA_intro_unnamed-chunk-33-1.png" style="display: block; margin: auto;" />
