## Data file naming

This folder contains data and metadata files from the following study. 

- Pavkovic, M., Pantano, L., Gerlach, C.V. et al. Multi omics analysis of fibrotic kidneys in two mouse models. Sci Data 6, 92 (2019) <https://doi.org/10.1038/s41597-019-0095-5>

The original data was downloaded from Zenodo (<https://zenodo.org/record/2592516>).


The files are formated as tab-separated values (tsv) and named according to the following convention:

- the prefix indicate the data type

    - **fa**: folic acid induced nephropathy (reversible), transcriptome data
    - **pfa**: folic acid induced nephropathy, proteome data
    - **uuo**: unilateral uretral obstruction (irreversible), transcriptome data
    - **puuo**: unilateral uretral obstruction, proteome data

- The suffix indicates the data  normalisation

    - **raw**: transcriptome counts provided by the authors (note: not integer, because their raw data was already somehow normalized)
    - **normalized¨**: transcriptome counts standardized to achieve the same third quartile for each sample
    - **log2**: log2 transformation for proteome data
    
- the  **metadata** files contain a short description of each sample (one row per sample). Note that the last column contains a sample-specific color specification in [hexadecimal web color code](https://en.wikipedia.org/wiki/Web_colors#Hex_triplet) to facilitate the drawings. Don't hesitate to chose [other colors](https://htmlcolorcodes.com/) according to your personal taste. 
