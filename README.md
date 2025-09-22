# 🌿 How Environmental Factors Influence Wildlife Populations

This project explores how environmental factors shape wildlife populations using **factor analysis** and **survival analysis** in **R**. The analysis identifies the environmental variable most strongly correlated with species diversity and determines which habitat is most at risk over time.

---

## 🔍 Project Objective

To analyze habitat-level data and determine:
- The most impactful environmental factor on species diversity.
- The latent environmental constructs using Exploratory Factor Analysis (EFA).
- The habitat with the lowest survival probability.

---

## 📊 Key Analyses

### 1. **Correlation Matrix & Dominant Factor**
- Dataset: `factor_data`
- Output: `most_impactful_factor`
- Method: Pearson correlation with species diversity.

### 2. **Exploratory Factor Analysis (EFA)**
- Tool: `psych::fa()`
- Outputs:
  - `num_factors`: Chosen number of latent factors.
  - `EFA_model`: Fitted factor model.

### 3. **Survival Analysis by Habitat**
- Dataset: Habitat survival times and censoring status.
- Outputs:
  - `survival_fit_df`: Survival model output.
  - `low_surv_habitat`: Habitat with lowest survival at time 400.
