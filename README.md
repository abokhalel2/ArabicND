# Validation Analysis for ArabicND

This repository contains the dataset and R scripts used for the statistical validation of **ArabicND**, a web-based tool for computing neighborhood density in Modern Standard Arabic.

## 📂 Repository Contents

* **`ArabicND.csv`**: The raw dataset containing neighborhood density metrics (Classic N and Broad OND) for words of varying lengths (3, 4, and 5 letters).
* **`analysis.R`**: The R script used to perform data cleaning, descriptive statistics, correlations, t-tests, and ANOVA.

## 🛠️ Prerequisites

To run the analysis script, you will need **R** installed. The script automatically checks for and installs the following required packages if they are missing:

* `tidyverse` (for data manipulation and plotting)
* `psych` (for descriptive statistics)
* `afex` (for ANOVA)
* `effectsize` (for effect size calculation)

## 📊 Analysis Workflow

The `analysis.R` script performs the following steps:

1.  **Data Preparation:** Reads the raw CSV and reshapes the data for 3, 4, and 5-letter words into a tidy format.
2.  **Correlations:** Calculates Pearson correlations between Classic Neighborhood Density and Broad Orthographic Neighborhood Density (OND) across different word lengths.
3.  **Descriptive Statistics:** Computes means and standard deviations for both metrics.
4.  **Visualization:** Generates a line/point plot (`ggplot2`) comparing Mean Classic vs. Broad OND across word lengths.
5.  **Hypothesis Testing:**
    * **Paired t-tests:** Compares Classic vs. Broad OND for each word length.
    * **ANOVA:** Performs a mixed-design ANOVA to analyze the effects of Word Length (Between) and Measure Type (Within).

## 🚀 How to Run

1.  Clone this repository or download the files.
2.  Open `analysis.R` in RStudio.
3.  Ensure the working directory is set to the folder containing `ArabicND.csv`.
4.  Run the script.

## 📧 Contact

**Ibrahim Alluhaybi**

Email: ialohab@imamu.edu.sa

[![Stack Overflow](https://img.shields.io/stackexchange/stackoverflow/r/6765312.svg?label=Stack%20Overflow&logo=stackoverflow)](https://stackoverflow.com/users/6765312/ibrahim)
