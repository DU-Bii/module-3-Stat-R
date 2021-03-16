#### Principal Component Analysis ####

## This script assumes that the script 01_reload_data.R has ben run to load the data from Pavkovic 2019

## Load libraries
library("FactoMineR")
library("factoextra")
library("corrplot")

## Check the parameters (should include the data type and dataset)
print(as.data.frame(parameters))

## Choose the non-normalised filtered log2 data to play with
x <- log2Filtered 
dim(x) # Check the dimensions
colnames(x) ## Check the sample names
head(x)

#### Compute the components ####
## Beware: the individuals should come as row --> we have to transpose the expression matrix
res.pca <- PCA(t(x), scale.unit = FALSE, ncp = ncol(x), graph = FALSE)

## Check the content of the resulting object
names(res.pca)

## Eigen values
res.pca$eig

## Variables versus components
head(res.pca$var$coord) ## Coordinates
head(res.pca$var$cor) ## Correlation
head(res.pca$var$cos2) ## Cos2 (squared correlation)
head(res.pca$var$contrib) ## Contribution of each variable to each component (loading ?)

## Cos2 is just the square of the correlation
head(res.pca$var$cos2) - head(res.pca$var$cor)^2

## The sum of squared correlations per variable must be 1
head(apply(res.pca$var$cos2, 1, sum))


## Individuals versus components
res.pca$ind$coord ## Coordinates
res.pca$ind$cos2 ## squared correlation
res.pca$ind$contrib ## Contribution of each individual to each component (loading ?)
res.pca$ind$dist  ## ?

## The sum of cos2 per individual must be 1
apply(res.pca$ind$cos2, 1, sum)


#### Plot eigen values ####
fviz_eig(res.pca, addlabels = TRUE, ylim = c(0, 50), main = paste(parameters$datatype, parameters$dataset))

#### Plot projections of features on components 1 and 2 ####

## This is ugly because the variable names are maskoing everything
fviz_pca_var(res.pca, col.var = "black")

## Just plot points for the variables (features)
fviz_pca_var(res.pca, geom.var = "point")

## Add density colors
plot(x = res.pca$var$coord[,1], xlab = "PC1",
     y = res.pca$var$coord[,2], ylab = "PC2", 
     col = densCols(x = res.pca$var$coord[,1],
                    y = res.pca$var$coord[,2]))
grid()
abline(h = 0)
abline(v = 0)

## Plot PC3 vs PC4
plot(x = res.pca$var$coord[,3], xlab = "PC3",
     y = res.pca$var$coord[,4], ylab = "PC4", 
     col = densCols(x = res.pca$var$coord[,2],
                    y = res.pca$var$coord[,3]))
grid()
abline(h = 0)
abline(v = 0)


#### Plot  projections of individuals on components 1 and 2 ####
fviz_pca_ind(res.pca, col.var = "black")

#### Correlation plot ####
corrplot(res.pca$ind$cos2, is.corr=FALSE)

## Question: do you see a relationship between the components and the day ?

#### Plot individuals with cos2-proportional gradient ####
fviz_pca_ind(res.pca, 
             col.ind = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), ## Color gradient
             repel = TRUE # Avoid overlap between labels
)


#### Plot PC1 vs PC2 with condition-specific colors ####
fviz_pca_ind(res.pca, axes = c(1,2), 
             col.ind = metadata$condition,
             repel = TRUE # Avoid overlap between labels
)

#### Plot PC4 vs PC3 with condition-specific colors ####
fviz_pca_ind(res.pca, axes = c(3,4), 
             col.ind = metadata$condition,
             repel = TRUE # Avoid overlap between labels
)

#### Plot PC5 vs PC6 with condition-specific colors ####
fviz_pca_ind(res.pca, axes = c(5, 6), 
             col.ind = metadata$condition,
             repel = TRUE # Avoid overlap between labels
)

