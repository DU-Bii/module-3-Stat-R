####  Parameters #####

## Population parameters
mu1 <- 10
mu2 <- 10
sigma1 <- 2
sigma2 <- 3

## Sample sizes
n1 <- 8
n2 <- 8

## Number of features
m <- 1e4 
## Antoine's trick: : use eng notation to avoid spending hours to count the zeros

#### Generate a table with random normal data ####

## Sampling from the first population
## Tip: we go very progressively for didactic purposes
randVector <- rnorm(n = m * n1, mean = mu1, sd = sigma1) 
randMatrix <- matrix(data = randVector, nrow = m, ncol = n1)
group1 <- data.frame(randMatrix)
# hist(randVector, breaks = 100)

## Name the rows and columns
rownames(group1) <- paste(sep = "", "ft", 1:m)
colnames(group1) <- paste0("g1s", 1:n1)
# head(group1)

## Sampling from the second population
group2 <- data.frame(
  matrix(data = rnorm(n = m * n2, 
                      mean = mu2, 
                      sd = sigma2), 
         nrow = m, ncol = n2))
rownames(group2) <- paste0("ft", 1:m)
colnames(group2) <- paste0("g2s", 1:n2)
# head(group2)

#### Boxplot per column ####


## Live dangerously : use cbind()
# dataTable <- cbind(group1, group2)
# dim (dataTable)

## Safe life: use merge()
dataTable <- merge(x = group1, y = group2, by = "row.names")
rownames(dataTable) <- dataTable$Row.names
dataTable <- dataTable[, 2:ncol(dataTable)]
dim(dataTable)
# View(dataTable)


boxplot(dataTable, horizontal = TRUE, las = 1)

#### Craftwork approach of the hypothesis test #####

i <- 271 ## Choose arbitrarily the index of one feature
x1 <- group1[i, ] ## Select the corresponding samlple from population 1
x2 <- group2[i, ] ## Select the corresponding samlple from population 1

# ?t.test()
tTestResult <- t.test(x = x1, y = x2, 
                      alternative = "two.sided", 
                      var.equal = FALSE)
# View(tTestResult)
resultVector <- c(tTestResult$statistic,
                  tTestResult$parameter,
                  "pValue" = tTestResult$p.value)






