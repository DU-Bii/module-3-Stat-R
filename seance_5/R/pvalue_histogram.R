#' @title draw a P-value histogram and return estimations of proportions of cases respectively under H0 and H1.
#' @author Jacques van Helden
#' @param Pvalues a vector of P-values. 
#' Must include all the p-values computed during a multiple testing, 
#' and can by no way be restricted to a selection of the significant ones.
#' @param main="Distribution of P-values" main title for the histogram
#' @param alpha=NULL if speficied, indicate the number of genes passing this p-value threshold
#' @param bins=20 number of class intervals in the histogram
#' @param ... other parameters are passed to hist()
#' @export
PvalueHistogram <- function(Pvalues, 
                            main = "Distribution of P-values", 
                            alpha = NULL,
                            lambda = 0.5,
                            bins = 20,
                            ...) {
  breaks <- seq(from = 0, to = 1, by = 1/bins)
  hist(Pvalues, breaks = breaks, col = "grey",
       main = main,
       xlab = "nominal P-value",
       ylab = "Number of genes",
       ...)
  
  ## Estimate the proportion of genes under H0 / H1 following the method from Storey-Tibshirani (2003)
  pval.stat <- list()
  pval.stat$N <- length(Pvalues)
  pval.stat$m0 <- sum(Pvalues >= parameters$lambda) / parameters$lambda
  pval.stat$m1 <- pval.stat$N - pval.stat$m0
  pval.stat$pi0 <- pval.stat$m0 / pval.stat$N
  pval.stat$pi1 <- 1 - pval.stat$pi0
  # t(as.data.frame(pval.stat))
  
  
  ## Display the indicators
  legend.text <- c(
    paste("N = ", prettyNum(big.mark = ",", pval.stat$N)),
    paste("m0 = ", prettyNum(big.mark = ",", pval.stat$m0)),
    paste("m1 = ", prettyNum(big.mark = ",", pval.stat$m1)),
    paste("pi0 = ", signif(digits = 2, pval.stat$pi0)),
    paste("pi1 = ", signif(digits = 2, pval.stat$pi1))
  )
  if (!is.null(alpha)) {
    pval.stat$alpha <- alpha
    pval.stat$positives <- sum(Pvalues < alpha)
    legend.text <- append(
      legend.text, 
      c(paste("alpha = ", signif(digits = 2, pval.stat$alpha)),
        paste("positives = ", pval.stat$positives)))
  }  
  
  legend("topright", legend = legend.text)
  
  ## Draw horizontal line to denote cases under H1
  abline(h = pval.stat$m0 / bins, col="blue")
  
  ## Return stats
  return(pval.stat)  
}
