---
title: "Differential analysis of proteomics data"
author: "Jacques van Helden"
date: "2020-03-08"
output:
  html_document:
    self_contained: no
    code_folding: hide
    fig_caption: yes
    fig_height: 6
    fig_width: 7
    highlight: tango
    incremental: no
    keep_md: yes
    smaller: yes
    theme: cerulean
    toc: yes
    toc_depth: 3
    toc_float: yes
    widescreen: yes
  beamer_presentation:
    colortheme: dolphin
    fig_caption: yes
    fig_height: 6
    fig_width: 7
    fonttheme: structurebold
    highlight: tango
    incremental: no
    keep_tex: no
    slide_level: 2
    theme: Montpellier
    toc: yes
  pdf_document:
    fig_caption: yes
    highlight: zenburn
    toc: yes
    toc_depth: 3
  revealjs::revealjs_presentation:
    theme: night
    transition: none
    self_contained: no
    code_folding: hide
    css: ../../slides.css
  slidy_presentation:
    font_adjustment: 0   ## set to negative/positive values for smaller/bigger fonts
    duration: 45
    self_contained: no
    code_folding: hide
    fig_caption: yes
    fig_height: 6
    fig_width: 7
    highlight: tango
    incremental: no
    keep_md: yes
    smaller: yes
    theme: cerulean
    toc: yes
    widescreen: yes
  ioslides_presentation:
    self_contained: no
    code_folding: hide
    css: ../../slides.css
    fig_caption: yes
    fig_height: 6
    fig_width: 7
    highlight: tango
    smaller: yes
    toc: yes
    widescreen: yes
font-import: http://fonts.googleapis.com/css?family=Risque
subtitle: DUBii -- Statistics with R
font-family: Garamond
transition: linear
---



## Data sources

Study case: 

- Stare, T., Ramšak, Ž., Križnik, M. et al. Multiomics analysis of tolerant interaction of potato with potato virus Y. Sci Data 6, 250 (2019). https://doi.org/10.1038/s41597-019-0216-1 (<https://www.nature.com/articles/s41597-019-0216-1>)

- The metadata and data area available on the PRIDE database (<https://www.ebi.ac.uk/pride/archive/projects/PXD015221>).

- The data was downloaded from the FTP site (<ftp://ftp.pride.ebi.ac.uk/pride/data/archive/2019/09/PXD015221>). 




## Data loading

### Data location


```r
## Local dir containing the data
dataDir <- "data"
# list.files(dataDir)

## Data file (table of protein quantifications)
data.file <- "ProteomeDiscoverer_Multiconsensus_from_18_Reports_PEP_INFO_protein-table.csv"

## Metadata file (sample descriptions)
metadata.file <- "Metadata_sample_names.csv" 
```

### Load and check the metadata


```r
## Load metadata table
metadata <- read.csv(file = file.path(dataDir, metadata.file))
# View(metadata)
# names(metadata)

# Select the relevant columns for our analysis
fields <- c("proteomicsPool", 
            "Genotype",
            "Treatment", 
            "BiosampleName")
poolDescriptions <- unique(metadata[, fields])
# dim(poolDescriptions)
# View(poolDescriptions)

poolNames <- as.vector(poolDescriptions$proteomicsPool)

## Define pool condition as the combination of genotype + treatment
poolDescriptions$condition <- paste(
  sep = "_", 
  poolDescriptions$Genotype,
  poolDescriptions$Treatment)

## Suppress the leadin "D-", which is found everywhere and this not informative
poolDescriptions$condition <- sub(pattern = "^D-", replacement = "", x = poolDescriptions$condition)

## Build informative labels for the pools
poolLabels <- paste(sep = "_", 
                    poolDescriptions$condition,
                    poolDescriptions$proteomicsPool)
poolLabels <- sub(pattern = "_pool", replacement = "_", x = poolLabels)
names(poolLabels) <- poolNames # use poolNames as indices

## Assign the pool labels as rownames for the metadata
rownames(poolDescriptions) <- poolLabels

## Define condition-specific colors
conditions <- sort(unique(poolDescriptions$condition))
conditionColors <- rainbow(n = length(conditions))
names(conditionColors) <- conditions

## Assign a color to each pool according to its condition
poolDescriptions$color <- conditionColors[poolDescriptions$condition]
```

The metadata table contains 36 rows, each describing one sample. However, samples were pooled by pairs for the proteomics analysis, so that the actual data contains 18 pools. The table below provides the description of the pools. 


```r
kable(poolDescriptions, caption = "Description of the sample pools.")
```



Table: Description of the sample pools.

              proteomicsPool   Genotype   Treatment   BiosampleName                                                                               condition   color     
------------  ---------------  ---------  ----------  ------------------------------------------------------------------------------------------  ----------  ----------
COI_MOCK_1C   pool1C           D-COI      MOCK        Potato sample (Désirée-COI); 4 days post mechanical treatment; bottom treated leaf          COI_MOCK    #FF0000FF 
COI_MOCK_2C   pool2C           D-COI      MOCK        Potato sample (Désirée-COI); 4 days post mechanical treatment; bottom treated leaf          COI_MOCK    #FF0000FF 
COI_MOCK_3C   pool3C           D-COI      MOCK        Potato sample (Désirée-COI); 4 days post mechanical treatment; bottom treated leaf          COI_MOCK    #FF0000FF 
COI_PVY_4C    pool4C           D-COI      PVY         Potato sample (Désirée-COI); 4 days post potato virus Y inoculation; bottom treated leaf    COI_PVY     #FFFF00FF 
COI_PVY_5C    pool5C           D-COI      PVY         Potato sample (Désirée-COI); 4 days post potato virus Y inoculation; bottom treated leaf    COI_PVY     #FFFF00FF 
COI_PVY_6C    pool6C           D-COI      PVY         Potato sample (Désirée-COI); 4 days post potato virus Y inoculation; bottom treated leaf    COI_PVY     #FFFF00FF 
NAHG_MOCK_9   pool9            D-NAHG     MOCK        Potato sample (Désirée-NahG); 4 days post mechanical treatment; bottom treated leaf         NAHG_MOCK   #00FF00FF 
NAHG_MOCK_7   pool7            D-NAHG     MOCK        Potato sample (Désirée-NahG); 4 days post mechanical treatment; bottom treated leaf         NAHG_MOCK   #00FF00FF 
NAHG_MOCK_8   pool8            D-NAHG     MOCK        Potato sample (Désirée-NahG); 4 days post mechanical treatment; bottom treated leaf         NAHG_MOCK   #00FF00FF 
NAHG_PVY_3    pool3            D-NAHG     PVY         Potato sample (Désirée-NahG); 4 days post potato virus Y inoculation; bottom treated leaf   NAHG_PVY    #00FFFFFF 
NAHG_PVY_1    pool1            D-NAHG     PVY         Potato sample (Désirée-NahG); 4 days post potato virus Y inoculation; bottom treated leaf   NAHG_PVY    #00FFFFFF 
NAHG_PVY_2    pool2            D-NAHG     PVY         Potato sample (Désirée-NahG); 4 days post potato virus Y inoculation; bottom treated leaf   NAHG_PVY    #00FFFFFF 
WT_MOCK_10    pool10           D-WT       MOCK        Potato sample (Désirée); 4 days post mechanical treatment; bottom treated leaf              WT_MOCK     #0000FFFF 
WT_MOCK_12    pool12           D-WT       MOCK        Potato sample (Désirée); 4 days post mechanical treatment; bottom treated leaf              WT_MOCK     #0000FFFF 
WT_MOCK_11    pool11           D-WT       MOCK        Potato sample (Désirée); 4 days post mechanical treatment; bottom treated leaf              WT_MOCK     #0000FFFF 
WT_PVY_6      pool6            D-WT       PVY         Potato sample (Désirée); 4 days post potato virus Y inoculation; bottom treated leaf        WT_PVY      #FF00FFFF 
WT_PVY_4      pool4            D-WT       PVY         Potato sample (Désirée); 4 days post potato virus Y inoculation; bottom treated leaf        WT_PVY      #FF00FFFF 
WT_PVY_5      pool5            D-WT       PVY         Potato sample (Désirée); 4 days post potato virus Y inoculation; bottom treated leaf        WT_PVY      #FF00FFFF 

The data contains 3 replicates per condition, where a condition is a combination of a genotype (COI, NAHG or WT) and a treatment (MOCK or PVY).


```r
library(knitr)
kable(table(poolDescriptions[, c("Genotype", "Treatment")]), 
      caption = "Number of replicates per condition. Columns: treatment (MOCK or virus infection). Rows: genotype. ")
```



Table: Number of replicates per condition. Columns: treatment (MOCK or virus infection). Rows: genotype. 

          MOCK   PVY
-------  -----  ----
D-COI        3     3
D-NAHG       3     3
D-WT         3     3

### Loading the data table



```r
data <- read.csv(file = file.path(dataDir, data.file))
# names(data)
# head(data)

## Extract the quantities in a separat data table to facilitate the statistical analysis
proteinQuant <- data[, poolNames]
rownames(proteinQuant) <- data[, "Accession"]
# dim(proteinQuant)
# View(proteinQuant)

## Replace pool names by pool labels in the protein table
names(proteinQuant) <- poolLabels[names(proteinQuant)]
# View(proteinQuant)
```

The data table contains some descriptive columns, followed by  338 columns providing the quantities of 338 proteins (rows) in each sample pool (columns). 


## Distributions of quantities per sample

Draw a box plot of the protein quantities using `boxplot()` with its the default options. Then read the help page (`help(boxplot)`) and fine-tune the options to get a more informative result.  


```r
boxplot(proteinQuant)
```

<div class="figure" style="text-align: center">
<img src="figures/data-structures_boxplot_ugly-1.png" alt="Boxplot showing the distribution of counts per sample for all the detected proteins. The result is not readable, we will do better in the next fiugure. " width="80%" />
<p class="caption">Boxplot showing the distribution of counts per sample for all the detected proteins. The result is not readable, we will do better in the next fiugure. </p>
</div>


```r
## Store initial parameter values
initialParameters <- par(no.readonly = TRUE)
# par("mar")

## Modify the parameters
par(mar = c(4.1, 7, 1, 1))
par(mfrow = c(1, 2))
boxplot(proteinQuant, 
        col = poolDescriptions$color,
        xlab = "Raw counts",
        horizontal = TRUE, 
        cex.axis = 0.8,
        las = TRUE)
boxplot(log2(proteinQuant), 
        col = poolDescriptions$color,
        xlab = "log2(counts)",
        horizontal = TRUE, 
        cex.axis = 0.8,
        las = TRUE)
```

<div class="figure" style="text-align: center">
<img src="figures/data-structures_boxplot-1.png" alt="Boxplot showing the distribution of counts per sample for all the detected proteins" width="100%" />
<p class="caption">Boxplot showing the distribution of counts per sample for all the detected proteins</p>
</div>

```r
par(initialParameters)
```



```r
## Store initial parameter values
initialParameters <- par(no.readonly = TRUE)
# par("mar")

## Modify the parameters
par(mar = c(4.1, 7, 1, 1))
par(mfrow = c(1, 2))
vioplot(proteinQuant, 
        col = poolDescriptions$color,
        xlab = "Raw counts",
        horizontal = TRUE, 
        cex.axis = 0.8,
        las = TRUE)
vioplot(log2(proteinQuant), 
        col = poolDescriptions$color,
        xlab = "log2(counts)",
        horizontal = TRUE, 
        cex.axis = 0.8,
        las = TRUE)
```

<div class="figure" style="text-align: center">
<img src="figures/data-structures_vioplot-1.png" alt="Violin showing the distribution of counts per sample for all the detected proteins" width="100%" />
<p class="caption">Violin showing the distribution of counts per sample for all the detected proteins</p>
</div>

```r
par(initialParameters)
```


## Multidimensional scaling with PCA

A first exploratory approach is to project the samples on a 2-dimensional plane, where the distance between samples approximately corresponds to the differences between their proteomics profiles. 


