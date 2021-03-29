# Statistics with R -- 2021 session

## Programme

- [Session 1. R base en explorant des données omiques](#session-1)

- [Session 2. Renforcement de R](#session-2)

- [Session 3. Statistiques pour les données à haut-débit / RStudio et rapport Rmarkdown](#session-3)

- [Session 4. Analyse en composantes principales / Exploration des données multidimensionelles](#session-4)

- [Session 5. Classification supervisée et apprentissage](#session-5)

- [Session 6. Classification non-supervisée / Analyse d'enrichissement](#session-6)



## Goals

The aim of this module is to provide you with the bases of R programming and to present you some statistical concepts for high-throuput data.

To follow this course, prior knowledge is expected on: 

- R environment, 
- getting help in R,
- types of variables (particularly on vectors).

[Link to the prerequisites](<https://du-bii.github.io/accueil/activites_preparatoires/>)


## Intervenants

1. Claire Vandiedonck (<https://orcid.org/0000-0002-6669-6923>)
2. Jacques van Helden (<https://orcid.org/0000-0002-8799-8584>)
3. Anne Badel (<https://orcid.org/0000-0002-2777-5979>)
4. Magali Berland (<https://orcid.org/0000-0002-6762-5350>)
5. Antoine Bridier-Nahmias (<https://orcid.org/0000-0002-0376-6840>)
6. Olivier Sand (<https://orcid.org/0000-0003-1465-1640>)
7. Bruno Toupance (<https://orcid.org/0000-0002-8244-1824>)
8. Clémence Réda(<https://clreda.github.io/>)
9. Yves Clément (<https://orcid.org/0000-0002-5932-9412>)
10. Olivier Taboureau (<https://orcid.org/0000-0001-7081-2491>)

## Course links

| Doc | Description |URL |
|---------|---------------------------|---------------------------------------|
| **Git pages** | **Web site of the course**  (to see the supports) | <https://du-bii.github.io/module-3-Stat-R/stat-R_2021/> | 
| Git repo | Repository enabling to download or clone the teaching material on your computer | <https://github.com/DU-Bii/module-3-Stat-R> |
| Serveur Jupyter Hub IFB | Python but also R! | <https://jupyterhub.cluster.france-bioinformatique.fr/> |
| RStudio at IFB cluster | link to RStudio on th IFB cluster | <https://rstudio.cluster.france-bioinformatique.fr/> |
| Slack | forum pour échanges et discussions | <https://dubii.slack.com> |

## Teaching material

<a name="session-1"></a>

### Session 1. R base en explorant des données omiques

- Date:  03/03/2021 de 9h30 à 12h30
- Instructeurs : Claire Vandiedonck & Anne Badel  
- Helpers : Antoine Bridier-Nahmias, Clémence Réda, Bruno Toupance, Jacques van Helden 

#### Objectifs

1. Vérification et consolidation des prerequis: session R, vecteurs, matrices.
2. Dataframes: création, extraction de données, manipulation.

#### Supports de cours

- Slides: [Slides for the whole session](slides/DUBii_R_Session1_2021.pdf) 

- Questions: [lien wooclap](<https://www.wooclap.com/AIFGCO>) et [proposition de solution](scripts/session1_live.R) 

- Tutorial: 

    - on **dataframes** ([notebook ipynb](tutorials/Rsession1_tuto_dataframes.ipynb) et [sa version exécutée en html](tutorials/Rsession1_tuto_dataframes_correction.html)) 
    - on **factors** ([notebook ipynb](tutorials/Rsession1_tuto_factors.ipynb) et [sa version exécutée en html](tutorials/Rsession1_tuto_factors.html))

- Practical: 

    - [Practical on dataframes applied to omics data](practicals/Rsession1_practicals_dataframes.ipynb) et [son corrigé en .ipynb](practicals/Rsession1_practicals_dataframes_correction.ipynb) ou [son corrigé en .html](practicals/Rsession1_practicals_dataframes_correction.html)
- Data: 

    - [Temperatures.txt](data/Temperatures.txt),[rawData](data/pavkovic2019_transcriptome_uuo_metadata.tsv
), 
    - [metadata](data/pavkovic2019_transcriptome_uuo_rawData.tsv)
    - Accès local (pour usagers du cluster IFB-core):  `shared/projects/dubii2021/trainers/module3/data/pavkovic/1.datainit`
 
<a name="session-2"></a>

### Session 2. Renforcement de R

- Date:  04/03/2021 de 13h30 à 16h30
- Instructeurs : Claire Vandiedonck & Magali Berland  
- Helpers : Antoine Bridier-Nahmias, Yves Clément, Bruno Toupance, Jacques van Helden 

#### Objectifs

1. Contrôles de flux: boucles versus vectorisation, excutions conditionnelles

2. Fonctions: implémentation

3. Paquets/librairies: installation et troubleshooting, chargement, utilisation

4. Figures à façon avec R base

5. Introduction au Tidyverse: ggplot2, dplyr, tidyr

#### Supports de cours

- Slides: 

    - [Slides for part 1 to 4](slides/DUBii_R_Session2_2021.pdf) 
    - [Introduction au tidyverse](slides/2021-03-04-Intro-tidyverse.pdf)

- Tutorial: 

    - on **functions** ([notebook ipynb](tutorials/Rsession2_tuto_functions.ipynb))
    - on **packages** ([notebook ipynb](tutorials/Rsession2_tuto_packages.ipynb))

- Practical: 

    - optional on **loops, conditions and functions** ([notebook ipynb](practicals/Rsession2_practical_loops_conditions_functions.ipynb) et [son corrigé](practicals/Rsession2_practical_loops_conditions_functions_correction.html))
    - on **figures** ([notebook ipynb](practicals/Rsession2_practicals_figures.ipynb) et [son corrigé](practicals/Rsession2_practicals_figures_correction.html))
    - TD introduction au **tidyverse** ([format html](practicals/2021-03-04-TD-Intro-tidyverse.html), [format ipynb](practicals/TD-tidyverse-dplyr-tidyr-sujet.ipynb)) et ses corrigés: [partie 1 sur ggplot au format ipynb](practicals/TD-tidyverse-ggplot-correction.ipynb) et [partie 2 & 3 pour dplyr et tidyr au format ipynb](practicals/TD-tidyverse-dplyr-tidyr-correction.ipynb)


<a name="session-3"></a>

### Session 3. Statistiques pour les données à haut-débit / RStudio et rapport Rmarkdown

- Date:  09/03/2021 de 14h30 à 17h30
- Instructeurs : Claire Vandiedonck & Antoine Bridier-Nahmias  
- Helpers : Anne Badel, Clémence Réda, Jacques van Helden, Olivier Sand

#### Objectifs

1. Statistiques pour les omiques:

- Rappels de statistiques de base: flutuation d'échantillonage, théorie des tests
- Problème de la dimensionalité: Estimation des paramètres et tests multiples

2. RStudio & Rapport Rmarkdown

#### Supports de cours

- Slides: [Slides for part 1](slides/DUBii_R_Session3_2021.pdf) 
- Practical:
    - links: [shiny app to simulate distributions](<http://shiny.calpoly.sh/Sampling_Distribution/>) - [dabestr](<https://github.com/ACCLAB/dabestr>)
    - live on **statistics** [notebook ipynb](practicals/Rsession3_practical_statomics.ipynb) et [son corrigé en html](practicals/Rsession3_practical_statomics_correction.html) ou [en ipynb](practicals/Rsession3_practical_statomics_correction.ipynb)
    - optional on **statistics** [[mean-comparison-test_random-numbers.html](practicals/mean-comparison-test_random-numbers/mean-comparison-test_random-numbers.html)] ou [mean-comparison-test_random-numbers.pdf](practicals/mean-comparison-test_random-numbers/mean-comparison-test_random-numbers.pdf)] ou [[mean-comparison-test_random-numbers.Rmd](https://raw.githubusercontent.com/DU-Bii/module-3-Stat-R/master/stat-R_2020/practicals/mean-comparison-test_random-numbers/mean-comparison-test_random-numbers.Rmd)]
    - live on **Rmd** [R markdown demo au format .Rmd](practicals/Rsession3_Rnotebook_demo.rmd) et le [rapport généré au format html](practicals/Rsession3_Rnotebook_demo.html)



<a name="session-4"></a>

### Session 4. Analyse en composantes principales et exploration des données multidimensionelles 

- Date:  11/03/2021 de 9h00 à 12h00

- Instructeurs : Magali Berland & Jacques van Helden
- Helpers : Anne Badel, Clémence Réda, Claire Vandiedonck, Olivier Taboureau

#### Objectifs

1. Analyse en composantes principales (**ACP**)

    - Comprendre le principe de base de l'analyse en composantes principales, ainsi que les objectifs de cette méthode.
  
    - Réaliser une ACP avec R, obtenir des visualisations graphiques pour aider à l'interprétation (cercle des corrélations, biplot, contribution des variables et des individus). 

2. Exploration de données multi-omiques multidimensionelles

    - Maîtriser les téléchargements et chargements de fichiers de données et métadonnées
    - Charger des fichiers de données
    - Rappel des concepts de base de corrélation entre deux variables
    - Extension à la corrélation entre $n$ variables
    - Applications à des jeux de données de multi-omiques

<!-- 2. Régression

    - Rappel des principes de la régression d'une variable en une autre
    - Extension à la régression multidimensionnelle
    - Application à des jeux de données multi-omiques
-->


#### Supports de cours


- Slides: [Cours sur l'ACP](slides/2021-03-11-ACP.html) visualisable [ici](https://htmlpreview.github.io/?https://github.com/DU-Bii/module-3-Stat-R/blob/master/stat-R_2021/slides/2021-03-11-ACP.html)

- Practicals:

    - [TD sur l'ACP](practicals/2021-03-11-TD-ACP.html) visualisable [ici](https://htmlpreview.github.io/?https://github.com/DU-Bii/module-3-Stat-R/blob/master/stat-R_2021/practicals/2021-03-11-TD-ACP.html) a réaliser sur ces données : [metadata](data/metadata.RDS) et [microbiota.abundance.log](data/microbiota.abundance.log.RDS)
    - [Correction du TD sur l'ACP](practicals/2021-03-11-TD-ACP-correction.html), visualisable [ici](https://htmlpreview.github.io/?https://github.com/DU-Bii/module-3-Stat-R/blob/master/stat-R_2021/practicals/2021-03-11-TD-ACP-correction.html)

    - **Tutoriel: exploration des données multi-omiques** [[html](tutorials/data-exploration_pavkovic_2019/tuto_data-exploration_pavkovic.html)] [[Rmd](https://raw.githubusercontent.com/DU-Bii/module-3-Stat-R/master/stat-R_2021/tutorials/data-exploration_pavkovic_2019/tuto_data-exploration_pavkovic.Rmd)]


- **Exercice : application de l'ACP aux données multi-omiques de Pavkovicz (2019)**

    1. Téléchargez le [Rmd source](https://raw.githubusercontent.com/DU-Bii/module-3-Stat-R/master/stat-R_2021/tutorials/data-exploration_pavkovic_2019/tuto_data-exploration_pavkovic.Rmd) du tutoriel "exploration des données multi-omiques"
    2. Téléversez-le dans un dossier de votre espace sur le cluster
    3. Dans l'en-tête de votre version du Rmd, changez la valeur du  `self_contained` en indiquant `yes`
    4. Lancez knitr pour générer le rapport en formats HTML et pdf pour vous assurez que l'original compile bien. 
    5. Réalisez l'exercice "PCA of Pavkovicz data"
    6. Déposez les résultats (Rmd et fichier html self-contained) dans le sous-dossier TP4 du dossier de dépôt convenu sur slack

<a name="session-5"></a>
<a name="session-6"></a>

### Sessions 5 et 6 (rassemblées en une journée)

- Date:  29/03/2021 de 10h00 à 13h00 et de 14h30 à 17h30
- Instructeurs : Anne Badel, Jacques van Helden, Olivier Sand  
- Helpers : Claire Vandiedonck, Yves Clément, Bruno Toupance, Olivier Taboureau

#### Objectifs

#### Supports pédagogiques


| Topics | Support | Formats |
|----------------------|-------------------------|-----------|
| **The TCGA BIC study case** | Intro | [[pdf](slides/DUBii_R_sessions5-6_intro_2021.pdf)] |
| **Data loading and exploration** | Tutorial (optional) | [[html](tutorials/machine-learning_TCGA-BIC/01_data-loading_TCGA-BIC.html)] [[Rmd](tutorials/machine-learning_TCGA-BIC/01_data-loading_TCGA-BIC.Rmd)] |
| **Principes du clustering** | Cours | [[html](slides/clustering/clustering_cours_2021-03-29.html)] [[Rmd](https://raw.githubusercontent.com/DU-Bii/module-3-Stat-R/master/stat-R_2021/slides/clustering/clustering_cours_2021-03-29.Rmd)] |
| | Tutorial + practical | [[html](tutorials/machine-learning_TCGA-BIC/02_clustering_TCGA-BIC_tuto-tp.html)]  [[Rmd](https://raw.githubusercontent.com/DU-Bii/module-3-Stat-R/master/stat-R_2021/tutorials/machine-learning_TCGA-BIC/02_clustering_TCGA-BIC_tuto-tp.Rmd)] |
| **Analyse d'enrichissement fonctionnel** | Cours | [[html](slides/cours_enrichment_2021.html)]|
| | Tutorial | [[html](tutorials/Rsession6_tuto_gProfiler.html)] [[Rmd](https://raw.githubusercontent.com/DU-Bii/module-3-Stat-R/master/stat-R_2021/tutorials/Rsession6_tuto_gProfiler.Rmd)] |
| | Practical | [[html](practicals/Rsession6_functional_enrichment.html)] [[Rmd](practicals/Rsession6_functional_enrichment.Rmd)]|
| **Supervised classification** | Slides | |
| | Tutorial + practical | [[html](stat-R_2021/tutorials/machine-learning_TCGA-BIC/04_supervised-classification_TCGA-BIC_tuto-tp.html)]  [[Rmd](https://raw.githubusercontent.com/DU-Bii/module-3-Stat-R/master/stat-R_2021/tutorials/machine-learning_TCGA-BIC/04_supervised-classification_TCGA-BIC_tuto-tp.Rmd)] |



<!--
4. Corrélation régression (à confirmer)
-->




### Travail personnel

1. Après la Session 1

    - finir le tutorial des dataframes pour demain jeudi après-midi -> poser des questions sur slack si des points sont obscurs
    - faire le practical dans vos séances de travail personnel du vendredi des 2 1ères semaines -> les données serviront de Fil Rouge tout au long du module
    - faire le tutorial sur les factors pendant le temps de travail personnel

2. Après la Session 2

    - finir le practical sur tidyverse pour jeudi 11/03/2021 
    - fnir le practical sur les figures avec R base (correction disponible)
    - faire le practical sur les paquets (correction disponible)
    - ***facultatif***: faire le practical sur les contrôles de flux et fonctions (correction disponible) 

3. Après la Session 3

    - revoir à tête reposée le practical sur les statistiques
    - revoir à tête reposée l'exemple de notebook Rmd sur Rstudio: Antoine l'a un peu complété
    - ***facultatif***: pour les plus avancés, voir l'exemple du notebook .rmd  optionnel sur les statistiques 

4. Après la session 4

    - terminer le TP de Magali Berlan sur l'ACP
    - réaliser le travail personnel de Jacques van Helden : application de l'ACP aux données multi-omiques de Pavkovicz


   **L'activité atelier est annulée due à la charge de travail déjà importante.**


## R tutorials and good practice

| Doc | Description |URL |
|------------|-------------------------------|---------------------------------------|
| Cheet sheats | RStudio Cheet sheats | <https://rstudio.com/resources/cheatsheets/> |
| Tutorial | Tutorial for Beginners by E. Paradis - English version | <https://cran.r-project.org/doc/contrib/Paradis-rdebuts_en.pdf> |
| Tutorial | Tutorial for Beginners by E. Paradis - French version | <https://cran.r-project.org/doc/contrib/Paradis-rdebuts_fr.pdf> |
| R style guide | Google’s R Style Guide  | <https://google.github.io/styleguide/Rguide.html> |
| Another reference for R style guide | tidyversesStyle Guide  | <https://style.tidyverse.org/> |

## Ressources

| Category 	| Title                  	| Description                                         	| Link 	                                        |
|-------------------------------------	|------------------------	|-----------------------------------------------------	|-------------------------------------------	|
| Coding | The tidyverse R style guide | Style recommendations for R code | <https://style.tidyverse.org/> |
| Coding | Tidyverse cheat sheet | One-poage summary of basic tidyverse syntax | <https://s3.amazonaws.com/assets.datacamp.com/blog_assets/Tidyverse+Cheat+Sheet.pdf> |
| Versioning | Happy Git and GitHub for the useR | How to manage versioning of R code on a github repository | <https://happygitwithr.com/> |
| Functions                           	| R Documentation        	| List of R packages and functions                    	| <https://www.rdocumentation.org/>	|
| Functions                           	| QuickR                 	| List R functions for stats and plotting             	| <https://www.rdocumentation.org/>	|
| Statistics and DataViz              	| STDHA                  	| Statistical tools for high-throughput data analysis 	| <http://www.sthda.com/english/> |
| Basic stats explained to biologists 	| Points of Significance 	| Nature Methods collection                           	| <https://www.nature.com/collections/qghhqm/pointsofsignificance>  |
| DataViz                             	| R Graph gallery        	| How to display your data                            	| <http://www.r-graph-gallery.com/all-graphs/> |
| DataViz                             	| DEFAKATOR              	| Détecter des graphiques trompeurs                   	| <https://www.youtube.com/watch?v=crTt-QIyS-o> |
| DataViz                             	| Using color sin R      	| Explains available packages for colors in R         	| <https://www.stat.ubc.ca/~jenny/STAT545A/block14_colors.html#using-colors-in-r> |
| DataViz                             	| Using colors in R      	| How to do a high resolution figure with R base      	| https://danieljhocking.wordpress.com/2013/03/12/high-resolution-figures-in-r/ |
| DataViz                             	| DataViz                	| link tto the book                                   	| <https://clauswilke.com/dataviz/>|


## Licence

![](../img/CC-BY-SA.png)

Ce contenu est mis à disposition selon les termes de la licence [Creative Commons Attribution - Partage dans les Mêmes Conditions 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/deed.fr) (CC BY-SA 4.0). Consultez le fichier [LICENSE](LICENSE) pour plus de détails.
