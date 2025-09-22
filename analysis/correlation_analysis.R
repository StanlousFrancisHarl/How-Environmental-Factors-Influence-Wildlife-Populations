# correlation_analysis.R
library(readr)
library(dplyr)

# Load dataset (correct path inside data/)
factor_data <- read_csv("data/R_factor_data.csv", show_col_types = FALSE)

# Correlation analysis
cor_factor_data <- cor(factor_data, use = "pairwise.complete.obs")
cor_species <- cor_factor_data["SpeciesDiversity", ]
cor_species <- cor_species[names(cor_species) != "SpeciesDiversity"]

most_impactful_factor <- names(which.max(abs(cor_species)))

# Ensure output folder exists
if (!dir.exists("output")) dir.create("output")

# Save detailed results
write.csv(cor_species, "output/correlation_species.csv")

# Save summary
writeLines(paste("Most impactful factor:", most_impactful_factor),
           "output/correlation_summary.txt")

# Print to logs
cat("Most impactful factor:", most_impactful_factor, "\n")

# Ensure R exits cleanly
quit(save = "no")

# Run
