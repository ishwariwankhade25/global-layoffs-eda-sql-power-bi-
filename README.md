# 📊 Global Layoffs Analysis (SQL + Power BI)

## Table of Contents

- [📌 Project Overview](#📌-Project-Overview)
- [🛠️ Tools & Technologies](#🛠️-Tools-&-Technologies)
- [📂 Dataset](#📂-Dataset)
- [🧹 Data Cleaning (SQL)](#🧹-Data-Cleaning-(SQL))
- [📊 Exploratory Data Analysis (SQL)](#📊-Exploratory-Data-Analysis-(SQL))
- [📈Dashboard (Power BI)](#📈-Dashboard-(Power-BI))
- [🔍 Key Insights](#🔍-Key-Insights)
- [🚀 How to Use](#🚀-How-to-Use)
- [💡 Learnings](#💡-Learnings)
- [📬 Contact](#📬-Contact)


## 📌 Project Overview

This project analyzes global layoffs data using **SQL for data cleaning and exploratory data analysis (EDA)** and **Power BI for interactive dashboard visualization**.

The goal of this project is to uncover trends, patterns, and key insights about layoffs across companies, industries, and countries.


## 🛠️ Tools & Technologies

* SQL (MySQL) – Data Cleaning & EDA
* Power BI – Data Visualization & Dashboard
* Excel/CSV – Dataset Handling


## 📂 Dataset

* Source: Public layoffs dataset
* Contains information about:

  * Company
  * Industry
  * Location
  * Total layoffs
  * Percentage layoffs
  * Funding raised
  * Date


## 🧹 Data Cleaning (SQL)

Key steps performed:

* Removed duplicate records using `ROW_NUMBER()`
* Standardized text fields (company names, country names)
* Converted date column to proper DATE format
* Handled missing values (removed incomplete records where necessary)
* Created a clean staging table (`layoffs_staging2`) for analysis


## 📊 Exploratory Data Analysis (SQL)

Key analyses performed:

* Total layoffs by company
* Layoffs by industry, country, and location
* Year wise and monthly trends
* Companies with 100% layoffs
* Top companies by layoffs each year (using window functions)
* Rolling total layoffs over time


## 📈 Dashboard (Power BI)

An interactive dashboard was created to visualize:

* 🔹 Total layoffs, highest single layoff, total companies affected
* 🔹 Layoff trends over time (year-wise)
* 🔹 Industry-wise layoffs distribution
* 🔹 Top 10 companies by layoffs
* 🔹 Filters for year and industry

### Dashboard Preview
![dashboard.jpg](https://github.com/ishwariwankhade25/global-layoffs-eda-sql-power-bi-/blob/b6824e7e341ecb2d77a9a9bb1bd48bc630681594/dashboard.jpg)


## 🔍 Key Insights

* Layoffs peaked around **2023**, indicating major global workforce reductions
* **Technology and retail industries** experienced the highest layoffs
* Several companies had **100% workforce layoffs**, indicating shutdowns
* Layoffs varied significantly across countries, with certain regions more impacted
* Post-peak, layoffs show signs of **decline and stabilization**


## 🚀 How to Use

1. Run SQL scripts to clean and analyze the data
2. Open Power BI file (`.pbix`) to explore the dashboard
3. Use slicers (filters) to interact with the data


## 💡 Learnings

* Practical implementation of SQL data cleaning techniques
* Use of window functions for advanced analysis
* Building interactive dashboards in Power BI
* Translating raw data into meaningful business insights


## 📬 Contact

Ishwari Wankhade<br>
- 📧 **Email:** [career.ishwari@gmail.com](career.ishwari@gmail.com)
- 🔗 **LinkedIn:** [LinkedIn](linkedin.com/in/ishwari-analytics)



⭐ If you found this project useful, consider giving it a star!
