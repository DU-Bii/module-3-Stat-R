---
title: "Module 3 - Méthodes d'apprentissage avec R - Séance 6"
author: "Frédéric Guyon"
date: '2019-02-26'
output:
  slidy_presentation:
    fig_caption: yes
    fig_height: 6
    fig_width: 7
    highlight: tango
    incremental: no
    keep_md: yes
    self_contained: yes
    slide_level: 2
    smaller: yes
    smart: no
    theme: cerulean
    toc: yes
    widescreen: yes
  html_document:
    fig_caption: yes
    highlight: zenburn
    self_contained: no
    theme: cerulean
    toc: yes
    toc_depth: 3
    toc_float: yes
  ioslides_presentation:
    colortheme: dolphin
    fig_caption: yes
    fig_height: 6
    fig_width: 7
    fonttheme: structurebold
    highlight: tango
    self_contained: no
    slide_level: 2
    smaller: yes
    toc: yes
    widescreen: yes
  pdf_document:
    fig_caption: yes
    highlight: zenburn
    toc: yes
    toc_depth: 3
  revealjs::revealjs_presentation:
    css: ../slides.css
    self_contained: yes
    theme: night
    transition: none
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



## Deux classes a priori connues
<div class="figure" style="text-align: center">
<img src="img/SepLin1.pdf" alt="2 groupes" width="50%" />
<p class="caption">2 groupes</p>
</div>

## Séparation linéaire
<div class="figure" style="text-align: center">
<img src="img/SepLin2.pdf" alt="2 groupes" width="50%" />
<p class="caption">2 groupes</p>
</div>

## Modèle d'apprentissage
<div class="figure" style="text-align: center">
<img src="img/model.pdf" alt="black-box model: SVM ou NN" width="50%" />
<p class="caption">black-box model: SVM ou NN</p>
</div>

## Modèle d'apprentissage

- les vecteurs d'apprentissage $x_i$: 
      représentation de nos objets à classer

- classe ou valeur attendue pour chaque objet: $y_i$

- modèle = paramètres à identifier

  	 - poids des réseaux de neurones
	 - coefficients des hyperplan séparateurs pour les SVM
	 - obtenus par minimisation d'une fonction d'écart (loss function)
  
- fonction de décision: classe=F(x,par)

## Historique rapide

- **1957** : Perceptron (Rosenblatt)
- **1980** : Artificial Neural Network (K. Fukushima)
- **1989** : Algorithme de Back-propagation du gradient
appliqué à NN à plusieurs couches (ZIP codes)
- Problème : apprentissage difficile et long (vanishing gradient)
- **1990-2000** : Problèmes de convergence, lenteur ont favorisés
l'émergence des SVM
- **2007** : apparition du terme Deep Learning (Hinton)
- Actuellement, méthodes les plus performantes sur benchmarks
d'évaluation : TIMIT (Reconnaissance de la parole), MNIST
(images de chiffres manuscrits)


# Support Vecteur Machine

## Séparation linéaire: deux classes

<div class="figure" style="text-align: center">
<img src="img/SepLin3.pdf" alt="2 groupes, pas de s&lt;U+00E9&gt;paration unique" width="50%" />
<p class="caption">2 groupes, pas de s<U+00E9>paration unique</p>
</div>
## Marge entre classes séparables

 - Marge: distance au point le plus proche
 - Recherche du plan qui maximise cette marge
 - Marge large = plus grande stabilité des prédictions
 - SVM = Séparateur à Vaste Marge
 
<div class="figure" style="text-align: center">
<img src="img/SVMfigure5.pdf" alt="La Vaste Marge" width="50%" />
<p class="caption">La Vaste Marge</p>
</div>
## Approche SVM dans le cas général

- Plan séparateur trouvé par minimisation des erreurs de classification
- On n'interdit pas les erreurs de classement, mais on les pénalise
- Paramètre C ou cost = constante de pénalisation pour contrôler les erreurs de classement

## Approche SVM dans le cas général

- Souvent problèmes de classification plus faciles
dans un espace plus grand (espace de redescription)
- Plus de degrés de libertés pour trouver un modèle
- Séparation linéaire possible dans l'espace de redescription
- Cet espace est décrit par une fonction noyau

<div class="figure" style="text-align: center">
<img src="img/Phi.pdf" alt="Espace des features" width="40%" />
<p class="caption">Espace des features</p>
</div>
## Exemples 
<div class="figure" style="text-align: center">
<img src="img/svm1.pdf" alt="S&lt;U+00E9&gt;paration lin&lt;U+00E9&gt;aire" width="35%" />
<p class="caption">S<U+00E9>paration lin<U+00E9>aire</p>
</div>
\tiny The Elements of Statistical Learning: Data Mining, Inference, and Prediction.Second Edition.Trevor Hastie, Robert Tibshirani, Jerome Friedman.

## Exemples

<div class="figure" style="text-align: center">
<img src="img/svm2.pdf" alt="S&lt;U+00E9&gt;paration polyn&lt;U+00F4&gt;miale et gaussienne" width="35%" />
<p class="caption">S<U+00E9>paration polyn<U+00F4>miale et gaussienne</p>
</div>
\tiny The Elements of Statistical Learning: Data Mining, Inference, and Prediction.Second Edition.Trevor Hastie, Robert Tibshirani, Jerome Friedman.

## Exemple 1: iris avec Support Vector Machine


```r
library(e1071)
model=svm(Species~., data=iris)
ypred=predict(model,iris[,1:4])
table(ypred, iris[,5])
```
## Exemple 2: classification non séparable


```r
Data=read.table("data/cercles.dms")
X=as.matrix(Data[,1:2])
y=Data[,3]
plot(X,col=y)
```

<img src="figures/07_tests_multiplesunnamed-chunk-7-1.png" width="50%" style="display: block; margin: auto;" />

## Exemple 2: classification non séparable

```r
result=svm(X,y, type="C-classification",kernel="radial", cost=1)
ypred=predict(result,X)
table(y, ypred)
plot(X, col=y)
points(X,col=ypred, pch="+")
```

<img src="figures/07_tests_multiplesunnamed-chunk-8-1.png" width="50%" style="display: block; margin: auto;" />

## SVM: les caractéristiques générales

- Un choix de noyau = forme des frontières
- Le paramètre $C$ règle le nombre d'erreurs d'apprentissage
- Plus $C$ est grand:

       - moins les frontières sont régulières (smooth)
       - plus le nombre d'erreurs d'apprentissage est faible (tendance)
       - le nombre d'erreurs de test peut être plus faible

- $C \longrightarrow \infty$ : aucun mauvais classement mais sur-apprentissage
- En général l'algorithme renvoie les "support vectors"
- support vecteurs: données (points) utilisées pour la séparation

## Réseaux de neurones : le neurone

<div class="figure" style="text-align: center">
<img src="img/neurone.pdf" alt="One single neurone" width="25%" />
<p class="caption">One single neurone</p>
</div>
$y= \sigma\left(w_0 +  w_1 x_1 + w_2 x_2 + \dots \right)$

<div class="figure" style="text-align: center">
<img src="img/sigmoid.pdf" alt="A sigmoid function" width="25%" />
<p class="caption">A sigmoid function</p>
</div>
## Réseaux de neurones : le neurone
<div class="figure" style="text-align: center">
<img src="img/NN2.pdf" alt="A neural network" width="50%" />
<p class="caption">A neural network</p>
</div>

- couche d'entrée (input layer)
- couches cachées (hidden layers)
- couche de sortie (output layer)
- package nnet

  	  - une seule couche cachée
	  - une couche de sortie avec fonction d'activation linéaire ou softmax

## Fonction nnet: 1 couche cachée
### Exemple iris avec réseau de neurones

```r
library(nnet)
X=as.matrix(iris[,1:4])
y=as.integer(iris[,5])
# une première façon
Y=class.ind(y)
model=nnet(X,Y, size=2, softmax=TRUE)
ypred=max.col(predict(model,X))
table(y, ypred)
```
## Ou bien

```r
model=nnet(Species~.,data=iris, size=2)
ypred=max.col(predict(model,X))
table(y, ypred)
```

## Plus sérieusement, avec évaluation

```r
ind_app=sample(1:nrow(iris),50)
Xapp=iris[ind_app,1:4]
yapp=iris[ind_app,5]
Xtest=iris[-ind_app,1:4]
ytest=iris[-ind_app,5]

Yapp=class.ind(yapp)
model=nnet(Xapp,Yapp, size=2, softmax=TRUE)
```

## Evaluation des erreurs

```r
# erreur d'apprentissage
ypred=max.col(predict(model,Xapp))
table(yapp, ypred)

# erreur de test
ypred=max.col(predict(model,Xtest))
table(ytest, ypred)
```
