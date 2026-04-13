
-- EXPLORATORY DATA ANALYSIS
-- =========================================

-- 1. Overview of dataset
SELECT *
FROM layoffs_staging2;


-- 2. Percentage layoffs analysis
-- =========================================

-- Max and Min percentage laid off
SELECT MAX(percentage_laid_off), MIN(percentage_laid_off)
FROM layoffs_staging2
WHERE percentage_laid_off IS NOT NULL;

-- Companies with 100% layoffs
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1;

-- Same but ordered by funds raised
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised DESC;


-- 3. Company-wise layoffs
-- =========================================

SELECT company, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY total_laid_off DESC;


-- 4. Date range
-- =========================================

SELECT MIN(date), MAX(date)
FROM layoffs_staging2;


-- 5. Industry analysis
-- =========================================

SELECT industry, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_laid_off DESC;


-- 6. Country analysis
-- =========================================

SELECT country, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY country
ORDER BY total_laid_off DESC;


-- 7. Location analysis
-- =========================================

SELECT location, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY location
ORDER BY total_laid_off DESC;


-- 8. Yearly trend
-- =========================================

SELECT YEAR(date) AS year, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY YEAR(date)
ORDER BY year ASC;


-- 9. Stage analysis
-- =========================================

SELECT stage, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY stage
ORDER BY total_laid_off DESC;


-- 10. Top companies per year
-- =========================================

WITH Company_Year AS (
    SELECT company, YEAR(date) AS year,
           SUM(total_laid_off) AS total_laid_off
    FROM layoffs_staging2
    GROUP BY company, YEAR(date)
),
Company_Year_Rank AS (
    SELECT company, year, total_laid_off,
           DENSE_RANK() OVER (PARTITION BY year ORDER BY total_laid_off DESC) AS ranking
    FROM Company_Year
)
SELECT company, year, total_laid_off, ranking
FROM Company_Year_Rank
WHERE ranking <= 3
AND year IS NOT NULL
ORDER BY year ASC, total_laid_off DESC;


-- 11. Monthly trend
-- =========================================

SELECT DATE_FORMAT(date, '%Y-%m') AS month,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY month
ORDER BY month ASC;


-- 12. Rolling total layoffs
-- =========================================

WITH DATE_CTE AS (
    SELECT DATE_FORMAT(date, '%Y-%m') AS month,
           SUM(total_laid_off) AS total_laid_off
    FROM layoffs_staging2
    GROUP BY month
)
SELECT month,
       SUM(total_laid_off) OVER (ORDER BY month ASC) AS rolling_total_layoffs
FROM DATE_CTE
ORDER BY month ASC;