# Render manuscript in all formats
# Run this script to generate HTML, PDF, and Word versions

library(quarto)
library(here)

# Find all .qmd files in current directory
qmd_files <- list.files(pattern = "\\.qmd$", full.names = TRUE)

if (length(qmd_files) == 0) {
  stop("No .qmd files found in current directory")
}

cat("Found", length(qmd_files), "Quarto files to render:\n")
cat(paste(basename(qmd_files), collapse = "\n"), "\n\n")

# Render each file
for (file in qmd_files) {
  cat("Rendering:", basename(file), "\n")
  
  tryCatch({
    quarto_render(file)
    cat("✓ Success:", basename(file), "\n\n")
  }, error = function(e) {
    cat("✗ Error rendering", basename(file), ":", e$message, "\n\n")
  })
}

cat("Rendering complete!\n")
cat("Check the output/ directory for generated files.\n")
