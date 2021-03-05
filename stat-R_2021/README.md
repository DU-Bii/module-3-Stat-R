# Statistics with R -- 2021 session

## Programme

[Session 1. R base en explorant des données omiques](#session-1-r-base-en-explorant-des-données-omiques)

[Session 2. Renforcement de R](#session-2-renforcement-de-r)

[Session 3. Statistiques pour les données à haut-débit / RStudio et rapport Rmarkdown](#session-3-statistiques-pour-les-données-à-haut-débit-/-rstudio-et-rapport-rmarkdown)

[Session 4. Régresion linéaire multivariée / Corrélation / Exploration des données multidimensionelles](#session-4-régresion-linéaire-multivariée-/-corrélation-/-exploration-des-données-multidimensionelles)

[Session 5. Classification supervisée et apprentissage](#session-5-classification-supervisée-et-apprentissage)

[Session 6. Classification non-supervisée / Analyse d'enrichissement](#session-6-classification-non-supervisée-/-analyse-d'enrichissement)


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

### Session 1. R base en explorant des données omiques

- Date:  03/03/2021 de 9h30 à 12h30
- Instructeurs : Claire Vandiedonck & Anne Badel  
- Helpers : Antoine Bridier-Nahmias, Clémence Réda, Bruno Toupance, Jacques van Helden 

#### Objectifs

1. vérification et consolidation des prerequis: session R, vecteurs, matrices
2. dataframes: création, extraction de données, manipulation

#### Supports de cours

- Slides: [Slides for the whole session](slides/DUBii_R_Session1_2021.pdf) 
- Questions: [lien wooclap](<https://www.wooclap.com/AIFGCO>) et [proposition de solution](scripts/session1_live.R) 
- Tutorial: [Tutorial on dataframes](tutorials/Rsession1_tuto_dataframes.ipynb), 
- Practical: [Practical on dataframes applied to omics data](practicals/Rsession1_practicals_dataframes.ipynb)
- Data: [File Temperatures.txt](data/Tempartures.txt)
 
**=> To do:**
- finir le tutorial pour demain jeudi après-midi -> poser des questions sur slack si des points sont obscurs
- faire le practical dans vos séances de travail personnel du vendredi des 2 1ères semaines -> les données serviront de Fil Rouge tout au long du module

*Friday 05/03/2021 personnal work:* TBA

### Session 2. Renforcement de R

- Date:  04/03/2021 de 13h30 à 16h30
- Instructeurs : Claire Vandiedonck & Magali Berland  
- Helpers : Antoine Bridier-Nahmias, Yves Clément, Bruno Toupance, Jacques van Helden 

#### Objectifs

1. contrôles de flux: boucles versus vectorisation, excutions conditionnelles
2. fonctions: implémentation
3. paquets/librairies: installation et troubleshooting, chargement, utilisation
4. figures à façon avec R base
5. introduction au Tidyverse: ggplot2, dplyr, tidyr

#### Supports de cours

- Slides: [Slides for part 1 to 4](slides/DUBii_R_Session2_2021.pdf) - [Introduction au tidyverse](slides/2021-03-04-Intro-tidyverse.pdf)
- Tutorial: [Tutorial on functions](tutorials/Rsession2_tuto_functions.ipynb) - [on packages](tutorials/Rsession2_tuto_packages.ipynb) 
- Practical: [optional on loops, conditions and functions](practicals/Rsession2_practical_loops_conditions_functions.ipynb)  - [on figures](practicals/Rsession2_practicals_figures.ipynb) - [TD introduction au tidyverse](tutorials/2021-03-04-TD-Intro-tidyverse.html) et visualisation du sujet du TD [ici](https://htmlpreview.github.io/?https://github.com/DU-Bii/module-3-Stat-R/blob/master/stat-R_2021/tutorials/2021-03-04-TD-Intro-tidyverse.html)
Corrigé du [TD sur ggplot au format JupyterLab](TD-tidyverse-ggplot-corrigé.ipynb)

Sujet du [TD sur dplyr et tidyr au format JupyterLab](TD-tidyverse-dplyr-tidyr-sujet.ipynb)

<!--

### Session 3. Statistiques pour les données à haut-débit / RStudio et rapport Rmarkdown

- Date:  09/03/2021 de 14h30 à 17h30
- Instructeurs : Claire Vandiedonck & Antoine Bridier-Nahmias  
- Helpers : Anne Badel, Clémence Réda, Jacques van Helden, Olivier Sand

#### Objectifs

1. Problème de la dimensionalité
2. Estimation des paramètres
3. Tests multiples
4. Analyse différentielle de données omiques
5. RStudio
6. Rapport Rmarkdown


### Session 4. Régresion linéaire multivariée / Corrélation / Exploration des données multidimensionelles


### Session 5. Classification supervisée et apprentissage


### Session 6. Classification non-supervisée / Analyse d'enrichissement

-->

## R tutorials and good practice

| Doc | Description |URL |
|------------|-------------------------------|---------------------------------------|
| Cheet sheats | RStudio Cheet sheats | <https://rstudio.com/resources/cheatsheets/> |
| Tutorial | Tutorial for Beginners by E. Paradis - English version | <https://cran.r-project.org/doc/contrib/Paradis-rdebuts_en.pdf> |
| Tutorial | Tutorial for Beginners by E. Paradis - French version | <https://cran.r-project.org/doc/contrib/Paradis-rdebuts_fr.pdf> |
| R style guide | Google’s R Style Guide  | <https://google.github.io/styleguide/Rguide.html> |
| Another reference for R style guide | tidyversesStyle Guide  | <https://style.tidyverse.org/> |


## Licence

![](../img/CC-BY-SA.png)

Ce contenu est mis à disposition selon les termes de la licence [Creative Commons Attribution - Partage dans les Mêmes Conditions 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/deed.fr) (CC BY-SA 4.0). Consultez le fichier [LICENSE](LICENSE) pour plus de détails.
