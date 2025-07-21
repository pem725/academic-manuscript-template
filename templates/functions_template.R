# Standard R functions for academic manuscripts
# Based on PMK Lab standards

# Data loading and cleaning functions
load_and_clean_data <- function(file_path) {
  # Determine file type and load accordingly
  if (grepl("\\.sav$", file_path)) {
    data <- haven::read_sav(file_path)
  } else if (grepl("\\.csv$", file_path)) {
    data <- readr::read_csv(file_path)
  } else if (grepl("\\.xlsx?$", file_path)) {
    data <- readxl::read_excel(file_path)
  } else {
    stop("Unsupported file format")
  }
  
  # Basic cleaning
  data_clean <- data %>%
    filter(rowSums(is.na(.)) < ncol(.) * 0.5) # Remove rows with >50% missing
  
  return(data_clean)
}

# Descriptive statistics
get_descriptives <- function(data, variables) {
  data %>%
    select(all_of(variables)) %>%
    psych::describe() %>%
    round(2) %>%
    as.data.frame()
}

# Correlation matrix formatting
format_cor_matrix <- function(cor_matrix, digits = 2) {
  cor_formatted <- round(cor_matrix, digits)
  cor_formatted[upper.tri(cor_formatted)] <- ""
  diag(cor_formatted) <- ""
  return(cor_formatted)
}

# Effect size calculations
cohens_d <- function(x, y) {
  pooled_sd <- sqrt(((length(x) - 1) * var(x, na.rm = TRUE) + 
                    (length(y) - 1) * var(y, na.rm = TRUE)) / 
                   (length(x) + length(y) - 2))
  d <- (mean(x, na.rm = TRUE) - mean(y, na.rm = TRUE)) / pooled_sd
  return(d)
}

# SEM model fit reporting
report_fit_measures <- function(sem_fit) {
  fit_measures <- fitMeasures(sem_fit, c("chisq", "df", "pvalue", "cfi", "tli", "rmsea", "srmr"))
  
  cat("Model Fit Measures:\n")
  cat("Chi-square:", round(fit_measures["chisq"], 3), "\n")
  cat("df:", fit_measures["df"], "\n")
  cat("p-value:", round(fit_measures["pvalue"], 3), "\n")
  cat("CFI:", round(fit_measures["cfi"], 3), "\n")
  cat("TLI:", round(fit_measures["tli"], 3), "\n")
  cat("RMSEA:", round(fit_measures["rmsea"], 3), "\n")
  cat("SRMR:", round(fit_measures["srmr"], 3), "\n")
}

# Missing data visualization
visualize_missing <- function(data) {
  missing_data <- data %>%
    summarise_all(~sum(is.na(.))) %>%
    pivot_longer(everything(), names_to = "variable", values_to = "missing_count") %>%
    mutate(
      total = nrow(data),
      missing_pct = (missing_count / total) * 100
    ) %>%
    filter(missing_count > 0) %>%
    arrange(desc(missing_pct))
  
  if (nrow(missing_data) > 0) {
    ggplot(missing_data, aes(x = reorder(variable, missing_pct), y = missing_pct)) +
      geom_col(fill = "steelblue", alpha = 0.7) +
      coord_flip() +
      labs(
        title = "Missing Data by Variable",
        x = "Variable",
        y = "Percentage Missing"
      ) +
      theme_minimal()
  } else {
    print("No missing data found!")
  }
}
