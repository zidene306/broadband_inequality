
# Column Meaning
## Ookla speed data.parquet:
**quadkey:**	Geographic tile identifier: 
**avg_d_kbps:**	Average download speed
**avg_u_kbps:**	Average upload speed
**avg_lat_ms:**	Average latency
**tests:**	Number of speed tests
**devices:**	Number of devices

# Data sources: 
**-Ookla speed data ".parquet"**
**-ADMIN-EXPRESS ".GPKG"**
**-INSEE Population density ".xlsx"**

## INSEE demographics:
gpkg file type = GeoPackage, portable GIS database that supports multiple layers


# Business question:

"Analysis of broadband inequalities across French regions/depts."



Build maps showing:

Rural vs urban performance: 
(Fiber deployment impact)
Regional disparities: 

# Machine Learning

Predict:

Download speed
Latency category==>To calculate: Excellent: latency <20: , good: 20<= latency <50, Fair: 50<=lat<100, Poor: latency >=100
Broadband quality score ==>To calculate: 
Calculation :
Excellent: upload>1000 and download >300 and latency >

A practical broadband quality score
score = 0.5 * avg_down_mbps + 0.2 * avg_up_mbps + 0.3 * avg_lat_ms

Models:

Linear Regression
Random Forest

# broadband inequality project

keep nbr_tests and nbr_devices separate from the quality score.

nbr_tests and nbr_devices separate from the quality score: use them as a reliability/confidence indicator:

df["confidence"] = np.log1p(df["nbr_tests"])

Reason:

Speed and latency describe quality.
Tests/devices describe how reliable that measurement is.
Mixing them into the quality score can make heavily tested urban areas appear "better" simply because they have more observations.

# Project Objective:

## Broadband Quality Score → speed + loaded latency
## Measurement Confidence Score → tests + devices
## Urban/Rural classification (INSEE) → to study disparities

# Data

Ookla Open Data + French admin borders + pop density

This gives:

SQL queries in BigQuery
Python/Pandas analysis
Geospatial visualizations
Statistical testing
A business/public-policy story

# Data Cleaning and wrangling:
Draw an organigram/flowchart of the process

# What insights to demonstrate?
## 1. Regional broadband inequality

## 2. Rural vs Urban gap

## 3. Broadband quality score by department

## 4. Digital divide

Find departments below national average

==> link: https://console.cloud.google.com/bigquery?project=capstoneproject-500310&ws=!1m29!1m7!12m5!1m3!1scapstoneproject-500310!2seurope-west1!3scd7fdb5b-f9b8-473c-9ccf-29a0cabc7658!2e1!23sTREE_NODE_SELECTION!1m6!12m5!1m3!1scapstoneproject-500310!2seurope-west1!3s54c839c1-df56-4050-aff7-a3e1eea1b021!2e1!1m6!12m5!1m3!1scapstoneproject-500310!2seurope-west1!3s27634900-6e30-4ae5-94b5-01815bf3cad4!2e1!1m6!12m5!1m3!1scapstoneproject-500310!2seurope-west1!3saa262b54-b42f-476a-aa01-7e9bb33ddad5!2e1

