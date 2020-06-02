#### Reload the data from memory image ####

datatype <- "transcriptome"
dataset <- "fa"

## Define the path of the shared data dir
sharedDir <- "/shared/projects/dubii2020/data/module3/seance5"

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
