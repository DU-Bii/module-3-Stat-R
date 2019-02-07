---
title: "Module 3 - Analyse statistique avec R - Séance 2"
author: "Leslie REGAD"
date: '2019-02-07'
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
  revealjs::revealjs_presentation:
    css: ../slides.css
    self_contained: yes
    theme: night
    transition: none
font-import: http://fonts.googleapis.com/css?family=Risque
subtitle: DUBii 2019
font-family: Garamond
transition: linear
---




## Plan

* Rappels de probabilité 
* Introduction du cas d'études
* Estimation d'un paramètre statistique
    + Estimateur ponctuel
    + Intervalle de confiance
* La thérorie des tests d'hypothèses
    + Le test de comparaison de deux moyennes
    + Les autres tests d'hypothèses
* A vous de jouer : Etude de cas


## Expérience aléatoire 

* **Phénomène déterministe** : phénomène dont on peut prévoir le résultat avec certitude lorsqu’on contrôle les causes  
*exemple* : je lâche la craie $\rightarrow$ elle tombe  

* **Expérience aléatoire** : expérience qui, répétée dans des conditions apparemment identiques, peut donner des résultats différents. Elle se définit par trois propositions :
    + l’expérience peut être répétée
    + plusieurs résultats sont possibles
    + le résultat ne peut être prédit avec certitude  
*exemple* : je lâche la craie $\rightarrow$ combien de morceaux de craie trouve-t-on par terre ?


## Variable aléatoire (VA) / Unité statistique


* **Variable aléatoire** (VA) = variable $X$ qui prend des valeurs en fonction du résultat d’une expérience aléatoire  
$\rightarrow$ elle répond à la question : Que mesure-t-on pendant l'expérience aléatoire ?  
* **Unité statistique** = unité sur laquelle est mesurée la VA


* Exemple
    + Expérience aléatoire : je lâche la craie $\rightarrow$ combien de morceaux trouve-t-on par terre?
    + variable aléatoire : nombre de morceaux obtenus
    + unité statistique (US) : 1 craie


* Notations : 
    + $X$ : la variable aléatoire
    + $x_i$ : les réalisations de $X$    

* VA réelles sont caractérisée par 2 paramètres : 
    + **Espérance** ($E(X)$) : caractérise la tendance centrale, la valeur moyenne, prise par la VA
    + **Variance** ($V(X)$) : caractérise la dispersion des valeurs de la variable autour de son espérance


    
## Deux types de VA réelles

* L'ensemble des valeurs possibles est définit sur $\mathbb{R}$

$\quad$

* **discrète** : l'ensemble des valeurs que $X$ peut prendre est fini ou infini dénombrable
    + nombres d'oeufs pondus par une poule : 2, 3, 4, ...  
    
* **continue** : les autres variables  
    + poids d'un patient : 75.3kg, 56.4kg, 87kg, ...  
    + taux de cholestérol : 2g/l, 1.8g/l, ...  

    
    
## Variable réelle discrète

* se définit par sa **loi de probabilité** : fonction  qui associe à chaque valeur de $X$ sa probabilité
$$p_i = p(X = x_i)$$   
    + avec $0<p_i<1$
    + $\sum_{i=1}^{k} p_i = 1$, avec $k$ le nombre de modalités de $X$   
    
* $X$ = "le numéro de la face d'un dé"   

<img src="figures/07_tests_multiplesunnamed-chunk-2-1.png" style="display: block; margin: auto;" />


## Variable quantitative continue

*  l'ensemble des valeurs que $X$ peut prendre est infini  
$\rightarrow p(X=x_i) = 0$

* se caractérise par sa **densité de probabilité** = la fonction $f(x)$ définie par : 
$$P[x < X \leq x + dx] = f (x) dx \textrm{   pour } x \in  \mathbb{R}$$


* la **fonction de répartition** est la fonction $F(X)$ telle que : 
$$ F(x)=P[X \leq x] = \int_{-\infty}^x f(u)du \textrm{   pour } x \in  \mathbb{R}$$


<img src="figures/07_tests_multiplesunnamed-chunk-3-1.png" style="display: block; margin: auto;" />
 
  

   


## Etude de cas : le myélome multiple (MM)
<style>
  .col2 {
    columns: 2 200px;         /* number of columns and width in pixels*/
    -webkit-columns: 2 200px; /* chrome, safari */
    -moz-columns: 2 200px;    /* firefox */
  }
  .col3 {
    columns: 3 100px;
    -webkit-columns: 3 100px;
    -moz-columns: 3 100px;
  }
</style>

* Prolifération incontrôlée des plasmocytes $\rightarrow$ **Affection de la moelle osseuse** 

<div class="col2"> 
<center>
![](img/MM.png){width=72%}
</center>

* Cancer relativement **rare**
* Touche proportionnellement davantage les hommes que les femmes
* Atteint principalement les personnes âgées de plus de 60 ans et survient rarement avant 40 ans
</div>

* Symptômes 
    + plasmocytes malins prennent peu à peu la place des autres cellules sanguines :  
$\rightarrow$ **diminution de l’immunité humorale**, anémie, infections, risque d’ecchymoses, ...

    + **Destruction osseuse** qui résulte de la décalcification en certains endroits du squelette  
$\rightarrow$ **fractures** peuvent aisément se produire à ces endroits  



## Cas d'étude 
<div style="float:left;width:75%;">
**Est-ce le dosage urinaire de la molécule déoxypyridinoline (pyr) est un bon marqueur pour détecter le MM ?**   
</div>  
<div style="float:right;width:25%;">   
![](img/pyr.png){width=40%}   
</div>   


$\quad$   

$\rightarrow$ est-ce que le taux de pyr des patients malades est plus grand que celui des individus sains ?

* X ="Taux de pyr" (micmol/mmolcreat) 
* US = un individu $\quad \quad \rightarrow$ type = quantitative continue

<center>
![](img/estimation1.png){width=55%}
</center>  

**Population** = ensemble d’individus ayant des caractéristiques qui leur sont propres  


## Mise en place du protocole 

$\rightarrow$ Récolte des données

<center>
![](img/estimation4.png){width=70%}
</center>

## Analyse des données avec R


```r
dataMyelom <- read.table("data/myelom.txt", sep="\t", header=T)
dim(dataMyelom)
```

```
[1] 218  38
```





```r
table(dataMyelom[,"diagn"])
```

```

  0   1 
 40 178 
```


* `diagn` = 0 $\rightarrow$ individus non malades   
* `diagn` = 1 $\rightarrow$ patients malades  





## Description des deux échantillons

* distribution de pyr dans les deux échantillons


```r
boxplot(pyr~diagn, data=dataMyelom, ylab="Valeur de pyr (micmol/mmolcreat)", col = "steelblue3")
```

<img src="figures/07_tests_multiplesunnamed-chunk-8-1.png" style="display: block; margin: auto;" />


## Mise en place du protocole 

$\rightarrow$ Récolte des données

<center>
![](img/estimation3.png){width=65%}
</center>

## Estimation de paramètres
<div class="col2">

* estimateur de l'espérance de $X$ = moyenne de $X$ dans l'échantillon
$$ \widehat{\mu} = m = \frac{\sum_{i=1}^{n}x_i}{n}$$

* estimateur de la variance de $X$  
$$ \widehat{\sigma^2} = s^2 = \frac{1}{n-1} \sum_{i=1}^{n}(x_i-m)^2$$
</div>


* calcul de l'**estimateur de l'espérance** de $X$ dans les deux échantillons

```r
by(dataMyelom[,"pyr"], dataMyelom["diagn"], mean)
```

```
diagn: 0
[1] 5.6985
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
diagn: 1
[1] 7.241742
```


* $m_1 \ne m_2$ : Ne signifie pas que $\mu_1 \ne \mu_2$

## Les fluctuations d'échantillonnage

* 1 population où $X \sim \mathcal{N}(\mu=4; \sigma^2=12)$  

1. tire un échantillon de 20 indidivus et calcule la moyenne de $X$ dans cet échantillon

```r
ech1 <- rnorm(n=20, mean=4, sd=sqrt(12))
mean(ech1)
```

```
[1] 3.83782
```

2. tire un deuxième échantillon de 20 indidivus et calcule la moyenne de $X$ dans cet échantillon

```r
ech2 <- rnorm(n=20, mean=4, sd=sqrt(12))
mean(ech2)
```

```
[1] 2.712418
```

$\rightarrow$ Les différences entre les deux estimateurs sont dues aux **fluctuations d'échantillonnage**

## Estimation de paramètres
<div class="col2">

* estimateur de l'espérance de $X$ = moyenne de $X$ dans l'échantillon
$$ \widehat{\mu} = m = \frac{\sum_{i=1}^{n}x_i}{n}$$

* estimateur de la variance : 
$$ \widehat{\sigma^2} = s^2 = \frac{1}{n-1} \sum_{i=1}^{n}(x_i-m)^2$$
</div>


* calcul de l'**estimateur de la variance** de $X$ dans les deux échantillons

```r
by(dataMyelom[,"pyr"], dataMyelom["diagn"], var)
```

```
diagn: 0
[1] 6.390654
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
diagn: 1
[1] 16.72764
```



## Estimation d'un paramètre : Intervalle de confiance (IC) 


* Apporte deux informations :
    + les valeurs possibles du paramètre $\theta$ à estimer
    + le degré de confiance attribué à ces valeurs  

  
 
$\quad$

* **IC de la moyenne** = intervalle $[m_{inf}; m_{sup}]$ dans lequel on considère que $\mu$  a une probabilité $(1-\alpha)$ de se trouver 


<div class="col2">
$$ p(m_{inf} < \mu < m_{sup}) = 1- \alpha $$  
![](img/IC.png){width=70%}
<center>

</center>


</div>
##IC de la moyenne : 2 cas


* Prend en compte 
    +  la **variabilité** des données     
    +  la **taille de l’échantillon**  

* si  $n > 30$: 
$$IC_{1-\alpha} = \left[ m \pm z_{1-\frac{\alpha}{2}} \times \sqrt{ \frac{s^2}{n} } \right]$$    
    + $z_{1-\frac{\alpha}{2}}$ : quantile de la loi normale centrée réduite d'ordre $\alpha$


$\quad$

* si $n < 30$ et $X \sim \mathcal{N}(\mu; \sigma^2)$
$$IC_{1-\alpha} = \left[m \pm t_{\alpha ; \textrm{(n-1)ddl}} \times \sqrt{\frac{s^2}{n}} \right]$$
    + $t_{\alpha ; \textrm{(n-1)ddl}}$ : quantile de la loi de student d'ordre $\alpha$ à $(n-1)$ degrés de liberté 




  
  
## IC du taux de pyr à 95%

* **échantillon 1** : 40 patients sains 


```r
alpha <- 0.5
pyr0 <- dataMyelom[which(dataMyelom[,"diagn"]==0),"pyr"]
borneInf.0 <- mean(pyr0) - qnorm(1-alpha/2) * sqrt(var(pyr0)/length(pyr0)) 
borneSup.0 <- mean(pyr0) + qnorm(1-alpha/2) * sqrt(var(pyr0)/length(pyr0)) 
round(c(borneInf.0, borneSup.0),2)
```

```
[1] 5.43 5.97
```
  
* **échantillon 2** : 178 patients atteints de MM 


```r
pyr1 <- dataMyelom[which(dataMyelom[,"diagn"]==1),"pyr"]
borneInf.1 <- mean(pyr1) - qnorm(1-alpha/2) * sqrt(var(pyr1)/length(pyr1)) 
borneSup.1 <- mean(pyr1) + qnorm(1-alpha/2) * sqrt(var(pyr1)/length(pyr1)) 
round(c(borneInf.1, borneSup.1),2)
```

```
[1] 7.03 7.45
```


<img src="figures/07_tests_multiplesunnamed-chunk-16-1.png" style="display: block; margin: auto;" />


## Cas d'étude : Introduction aux tests statistiques
 
<center> 
  ![](img/estimation2.png){width=60%}
</center>


$\quad$    
  

* 2 possibilités pour expliquer les différences entre $m_1$ et $m_2$ $\rightarrow$ 2 hypothèses   
    + elles s'expliquent seulement par **le hasard** (fluctuations d'échantillonnage) : H0 (hypothèse nulle)
    + elles s'expliquent par le **hasard** et par le **facteur maladie** : H1 (hypothèse alternative)

  
  

  
## Déroulement d'un test statistique
  
* Définit deux hypothèses sur un des paramètres de la VA
    + **hypothèse nulle (H0)** : égalité des paramètres : $\mu_1 = \mu_2 = \mu$  
    Les différences observées sont expliquées uniquement par le hasard   
    + **hypothèse alternative (H1)** : inégalité des paramètres : $\mu_1 < \mu_2$  
    Les différences observées sont expliquées à la fois par le hasard et par le facteur   
    
  
$\quad$
    
<center>
**Réaliser le test va consister à choisir une des deux hypothèses (H0 ou H1) en se basant sur les données des échantillons**   
</center>  

$\quad$  
$\rightarrow$ Est-ce que les données des échantillons ($m_1$ et $m_2$) sont compatibles avec H0 ?  

* si oui $\rightarrow$ non rejet de H0  
le hasard explique à lui seul les différences entre les deux moyennes observées

* si non $\rightarrow$ rejet de H0  
le hasard et le facteur expliquent les différences entre les deux moyennes observées    
    
## Est-ce que les données sont compatibles avec H0 ?
    
1. Définir un **critère statistique** $S$ dont la loi sous H0 est connue  
 $S = M_2 - M2$  avec $M$=moyenne de $X$ dans 1 échantillon    
$\quad$  
Sous H0 ( $n_1$ et $n_2 > 30$) : $S \sim \mathcal{N} \left(0 ; \sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2} }\right)$


<img src="figures/07_tests_multiplesunnamed-chunk-17-1.png" style="display: block; margin: auto;" />
  
2. Calculer $s_{obs}$ = valeur de $S$ calculée sur les échantillons : $s_{obs} = m_1 - m_2$    

3. Regarde si la réalisation  $s_{obs}$ est fortement probable sous H0 (quand $\mu_1 = \mu_2$)



## Est-ce que les données sont compatibles avec H0 ?

* $S = M_2 - M_1$  avec $S \sim \mathcal{N} \left(0 ; \sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2} }\right)$
* $s_{obs} = m2-m1$

* Calcule la probabilité d'obtenir sous H0 le même résultat que celui observé (ou plus grand) sur les échantillons = **p-value**  $= p(S > s_{obs})$
  


<div class="col2">
<img src="figures/07_tests_multiplesunnamed-chunk-18-1.png" style="display: block; margin: auto;" />
 

* forte valeur de p-value $\rightarrow$ : $s_{obs}$ est fortement probable sous $H0$
 </div>
  
  



## Est-ce que les données sont compatibles avec H0 ?

* $S = M_2 - M_1$  avec $S \sim \mathcal{N} \left(0 ; \sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2} }\right)$
* $s_{obs} = m2-m1$

* Calcule la probabilité d'obtenir sous H0 le même résultat que celui observé (ou plus grand) sur les échantillons = **p-value**  $= p(S > s_{obs})$
  


<div class="col2">
<img src="figures/07_tests_multiplesunnamed-chunk-19-1.png" style="display: block; margin: auto;" />
 

* forte valeur de p-value $\rightarrow$ : $s_{obs}$ est fortement probable sous $H0$  
* faible valeur de p-value $\rightarrow$ : $s_{obs}$ est très peu probable sous $H0$
 </div>
  
  
  
## Interprétation de la p-value :  $p(S>s_{obs})$  
  
<div style="float:left;width:70%;">
* p-value = 0.03   
$\rightarrow$ 3% de chance que la valeur $s_{obs}$ se produise sous H0  
$\rightarrow$ on a 3% de chance que 2 échantillons pris au hasard aient la même différence (ou plus grande) que celle observée   


</div>  
<div style="float:right;width:30%;"> 
<img src="figures/07_tests_multiplesunnamed-chunk-20-1.png" style="display: block; margin: auto;" />
 </div> 

$\quad$   

* p-value = 0.67  
$\rightarrow$ 67% de chance que la valeur $s_{obs}$ se produise sous H0  
$\rightarrow$ on a 67% de chance que 2 échantillons pris au hasard aient la même différence (ou plus grande) que celle observée 


  
## Les erreurs
  
Deux erreurs possibles quand on conclut au test : 

* **erreur de type I** : je conclus à 1 effet de la maladie alors qu'en réalité il n'y en a pas.   
* **erreur de type II** : je conclus à $\emptyset$ effet de la maladie alors qu'en réalité il existe.   

<div class="col2">
<center>
![](img/risque.png){width=100%}
</center>

<center>
![](img/risqueGraph.png){width=80%}
</center>

</div>

* **risque de 1ère espèce** ($\alpha$) : $p(\textrm{rejet H0 }  | \textrm{ H0 est vraie})$  
* **risque de 2ème espèce** ($\beta$) : $p(\textrm{non rejet H0 } | \textrm{ H0 est fausse})$  


* **Puissance du test** $\textrm{Puissance} = 1 - \beta = p(\textrm{rejet H0} | \textrm{H0 est fausse})$  
La probabilité de détecter une différence alors qu'il en existe une   



  
## Interprétation de la p-value :  $p(S>s_{obs})$  
  
<div style="float:left;width:70%;">
* p-value = 0.03   
$\rightarrow$ 3% de chance que la valeur $s_{obs}$ se produise sous H0  
$\rightarrow$ on a 3% de chance que 2 échantillons pris au hasard aient la même différence (ou plus grande) que celle observée   


</div>  
<div style="float:right;width:30%;"> 
<img src="figures/07_tests_multiplesunnamed-chunk-21-1.png" style="display: block; margin: auto;" />
 </div> 

$\quad$   

* p-value = 0.67  
$\rightarrow$ 67% de chance que la valeur $s_{obs}$ se produise sous H0  
$\rightarrow$ on a 67% de chance que 2 échantillons pris au hasard aient la même différence (ou plus grande) que celle observée 

$\quad$  
    
* on choisit un risque $\alpha$ comme valeur seuil : souvent 5%
    + si p-value > 0.05 $\rightarrow$ non rejet de H0  
    $\rightarrow$ les différences observées sur les échantillons sont expliquées uniquement par le hasard  
    
    
    + si p-value < 0.05 $\rightarrow$  rejet de H0  
    $\rightarrow$ Les différences observées sont dues aux fluctuations d'échantillonnage et au facteur   
  


## Comparaison du taux de pyr chez les patients malades et contrôles

<center>
Est-ce que le taux de pyr des patients malades est plus grand que celui des individus sains ?
</center>


* hypothèses  
<center>
H0 : $\mu_1 = \mu_2 \quad \quad \quad \quad \quad \quad$ H1 : $\mu_1 < \mu_2$   
</center>

```r
t.test(pyr~diagn, data=dataMyelom, var.equal=TRUE, alternative="less")
```

```

	Two Sample t-test

data:  pyr by diagn
t = -2.2878, df = 216, p-value = 0.01156
alternative hypothesis: true difference in means is less than 0
95 percent confidence interval:
      -Inf -0.428922
sample estimates:
mean in group 0 mean in group 1 
       5.698500        7.241742 
```

* p-value $< 0.05 \rightarrow$, le test est significatif au risque de 5%  
Le taux de pyr des individus contrôles est significativement plus petit de celui des patients malades  
Le dosage de pyr est un bon marqueur de la maladie. 




## Les différents types de tests 

* variable réelle continue : **Tests sur les moyennes**
    + 1 échantillon et 1 population de référence  
        + grand échantillon : test espilon   
        + petit échantillon : test de student  
        $\rightarrow$ : test paramétrique : test de student  (1 conditions de validité)  
        $X$ suit doit suivre une loi normale dans la population d'où est tiré l'échantillon   
        $\rightarrow$ tests non paramétriques : test de Wilcoxon ou test de Mann-Whitney  
    + 2 échantillons    
        + grands échantillons : test espilon   
        + petits échantillons 
        $\rightarrow$ : test paramétrique : test de student  (2 conditions de validité)  
        $X$ doit suivre un loi normale dans les deux populations  
        Egalité des deux variances  
        $\rightarrow$ tests non paramétriques : test de Kruskal-Wallis
        
    + $\geq$ 3 échantillons  
        + test paramétrique ANOVA  (2 conditions de validité)
        $X$ doit suivre un loi normale dans les différentes populations   
        Egalité des $k$ variances 
        + test non paramétrique : test de Kruskal-Wallis
        
 
 
## Les différents types de tests 

* test sur les distribution : 
    + à une loi normale : test de Shapiro
    + à une distribution théorique : test du chi$^2$ d'homogénéité  
    + deux distributions  : test du Cchi$^2$hi2 d'adéquation
    

* deux variables aléatoires (lien) :  
    + réelles continues :  
        + test paramétrique : test du coefficient de corrélation de Pearson  
        binormalité de la variable $X$  
        + test non paramétrique : test du coefficient de corrélation de Pearson  
    + réelles discrètes :  
        + test du chi$^2$ d'indépendance  
  
  
## Merci de votre attention !!!

$\quad$
$\quad$

<center>
Place au TP : Etude des caractéristiques des patients atteints d'une cirrhose du foie et des individus sains.
</center>




## Diminuer l'erreur de type II / Augmenter la puissance du test 
  
1. Augmenter la taille d'effet
2. Diminuer la variabilité des données (variance des données)
3. Augmenter la taille de l'échantillon
  
<center>
![](img/effetPuissance.png){width=75%}
</center>


