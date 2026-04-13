
-- 1. Create staging table (copy raw data)
-- =========================================

CREATE TABLE layoffs_staging LIKE layoffs;

INSERT INTO layoffs_staging
SELECT * FROM layoffs;


-- 2. Identify and remove duplicates
-- =========================================

CREATE TABLE layoffs_staging2 AS
SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY company, location, total_laid_off, date,
                 percentage_laid_off, industry, stage,
                 funds_raised, country
) AS row_num
FROM layoffs_staging;

DELETE FROM layoffs_staging2
WHERE row_num > 1;


-- 3. Standardize text fields
-- =========================================

-- Remove extra spaces in company names
UPDATE layoffs_staging2
SET company = TRIM(company);

-- Standardize country naming
UPDATE layoffs_staging2
SET country = 'UAE'
WHERE country = 'United Arab Emirates';


-- 4. Convert date format
-- =========================================

UPDATE layoffs_staging2
SET date = CASE
    WHEN date LIKE '%/%' THEN STR_TO_DATE(date, '%m/%d/%Y')
    WHEN date LIKE '%-%' THEN STR_TO_DATE(date, '%d-%m-%Y')
END;

ALTER TABLE layoffs_staging2
MODIFY COLUMN date DATE;


-- 5. Handle missing values
-- =========================================

-- Check rows where both key metrics are null
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Remove rows where industry is missing
DELETE FROM layoffs_staging2
WHERE industry IS NULL OR industry = '';


-- 6. Final cleanup
-- =========================================

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

SELECT *
FROM layoffs_staging2;