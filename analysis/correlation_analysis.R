# correlation_analysis.R
library(readr)
library(dplyr)

factor_data <- read_csv("R_factor_data.csv", show_col_types = FALSE)

cor_factor_data <- cor(factor_data, use = "pairwise.complete.obs")
cor_species <- cor_factor_data["SpeciesDiversity", ]
cor_species <- cor_species[names(cor_species) != "SpeciesDiversity"]

most_impactful_factor <- names(which.max(abs(cor_species)))

cat("Most impactful factor:", most_impactful_factor, "\n")
# Trigger test
