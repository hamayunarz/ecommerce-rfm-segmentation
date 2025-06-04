# Database connection for e-commerce project
# Simple connection setup using SQLAlchemy and PostgreSQL

import pandas as pd
from sqlalchemy import create_engine, text
from dotenv import load_dotenv # Changed from dotenv_values to load_dotenv
import os # Import the os module

def get_engine():
    # Load database credentials from .env file
    # This function automatically searches for .env in the current directory and its parents
    load_dotenv() 

    # Get values from environment variables using os.getenv
    # os.getenv is safer as it returns None if the variable isn't found, instead of a KeyError
    pg_user = os.getenv('POSTGRES_USER')
    pg_pass = os.getenv('POSTGRES_PASS')
    pg_host = os.getenv('POSTGRES_HOST')
    pg_port = os.getenv('POSTGRES_PORT')
    pg_db = os.getenv('POSTGRES_DB')
    pg_schema = os.getenv('POSTGRES_SCHEMA')
    
    # Simple check to ensure variables are loaded (optional, but good practice)
    if not all([pg_user, pg_pass, pg_host, pg_port, pg_db, pg_schema]):
        raise ValueError("One or more PostgreSQL environment variables not found. Check your .env file.")

    # Create connection string
    url = f'postgresql://{pg_user}:{pg_pass}@{pg_host}:{pg_port}/{pg_db}'
    
    # Create engine
    engine = create_engine(url, echo=False)
    
    # Set schema
    with engine.begin() as conn:
        conn.execute(text(f'SET search_path TO {pg_schema};'))
    
    return engine


