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


# Histogram
hist(unlist(log2Filtered), breaks=100)

## If this si fine you can go to the next sections of this script

####  Compute feature-wise descriptive statistics #####

## Compute the mean of each feature

meanPerFt <- apply(X = x, MARGIN = 1, FUN = mean)
class(meanPerFt)
head(meanPerFt)
hist(meanPerFt, 
     breaks = 100, 
     main = paste(parameters$datatype, parameters$dataset, "\n", "mean per feature"), 
     xlab = "log2(values)")


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

## I start again, in order to get the features in a meaningful order

## Estimator of central tendency
featureStat <- data.frame(
  mean = apply(X = x, MARGIN = 1, FUN = mean),
  median = apply(X = x, MARGIN = 1, FUN = median)
)

## Estimators of dispersion
featureStat$sd <- apply(X = x, MARGIN = 1, FUN = sd)
featureStat$IQR <- apply(X = x, MARGIN = 1, FUN = IQR)
featureStat$var <- apply(X = x, MARGIN = 1, FUN = var)

## Milestones percentiles
featureStat$min <- apply(X = x, MARGIN = 1, FUN = min)
featureStat$p05 <- apply(X = x, MARGIN = 1, FUN = quantile, prob = 0.05)
featureStat$p25 <- apply(X = x, MARGIN = 1, FUN = quantile, prob = 0.25)
featureStat$p75 <- apply(X = x, MARGIN = 1, FUN = quantile, prob = 0.75)
featureStat$p90 <- apply(X = x, MARGIN = 1, FUN = quantile, prob = 0.90)
featureStat$max <- apply(X = x, MARGIN = 1, FUN = max)

## Some representative plots
xmin <- floor(min(x))
xmax <- ceiling(max(x))
par(mfrow = c(3,2))
hist(featureStat$mean, breaks = 100, main = paste(parameters$datatype, parameters$dataset, "\n", "mean"), xlab = "log2(value)", xlim = c(xmin, xmax))
hist(featureStat$median, breaks = 100, main = "median", xlab = "log2(value)", xlim = c(xmin, xmax))
hist(featureStat$min, breaks = 100, main = "min", xlab = "log2(value)", xlim = c(xmin, xmax))
hist(featureStat$max, breaks = 100, main = "max", xlab = "log2(value)", xlim = c(xmin, xmax))
hist(featureStat$sd, breaks = 100, main = "sd", xlab = "log2(value)")
hist(featureStat$var, breaks = 100, main = "var", xlab = "log2(value)")
par(mfrow = c(1,1))

#### Mean versus median plot ####

## As simple as possible
plot(featureStat$mean, featureStat$median)

## A bit more readable
## We use the function densCols to color features according to the local density.
plot(x = featureStat$mean, 
     y = featureStat$median,
     las = 1,
     col = densCols(x = featureStat$mean, 
                    y = featureStat$median),
     main = paste(parameters$datatype, parameters$dataset, "\n", "Mean versus median"),
     xlab = "mean",
     ylab = "median")
grid()
abline(a = 0, b = 1)

#### Mean versus variance plot ####
plot(x = featureStat$mean, 
     y = featureStat$var,
     las = 1,
     col = densCols(x = featureStat$mean, 
                    y = featureStat$var),
     main = paste(parameters$datatype, parameters$dataset, "\n", "Mean versus var"),
     xlab = "mean",
     ylab = "var")
grid()


#### Mean versus standard deviation plot ####
plot(x = featureStat$mean, 
     y = featureStat$sd,
     las = 1,
     col = densCols(x = featureStat$mean, 
                    y = featureStat$sd),
     main = paste(parameters$datatype, parameters$dataset, "\n", "Mean versus standard deviation"),
     xlab = "mean",
     ylab = "sd")
grid()


#### Standard deviation versus variance plot ####
## This is trivial: the SD is the square root of the variance
plot(x = featureStat$sd, 
     y = featureStat$var,
     las = 1,
     col = densCols(x = featureStat$sd, 
                    y = featureStat$var),
     main = paste(parameters$datatype, parameters$dataset, "\n", "Standard deviation versus var"),
     xlab = "sd",
     ylab = "var")
grid()


#### Standard deviation versus variance plot ####
## This is trivial: the SD is the square root of the variance
plot(x = featureStat$sd, 
     y = featureStat$var,
     las = 1,
     col = densCols(x = featureStat$sd, 
                    y = featureStat$var),
     main = paste(parameters$datatype, parameters$dataset, "\n", "Standard deviation versus var"),
     xlab = "sd",
     ylab = "var")
grid()

#### Standard deviation versus IQR plot ####
plot(x = featureStat$sd, 
     y = featureStat$IQR,
     las = 1,
     col = densCols(x = featureStat$sd, 
                    y = featureStat$IQR),
     main = paste(parameters$datatype, parameters$dataset, "\n", "Standard deviation versus IQR"),
     xlab = "sd",
     ylab = "IQR")
grid()

## Note: the IQR of a normal distribution is ~1.35 whereas the standard dev is 1
normIQR <- qnorm(p = 0.75) - qnorm(p = 0.25)
message("Standard normal IQR = ", normIQR)
abline(a = 0, b = normIQR)


## Check what it gives with normal data
z <- data.frame(matrix(nrow = 8000, ncol = 10, rnorm(800000)))
zSD <- apply(z, 1, sd)
zIQR <- apply(z, 1, IQR)

#### Standard deviation versus IQR plot ####
plot(x = zSD, 
     y = zIQR,
     las = 1,
     col = densCols(x = zSD, 
                    y = zIQR),
     main = paste("rnorm data", "\n", "Standard deviation versus IQR"),
     xlab = "sd",
     ylab = "IQR")
grid()
abline(a = 0, b = normIQR)
points(median(zSD), median(zIQR))
