# survival_analysis.R
library(readr)
library(survival)
library(survminer)
library(dplyr)
library(broom)

survival_data <- read_csv("R_survival_data.csv", show_col_types = FALSE)

survival_fit <- survfit(Surv(Survival_Time, Censoring_Status) ~ Habitat, data = survival_data)
survival_fit_df <- tidy(survival_fit)

time_target <- 400
survival_fit_df$Habitat <- gsub("Habitat=", "", survival_fit_df$strata)
survival_fit_df$time_diff <- abs(survival_fit_df$time - time_target)

closest_times <- survival_fit_df %>%
  group_by(Habitat) %>%
  filter(time_diff == min(time_diff)) %>%
  ungroup()

low_surv_row <- closest_times[which.min(closest_times$estimate), ]
low_surv_habitat <- as.character(low_surv_row$Habitat)

ggsurvplot(survival_fit, data = survival_data)

cat("Habitat with lowest survival probability at ~400:", low_surv_habitat, "\n")
