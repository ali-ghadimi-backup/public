library(dplyr)
library(ggplot2)


CDF_LD <- function(x) {exp(x)/(1+exp(x))}

# Polt CDF 

ggplot(data.frame(x=c(-4, 4)), aes(x)) + 
  stat_function(fun=CDF_LD) + geom_vline(xintercept = 2,color = "red", size=.25) + geom_vline(xintercept = -2, color = "red", size=.25) + labs(y = "CDF") + 
  geom_hline(yintercept = CDF_LD(2), color = "blue", size=.25) + 
  geom_hline(yintercept = CDF_LD(-2), color = "green", size=.25) + labs(title = "The Logistic distribution CDF -4<x<4", y = "CDF")

PDF_LD <- function(x) { y <- exp(x)/((1+exp(x))^2)}

# Plot PDF

ggplot(data.frame(x=c(-4, 4)), aes(x)) + stat_function(fun=PDF_LD) + geom_vline(xintercept = 2, 
                                                                                color = "red", size=.25) + geom_vline(xintercept = -2, 
                                                                                                                      color = "red", size=.25) + labs(title = "The Logistic distribution PDF -4<x<4", y = "PDF")


#Finding Probability Using CDF
prob_by_CFD <- CDF_LD (2) - CDF_LD (-2)

# Finding Probability Using PDF integration method

prob_by_PDF <- (-(1+exp(2))^(-1)+(1+exp(-2))^(-1))

prob_by_CFD
prob_by_PDF


# The difference is:

prob_by_PDF - prob_by_CFD

# Now they are equal (True)

round(prob_by_CFD, 6) == round(prob_by_PDF, 6)


