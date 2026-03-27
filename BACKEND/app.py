from flask import Flask, request, jsonify, send_file
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash, check_password_hash
import jwt
import os
from datetime import datetime, timedelta
from dotenv import load_dotenv
import psycopg2
import psycopg2.extras

# Load environment variables
load_dotenv()

app = Flask(__name__)

# Configure CORS for deployment with fallback
cors_origins = os.getenv('CORS_ORIGINS', '*')
if cors_origins.strip() == '*':
    cors_origins_value = '*'
else:
    cors_origins_value = [origin.strip() for origin in cors_origins.split(',') if origin.strip()]

CORS(app, resources={
    r"/api/*": {
        "origins": cors_origins_value,
        "methods": ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
        "allow_headers": ["Content-Type", "Authorization"],
        "supports_credentials": True
    }
})

# Configuration
DATABASE_URL = os.getenv('DATABASE_URL')
if not DATABASE_URL:
    # Fallback to building connection string from individual variables
    db_user = os.getenv('DB_USER', 'prayas2026_user')
    db_password = os.getenv('DB_PASSWORD', 'IYI9rIK1xQTvt9zooJ844Bw4LN2ZQukS')
    db_host = os.getenv('DB_HOST', 'dpg-d62rk3ur433s73a1514g-a.oregon-postgres.render.com')
    db_port = os.getenv('DB_PORT', '5432')
    db_name = os.getenv('DB_NAME', 'prayas2026')
    DATABASE_URL = f'postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}'

# Force SSL for cloud PostgreSQL if not explicit
if DATABASE_URL and 'sslmode' not in DATABASE_URL.lower():
    if '?' in DATABASE_URL:
        DATABASE_URL = DATABASE_URL + '&sslmode=require'
    else:
        DATABASE_URL = DATABASE_URL + '?sslmode=require'

app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URL
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY', 'your-secret-key-here')
app.config['ENV'] = os.getenv('FLASK_ENV', 'production')
app.config['DEBUG'] = os.getenv('FLASK_DEBUG', 'False').lower() in ['1', 'true', 'yes']

# Database initialization

db = SQLAlchemy(app)

# Import routes
import auth_routes
import student_routes
import payment_routes
import fee_routes
import book_routes
import publication_routes
import ranker_routes
import notification_routes

# Register blueprints
app.register_blueprint(auth_routes.bp)
app.register_blueprint(student_routes.bp)
app.register_blueprint(payment_routes.bp)
app.register_blueprint(fee_routes.bp)
app.register_blueprint(book_routes.bp)
app.register_blueprint(publication_routes.bp)
app.register_blueprint(ranker_routes.bp)
app.register_blueprint(notification_routes.bp)

@app.route('/api/health', methods=['GET'])
def health():
    return jsonify({'status': 'ok', 'message': 'PRAYAS2026 Backend is running'}), 200

@app.errorhandler(404)
def not_found(error):
    return jsonify({'error': 'Resource not found'}), 404

@app.errorhandler(500)
def server_error(error):
    return jsonify({'error': 'Internal server error'}), 500

if __name__ == '__main__':
    port = int(os.getenv('PORT', 5000))
    app.run(debug=True, host='0.0.0.0', port=port)
