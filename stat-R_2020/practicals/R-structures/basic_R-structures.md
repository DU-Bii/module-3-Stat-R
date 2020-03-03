---
title: "Basic data structures in R -- matrices, data frames and lists"
author: "Claire Vandiedonck & Jacques van Helden"
date: "2020-03-04"
output:
  html_document:
    self_contained: no
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
    self_contained: true
    css: ../../slides.css
  slidy_presentation:
    font_adjustment: 0   ## set to negative/positive values for smaller/bigger fonts
    duration: 45
    self_contained: no
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
    css: slides.css
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

- Créez la matrice identité `matIdentite` de dimension 10 lignes x 10 colonnes contenant uniquement le chiffre 0. Puis remplacez uniquement les valeurs de la diagonale par le chiffre $1$.

- Créez une matrice `matAleatoire` contenant des valeurs tirées aléatoirement de dimension 10 lignes x 10 colonnes, dont les éléments suivent une loi normale de moyenne 0 et de variance $5$.

### Astuce

- Fonctions: `matrix()`, `diag()`, `rnorm()`

## Exercice 2

2.1. Créez deux vecteurs aléatoires nommés `x1` et `x2`, contenant chacun 100 valeurs aléatoires compatibles 1) avec une loi normale centrée réduite pour x1 et 2) avec une loi uniforme définie sur l’intervalle [0 ; 10] pour x2.

2.2. Créez une matrice `m1` qui contient les 10 premières valeurs de x1 (colonne 1 de m1) et les 10 dernières valeurs de x2 (colonne 2 de m1).

2.3. Créez une matrice `m2` qui contient les 16ème, 51ème, 79ème, 31ème et 27ème valeurs de x1 (colonne 1 de m2) et les 30ème, 70ème, 12ème, 49ème et 45ème de x2 (colonne 2 de m2).

2.4. Concaténez à la suite (l’une en dessous-de l’autre) les matrices m1 et m2, afin d’obtenir une nouvelle matrice m3. Quelles sont les dimensions (nombre de lignes et de colonnes) de m3?

**Fonctions à utiliser :** `rnorm()`, `runif()`, `cbind()`, `rbind()`, `dim()`, ...


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

**Fonctions à utiliser dans l’odre :** `read.table()`, `str()`, `is.na()`, `paste()`, `gsub()`, `order()`, `as.integer()`, `sum()`, `subset()`, `write.table()`

## Exercice 5

Sauvegardez dans une liste `session2_list` tous les objets créés pendant les exercices 1 à 4 en les mettant dans des sous-listes correspondant à chaque exercice que vous nommerez `exo1`, `exo2`, `exo3` et `exo4`.

**Fonctions à utiliser :** `list()`, `names()`



## Á la maison


- Revoyez toutes les fonctions vues en cours attentivement des sessions 1 et 2.

- Les corrections des exercices de la session 2 seront disponibles le vendredi soir.

- Vous devez terminer l’ensemble des exercices avant la prochaine session, lire et comprendre les corrections, puis refaire par vous-même les exercices sans les corrections.

- Une évaluation QCM aura lieu à la prochaine séance


