#### Reload the data from memory image ####

datatype <- "proteome"
dataset <- "fa"


#### Define the path of the shared data dir ###

## Beware, the following row works only if you are logged in the IFB core cluster. 
## If not see the next comment. 
sharedDir <- "/shared/projects/dubii2020/data/module3/seance5"

## Note: if you are working on your own computer, you can download the memory image files from here 
## https://github.com/DU-Bii/module-3-Stat-R/tree/master/stat-R_2020/practicals/pavkovic_2019/memimages
## - click on the file of your choice
## - click Download
## - adapt the sharedDir to specify the location of folder containing the memory image on your computed

## List the files available in the shared data dir
list.files(sharedDir)

memFile <- file.path(sharedDir, 
                     paste0("pavkovic2019_", 
                            datatype,"_",
                            dataset, "_memimage.Rdata"))

## Load the memory image file
load(memFile)


## Check the parameters
print(as.data.frame(parameters))

## We now dispose of the following tables, corresponding to the different steps of the pre-processing
# - rawValues: raw values
# - log2Values: log2-transformed values
# - log2Filtered: filtered out the undetected features
# - log2MedianCentered: median-based sample-wise centering
# - log2Standardized: median-based centering and IQR-based scaling
## We will have to choose the appropriate data types depending on our purposes


