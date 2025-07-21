# Data Dictionary

## Variables

| Variable | Type | Description | Values/Range |
|----------|------|-------------|--------------|
| id | Integer | Participant ID | 1-n |
| condition | Factor | Experimental condition | control, treatment |
| age | Integer | Age in years | 18-65 |
| gender | Factor | Gender | M, F, Other |
| score1 | Numeric | Outcome measure 1 | 1-5 scale |
| score2 | Numeric | Outcome measure 2 | 1-5 scale |
| score3 | Numeric | Outcome measure 3 | 1-5 scale |

## Notes
- Missing values coded as NA
- All scales are 1-5 Likert scales where 1=Strongly Disagree, 5=Strongly Agree
- Data collected between [DATE] and [DATE]

## Preprocessing Steps
1. Removed participants with >50% missing data
2. Excluded participants outside age range
3. [Add other preprocessing steps as needed]
