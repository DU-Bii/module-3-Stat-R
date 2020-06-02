#### Solutions: practical about data exploration ####


## Data loading

## We now dispose of the following tables, corresponding to the different steps of the pre-processing
# - rawValues: raw values
# - log2Values: log2-transformed values
# - log2Filtered: filtered out the undetected features
# - log2MedianCentered: median-based sample-wise centering
# - log2Standardized: median-based centering and IQR-based scaling
## We will have to choose the appropriate data types depending on our purposes

## Choose one data type and copy it to a variable named x
x <- log2Filtered

## Check the dimensions

dim(x)
names(x)
head(x)
View(x)

####  Compute feature-wise descriptive statistics #####

## Compute the mean of each feature

meanPerFt <- apply(X = x, MARGIN = 1, FUN = mean)
class(meanPerFt)
head(meanPerFt)
hist(meanPerFt, breaks = 100, "mean per feature", xlab = "log2(values)")


varPerFt <- apply(X = x, MARGIN = 1, FUN = var)

## Mean-variance plot
plot(meanPerFt, varPerFt)

## Create a data frame with one row per feature and one column per statistics
featureStat <- data.frame(
  mean = apply(X = x, MARGIN = 1, FUN = mean),
  var = apply(X = x, MARGIN = 1, FUN = var)
)
featureStat$sd <- apply(X = x, MARGIN = 1, FUN = sd)

dim(featureStat)
names(featureStat)

head(featureStat)

## A vous de jouer : add columns to featureStat with the different statistics
## IQR(), min(), p05, p25, median(), p75, p95, max()

## Tip: compute the percentile with function quantile()

