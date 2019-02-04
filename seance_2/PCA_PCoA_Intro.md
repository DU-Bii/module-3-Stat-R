---
title: "Module 3 - Analyse statistique avec R - Séance 2 : PCA et PCoA"
author: "Magali Berland"
date: '2019-02-04'
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



## Analyse en Composantes principales

Objectif : décrire sans a priori un tableau de données constitué exclusivement de variables quantitatives.

<img src="figures/PCA_PCoA_intro_unnamed-chunk-2-1.png" width="400px" style="display: block; margin: auto;" />

## Analyse en Composantes principales

<img src="figures/PCA_PCoA_intro_unnamed-chunk-3-1.png" width="600px" style="display: block; margin: auto;" />

## Analyse en Composantes principales

L’ACP permet de déterminer :

- les espaces de dimension inférieure à l’espace initial 
- sur lesquels la projection du nuage de points initial est la moins déformée possible, 
- celle qui conserve le plus d’information c’est-à-dire de variabilité.


## Analyse en Composantes principales

Le principe de l'ACP : 

- Trouver un axe ( = la première composante principale), 
- Issu d'une combinaison linéaire des variables initiales, 
- Tel que la variance du nuage autour de cet axe soit maximale. 
- Réitérer ce processus dans des directions orthogonales pour déterminer les composantes principales suivantes.

## Analyse en Composantes principales

- l'ACP permet de conserver au mieux la structure de corrélation entre les variables initiales.
- Plusieurs variables corrélées : 

  - Première composante principale = combinaison de ces variables 
  - Suffit à représenter les individus avec une perte d’information minimale 
  - Tous les points sont relativement proches de ce nouvel axe.

## Notions de base

<img src="figures/PCA_PCoA_intro_unnamed-chunk-4-1.png" width="500px" style="display: block; margin: auto;" />

- L’ACP suppose que les directions avec les plus grandes variances sont les plus “importantes”
- La quantité de variance expliquée par chaque composante principale est mesurée par ce que l’on appelle valeur propre.
- L’ACP est particulièrement utile lorsque les variables sont fortement corrélées (réduction de dimension)


## Standardisation des données

- Pour faire une ACP, les variables sont souvent normalisées 
- Particulièrement recommandé lorsque les variables sont mesurées dans différentes unités 
- L’objectif est de rendre les variables comparables. 

## Standardisation des données

- Pour faire une ACP, les variables sont souvent normalisées 
- Particulièrement recommandé lorsque les variables sont mesurées dans différentes unités 
- L’objectif est de rendre les variables comparables. 
- Centrer et réduire = soustraire à chaque valeur la moyenne de la variable et diviser par l’écart-type : #insert formula
- L’ACP appliquée à ces données transformées est appelée ACP normée.
- La fonction scale() peut être utilisée pour normaliser les données.
