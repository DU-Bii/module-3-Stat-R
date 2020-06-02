#### Select features based on different criteria ####

## This script assumes that the script 01_reload_data.R has ben run to load the data from Pavkovic 2019

n <- 500 # Number of features to work with

## Compute feature-wise statistics
featureStat <- as.data.frame()

## Top-ranking variance
