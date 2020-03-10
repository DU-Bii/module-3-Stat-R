# Statistics with R -- 2020 session


## Contents

- [Goals](#goals)
- [Teachers](#teachers)
- [Course links](#course-links)
- [R tutorials and good practice](#r-tutorials-and-good-practice)
- [Teaching material](#teaching-material)

    - [Session 1. R and Rmd basics](#session-1-r-and-rmd-basics)
    - [Session 2. Statistical analysis with R](#session-2-statistical-analysis-with-r)
    - [Session 3. Statistics for omics data](#session-3-statistics-for-omics-data)
    - [Session 4. Clustering](clustering/)
    - [Session 5. Data exploration and enrichment analysis](#session-5-data-exploration-and-enrichment-analysis)
    - [Session 6. Supervised classification and learning](#session-6-supervised-classification-and-learning)

## Goals

The aim of this module is to provide you with the bases of R programming and to present you some statistical concepts for high-throuput data.

To follow this course, prior knowledge is expected on: 

- R environment, 
- getting help in R,
- types of variables (particularly on vectors).

Link to the prerequisites: 

<https://du-bii.github.io/accueil/activites_preparatoires/>


## Teachers

| Name  | Role(s) |
|-----------------------------|----------------|
| [Claire Vandiedonck](https://orcid.org/0000-0002-6669-6923) | Coordinator, teacher |
| [Jacques van Helden](https://orcid.org/0000-0002-8799-8584) | Coordinator, teacher |
| Guillaume Achaz | Teacher |
| Anne Badel | Teacher |
| Magali Berland | Teacher |
| [Antoine Bridier-Nahmias](https://orcid.org/0000-0002-0376-6840) | Teacher |
| Olivier Sand | Teacher |
| Natacha Cerisier | Helper |


## Course links

| Doc | Description |URL |
|---------|---------------------------|---------------------------------------|
| **Git pages** | **Web site of the course**  (to see the supports) | <https://du-bii.github.io/module-3-Stat-R/> | 
| Git repo | Repository enabling to download or clone the teaching material on your computer | <https://github.com/DU-Bii/module-3-Stat-R> |
| RStudio at IFB cluster | link to RStudio on th IFB cluster | <https://rstudio.cluster.france-bioinformatique.fr/> |
| Moodle | link to the Moddle web page of the DUBii with your ENT account] | <https://moodlesupd.script.univ-paris-diderot.fr/course/view.php?id=10629> |


## R tutorials and good practice

| Doc | Description |URL |
|------------|-------------------------------|---------------------------------------|
| Cheet sheats | RStudio Cheet sheats | <https://rstudio.com/resources/cheatsheets/> |
| Tutorial | Tutorial for Beginners by E. Paradis - English version | <https://cran.r-project.org/doc/contrib/Paradis-rdebuts_en.pdf> |
| Tutorial | Tutorial for Beginners by E. Paradis - French version | <https://cran.r-project.org/doc/contrib/Paradis-rdebuts_fr.pdf> |
| R style guide | Google’s R Style Guide  | <https://google.github.io/styleguide/Rguide.html> |


## Teaching material

### Session 1. R and Rmd basics


| Topics |  Duration | Material |
|------------------------------------------|----------|------------------------------------------------------------------------------------|
| Slides for the whole session | 1/2 day | [[pdf](slides/DUBii_R_Session_1.pdf)] | 
| wooclap Poll | 5' | [[html](https://app.wooclap.com/EGIDTQ))] | 
| Start R | 20'  | [[link to RStudio on th IFB cluster](https://rstudio.cluster.france-bioinformatique.fr/)] [[start-R.html](practicals/1.01_start-R/start-R.html)] [[start-R.Rmd](https://raw.githubusercontent.com/DU-Bii/module-3-Stat-R/master/stat-R_2020/practicals/1.01_start-R/start-R.Rmd)]  |
| Validation of the prerequisites: quizz on Moodle | 15' + 20' | [[with your ENT account](https://moodlesupd.script.univ-paris-diderot.fr/course/view.php?id=10629)] [[with password: dubii2020](https://moodlesupd.script.univ-paris-diderot.fr/course/view.php?id=13420)] |
| Script | Live demo on the board | [[R](scripts/live_demo_session_1.R)] |
| Basic R structures (matrices, data frames, factors and lists) | 45'  | [[basic_R-structures.html](practicals/R-structures/basic_R-structures.html)] [[basic_R-structures.Rmd](https://raw.githubusercontent.com/DU-Bii/module-3-Stat-R/master/stat-R_2020/practicals/R-structures/basic_R-structures.Rmd)]  [[Factors_in_R.html](practicals/factors/Factors_in_R.html)] | [[Factors_in_R.Rmd](https://raw.githubusercontent.com/DU-Bii/module-3-Stat-R/master/stat-R_2020/practicals/factors/Factors_in_R.Rmd)]|
| *Coffee break* | 15' | |
| Intro to programming with R | 35' |  [[html](practicals/R-programing_intro/R-programing_intro.html)] [[Rmd](https://raw.githubusercontent.com/DU-Bii/module-3-Stat-R/master/stat-R_2020/practicals/R-programing_intro/R-programing_intro.Rmd)] |
| R markdown | 45' | Demo and [[COVID-19_HK.nb.html](practicals/Rmarkdown_demo/COVID-19_HK.nb.html)] |


### Session 2. Statistical analysis with R


| Type |  Description | Links |
|-----------|------------------------------|-----------------------------|
| Slides | Slides for the whole session | [[pdf](slides/DUBii_R_Session_2.pdf)] |
| R Scripts | Scripts used for the slides | [[R](scripts/DUBii_R_Session_2.R)] |
| Shiny app | Shiny app to explore sampling fluctuation | <http://shiny.calpoly.sh/Sampling_Distribution/> |
| Practical | Descriptive statistics | [[html](practicals/descriptive-statistics/descriptive-statistics.html)] [[Rmd](https://raw.githubusercontent.com/DU-Bii/module-3-Stat-R/master/stat-R_2020/practicals/descriptive-statistics/descriptive-statistics.Rmd)] |
| R package | Package to visualise effect sizes | <https://github.com/ACCLAB/dabestr> |
| Document | Memo on correlation and regression | [[pdf]](documents/CovCorReg.pdf)] |
| Practical | A first data analysis with R | [[html](practicals/first-data-analysis/A_first_data_analysis.html)] [[Rmd](https://raw.githubusercontent.com/DU-Bii/module-3-Stat-R/master/stat-R_2020/practicals/first-data-analysis/A_first_data_analysis.Rmd)] |


*Links mentionned during the session:*

|  Topic | Title | Description | Link|
|------------------------------------------|----------|----------|------------------------------------------------------------------------------------|
| Basic stats explained to biologists | Points of Significance |Nature Methods collection  |<https://www.nature.com/collections/qghhqm/pointsofsignificance> |
| How to represent data | Points of View | Nature Methods collection |<http://blogs.nature.com/methagora/2013/07/data-visualization-points-of-view.html> |
| How to represent data | DEFAKATOR | Détecter des graphiques trompeurs  |<https://www.youtube.com/watch?v=crTt-QIyS-o> |




### Session 3. Statistics for omics data

| Topics | Description | Duration | Material |
|------------------------------------------|------------------------|----------|------------------------------------------------------------------------------------|
| Debrief session 1 & 2 - part I | R code: data structures, function usage, plots | 20' | live |
| Practical part I | simulated data | 30' | [[html]()]  [[Rmd]()]|
| Debrief session 1 & 2 - part II| basic statistics | 20' | [[pdf](slides/DUBii_R_Session_2.pdf)] |
| *Coffee break* | 15' | |
| Practical part II | industrialization of hypotheses tests | 45' | [[html]()]  [[Rmd]()]|
| Statistics on omics data - part I | multiple testing issue | 20' | [[pdf](slides/DUBii_R_Session_3.pdf)] |
| Practical part III | correction for multiple testing | 15' | [[html]()]  [[Rmd]()]|
| Statistics on omics data - part II | parameters estimation issue | 15' | [[pdf](slides/DUBii_R_Session_3.pdf)] |



### Session 4. Clustering

Contents: [clustering/](clustering/)

### Session 5. Data exploration and enrichment analysis

### Session 6. Supervised classification and learning



