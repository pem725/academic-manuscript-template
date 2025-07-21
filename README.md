# Academic Manuscript Template

A standardized template for academic manuscripts using Quarto and R, designed for psychology research projects.

## Features

- **Standardized Structure**: Consistent organization across all projects
- **APA 7th Edition**: Compliant formatting and citations
- **Zotero Integration**: Seamless bibliography management
- **Reproducible Research**: Version controlled with automated rendering
- **Multiple Output Formats**: HTML, PDF, and Word documents

## Quick Start

### Option 1: Use Template Repository
1. Click "Use this template" on GitHub
2. Clone your new repository
3. Run `scripts/setup_project.R` to install dependencies
4. Start writing in the main `.qmd` file

### Option 2: Use with manuscript_startHERE.py
1. Download `manuscript_startHERE.py`
2. Run: `python manuscript_startHERE.py your_project_name`
3. Follow the prompts for Zotero integration

## File Structure

academic-manuscript-template/
├── .github/
│   ├── workflows/
│   │   └── render-quarto.yml
│   └── ISSUE_TEMPLATE/
│       └── manuscript-checklist.md
├── templates/
│   ├── manuscript_template.qmd
│   ├── apa7.docx
│   └── functions_template.R
├── styles/
│   ├── apa7.csl
│   └── custom-academic.scss
├── data/
│   ├── example_data.csv
│   └── data_dictionary.md
├── scripts/
│   ├── setup_project.R
│   └── render_all_formats.R
├── README.md
├── .gitignore
└── _quarto.yml

## Requirements

- R (≥ 4.0.0)
- Quarto CLI
- RStudio (recommended)
- Git
- Zotero (for reference management)

## Usage

1. **Setup**: Install required packages using `scripts/setup_project.R`
2. **Data**: Place data files in `data/` directory
3. **Analysis**: Edit the main `.qmd` file with your analysis
4. **Render**: Use `quarto render manuscript.qmd` to generate outputs
5. **Version Control**: Commit changes regularly to Git

## Citation Style

This template uses APA 7th edition formatting. To use a different style:
1. Download the appropriate `.csl` file
2. Place it in `styles/` directory
3. Update the `csl` field in the YAML header

## Contributing

This template is designed for the McKnight Lab at George Mason University. 
For suggestions or improvements, please open an issue.

## Authors

- Patrick E. McKnight (pmcknigh@gmu.edu)
- Todd B. Kashdan (tkashdan@gmu.edu)

## License

MIT License - feel free to adapt for your own use.
