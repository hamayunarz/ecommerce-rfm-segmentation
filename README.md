# E-commerce Customer Segmentation Project

## Overview
In this project, I analyzed 6 years of customer data from an Indonesian e-commerce company. The goal was to understand customer behavior, reduce churn, and help the business focus on the right users.

The dataset included:
- 50,242 customers
- 850,000+ transactions
- 12.8 million click events

## Tools & Methods
**Tools:** Python, SQL, dbt, Tableau  
**Techniques:** RFM analysis, customer segmentation, data visualization

---

## Business Results
- Grouped customers into **4 meaningful segments**
- Found that **24% of customers (VIPs) drive 78% of total revenue**
- Identified **17,613 at-risk customers** who haven’t purchased in over 600 days
- Suggested targeted campaigns that could lead to a **25% uplift in conversion**

---

## How I Did It

### Step 1: Data Preparation
I used SQL and dbt to clean and organize the raw data. Then I calculated RFM scores for every customer:
- **Recency:** How recently they purchased
- **Frequency:** How often they purchase
- **Monetary:** How much they spend

### Step 2: Segmentation
Based on RFM scores, customers were grouped into:
- **VIPs** – active and high spenders  
- **Loyal** – regular and reliable  
- **Regular** – average behavior  
- **At-Risk** – likely to churn

### Step 3: Insights & Dashboards
I built dashboards in Tableau and explored trends using Python. I also tested hypotheses on revenue distribution, location impact, and device usage.

---
## Data Quality Improvements
- Initial data quality: 85%
- Post-cleaning quality: 99%
- Missing values reduced: 10% → 0.1%
- Duplicates removed: 2% (1,000+ records)
- Outliers handled: 5% (2,500+ records)

## Key Insights

- **VIP customers spend 3x more** than average  
- **Jakarta** has the highest share of VIPs (18%)  
- **90% of users shop on mobile** — mostly Android  
- **Churn is real**: Over 17,000 customers stopped buying
- Recommended targeted recovery and VIP campaigns projected to improve conversion by 25% — based on segmentation and behavioral insights
