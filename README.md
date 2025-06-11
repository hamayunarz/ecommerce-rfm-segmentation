# ecommerce-rfm-segmentation
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
my-ecommerce-segmentation-project/
├── data/
│   ├── raw/                     # Untouched, initial datasets (e.g., Kaggle CSVs)
│   └── processed/               # Cleaned and ready-to-use datasets
├── models/                     # DBT models
│   ├── staging/
│   │   └── raw_ecommerce/      # Your source system name
│   ├── prep/
│   │   
│   └── marts/
│       
├── notebooks/                 # Jupyter notebooks
│   ├── 1_data_ingestion_and_initial_eda.ipynb
│   ├── 2_data_cleaning_and_preprocessing.ipynb
│   ├── 3_feature_engineering_rfm_external_data.ipynb
│   ├── 4_modeling_segmentation_churn.ipynb
│   └── 5_insights_and_recommendations.ipynb
├── src/                       # Non-dbt specific code
│   ├── python_scripts/
│   │   ├── ingest_raw_data.ipynb
│   │   ├── TEST.ipynb
│   │   └── rfm_calculator.py
│   ├── sql_dbt_models/        # Entire DBT project structure (mirror of models/)
│   └── sql_queries/           # Ad-hoc or external SQL queries
│       ├── event_metadata.sql
│       └── product_metadata.sql
├── reports/
│   ├── figures/               # All visualizations (charts, plots)
│   └── final_presentation.pdf
├── tableau_dashboard/
│   └── ecommerce_segmentation_dashboard.twbx               
├── target/                    # dbt build artifacts
├── dbt_project.yml            # dbt config file
├── index.html
├── README.md                  # Project overview and instructions
├── requirements.txt           # Python dependencies
└── setup.py                   # Optional packaging script
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