# How Environmental Factors Influence Wildlife Populations

This project explores how environmental factors shape wildlife populations using factor analysis and survival analysis in R. The analysis identifies the environmental variable most strongly correlated with species diversity and determines which habitat is most at risk over time.

## Project Objective
The goal of this project is to analyze habitat-level data and determine:
- The most impactful environmental factor on species diversity.  
- The latent environmental constructs using Exploratory Factor Analysis (EFA).  
- The habitat with the lowest survival probability over time.  

## Key Analyses
1. **Correlation Matrix & Dominant Factor**  
   - Dataset: `R_factor_data.csv`  
   - Method: Pearson correlation with species diversity  
   - Output: `most_impactful_factor`  

2. **Exploratory Factor Analysis (EFA)**  
   - Tool: `psych::fa()`  
   - Outputs:  
     - `num_factors`: Number of latent factors identified  
     - `EFA_model`: Fitted factor model  

3. **Survival Analysis by Habitat**  
   - Dataset: `R_survival_data.csv`  
   - Outputs:  
     - `survival_fit_df`: Survival model results  
     - `low_surv_habitat`: Habitat with the lowest survival probability at time 400  

## Project Files
- `R_notebook.ipynb` – Jupyter Notebook with the R analysis  
- `R_factor_data.csv` – Environmental and species diversity data  
- `R_survival_data.csv` – Habitat survival time data  
- `README.md` – Project documentation  
