---
title: "Start R -- First steps with R and RStudio"
author: "Claire Vandiedonck & Jacques van Helden"
date: "2020-03-04"
output:
  slidy_presentation:
    font_adjustment: 0   ## set to negative/positive values for smaller/bigger fonts
    duration: 45
    self_contained: no
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
    self_contained: true
    css: ../../slides.css
  html_document:
    self_contained: no
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
  ioslides_presentation:
    self_contained: no
    css: slides.css
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





## Connection to IFB RStudio server

In a Web browser, open a connection to the IFB RStudio server

<https://rstudio.cluster.france-bioinformatique.fr/>

This requires your login and password. 

Check the version of R and of loaded packages.

```r
## Print info about the session
sessionInfo()
```

```
R version 3.6.2 (2019-12-12)
Platform: x86_64-apple-darwin13.4.0 (64-bit)
Running under: macOS Mojave 10.14.6

Matrix products: default
BLAS/LAPACK: /Users/jvanheld/miniconda3/envs/rsat-core-2020.02.29/lib/libopenblasp-r0.3.8.dylib

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] knitr_1.28

loaded via a namespace (and not attached):
 [1] compiler_3.6.2  magrittr_1.5    tools_3.6.2     htmltools_0.4.0 yaml_2.2.1      Rcpp_1.0.3      stringi_1.4.6   rmarkdown_2.1   stringr_1.4.0   xfun_0.12       digest_0.6.25   rlang_0.4.4     evaluate_0.14  
```



# Navigating in your folders


## Where am I?


```r
## Where am I now?
getwd()

## Where is my home?
Sys.getenv("HOME")

## Who am I?
Sys.getenv("LOGNAME")

## Go home
setwd(Sys.getenv("HOME"))
setwd("~")  ## An easier way
```

### Explanations

- `Sys.getenv()` returns all the environment variables
- `$HOME` is a Unix variable environment indicating the home directory
- `$LOGNAME` is my login name (did you guess?)
- in Unix, `~` denotes your home directory (equivalent to `$HOME`)


## Defining a specific directory for this session

We will create specific directory to store the data and results of the practicals for this course.
For this we use the function `file.path()` to concatenate subfolders. 


```r
## Define the directory for this course
courseDir <- file.path("~", "dubii20", "stat-R", "session1")
print(courseDir) ## Check the result
```


## Creating a directory for this session

Use the command `dir.create()` to create the directory defined`courseDir` defined in the previous slide. 


```r
## Create the directory
dir.create(courseDir) ## THIS WILL LIKELY NOT WORK
```

The above command returned an error. Do you understand why?
If not read the help page and find a way to solve the problem. 


```r
help(dir.create )
```


## Creating a directory for this session

**Solution:**

- The command `dir.create()` refused to create a subdirectory (`session1`) because its parent directories (`dubii2020` and `stat-R`) did not exist.
- We can use the option `recursive= TRUE` to create.


```r
## Create the directory with the recursive option
dir.create(path = courseDir, recursive = TRUE)
```
Now, re-run the same command and checl the result. 



```r
## Create the directory with the recursive option
dir.create(path = courseDir, recursive = TRUE)
```

## Creating a directory for this session


```r
## Create the directory with the recursive option
dir.create(path = courseDir, 
           recursive = TRUE, ## Create the parent directories
           showWarnings = FALSE) ## Don't shout it already exists

## Go to this directory
setwd(courseDir)
getwd() ## Check that you are in the right place
```



## Load the data for this course

Data and files are stored on the cluster in the directory `/shared/projects/dubii2020/data/module3/seance1/`

We will download the data `Prerequis.RData`  that you saved during the prerequisites session.


```r
## Define the path of the files
data_path <- "/shared/projects/dubii2020/data/module3/seance1/"
print(data_path) ## Check the result

## Load the data from this path
load(paste(data_path, "Prerequis.RData", sep=""))

## List the data you have dowloaded, check their struture and keep in your session only the three vectors called size, weight and bmi as well as the matrix called myData2
ls()

## to complete...
```

Finally, open the script `DUBii_R_Session1.R` stored in the same directory as the data.
