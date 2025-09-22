# survival_analysis.R
library(readr)
library(survival)
library(survminer)
library(dplyr)
library(broom)

# Load dataset
survival_data <- read_csv("data/R_survival_data.csv", show_col_types = FALSE)

# Fit survival model
survival_fit <- survfit(Surv(Survival_Time, Censoring_Status) ~ Habitat, data = survival_data)
survival_fit_df <- tidy(survival_fit)

# Find habitat with lowest survival at ~400
time_target <- 400
survival_fit_df$Habitat <- gsub("Habitat=", "", survival_fit_df$strata)
survival_fit_df$time_diff <- abs(survival_fit_df$time - time_target)

closest_times <- survival_fit_df %>%
  group_by(Habitat) %>%
  filter(time_diff == min(time_diff)) %>%
  ungroup()

low_surv_row <- closest_times[which.min(closest_times$estimate), ]
low_surv_habitat <- as.character(low_surv_row$Habitat)

# Ensure output folder exists
if (!dir.exists("output")) dir.create("output")

# Save results
write.csv(survival_fit_df, "output/survival_fit.csv")
writeLines(paste("Lowest survival habitat at ~400:", low_surv_habitat),
           "output/survival_summary.txt")

# Save plot
png("output/survival_plot.png", width = 800, height = 600)
print(ggsurvplot(survival_fit, data = survival_data))
dev.off()

# Print to logs
cat("Habitat with lowest survival probability at ~400:", low_surv_habitat, "\n")

# Exit cleanly
quit(save = "no")

# Trigger survival test
