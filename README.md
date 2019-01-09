
# DUBii module 3 : Statistiques avec R

## Accès

- Web: <https://du-bii.github.io/DUBii-3-Statistiques-avec-R/>
- Github (sources): <https://github.com/DU-Bii/DUBii-3-Statistiques-avec-R/>

Cloner le cours sur votre propre ordinateur.

```{bash}
git clone https://github.com/DU-Bii/DUBii-3-Statistiques-avec-R.git
```

## Responsables

1. Anne Badel, Université Paris-Diderot
2. [Jacques van Helden](https://orcid.org/0000-0002-8799-8584), Institut Français de Bioinformatique, Aix-Marseille Université

## Autres intervenants

3. Hugo Varet, Institut Pasteur
4. Claire Vandiedonck, Université Paris-Diderot
4. Leslie Regad, Université Paris-Diderot
6. Frédéric Guyon, Université Paris-Diderot

## Calendrier 2019

Calendrier du DUBii : <https://goo.gl/MVEA4q>


## Compétences attendues à la fin du module

A la fin du module, les participants auront acquis les compétences suivantes:

- écrire un script R qui charge des fichiers de données (généralement en format tabulaire), réalise une série d'analyses statistiques, exporte les résultats sous différents formats et génère figures illustrant les résultats
- intégrer les scripts et l'interprétation dans un rapport en format R markdown, pour assurer la reproductibilité des résultats et la cohérence entre les résultats et le texte décrivant leur interprétation

## Concepts  à couvrir

- Manipulation de données avec R

    - vecteurs
    - matrices
    - data frames

- Représentations graphiques courantes en bioinformatiques

    - histogramme
    - box plot (boîte à moustaches)
    - violin plot
    - MA plot
    - volcano plot
    - PC plot
    - heatmap
    
- Tests d'hypothèses

- Corrections de tests multiples

- Clustering

- Classement (supervised classification)


## Synopsis

### Prérequis

Avant d'entamer ce module, les participants sont censés avoir suivi les deux premiers modules d'introxuction à R sur Data Camp.

### [Séance 1 : Introduction à R](seance_1/README.md)

*Intervenants: Hugo Varet et Frédéric Guyon*

- Récupérer et adapter le TP de Roscoff
- Identifier des cas d'études intéressants

### [Séance 2 : Programmation avec R](seance_2/README.md)

*Intervenants: Frédéric Guyon et Magali Berland*




### [Séance 3: Détection de gènes différentiellement exprimés](seance_3/README.md)

*Intervenants: Claire Vandiedonck & Magali Berland & Jacques van Helden*

- Concepts

    - échantillonnage et estimation
    - tests d'hypothèse
    - tests multiples
    - visualisation des résultats globaux  (MA plots, volcano plots, histogrammes de p-vlaeurs)
    - évaluation de l'impact des choix de logiciels et paramètres 

### [Séance 4: Clustering](seance_4/README.md)

*Intervenants: Leslie Regad & Anne Badel & Jacques van Helden*

- Concepts

    - Approches de clustering: hiérarchique, K-means
    - Complexité
    - évaluation du clustering
    - comparaison de résultats de clustering
    - Visualisartion (heat maps, arbres)
    
### [Séance 5: Statistiques d'enrichissement](seance_5/README.md)

*Intervenants: Jacques van Helden + Claire Vandiedonck (à confirmer)*

- Concepts

    - Distributions discrètes de probabilité
    - Test exact de Fisher
    - Détection d'enrichissement 
    - Corrections de tests multiples (avec dépendances)

- Applications

    - Analyse de séquences: détection de motifs sur-représentés (binomiale, Poisson, ...)
    - Analyse de données NGS ChIP-seq: détection de pics (binomiale, Poisson)
    - Enrichissement fonctionnel (hypergéométrique)

### [Séance 6: Classification supervisée](seance_6/README.md)

*Intervenants: Jacques van Helden et Leslie Regad*

- Cas d'étude: transcriptome de cancer (données TCGA)
- Méthodes: k-nearest neighbours, Random Forest, SVM
- Concepts:

    - Approches de classification supervisées
    - Entraînement / test
    - Evaluation des résultats (évaluation croisée, mesures de performance)


