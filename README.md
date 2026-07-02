# 🇫🇷 France Broadband Analysis
### Analysis of Broadband Inequalities Across French Regions & Departments

## Project Overview

Access to high-quality broadband internet has become essential for economic development, education, healthcare, and digital inclusion. Despite continuous investments in telecommunications infrastructure, broadband performance remains uneven across France.

This project analyzes broadband inequalities across French regions and departments using millions of internet speed measurements combined with demographic and geographic datasets. The project leverages SQL, Python, Machine Learning, and Power BI to uncover regional disparities and provide actionable insights for policymakers and stakeholders.

---

# Business Question

> **How does broadband quality vary across French regions and departments, and what factors explain these inequalities?**

The project aims to answer questions such as:

- Which regions have the best broadband performance?
- Are rural areas disadvantaged compared to urban areas?
- Which departments are below the national average?
- Can broadband quality be predicted using machine learning?

---

# Project Objectives

The project focuses on three complementary indicators:

### 1. Broadband Quality Score
Measures internet quality using:

- Download speed
- Upload speed
- Loaded latency = (Download Latency + Upload Latency)/2

---


### 2. Urban vs Rural Classification

Using INSEE population density data to classify areas as:

- Urban
- Rural

This enables analysis of digital inequalities.

---

# Data Sources

## 1. Ookla Open Data (.parquet)

Contains broadband performance measurements.

### Columns

| Column | Meaning |
|---------|----------|
| **quadkey** | Geographic tile identifier |
| **avg_d_kbps** | Average download speed |
| **avg_u_kbps** | Average upload speed |
| **avg_lat_ms** | Average latency |
| **tests** | Number of speed tests |
| **devices** | Number of unique devices |

---

## 2. ADMIN-EXPRESS (.gpkg)

French administrative boundaries.

GeoPackage (.gpkg) is a portable GIS database supporting multiple spatial layers.

Used to obtain:

- Regions
- Departments
- Administrative geometries

---

## 3. INSEE Population Density (.xlsx)

Used for:

- Population density
- Urban/Rural classification
- Demographic analysis

---

# Data Pipeline

The project combines multiple technologies:

```
Ookla Open Data + ADMIN-EXPRESS + INSEE Population Density
        │
        ▼
Data Cleaning
        │
        ▼
BigQuery SQL
        │
        ▼
Python / Pandas
        │
        ▼
Feature Engineering
        │
        ▼
Machine Learning
        │
        ▼
Power BI Dashboard
```

---

# Data Cleaning & Wrangling

Main preprocessing steps include:

- Import datasets
- Remove duplicates
- Handle missing values
- Convert speeds from Kbps to Mbps
- Join administrative boundaries
- Merge demographic information
- Create geographic identifiers
- Compute derived features
- Export cleaned datasets

*A process flowchart illustrating the complete ETL pipeline is included in the project documentation.*

---

# Feature Engineering

## Broadband Quality Score

A practical broadband quality score is computed as:

```
Score = 0.5 × Average Download Speed + 0.2 × Average Upload Speed + 0.3 × Loaded Latency
```

---

## Latency Categories

Latency is categorized as:

| Category | Latency |
|-----------|----------|
| Excellent | < 20 ms |
| Good | 20–49 ms |
| Fair | 50–99 ms |
| Poor | ≥ 100 ms |

---

# Machine Learning

The project includes predictive models for:

## Regression

- Download speed prediction

Models:

- Linear Regression
- Random Forest Regressor

---

# SQL Analysis

Google BigQuery is used for:

- Data exploration
- Aggregations
- Regional statistics
- Department comparisons
- National averages
- Feature extraction

---

# Power BI Dashboard

Interactive dashboards provide:

- Regional broadband quality maps
- Department-level comparisons
- Download speed analysis
- Upload speed analysis
- Latency analysis
- Broadband Quality Score visualization
- Urban vs Rural comparison
- Interactive filters and drill-down

---

# Maps & Geospatial Analysis

The project includes spatial visualizations showing:

- Regional disparities
- Department-level performance
- Rural vs Urban broadband quality
- Fiber deployment impact
- Broadband Quality Score distribution
- Digital divide across France

---

# Key Insights

The project aims to demonstrate:

## 1. Regional Broadband Inequality

Identify which French regions outperform or underperform the national average.

---

## 2. Rural vs Urban Gap

Compare broadband performance between densely populated and rural areas.

---

## 3. Broadband Quality Score by Department

Rank departments according to the composite broadband quality score.

---

## 4. Digital Divide

Highlight departments that remain below the national average and identify areas requiring further investment.

---

# Technologies Used

- Python
- Pandas
- NumPy
- GeoPandas
- Matplotlib
- Scikit-learn
- Google BigQuery
- SQL
- Power BI
- Git & GitHub

---

# Repository Structure

```
France-Broadband-Analysis/

│
├── data/
│   ├── raw/
│   └── clean/
│    
│
├── notebooks/
│
├── sql_scripts/
│
├── powerbi/
│
├── figures/
│
├── visio
│
├── src/
│
├── README.md
├── CONFIG.yaml
├── .
├── README.md
└── requirements.txt
```

---

# Expected Deliverables

- Clean analytical dataset
- SQL data warehouse queries
- Python data analysis notebooks
- Machine Learning models
- Interactive Power BI dashboard
- Geospatial maps
- Business insights supporting digital inclusion and broadband policy decisions

---

# Future Improvements

- Incorporate fiber availability data
- Analyze broadband trends over multiple years
- Include mobile network performance
- Develop a web-based interactive dashboard
- Evaluate additional machine learning models (e.g., XGBoost, LightGBM)

---

# Author
Z.A
**France Broadband Analysis**  
Data Analytics Bootcamp Project  
Ironhack (May 4 – July 3)