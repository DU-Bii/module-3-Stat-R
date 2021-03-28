# Machine-learning with  Breast Invasive Cancer transcriptome data

## Introduction

This tutorial/practical aims at providing a first survey of machine-learning methods (clustering and supervised classification) based on an illustrative study case: the transcriptomic RNA-seq for a cohort of Breast Invasive Cancer from [The Cancer Genome Atlas](https://cancergenome.nih.gov/). 

## Course structure

1. Data loading and exploration: [[html](tutorials/machine-learning_TCGA-BIC/01_data-loading_TCGA-BIC.html)] [[Rmd](tutorials/machine-learning_TCGA-BIC/01_data-loading_TCGA-BIC.Rmd)]

2. Clustering

3. Functional enrichment of gene clusters

4. Supervised classification


## Publications

- The Cancer Genome Atlas Network, Comprehensive molecular portraits of human breast tumours, Nature. 490 (2012) 61–70. <https://doi.org/10.1038/nature11412>.

- G. Ciriello *et al.* (2015). Comprehensive Molecular Portraits of Invasive Lobular Breast Cancer, Cell. 163: 506–519. <https://doi.org/10.1016/j.cell.2015.09.033>.

## Data preprocessing

We downloaded the TCGA raw counts from the Recount2 database, and applied the following preprocessing steps:

1. select the samples belonging to the Breast Invasive Cancer (BIC) study;
2. define the cancer type (used as class label for supervised classification) based on the three immuno markers;
3. filter out "undetected" genes, i.e. genes having zero counts in almost all samples;
4. library size standardisation;
5. log2-transform of the counts;
6. detection of differentially expressed genes 
7. selection of a reduced subset of genes (likely to be relevant for clustering and supervised classification) by keeping the 1000 genes having the lowest adjusted p-value in differential expression analysis;
8. exported the different results (raw counts, filtered, normalised, differentially expressed) in TSV files.

The preprocessing was done with an R markdown file, which enables anyone to reproduce the results and understand each step. 


- Study case description: [TCGA BIC study case](https://du-bii.github.io/study-cases/Homo_sapiens/TCGA_study-case/)

- Pre-processing report: [import_TCGA_from_Recount.html](https://du-bii.github.io/study-cases/Homo_sapiens/TCGA_study-case/import_TCGA_from_Recount.html)

- R markdown: [import_TCGA_from_Recount.Rmd](https://raw.githubusercontent.com/DU-Bii/study-cases/master/Homo_sapiens/TCGA_study-case/import_TCGA_from_Recount.Rmd)




