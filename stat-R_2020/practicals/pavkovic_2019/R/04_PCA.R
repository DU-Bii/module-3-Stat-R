#### Analyse the covariance, correlation and PCA ####

## This script assumes that the script 01_reload_data.R has ben run to load the data from Pavkovic 2019

# data.folder <- "./data/hbc-MouseKidneyFibrOmics-a39e55a/tables/puuo/results/counts"
# uuo_prot.expr.file <- file.path(data.folder, "uuo_model_counts.csv")
# uuo_prot.expr <- read.csv(file = uuo_prot.expr.file, header = TRUE)
# uuo_prot.expr.transposed <- t(uuo_prot.expr)


## Choose the non-normalised filtered log2 data to play with
x <- log2Filtered 
dim(x) # Check the dimensions
colnames(x) ## Check the sample names
head(x)
View(x)

#### Compute the different between-sample (dis)similarity metrics  ####
sampleDist <- dist(t(x), method = "euclidian")
print(sampleDist)
heatmap(as.matrix(sampleDist))

sampleCov <- cov(x)
dim(sampleCov) ## Check the dimensions

## Classical Pearson's correlation correlation between each pair of sample
samplePearsonCor <- cor(x, method = "pearson")
print(samplePearsonCor)

sampleSpearmanCor <- cor(x, method = "spearman")
print(sampleSpearmanCor)

dim(sampleSpearmanCor)


#### PCA ####
library("FactoMineR")
library("factoextra")

PCA(x, scale.unit = TRUE, ncp = 6, graph = TRUE)

