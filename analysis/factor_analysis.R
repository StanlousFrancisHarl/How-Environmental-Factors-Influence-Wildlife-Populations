# factor_analysis.R
library(readr)
library(psych)
library(GPArotation)

# Load dataset
factor_data <- read_csv("data/R_factor_data.csv", show_col_types = FALSE)

# Factor analysis
num_factors <- 2
EFA_model <- fa(factor_data, nfactors = num_factors)

# Ensure output folder exists
if (!dir.exists("output")) dir.create("output")

# Save loadings
write.csv(EFA_model$loadings[], "output/factor_loadings.csv")

# Save summary
sink("output/factor_summary.txt")
print(EFA_model)
sink()

# Print to logs
cat("Number of factors extracted:", num_factors, "\n")

# Exit cleanly
quit(save = "no")
