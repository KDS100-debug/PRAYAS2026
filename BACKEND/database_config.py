"""
Database Configuration and Connection Utilities
This module handles PostgreSQL database connections and provides helper functions
"""
import os
from sqlalchemy import create_engine
from sqlalchemy.pool import StaticPool
from dotenv import load_dotenv
import psycopg2
import psycopg2.extras

load_dotenv()

class DatabaseConfig:
    """Database configuration class"""
    
    # Get database URL from environment
    DATABASE_URL = os.getenv('DATABASE_URL')
    
    if not DATABASE_URL:
        # Fallback to building connection string from individual variables
        DB_USER = os.getenv('DB_USER', 'prayas2026_user')
        DB_PASSWORD = os.getenv('DB_PASSWORD', 'IYI9rIK1xQTvt9zooJ844Bw4LN2ZQukS')
        DB_HOST = os.getenv('DB_HOST', 'dpg-d62rk3ur433s73a1514g-a.oregon-postgres.render.com')
        DB_PORT = os.getenv('DB_PORT', '5432')
        DB_NAME = os.getenv('DB_NAME', 'prayas2026')
        DATABASE_URL = f'postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}'

    # Force SSL for cloud PostgreSQL if not explicit
    if DATABASE_URL and 'sslmode' not in DATABASE_URL.lower():
        if '?' in DATABASE_URL:
            DATABASE_URL = DATABASE_URL + '&sslmode=require'
        else:
            DATABASE_URL = DATABASE_URL + '?sslmode=require'

    # SQLAlchemy configuration
    SQLALCHEMY_DATABASE_URI = DATABASE_URL
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    
    # Connection pool settings
    SQLALCHEMY_ENGINE_OPTIONS = {
        'pool_size': 10,
        'pool_recycle': 3600,
        'pool_pre_ping': True,
    }


def get_database_url():
    """Get the database connection URL"""
    return DatabaseConfig.DATABASE_URL


def test_database_connection():
    """Test the database connection"""
    try:
        from sqlalchemy import text
        engine = create_engine(DatabaseConfig.DATABASE_URL)
        with engine.connect() as connection:
            result = connection.execute(text("SELECT 1"))
            return True, "Database connection successful"
    except Exception as e:
        return False, f"Database connection failed: {str(e)}"


# Database connection initialization function
def init_db(app):
    """Initialize database with Flask app"""
    from flask_sqlalchemy import SQLAlchemy
    db = SQLAlchemy(app)
    return db
