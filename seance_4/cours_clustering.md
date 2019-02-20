---
title: "Méthodes de Partionnement et d'apprentissage non supervisé"
subtitle: Classification Hiérarchique et Kmeans
author: "Anne Badel, Frédéric Guyon & Jacques van Helden"
date: "2019-02-20"
output:
  slidy_presentation:
    highlight: default
    incremental: no
    smart: no
    slide_level: 1
    self_contained: yes
    fig_caption: no
    fig_height: 5
    fig_width: 5
    keep_md: yes
    smaller: yes
    theme: cerulean
    toc: yes
    widescreen: yes
  beamer_presentation:
    colortheme: dolphin
    fig_caption: no
    fig_height: 5
    fig_width: 5
    fonttheme: structurebold
    highlight: default
    incremental: no
    keep_tex: no
    slide_level: 1
    theme: Montpellier
    toc: yes
  html_document:
    fig_caption: yes
    highlight: zenburn
    self_contained: no
    theme: cerulean
    toc: yes
    toc_depth: 3
    toc_float: yes
  ioslides_presentation:
    highlight: zenburn
    incremental: no
  pdf_document:
    fig_caption: yes
    highlight: zenburn
    toc: yes
    toc_depth: 3
  revealjs::revealjs_presentation:
    theme: night
    transition: none
    self_contained: true
    slide_level: 1
    css: ../slides.css
font-import: http://fonts.googleapis.com/css?family=Risque
font-family: Garamond
transition: linear
---







# Partitionnement et apprentissage

- On a une **représentation** des données

    + sous forme de valeurs réelles=vecteur de 
    + sous forme de catégories

- **Clustering**: on cherche a priori des groupes dans les données

- **Apprentissage**:

    + on connaît le partitionnement sur un jeu de données
    + on cherche le groupe (la classe) de nouvelles données

# Partionnement = Clustering

<div class="figure" style="text-align: center">
<img src="img/figure1.png" alt="Y a-t-il des groupes ?" width="50%" />
<p class="caption">Y a-t-il des groupes ?</p>
</div>


# Partionnement = Clustering

<div class="figure" style="text-align: center">
<img src="img/figure2.png" alt="Oui, 4 groupes. " width="50%" />
<p class="caption">Oui, 4 groupes. </p>
</div>

# Apprentissage

<div class="figure" style="text-align: center">
<img src="img/figure3.png" alt="2 groupes. " width="50%" />
<p class="caption">2 groupes. </p>
</div>

# Apprentissage: Séparation linéaire

<div class="figure" style="text-align: center">
<img src="img/figure4.png" alt="2 groupes. " width="50%" />
<p class="caption">2 groupes. </p>
</div>


# Méthodes
Trois grands principes de méthodes basées sur:

- La géométrie
- Les probabilités (statistique)
- Les graphes

En fait, trois façons de voir les mêmes algorithmes

# Géométrie et distances

<div class="columns-2">

On considère les données comme des points de $R^n$ (*)


- géométrie donnée par distances
- distances = dissimilaritées imposées par le problème
- dissimilarités $\longrightarrow$ permettent visualisation de l'ensemble des points
- Détermination visuelle des groupes

(*) Espace Euclidien à $n$ dimensions, où 

- chaque dimension représente une des variables observées;
- un individu est décrit comme un vecteur à $n$ valeurs, qui correspond à un point dans cet espace. 

</div>


# Les données

[Ces données sont un classique des méthodes d'apprentissage](https://onlinelibrary.wiley.com/doi/epdf/10.1111/j.1469-1809.1936.tb02137.x)

Dans un premier temps, regardons les données.


```r
dim(mes.iris)
```

```
[1] 150   4
```

```r
head(mes.iris)
```

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width
1          5.1         3.5          1.4         0.2
2          4.9         3.0          1.4         0.2
3          4.7         3.2          1.3         0.2
4          4.6         3.1          1.5         0.2
5          5.0         3.6          1.4         0.2
6          5.4         3.9          1.7         0.4
```

# Les variables


```r
summary(mes.iris)
```

```
  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
 Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
 Median :5.800   Median :3.000   Median :4.350   Median :1.300  
 Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
 Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
```


# Visualisation des données

On peut ensuite essayer de visualiser les données
  

```r
plot(mes.iris)
```

<img src="figures/irisDeFisher_plot_iris-1.png" width="60%" style="display: block; margin: auto;" />

*****

# Cas d'étude : TCGA Breast Invasive Cancer (BIC)

- Présentation du cas d'étude (Jacques van Helden A COMPLETER)

# TP : analyse de données d'expression

- TP clustering : 
[[html](TP_clustering.html)]
[[pdf](TP_clustering.pdf)]
[[Rmd](https://raw.githubusercontent.com/DU-Bii/module-3-Stat-R/master/seance_4/TP_clustering.Rmd)]

- Première partie : chargement des données

# Géométrie et distances

Sur la base d'une distance (souvent euclidienne)

- Partionnement:

    + Moyennes mobiles ou K-means : séparation optimale des groupes connaissant le nombre de groupes
    + Méthode agglomérative ouhierarchical clustering

- Classification:

    + attribution K plus proches voisins (K Nearest Neighbor)
    + séparation linéaire ou non linéaire

# Distances

Définition d'une distance : fonction positive de deux variables

1. $d(x,y) \ge 0$
2. $d(x,y) = d(y,x)$
3. $d(x,y) = 0 \Longleftrightarrow x = y$
4. **Inégalité triangulaire :** $d(x,z) \le$ d(x,y)+d(y,z)

Si 1,2,3 : dissimilarité

# Distances utilisées dans R

- distance euclidienne ou distance $L_2$:
  $d(x,y)=\sqrt{\sum_i (x_i-y_i)^2}$
  
- distance de manahattan ou distance $L_1$:
  $d(x,y)=\sum_i |x_i-y_i|$
    
- distance du maximum ou L-infinis, $L_\infty$:
  $d(x,y)=\max_i |x_i-y_i|$
    
<img src="img/distance.png" width="70%" style="display: block; margin: auto;" />


# Distances utilisées dans R

- distance de Minkowski $l_p$:
$$d(x,y)=\sqrt[p]{\sum_i (|x_i-y_i|^p}$$

- distance de Canberra (x et y valeurs positives):
$$d(x,y)=\sum_i \frac{x_i-y_i}{x_i+y_i}$$

- distance binaire ou distance de Jaccard ou Tanimoto: proportion de propriétés communes

# Autres distances non géométriques (pour information)

Utilisées en bio-informatique:

- Distance de **Hamming**: nombre de remplacements de caractères (substitutions)

- Distance de **Levenshtein**: nombre de substitutions, insertions, deletions entre deux chaînes de caractères

$$d("BONJOUR", "BONSOIR")=2$$

- Distance d'**alignements**: distances de Levenshtein avec poids (par ex. matrices BLOSSUM)

- Distances d'**arbre** (Neighbor Joining)

- Distances **ultra-métriques** (phylogénie UPGMA)

# Distances plus classiques en génomique

Comme vu lors de la séance 3, il existe d'autres mesures de distances :

- **Jaccard** (comparaison d'ensembles): $J_D = \frac{A \cap B}{A \cup B}$

- Distance du $\chi^2$ (comparaison de tableau d'effectifs)

Ne sont pas des distances, mais indices de dissimilarité :

- **Bray-Curtis** (en écologie, comparaison d'abondance d'espèces)
- **Jensen-Shannon** (comparaison de distributions)
  
**Remarque** : lors du TP, sur les données d'expression RNA-seq, nous utiliserons le **coefficient de corrélation de Spearman** et la distance dérivée, $d_c = 1-r$

# Distances entre groupes

- **Single linkage** : élements les plus proches des 2 groupes

$$D(C_1,C_2) = \min_{i \in C_1, j \in C_2} D(x_i, x_j)$$
  
- **Complete linkage** : éléments les plus éloignés des 2 groupes

$$D(C_1,C_2) = \max_{i \in C_1, j \in C_2} D(x_i, x_j)$$
  
- **Group average** : distance moyenne

$$D(C_1,C_2) = \frac{1}{N_1 N_2} \sum_{i \in C_1, j \in C_2} D(x_i, x_j)$$
  
- **Ward**

$d^2(C_i,C_j) = I_{intra}(C_i \cup C_j)-I_{intra}(C_i)-I_{intra}(C_j)$

$D(C_1,C_2) = \sqrt{\frac{N_1N_2}{N_1 + N_2}} \| m_1 -m_2 \|$

# Distances entre groupes

<img src="img/groupes.png" width="90%" style="display: block; margin: auto;" />


# Les données

[Ces données sont un classique des méthodes d'apprentissage](https://onlinelibrary.wiley.com/doi/epdf/10.1111/j.1469-1809.1936.tb02137.x)

Dans un premier temps, regardons les données


```r
dim(mes.iris)
```

```
[1] 150   4
```

```r
head(mes.iris)
```

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width
1          5.1         3.5          1.4         0.2
2          4.9         3.0          1.4         0.2
3          4.7         3.2          1.3         0.2
4          4.6         3.1          1.5         0.2
5          5.0         3.6          1.4         0.2
6          5.4         3.9          1.7         0.4
```

---


```r
str(mes.iris)
```

```
'data.frame':	150 obs. of  4 variables:
 $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
 $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
 $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
 $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
```

```r
summary(mes.iris)
```

```
  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
 Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
 Median :5.800   Median :3.000   Median :4.350   Median :1.300  
 Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
 Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
```


# Visualisation des données

On peut ensuite essayer de visualiser les données

  - par un `plot`
  

```r
plot(mes.iris)
```

<img src="figures/irisDeFisher_plot_4variables-1.png" width="60%" style="display: block; margin: auto;" />

# Visualisation des données - coloration par espèces



```r
species.colors <- c(setosa = "#BB44DD", virginica = "#AA0044", versicolor = "#4400FF")
plot(mes.iris, col = species.colors[iris$Species], cex = 0.7)
```

<img src="figures/irisDeFisher_plot_4variables_variety-1.png" width="60%" style="display: block; margin: auto;" />


# Visualisation des données

- par la fonction `image()`
  

```r
image(1:nb.var, 1:nb.iris ,t(as.matrix(mes.iris)), xlab = "variables", ylab = "Observation nb", las = 1)
```

<img src="figures/irisDeFisher_var_image-1.png" width="60%" style="display: block; margin: auto;" />

# Nettoyage des données (1): données manquantes

Avant de commencer à travailler, il est nécessaire de commencer par vérifier que :

- il n'y a pas de données manquantes


```r
sum(is.na(mes.iris))
```

```
[1] 0
```

# Nettoyage des données (2) : variables constantes

- aucune  variable n'est constante (aucune variable n'a une variance nulle)
  

```r
iris.var <- apply(mes.iris, 2, var)
kable(iris.var, digits = 3, col.names = "Variance")
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> Variance </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Sepal.Length </td>
   <td style="text-align:right;"> 0.686 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sepal.Width </td>
   <td style="text-align:right;"> 0.190 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Petal.Length </td>
   <td style="text-align:right;"> 3.116 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Petal.Width </td>
   <td style="text-align:right;"> 0.581 </td>
  </tr>
</tbody>
</table>

```r
sum(apply(mes.iris, 2, var) == 0)
```

```
[1] 0
```


# Normalisation

Afin de pouvoir considérer que toutes les variables sont à la même échelle, il est parfois nécessaire de normaliser les données.

- soit 

    - en centrant (ramener la moyenne de chaque variable à $0$)
  

```r
mes.iris.centre <- scale(mes.iris, center=TRUE, scale=FALSE)
```

- soit 

    - en centrant (ramener la moyenne de chaque variable $0$)
    - et mettant à l'échelle (ramener la variance de chaque variable à $1$)


```r
mes.iris.scaled <- scale(mes.iris, center=TRUE, scale=TRUE)
```


# On peut visuellement regarder l'effet de la normalisation :

## par un plot des données 


```r
plot(mes.iris, main = "Raw variables")
```

<img src="figures/irisDeFisher_plot_raw_vs_scaled-1.png" width="60%" style="display: block; margin: auto;" />

**!** ne pas faire si "grosses" données


----

## ... par une boîte à moustaches (boxplot)


```r
par(mfrow = c(1,2))
par(mar = c(7, 4.1, 4.1, 1.1)) # adapt margin sizes for the labels
boxplot(mes.iris, main = "Raw data", las = 2)
boxplot(mes.iris.scaled, main = "scaled", las = 2)
```

<img src="figures/irisDeFisher_boxplots_raw_vs_norm-1.png" width="70%" style="display: block; margin: auto;" />

```r
par(mar = c(5.1, 4.1, 4.1, 2.1)) # Restore original margin sizes
```

----

## ... par une image


```r
par(mfrow=c(1,2))
image(1:nb.var, 1:nb.iris, t(as.matrix(mes.iris)), main="Raw data")
image(1:nb.var, 1:nb.iris, t(as.matrix(mes.iris.scaled)), main="Scaled data")
```

<img src="figures/irisDeFisher_image_raw_vs_norm-1.png" width="80%" style="display: block; margin: auto;" />


----

## ... par une projection sur une ACP


```r
par(mfrow = c(1,2))
biplot(prcomp(mes.iris), las = 1, cex = 0.7,
       main = "Données non normalisées")
biplot(prcomp(mes.iris, scale = TRUE), las = 1, cex = 0.7,
       main = "Données normalisées")
```

<img src="figures/irisDeFisher_unnamed-chunk-9-1.png" width="90%" style="display: block; margin: auto;" />

# La matrice de distances

Nous utilisons ici la distance euclidienne. 




```r
iris.euc <- dist(mes.iris)
iris.scale.euc <- dist(mes.iris.scaled)
```


```r
par(mfrow = c(1,2))
image(t(as.matrix(iris.euc)), main = "Données brutes", las = 1)
image(t(as.matrix(iris.scale.euc)), main = "Données normalisées", las = 1)
```

<img src="figures/irisDeFisher_heatmap_euclidian_dist-1.png" width="80%" style="display: block; margin: auto;" />

```r
par(mfrow = c(1,1))
```

# La classification hiérarchique

## Principe

- **classification hiérarchique** : mettre en évidence des liens hiérachiques entre les individus

    - classification hiérarchique **ascendante** : partir des individus pour arriver à des classes / cluster
    
    - classification hiérarchique **descendante** : partir d'un groupe qu'on subdivise en sous-groupes /clusters jusqu'à arriver à des individus.

---

## Notion importante, cf distances

- ressemblance entre individus = distance
- ressemblance entre groupes d'invidus = critère d'aggrégation

    - lien simple
    - lien complet
    - lien moyen
    - critère de Ward

---

## L'algorithme

### étape 1 :

- départ : n individus = n clusters distincts
- calcul des distances entre tous les individus

    - choix de la métrique à utiliser en fonction du type de données

- regroupement des 2 individus les plus proches => (n-1) clusters

---

## au départ

<img src="img/hclust1.png" width="90%" style="display: block; margin: auto;" />


---

## identification des individus les plus proches

<img src="img/hclust2.png" width="90%" style="display: block; margin: auto;" />


---

## construction du dendrogramme

<img src="img/hclust3.png" width="90%" style="display: block; margin: auto;" />

---

## étape j :

- calcul des dissemblances entre chaque groupe obtenu à l'étape $(j-1)$

- regroupement des deux groupes les plus proches => $(n-j)$ clusters
  
---

## calcul des nouveaux représentants `BE` et `CD`

<img src="img/hclust4.png" width="90%" style="display: block; margin: auto;" />

---

## calcul des distances de l'individu restant `A` aux points moyens

<img src="img/hclust5.png" width="90%" style="display: block; margin: auto;" />


---

## A est plus proche de ...

<img src="img/hclust6.png" width="90%" style="display: block; margin: auto;" />

---

## dendrogramme

<img src="img/hclust7.png" width="90%" style="display: block; margin: auto;" />

---

## pour finir

<img src="img/hclust8.png" width="90%" style="display: block; margin: auto;" />

---

- à l'étape $(n-1)$, tous les individus sont regroupés dans un même cluster

## dendrogramme final

<img src="img/hclust9.png" width="90%" style="display: block; margin: auto;" />

---

## Je ne fais pas attention à ce que je fais ...


```r
iris.hclust <- hclust(iris.euc)
plot(iris.hclust, hang = -1, cex = 0.5)
```

<img src="figures/irisDeFisher_dont_care-1.png" width="70%" style="display: block; margin: auto;" />

... c'est à dire aux options des fonctions `dist()` et `hclust()`

---

## Sur données normalisées


```r
iris.scale.hclust <- hclust(iris.scale.euc)
plot(iris.scale.hclust, hang = -1, cex = 0.5)
```

<img src="figures/irisDeFisher_dont_care_norm-1.png" width="70%" style="display: block; margin: auto;" />

---


```r
par(mfrow = c(2, 1))
plot(iris.hclust, hang = -1, cex = 0.5, main = "Données brutes")
plot(iris.scale.hclust, hang = -1, cex = 0.5, main = "Normalisées")
```

<img src="figures/irisDeFisher_dont_care_raw_vs_norm-1.png" width="80%" style="display: block; margin: auto;" />

---

## En utilisant une autre métrique


```r
iris.scale.max <- dist(mes.iris.scaled, method = "manhattan")
iris.scale.hclust.max <- hclust(iris.scale.max)
par(mfrow=c(2,1))
plot(iris.scale.hclust, hang=-1, cex=0.5, main = "Euclidian dist")
plot(iris.scale.hclust.max, hang=-1, cex=0.5, main = "Manhattan dist")
```

<img src="figures/irisDeFisher_hclust_euclidian_vs_manhattan-1.png" width="80%" style="display: block; margin: auto;" />

---

## En utilisant un autre critère d'aggrégation


```r
iris.scale.hclust.single <- hclust(iris.scale.euc, method="single")
iris.scale.hclust.ward <- hclust(iris.scale.euc, method="ward.D2")
par(mfrow=c(2,1))
plot(iris.scale.hclust.single, hang=-1, cex=0.5, main = "Single linkage")
plot(iris.scale.hclust.ward, hang=-1, cex=0.5, main = "Ward linkage")
```

<img src="figures/irisDeFisher_linkage_rule-1.png" width="80%" style="display: block; margin: auto;" />

```r
par(mfrow=c(1,1))
```

# Les k-means

Les individus dans le plan

<img src="img/kmeans0.png" width="80%" style="display: block; margin: auto;" />


# L'algorithme

## étape 1 :

- $k$ centres provisoires tirés au hasard
- $k$ clusters créés à partir des centres en regroupant les individus les plus proches de chaque centre
- obtention de la partition $P_0$ 

---

## Choix des centres provisoires 

<img src="img/kmeans1.png" width="80%" style="display: block; margin: auto;" />


---

## Calcul des distances aux centres provisoires 

<img src="img/kmeans2.png" width="80%" style="display: block; margin: auto;" />

---

## Affectation à un cluster

<img src="img/kmeans3.png" width="80%" style="display: block; margin: auto;" />

---

## Calcul des nouveaux centres de classes

## Etape j :

- construction des centres de gravité des k clusters construits à l’étape $(j-1)$

- $k$ nouveaux clusters créés à partir des nouveaux centres suivant la même règle qu’à l’étape $0$

- obtention de la partition $P_j$

<img src="img/kmeans4.png" width="80%" style="display: block; margin: auto;" />

---

## Fin : 

- l’algorithme converge vers une partition stable

## Arrêt : 

- lorsque la partition reste la même, ou lorsque la variance intra-cluster ne décroit plus, ou lorsque le nombre maximal d’itérations est atteint.

<img src="img/kmeans5.png" width="80%" style="display: block; margin: auto;" />

---

## Un premier k-means en 5 groupes


```r
iris.scale.kmeans5 <- kmeans(mes.iris.scaled, center=5)
iris.scale.kmeans5
```

```
K-means clustering with 5 clusters of sizes 28, 22, 32, 40, 28

Cluster means:
  Sepal.Length Sepal.Width Petal.Length Petal.Width
1   -0.6004762  0.61052381   -2.2580000  -0.9171905
2   -1.1387879  0.06539394   -2.3443636  -0.9993333
3    1.0691667  0.04266667    2.0888750   0.9319167
4    0.4091667 -0.20233333    1.0570000   0.4256667
5   -0.3111905 -0.42161905    0.2027143   0.0292381

Clustering vector:
  [1] 1 2 2 2 1 1 2 1 2 2 1 2 2 2 1 1 1 1 1 1 1 1 2 1 2 2 1 1 1 2 2 1 1 1 2 2 1 1 2 1 1 2 2 1 1 2 1 2 1 2 4 4 4 5 4 5 4 5 4 5 5 5 5 4 5 4 5 5 4 5 4 5 4 4 4 4 4 4 4 5 5 5 5 4 5 4 4 4 5 5 5 4 5 5 5 5 5 4 5 5 3 4 3 3 3 3 5 3 3 3 4 4 3 4 4 3 3 3 3 4 3 4 3 4 3 3 4 4 3 3 3 3 3 4 4 3 3 3 4 3 3 3 4 3 3 3 4
[148] 4 3 4

Within cluster sum of squares by cluster:
[1]  4.630714  3.114091 18.703437 13.624750  9.749286
 (between_SS / total_SS =  92.7 %)

Available components:

[1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss" "betweenss"    "size"         "iter"         "ifault"      
```

---


```r
iris.scale.kmeans5$cluster
```

```
  [1] 1 2 2 2 1 1 2 1 2 2 1 2 2 2 1 1 1 1 1 1 1 1 2 1 2 2 1 1 1 2 2 1 1 1 2 2 1 1 2 1 1 2 2 1 1 2 1 2 1 2 4 4 4 5 4 5 4 5 4 5 5 5 5 4 5 4 5 5 4 5 4 5 4 4 4 4 4 4 4 5 5 5 5 4 5 4 4 4 5 5 5 4 5 5 5 5 5 4 5 5 3 4 3 3 3 3 5 3 3 3 4 4 3 4 4 3 3 3 3 4 3 4 3 4 3 3 4 4 3 3 3 3 3 4 4 3 3 3 4 3 3 3 4 3 3 3 4
[148] 4 3 4
```

```r
table(iris.scale.kmeans5$cluster)
```

```

 1  2  3  4  5 
28 22 32 40 28 
```

---

## Visualisation des clusters


```r
plot(iris.scaled.acp, col.ind = iris.scale.kmeans5$cluster, choix = "ind", cex = 0.5)
```

<img src="figures/irisDeFisher_cluster_viz-1.png" style="display: block; margin: auto;" />

---

## Combien de clusters ?

Quand une partition est-elle bonne ?
  
- si les individus d’un même cluster sont proches

    - homogénéité maximale à l’intérieur de chaque cluster

- si les individus de 2 clusters différents sont éloignés

    - hétérogénéité maximale entre chaque cluster

---

## Classification hiérarchique

La coupure de l’arbre à un niveau donné construit une partition. la coupure doit se faire :

- après les agrégations correspondant à des valeurs peu élevées de l’indice

- avant les agrégations correspondant à des niveaux élevés de l’indice, qui dissocient les groupes bien distincts dans la population.

#


```r
plot(iris.scale.hclust.ward, hang=-1, cex=0.5)
```

<img src="figures/irisDeFisher_plot_iris_ward-1.png" width="95%" style="display: block; margin: auto;" />

---

## K-means

```r
I.intra = numeric(length=10)
I.intra[1] = kmeans(mes.iris.scaled, centers=2)$totss
for (i in 2:10) {
  kmi <- kmeans(mes.iris.scaled, centers=i)
  I.intra[i] <- kmi$tot.withinss
}
```

# 


```r
plot(1:10, I.intra, type="l")
```

<img src="figures/irisDeFisher_unnamed-chunk-13-1.png" style="display: block; margin: auto;" />

#


```r
iris.scale.kmeans3 <- kmeans(mes.iris.scaled, center=3)
plot(iris.scaled.acp, col.ind=iris.scale.kmeans3$cluster, choix="ind")
```

<img src="figures/irisDeFisher_unnamed-chunk-14-1.png" style="display: block; margin: auto;" />

# Heatmap


```r
heatmap(mes.iris.scaled, margins = c(7,4), cexCol = 1.4, cexRow = 0.5)
```

<img src="figures/irisDeFisher_headmapt-1.png" width="65%" style="display: block; margin: auto;" />

---




```r
my_group <- as.numeric(as.factor(substr(variete, 1 , 2)))
my_col <- brewer.pal(3, "Set1")[my_group]
heatmap(mes.iris.scaled, RowSideColors = my_col, 
        margins = c(7,4), cexCol = 1.4, cexRow = 0.5)
```

<img src="figures/irisDeFisher_heatmap_rowsidecol-1.png" width="65%" style="display: block; margin: auto;" />

# Comparaison de clustering: Rand Index

Mesure de similarité entre deux clustering

à partir du nombre de fois que les classifications sont d'accord

$$R=\frac{m+s}{t}$$

- m=nombre de paires dans la même classe dans les deux classifications
- s=nombre de paires séparées dans les deux classifications
- t=nombre de paires totales

# Comparaison de clustering: Adjusted Rand Index

$$ ARI=\frac{RI-Expected RI}{Max RI -Expected RI}$$

- ARI=RI normalisé
- Prend en compte la taille des classes
- ARI=1 pour classification identique
- ARI $\simeq$ 0 pour classification aléatoire (peut être <0)
- Adapté pour nombre de classe différent entre les deux classifications
et taille de classe différente

# Comparaison des résultats des deux classifications

- par une table de confusion


```r
cluster.kmeans3 <- iris.scale.kmeans3$cluster
cluster.hclust5 <- cutree(iris.scale.hclust.ward, k=5)
table(cluster.hclust5, cluster.kmeans3)
```

```
               cluster.kmeans3
cluster.hclust5  1  2  3
              1  0 50  0
              2  2  0 36
              3  0  0 26
              4 24  0  0
              5 12  0  0
```

---

- par une visualisation


```r
par(mfrow=c(1,2))
plot(iris.scaled.acp, col.ind=cluster.kmeans3, choix="ind", title="kmeans en 3 groupes", cex=0.6)
plot(iris.scaled.acp, col.ind=cluster.hclust5, choix="ind", title="hclust en 5 groupes", cex=0.6)
```

<img src="figures/irisDeFisher_unnamed-chunk-17-1.png" width="95%" style="display: block; margin: auto;" />

```r
par(mfrow=c(1,1))
```


# Comparaison avec la réalité

## La réalité


```r
variete <- iris[,5]
table(variete)
```

```
variete
    setosa versicolor  virginica 
        50         50         50 
```

#


```r
plot(iris.scaled.acp, col.ind=variete, choix="ind", cex=0.8)
```

<img src="figures/irisDeFisher_unnamed-chunk-19-1.png" width="65%" style="display: block; margin: auto;" />

---

# Comparer k-means avec la réalité


```r
conf.kmeans <- table(variete, cluster.kmeans3)
kable(conf.kmeans, caption = "Confusion table: 3-clusters k-means versus actual class")
```

<table>
<caption>Confusion table: 3-clusters k-means versus actual class</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
   <th style="text-align:right;"> 3 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> setosa </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> versicolor </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> virginica </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 14 </td>
  </tr>
</tbody>
</table>

---

## Setosa vs others

### Visualisation


```r
variete2 <- rep("notSetosa", 150)
variete2[variete=="setosa"] <- "setosa"
variete2 = factor(variete2)
table(variete2)
```

```
variete2
notSetosa    setosa 
      100        50 
```

---


```r
par(mfrow=c(1,2))
plot(iris.scaled.acp, col.ind=variete2, title="Actual species", cex=0.6)
cluster.kmeans2 <- kmeans(mes.iris.scaled, center=2)$cluster
plot(iris.scaled.acp, col.ind=cluster.kmeans2, title="2-group k-means", cex=0.6)
```

<img src="figures/irisDeFisher_unnamed-chunk-21-1.png" width="95%" style="display: block; margin: auto;" />

```r
par(mfrow=c(1,1))
```


---

### Table de confusion et calcul de performances


```r
conf.kmeans <- table(variete2, cluster.kmeans2)
kable(conf.kmeans)
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> notSetosa </td>
   <td style="text-align:right;"> 97 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> setosa </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 50 </td>
  </tr>
</tbody>
</table>

---

  - table de confusion, taux de bien prédits, spécificité, sensibilité, ...

```r
TP <- conf.kmeans[1,1]
FP <- conf.kmeans[1,2]
FN <- conf.kmeans[2,1]
TN <- conf.kmeans[2,2]
P <- TP + FN          # nb positif dans la réalité
N <- TN + FP          # nb négatif dans la réalité
FPrate <- FP / N      # = false alarm rate
Spe <- TN / N      # = spécificité 
Sens <- recall <- TPrate <- TP / P      # = hit rate ou recall ou sensibilité ou coverage
PPV <- precision <- TP / (TP + FP)
accuracy <- (TP + TN) / (P + N)
F.measure <- 2 / (1/precision + 1/recall)
performance <- c(FPrate, TPrate, precision, recall, accuracy, F.measure, Spe, PPV)
names(performance) <- c("FPrate", "TPrate", "precision", "recall", "accuracy", "F.measure", "Spe", "PPV")
```

---


```r
kable(performance, digits=3)
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> x </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> FPrate </td>
   <td style="text-align:right;"> 0.057 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TPrate </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> precision </td>
   <td style="text-align:right;"> 0.970 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> recall </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> accuracy </td>
   <td style="text-align:right;"> 0.980 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> F.measure </td>
   <td style="text-align:right;"> 0.985 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Spe </td>
   <td style="text-align:right;"> 0.943 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PPV </td>
   <td style="text-align:right;"> 0.970 </td>
  </tr>
</tbody>
</table>

---

  - rand index et adjusted rand index

```r
clues::adjustedRand(as.numeric(variete2), cluster.kmeans2)
```

```
     Rand        HA        MA        FM   Jaccard 
0.9605369 0.9204051 0.9208432 0.9639434 0.9302767 
```

---

## Versicolor vs !Versicolor

### Visualisation


```r
variete2 <- rep("notVersicolor", 150)
variete2[variete=="versicolor"] <- "versicolor"
variete2 = factor(variete2)
table(variete2)
```

```
variete2
notVersicolor    versicolor 
          100            50 
```

---



```r
par(mfrow=c(1,2))
plot(iris.scaled.acp, col.ind = variete2, cex  =0.7)
cluster.kmeans2 <- kmeans(mes.iris.scaled, center=2)$cluster
plot(iris.scaled.acp, col.ind = cluster.kmeans2, cex = 0.7)
```

<img src="figures/irisDeFisher_unnamed-chunk-27-1.png" width="90%" style="display: block; margin: auto;" />

```r
par(mfrow=c(1,1))
```

---

## Table de confusion et calcul de performances


```r
conf.kmeans <- table(variete2, cluster.kmeans2)
kable(conf.kmeans)
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> 1 </th>
   <th style="text-align:right;"> 2 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> notVersicolor </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:right;"> 50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> versicolor </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 47 </td>
  </tr>
</tbody>
</table>

```r
TP <- conf.kmeans[1,1]
FP <- conf.kmeans[1,2]
FN <- conf.kmeans[2,1]
TN <- conf.kmeans[2,2]
P <- TP + FN          # nb positif dans la réalité
N <- TN + FP          # nb négatif dans la réalité
FPrate <- FP / N      # = false alarm rate
Spe <- TN / N      # = spécificité 
Sens <- recall <- TPrate <- TP / P      # = hit rate ou recall ou sensibilité ou coverage
PPV <- precision <- TP / (TP + FP)
accuracy <- (TP + TN) / (P + N)
F.measure <- 2 / (1/precision + 1/recall)
performance <- c(FPrate, TPrate, precision, recall, accuracy, F.measure, Spe, PPV)
names(performance) <- c("FPrate", "TPrate", "precision", "recall", "accuracy", "F.measure", "Spe", "PPV")
```

---


```r
kable(performance, digits=3)
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> x </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> FPrate </td>
   <td style="text-align:right;"> 0.515 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TPrate </td>
   <td style="text-align:right;"> 0.943 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> precision </td>
   <td style="text-align:right;"> 0.500 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> recall </td>
   <td style="text-align:right;"> 0.943 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> accuracy </td>
   <td style="text-align:right;"> 0.647 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> F.measure </td>
   <td style="text-align:right;"> 0.654 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Spe </td>
   <td style="text-align:right;"> 0.485 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PPV </td>
   <td style="text-align:right;"> 0.500 </td>
  </tr>
</tbody>
</table>

```r
clues::adjustedRand(as.numeric(variete2), cluster.kmeans2)
```

```
      Rand         HA         MA         FM    Jaccard 
0.53995526 0.07211421 0.07722223 0.57895580 0.40737752 
```

# Pros et cons des différents algorithmes

| Algorithme | Pros | Cons |
|-------------|------------------------------|------------------------|
| **Hiérarchique** | L'arbre reflète la nature imbriquée de tous les sous-clusters | Complexité quadratique (mémoire et temps de calcul) $\rightarrow$ quadruple chaque fois qu'on double le nombre d'individus  |
| | Permet une visualisation couplée dendrogramme (groupes) + heatmap (profils individuels) | |
| | Choix a posteriori du nombre de clusters (élagage) | |
|  |  |  |
|  |  |  |
| **K-means** | Rapide (linéaire en temps), peut traiter des jeux de données énormes (centaines de milliers de pics ChIP-seq) | Positions initiales des centres est aléatoire $\rightarrow$ résultats changent d'une exécution à l'autre |
| | | Distance euclidienne (pas appropriée pour transcriptome par exemple) |


#

Contact: <anne.badel@univ-paris-diderot.fr>
