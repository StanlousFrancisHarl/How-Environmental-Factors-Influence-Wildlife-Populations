# How Environmental Factors Influence Wildlife Populations

This project explores how environmental factors shape wildlife populations using **R-based statistical methods** such as correlation analysis, factor analysis, and survival analysis. The workflow identifies which environmental variables are most strongly correlated with species diversity, extracts latent factors using Exploratory Factor Analysis (EFA), and determines which habitats are most at risk of decline over time.  

---

## Project Objectives
The goals of this project are to analyze habitat-level ecological data and determine:
- The **most impactful environmental factor** on species diversity.  
- The **latent environmental constructs** using Exploratory Factor Analysis (EFA).  
- The **habitat with the lowest survival probability** over time.  

---

## Key Analyses
1. **Correlation Matrix & Dominant Factor**  
   - Dataset: `data/R_factor_data.csv`  
   - Script: `analysis/correlation_analysis.R`  
   - Method: Pearson correlation with species diversity  
   - Output: `most_impactful_factor.txt` (also downloadable as an artifact in GitHub Actions)  

2. **Exploratory Factor Analysis (EFA)**  
   - Dataset: `data/R_factor_data.csv`  
   - Script: `analysis/factor_analysis.R`  
   - Tool: `psych::fa()`  
   - Outputs:  
     - `factor_loadings.csv` – Factor loadings  
     - `factor_summary.txt` – Summary of latent constructs  

3. **Survival Analysis by Habitat**  
   - Dataset: `data/R_survival_data.csv`  
   - Script: `analysis/survival_analysis.R`  
   - Outputs:  
     - `survival_fit.csv` – Survival model data  
     - `survival_summary.txt` – Model interpretation  
     - `survival_plot.png` – Kaplan-Meier survival curve  

---

## Repository Structure
├── analysis/ # R scripts for each analysis
│ ├── correlation_analysis.R
│ ├── factor_analysis.R
│ └── survival_analysis.R
├── data/ # Input datasets
│ ├── R_factor_data.csv
│ └── R_survival_data.csv
├── .github/workflows/ # GitHub Actions workflow
│ └── r-analysis.yml
├── R_notebook.ipynb # Jupyter notebook version (R kernel)
└── README.md # Project documentation


---

## Automation with GitHub Actions
This project includes a CI workflow (`.github/workflows/r-analysis.yml`) that automatically executes the relevant R script whenever changes are pushed:
- **Correlation job** runs if `correlation_analysis.R` or `R_factor_data.csv` is updated.  
- **Factor job** runs if `factor_analysis.R` or `R_factor_data.csv` is updated.  
- **Survival job** runs if `survival_analysis.R` or `R_survival_data.csv` is updated.  

🔹 **Artifacts (outputs)** from each job (TXT, CSV, PNG) can be downloaded from the **Actions tab** after the workflow finishes.

---

## Running Locally
1. Install [R](https://cran.r-project.org/) (v4.3 or later).  
2. Install required packages:
   ```r
   install.packages(c("readr", "dplyr", "psych", "survival", "ggplot2"))


Run the analyses manually:

Rscript analysis/correlation_analysis.R
Rscript analysis/factor_analysis.R
Rscript analysis/survival_analysis.R
