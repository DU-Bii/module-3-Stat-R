#### Select features based on different criteria ####

## Check the parameters
as.data.frame(parameters)

## This script assumes that the script 01_reload_data.R has ben run to load the data from Pavkovic 2019
x <- log2Filtered ## I choose this datase
n <- 500 # Number of features to work with


## Compute feature-wise statistics
featureStat <- data.frame(
  mean = apply(x, 1, mean)
)
head(featureStat)

featureStat$median <- apply(x, 1, median)

## Compare mean and median
plot(featureStat[, c("mean", "median")])

## Improve the plot
plot(featureStat[, c("mean", "median")],
     main = paste(parameters$datatype, parameters$dataset),
     panel.first=grid(), col = "#888888")
abline(a = 0, b = 1, col = "black")


featureStat$sd <- apply(x, 1, sd)
featureStat$var <- apply(x, 1, var)


## Select features havin the highest variances
hist(featureStat$var, breaks=200)

## Order returns the indices of the values by increasing or decreasing order of the values
highestVar <- order(featureStat$var, decreasing = TRUE)[1:500]
lowestVar <- order(featureStat$var, decreasing = FALSE)[1:500]
mean(featureStat$var[highestVar])
mean(featureStat$var[lowestVar])

#### Box plot of the standardized values ####
par(mar = c(5,6,4,1)) ## tune the plot margins to display the full labels
boxplot(log2Standardized, horizontal = TRUE, 
        las = 1, col = metadata$color,
        xlab = "log2(valueà)",
        main = paste(parameters$datatype, parameters$dataset, "filtered"))
par(mar = c(5.1,4.1, 5.1, 2.1)) ## Restore default plot mrgins
