#!/bin/bash
# Installation and Setup Script for PRAYAS2026

echo "======================================"
echo "PRAYAS2026 Installation Script"
echo "======================================"

# Check Python version
echo "Checking Python installation..."
python --version

# Create virtual environment
echo "Creating virtual environment..."
python -m venv venv

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Install Python dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt

# Copy environment configuration
echo "Setting up environment configuration..."
cp .env.example .env

echo ""
echo "======================================"
echo "Setup Complete!"
echo "======================================"
echo ""
echo "Next steps:"
echo "1. Update .env file with your database credentials"
echo "2. Create database: mysql -u root -p < database_schema.sql"
echo "3. Run Flask app: python app.py"
echo "4. Open browser to http://localhost:5000"
echo ""
