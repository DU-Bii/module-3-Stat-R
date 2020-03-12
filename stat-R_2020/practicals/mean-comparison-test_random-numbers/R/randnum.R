####  Parameters #####

## Population parameters
mu1 <- 7
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


#### Define metadata table ####

## Instantiate a data.frame with the group corresponding to each individual
metaData <- data.frame(row.names = colnames(dataTable),
                       group = c(rep(x = "g1", length.out = n1),
                                 rep(x = "g2", length.out = n2)))

table(metaData$group)
## Add the replicate number
metaData$replicate <- c(1:n1, 1:n2)

## Associate a color to each group
groupColors <- c("g1" = "#BBDDFF", "g2" = "#FFDDBB")                         
metaData$color <- groupColors[as.vector(metaData$group)]

## Generate a verbosy description
metaData$description <- paste0("Group: ", metaData$group, 
                               ", replicate: ", metaData$replicate)


## Draw a beautiful boxplot
boxplot(dataTable, horizontal = TRUE, las = 1, col = metaData$color)

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

#### Declare a function ####
#' @title Run a t-test on random numbers
#' @author Jacques van Helden
#' @param n1=10 size of the first sample
#' @param n2=10 size of the second sample
#' @return a vector with the statistics of the test: t, p.value, df
RandNumTest <- function(n1, 
                        n2,
                        mu1 = 7,
                        mu2 = 10,
                        sigma1 = 2,
                        sigma2 = 3,
                        verbose = FALSE,
                        ...
                      ) {
  if (verbose) {
    message("Running random number test with n1 = ", n1, " and n2 = ", n2)
  }
  
  ## Print the message passed in the arguments
  x1 <- rnorm(n = n1, mean = mu1, sd = sigma1)
  x2 <- rnorm(n = n2, mean = mu2, sd = sigma2)
  
  
  testResult <- t.test(x1, x2, ...)
  
  m1 <- mean(x1)
  m2 <- mean(x2)
  d <-  m1 - m2
  resultVector <- c(
    m1 = m1,
    m2 = m2,
    d = d,
    t = testResult$statistic, 
    p.value = testResult$p.value, 
    df = testResult$parameter)
  return(resultVector)
}

## Store the column names in a vector, we will use it several times below
randNumColNames <- c("m1", "m2", "d", "t", "p.value", "df")


# RandNumTest() ## this fails
RandNumTest(n1 = 4, n2 = 7, var.equal = FALSE, alternative = "two.sided")
RandNumTest(n1 = 40, n2 = 70)


#### Run m tests (iterations) ####

## Define the number of tests
m <- 10000
iterationResults <- data.frame(matrix(nrow = m, ncol = 6))
colnames(iterationResults) <- randNumColNames

## Run m experiments and measure time with a loop (inefficient)
message("iterating the test ", m, " times")
iterationTime <- system.time(
  for (i in 1:m) {
    iterationResults[i, ] <- RandNumTest(n1 = 16, n2 = 16, mu1 = 7, mu2 = 10,
                                         var.equal = FALSE, alternative = "two.sided")
  }
)
print("Iteration time")
print(iterationTime)

## Slightly better: run the same test with replicate()
message("iterating the test ", m, " times")
replicateTime <- system.time(
  repTests <- replicate(
    n = m, 
    RandNumTest(n1 = 16, 
                n2 = 16, 
                mu1 = 7, 
                mu2 = 10, 
                var.equal = FALSE, 
                alternative = "two.sided")
  )
)
class(repTests) ## this is a matrix
dim(repTests)   ## m columns, one per test (feature)

repTests <- t(repTests) ## Transpose the result because the vectors were aggregated as columns
repTests <- data.frame(repTests) ## Convert the matrix into a data.frame
class(repTests)  ## now a data.frame
dim(repTests) ## we now have m rows, good !

rownames(repTests) <- paste0("r", 1:m) ## name the rows
colnames(repTests) <- randNumColNames  ## name the columns
head(repTests)
tail(repTests)
print("Time with replicate()")
print(replicateTime)

colnames(repTests)

## Draw the p-value histogram
hist(repTests$p.value, breaks = 20)

## Draw alpha
alpha <- 0.05
abline(v = alpha, col = "red")

## Volcano plot
