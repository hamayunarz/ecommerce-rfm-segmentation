# ecommerce-customer-segmentation
E-commerce Customer Segmentation - Data Analyst Bootcamp Capstone Project
# Project Setup

## Install Dependencies

Run the following command in your terminal to install all required Python packages:

```bash
pip install -r requirements.txt

ecommerce-rfm-segmentation Project
Project Overview
This project analyzes e-commerce customer data to identify different customer segments and predict churn. The goal is to help businesses understand their customers better and make data-driven marketing decisions.
What I Did

Analyzed customer purchase data using RFM analysis (Recency, Frequency, Monetary)
Created customer segments using clustering techniques
Built predictive models to identify customers at risk of churning
Created visualizations and dashboards to present findings

Project Structure
your-ecommerce-segmentation-project/
├── data/
│   ├── raw/                 # Original data files
│   └── processed/           # Cleaned data files
├── notebooks/               # Jupyter notebooks with analysis
│   ├── 1_data_exploration.ipynb
│   ├── 2_data_cleaning.ipynb
│   ├── 3_customer_segmentation.ipynb
│   ├── 4_churn_prediction.ipynb
│   └── 5_results_and_insights.ipynb
├── src/                     # Python code
│   ├── db_connect.py        # Database connection
│   └── __init__.py
├── reports/                 # Charts and final presentation
│   └── figures/
├── README.md
└── requirements.txt
Setup Instructions
1. Install Required Libraries
bashpip install -r requirements.txt
2. Database Setup
Create a .env file in your project folder with your database information:
POSTGRES_USER=your_username
POSTGRES_PASS=your_password
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DB=your_database_name
POSTGRES_SCHEMA=public
3. How to Use
python# Connect to database
from src.db_connect import get_engine
import pandas as pd
from sqlalchemy import text

# Get database connection
engine = get_engine()

# Read data from database

df = pd.read_sql(text("SELECT * FROM customers;", con=engine)
print(df.head())
Key Findings
(Add your analysis results here as you complete the project)

Found X different customer segments
Identified key factors that predict customer churn
Recommended marketing strategies for each segment

Tools Used

Python: pandas, numpy, scikit-learn
Database: PostgreSQL, SQLAlchemy
Visualization: matplotlib, seaborn
Analysis: VS Code

Files Explanation
Notebooks (in order):

data_exploration.ipynb - First look at the data, basic statistics
data_cleaning.ipynb - Handle missing values, fix data types
customer_segmentation.ipynb - RFM analysis and clustering
churn_prediction.ipynb - Build models to predict churn
results_and_insights.ipynb - Summary of findings

Code Files:

src/db_connect.py - Simple database connection function
requirements.txt - List of Python libraries needed

How to Run

Clone this repository
Install requirements: pip install -r requirements.txt
Set up your .env file with database credentials
Run the notebooks in order (1 through 5)

Next Steps

Implement real-time customer scoring
Create automated reports
Test marketing campaigns based on segments

Contact
Hamayun Abdul Rahimzai - hamayunzai@gmail.com
https://www.linkedin.com/in/rahimzai/