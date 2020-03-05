---
title: "Descriptive statistics"
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

## Exercice 1 : personnalisation d’un graphique

1.	Représentez trois points en positions (x, y) : (1, 2), (2, 2) et (3, 3). 

    - Ajoutez le titre "Mon graphique" avec l’argument `main`
    - Sauvegardez ce graphique en format .jpeg sous le nom `initial_graph.jpeg` avec la fonction jpeg() suivie de dev.off()

2. Recommencez ce graphique en personnalisant l’affichage avec les options ou fonctions suivantes pas à pas (faites un nouveau graphique à chaque étape en ajoutant le nouveau paramètre) :

- `xlim` et `ylim` : délimitez l’affichage des échelles des deux axes entre 0 et 4
- `cex` : doublez la taille des points
- `pch` : donnez d’abord une forme de cercle plein à chaque point ;

Recommencez ensuite en spécifiant une forme différente pour chaque point :

- le 1er sous forme d’une croix (comme un +)
- le 2ème sous forme d’un triangle pointé vers le bas vide
- le 3ème sous forme d’un losange plein
- palette() : trouvez les couleurs de votre session et identifiez l’indice de la couleur grise
- `col` : mettez tous les points en gris 
puis donnez une couleur différente à chaque point :

    - rouge pour le 1er
    - bleu pour le 2nd 
    - contour en magenta et fond en cyan pour le 3ème (avec l’option `bg` en plus)

- `lwd` : doublez la largeur des traits tracés (ici des points)
- `bty` : retirez la cadre entourant le graphique pour ne conserver que les axes
- `xlab` et `ylab` = nommez les axes `Axe des  abscisses` et `Axe Y`.

3.	Ajoutez un 4ème point sous forme d’un cercle plein gris aux coordonnées (1.5, 3) avec la fonction points()

4.	Ajoutez une ligne pointillée de couleur verte en position horizontale à l’ordonnée 1 avec la fonction abline() et en particulier l’option `lty`

5.	Ajoutez une légende avec la fonction `legend()à dans le coin en haut à droite et aidez-vous des arguments :
- `col`, `pt.bg`,  `pt.lwd` et `pt.cex`: pour respecter les couleurs, formes des points que vous mettrez à la taille 1.5 
- `legend` : pour nommer vos points `A`, `B`, `C` et `D`
- `title` : pour donner un nom `Mes 4 points` à la légende 
- `horiz` : pour positionner les points côte à côte plutôt que les uns en dessous des autres
6.	Donnez le titre `Mon graphique personnalisé` à votre figure
7.	Sauvegardez-la en format pdf avec le nom "cutom_graph.pdf"



###	Fonctions à utiliser

- `jpeg()`
- `pdf()`
- `dev.off()`
- `plot()`
- `palette()`
- `grep()`
- `points()`
- `abline()`
- `legend()`
- `title()`

## Exercice 2: représentations graphiques de données qualitatives

- Importez dans R le fichier [`motorisation.txt`](data/motorisation.txt).
- Générez un camembert de la répartition des différentes motorisations et choisissez vous-mêmes des couleurs.
- Générez également un diagramme en bâtons avec les proportions (fréquences relatives) des différentes motorisations colorées comme dans le camembert.
- Disposez les deux graphes côte à côte sur un même graphique.

### Fonctions à utiliser

- `read.table()`
- `table()`
- `pie()`
- `barplot()`
- `par()`avec l’agument `mfrow`

##	Exercice 3 représentation graphique de la distribution d’une variable quantitative continue

- Tirez aléatoirement un ensemble de 100 nombres compatibles avec une distribution normale de moyenne 10 et d’écart type 5. 
- Sauvegardez-les dans un objet R.
- Tracez la représentation histogramme des valeurs obtenues.
- Changez le nombre d’intervalles de l’histogramme : 5, 50 et 100. 
- Tracez également une boite à moustache horizontale de ces data.
- Affichez les 3 histogrammes et le boxplot les uns en dessous des autres dans une même fenêtre graphique.

### Fonctions à utiliser

- `rnorm()`
- `hist()` avec l’argument `breaks`
- `boxplot`
- `par()` avec l’argument `mfrow`

##	Exercice 4: lois de probabilité

-	Si $X$ suit une loi normale de moyenne 10 et d’écart type 55, quelle est la probabilité $P(7 \le X \le 15)$ ?

-	Si $X$ suit une loi normale de moyenne $\mu=10$ et d’écart type $\sigma=55$, quelle est la valeur de $k$ telle que $P( X \ld k) = 0.67$ ?

-	Soit un test de Chi2 à 3 degrés de libertés avec une valeur de la statistique de `Chi2=16.26$. Quelle est la p-value de ce test ?

## Exercice 5: représentations graphiques de données quantitatives

- Récupérez le jeu de données airquality disponible sous R. 
- Créez les graphes de la figure ci-après avec ce jeu de données. 
 
 

```r
knitr::include_graphics(path = "img/airquality.png")
```

<div class="figure">
<img src="img/airquality.png" alt="Examples of graphical representations. " width="80%" />
<p class="caption">Examples of graphical representations. </p>
</div>

 
###	Fonctions à utiliser
- `data()`
- ` par()` avec les arguments `mfrow` et `mar``
- `plot()`
- `hist()`
- `lines()`
- `boxplot()`
- `abline()`
- `lm()`
- `title()`

##	Exercice 6 : analyse de données

Importez dans R le fichier [`TP_poisson.txt`](data/TP_poisson.txt)  R. Il s’agit d’un jeu de données de l’espèce de poisson "grand corégone" du lac Nathalie dans le territoire de la baie James (province du Québec) (d'après B. Scherrer). En 1977, Dumont a cherché les relations existantes entre le potentiel reproducteur (nombre d'œufs) de cette espèce de poisson (grand Corégone) et plusieurs caractères morphologiques. L'étude a été menée afin de déterminer une éventuelle relation entre le nombre d'œufs, révélant le potentiel reproducteur des poissons, et les variables morphologiques caractérisant ces poissons.


1.	Statistiques descriptives

    a.	Identifier les variables et le nombre d’observations de l’échantillon.

    **Fonctions à utiliser :**
    - `read.table()`
    - `head()`
    - `dim()`
    - `str()`
    - `names()`

b.	Calculer la moyenne, la variance et l’écart-type de chaque variable aléatoire.

    **Fonctions à utiliser**
    - `mean()`
    - `var()`
    - `sd()`
    - `apply()`
    - `summary()`

c.	Réaliser les représentations des distributions de chaque variable aléatoire.

    **Fonctions à utiliser**
    - `hist()`
    - `par(mfrow = c(-,-))`
    - `curve()`
    - `dnorm()
    
d.	Ces variables vous semblent-elles distribuées selon une loi Normale ? Pour le vérifier, superposez sur chaque histogramme les courbes de densité des lois normales correspondantes (les moyennes et les variances sont estimées à partir des données de l’échantillon). Vous pouvez tracer par superposition la loi normale de même moyenne et écart type sur chaque histogramme. Vous pouvez également tracer le qqplot pour comparer la distribution de chaque variable à celle d’une loi normale. Enfin, vous pouvez tester l’hypothèse nulle de la normalité par un test de Shapiro.

    **Fonctions à utiliser**
    - `curve()`
    - `dnorm()`
    - `qqplot()`
    - `qqline()`

2.	Comparaison des potentiels reproducteurs selon l’âge :
Existe-t-il une différence du nombre d’œufs produits entre les poissons jeunes (âge inférieur à 10 ans) et âgés (âge supérieur ou égal à 10)?
    a.	Créez une nouvelle variable qualitative pour identifier les deux groupes : les individus `jeunes` et les individus `âgés`

    **Fonction à utiliser**
    - `which()`
    
b.	Représentez la distribution de la variable `œufs` en fonction de la variable `âge`.

    **Fonctions à utiliser**
    - ` boxplot()`
    - `stripchart`

c.	Calculez les moyennes dans chaque groupe du nombre d’œufs

    **Fonctions à utiliser**
    - `apply()`
    - `mean()`

d.	Existe-t-il une différence entre ces moyennes ?

    **Fonctions à utiliser** 
    - `t.test()`
    - `wilcox.test()`
    
e.	Existe-t-il une relation linéaire entre le poids des gonades et le nombre d’oeufs produits ?

    **Fonctions à utiliser**
    - `plot()`
    - `cor()`
    - `lm()`
    - `or.test()`

    **Facultatif :** Vous pouvez ensuite tester l’effet d’autres variables sur la variable `oeufs`.
