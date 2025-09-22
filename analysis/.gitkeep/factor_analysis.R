# factor_analysis.R
library(readr)
library(psych)
library(GPArotation)

factor_data <- read_csv("R_factor_data.csv", show_col_types = FALSE)

cor_factor_data <- cor(factor_data, use = "pairwise.complete.obs")

scree(cor_factor_data, factors = FALSE)

num_factors <- 2
EFA_model <- fa(factor_data, nfactors = num_factors)

cat("Number of factors extracted:", num_factors, "\n")
print(EFA_model)
