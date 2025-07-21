# Project Setup Script
# Run this script to install all required packages and set up the project

install_if_missing <- function(packages) {
  new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
  if(length(new_packages)) {
    install.packages(new_packages, dependencies = TRUE)
  }
}

# Core packages for academic manuscripts
core_packages <- c(
  "here", "tidyverse", "haven", "readxl", "knitr", "rmarkdown", "quarto"
)

# Statistical analysis packages
stats_packages <- c(
  "psych", "lavaan", "emmeans", "lme4", "car", "effectsize", "correlation"
)

# Visualization packages
viz_packages <- c(
  "ggplot2", "plotly", "patchwork", "scales", "viridis"
)

# Table packages
table_packages <- c(
  "kableExtra", "gt", "modelsummary", "flextable"
)

# Install all packages
all_packages <- c(core_packages, stats_packages, viz_packages, table_packages)

cat("Installing required packages...\n")
install_if_missing(all_packages)

cat("Package installation complete!\n")
cat("Packages installed:", length(all_packages), "\n")

# Verify installation
cat("\nVerifying installation...\n")
for(pkg in all_packages) {
  if(require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat("✓", pkg, "\n")
  } else {
    cat("✗", pkg, "- FAILED TO INSTALL\n")
  }
}

cat("\nSetup complete! You're ready to start your manuscript.\n")
