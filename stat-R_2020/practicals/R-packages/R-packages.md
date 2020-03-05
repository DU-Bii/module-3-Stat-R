---
title: "R packages"
author: "Claire Vandiedonck"
date: "2020-03-05"
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

##	Exercice 1

Dans cet exercice, vous allez utiliser le plus ancien package publié sur le CRAN : `vioplot` de Daniel Adler en 2004 et maintenu par Thomas Kelly.

-	Installer le package `vioplot` depuis le repository CRAN de votre choix
-	Charger le package `vioplot`
-	Générer 3 vecteurs de 100 données tirées aléatoirement seulon une loi normale de moyenne 0, 3 et 5, et de variance respective, 1, 2, 3
-	Tracez un boxplot sur ces données
-	Faites un violin plot sur ces données

### Fonctions suggérées

- `getCRANmirrors()`
- `chooseCRANmirror()`
- ` install.packages()`
- ` library()`
- ` rnorm()`
- ` boxplot()`
- `vioplot()`


## Exercice 2

L’objectif de ce petit exercice est d’utiliser le package `GenomicRanges` de Bioconductor afin de détecter des chevauchements entre une liste de SNPs et des sites d’H3K27ac (enhancers actifs).

-	Installer Bioconductor si ce n’est déjà fait
-	Installer le package `GenomicRanges` de Bioconductor
-	Recherchez la documentation sur ce package
-	Importez les données de SNPs et de sites d’acétylation (fichiers sur moodle)
-	Donnez un nom de colonnes au dataframe des sites d’acétylation (`chrom`, `start`, `end`, `id`
-	Générez des objets de type `GRanges` pour chacun des deux dataframes en ne gardant que les colonnes 2 à 5 pour les SNPs.
-	Identifiez les chevauchements entre les deux datasets.

### Fonctions et outils à utiliser

- `install.packages()`
- `devtools`
- `library()`
- `browseVignettes()`
- `read.table()`

et je vous laisse trouver les deux fonctions pour les deux derniers points dans la documentation du package !

