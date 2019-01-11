
# DUBii module 3 : Statistiques avec R


## Informations

### Responsables

1. Anne Badel, Université Paris-Diderot
2. [Jacques van Helden](https://orcid.org/0000-0002-8799-8584), Institut Français de Bioinformatique, Aix-Marseille Université

### Autres intervenants

3. Hugo Varet, Institut Pasteur
4. Claire Vandiedonck, Université Paris-Diderot
4. Leslie Regad, Université Paris-Diderot
6. Frédéric Guyon, Université Paris-Diderot

### Calendrier 2019

Calendrier du DUBii : <https://goo.gl/MVEA4q>

### Accès aux supports de cours

- Web: <https://du-bii.github.io/DUBii-3-Statistiques-avec-R/>
- Github (sources): <https://github.com/DU-Bii/DUBii-3-Statistiques-avec-R/>

#### Cloner le cours sur votre propre ordinateur

Pour les **participants**

```sh
git clone https://github.com/DU-Bii/DUBii-3-Statistiques-avec-R.git
```

Pour les **contributeurs du cours** (requiert de faire partie de l'équipe *module3-R* de l'organisation github *DU-Bii*)

```sh
git clone git@github.com:DU-Bii/DUBii-3-Statistiques-avec-R.git
```


## Compétences attendues à la fin du module

A la fin du module, les participants auront acquis les compétences suivantes:

- Ecrire des scripts R pour 
    - charger des fichiers de données (généralement en format tabulaire), 
    - réaliser une série d'analyses statistiques, 
    - exporter les résultats sous différents formats,
    - générer différents types de figures synthétisant les résultats
    
- Générer un rapport scientifique en format R markdown
    - intégration de blocs de code dans un texte formaté
    - assure la cohérence entre les résultats et figures (générés au vol), et le texte qui en fournit l'interprétation
    - assure la reproductibilité des analyses

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

***Evaluer si on veut vraiment couvrir la programmation de fonctions avec R. Ne le faire que si on trouve des cas pertinents auxquels les participants risquent d'être confrontés pour leurs propres travaux. ***


### [Séance 3: Détection de gènes différentiellement exprimés](seance_3/README.md)

*Intervenants: Claire Vandiedonck & Magali Berland & Jacques van Helden*

- Concepts
    - échantillonnage et estimation
    - tests d'hypothèse
    - tests multiples
    - visualisation des résultats globaux  (MA plots, volcano plots, histogrammes de p-vlaeurs)
    - évaluation de l'impact des choix de logiciels et paramètres 
    - réduction de dimensionnalité pour afficher les résultats
        - PC plots`
        - SVD sur des matrices de similarité / dissimilarité
        - tSNE ? (à évaluer, au cas où on aborderait le single-cell RNA-seq)

- Application
    - TCGA: 
        - détection de gènes différentiellement exprimés entre deux groupes (types de cancer, stades)
        - analyse différentielle entre plusieurs groupes (types de cancer, stades)
    - Escherichia coli FNR: détection de gènes différentiellement exprimés entre deux conditions (aérobie / anaérobie; sauvage versus mutant FNR)
    

### [Séance 4: Clustering](seance_4/README.md)

*Intervenants: Leslie Regad & Anne Badel & Jacques van Helden*

- Concepts
    - Approches de clustering: hiérarchique, K-means
    - Complexité
    - évaluation du clustering
    - comparaison de résultats de clustering
    - Visualisartion (heat maps, arbres)

- Applications
    - Clustering et heat-maps de densités de reads autour des pics ChIP-seq (marques épigénétiques, facteurs transcriptionnels) avec KNN
    - Clustering hiérarchique de données d'expression pour identifier les groupes de gènes co-exprimés
    
        - TCGA visualisation des profils temporels (on choisir un type de cancer et on fait des heatmaps en fonction des stades)

    
- A évaluer
    - Clustering sur les graphes (brève présentation des problématiques et approches, pas forcément de TP) ? A discuter avec Costas et Anaïs
    
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


