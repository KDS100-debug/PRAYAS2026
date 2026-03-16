# Backend: Deployment Configuration Files

## Dockerfile (Save as: backend/Dockerfile)
```dockerfile
FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 10000

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:10000/api/health')"

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:10000", "app:app"]
```

## render.yaml (Save as: backend/render.yaml)
```yaml
services:
  - type: web
    name: prayas2026-backend
    runtime: python
    region: oregon
    rootDir: .
    buildCommand: "pip install -r requirements.txt"
    startCommand: "gunicorn -w 4 -b 0.0.0.0:$PORT app:app"
    envVars:
      - key: FLASK_ENV
        value: production
      - key: FLASK_DEBUG
        value: "False"
      - key: MYSQL_HOST
        sync: false
      - key: MYSQL_USER
        sync: false
      - key: MYSQL_PASSWORD
        sync: false
      - key: MYSQL_DB
        value: prayas2026
      - key: SECRET_KEY
        sync: false
      - key: CORS_ORIGINS
        sync: false
```

## Procfile (Save as: backend/Procfile)
```
web: gunicorn -w 4 -b 0.0.0.0:$PORT app:app
```

## requirements.txt (Save as: backend/requirements.txt)
```
gunicorn==21.2.0
Flask==2.3.2
Flask-CORS==4.0.0
Flask-MySQLdb==1.0.1
PyJWT==2.8.0
python-dotenv==1.0.0
Werkzeug==2.3.6
MySQLdb-python==1.2.5
```

## .env.example (Save as: backend/.env.example)
```
# FLASK Configuration
FLASK_ENV=development
FLASK_DEBUG=False
FLASK_HOST=0.0.0.0
FLASK_PORT=5000

# MySQL Database
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD=your_password
MYSQL_DB=prayas2026
MYSQL_PORT=3306

# Security
SECRET_KEY=your-secret-key-here-change-in-production

# CORS Configuration
CORS_ORIGINS=*

# JWT
JWT_EXPIRATION_HOURS=24

# Environment
APP_ENV=development
LOG_LEVEL=INFO
```

## .dockerignore (Save as: backend/.dockerignore)
```
__pycache__/
*.pyc
*.pyo
*.pyd
.Python
env/
venv/
.env
.git
.gitignore
*.md
.pytest_cache/
.coverage
htmlcov/
dist/
build/
*.egg-info/
.DS_Store
```

---

# Frontend: Deployment Configuration Files

## vercel.json (Save as: frontend/vercel.json)
```json
{
  "buildCommand": "echo 'Static frontend deployment'",
  "outputDirectory": ".",
  "public": false,
  "rewrites": [
    {
      "source": "/(.*)",
      "destination": "/index.html"
    }
  ],
  "redirects": [
    {
      "source": "/api/(.*)",
      "destination": "https://prayas-backend.onrender.com/api/$1"
    }
  ],
  "headers": [
    {
      "source": "/:path*",
      "headers": [
        {
          "key": "X-Content-Type-Options",
          "value": "nosniff"
        },
        {
          "key": "X-Frame-Options",
          "value": "DENY"
        },
        {
          "key": "X-XSS-Protection",
          "value": "1; mode=block"
        }
      ]
    }
  ],
  "env": {
    "NEXT_PUBLIC_API_URL": "@api_url"
  }
}
```

## config.js (Save as: frontend/config.js)
```javascript
/**
 * Frontend Configuration
 * Different settings based on environment
 */

const config = {
  development: {
    API_URL: 'http://localhost:5000',
    DEBUG: true,
    LOG_LEVEL: 'debug'
  },
  
  staging: {
    API_URL: 'https://prayas-backend-staging.onrender.com',
    DEBUG: false,
    LOG_LEVEL: 'info'
  },
  
  production: {
    API_URL: process.env.NEXT_PUBLIC_API_URL || 'https://prayas-backend.onrender.com',
    DEBUG: false,
    LOG_LEVEL: 'error'
  }
};

// Get environment (default to production in Vercel)
const env = process.env.NODE_ENV || process.env.VERCEL_ENV || 'production';
const activeConfig = config[env] || config.production;

// Export helper function
export const getAPIUrl = () => activeConfig.API_URL;
export const isDevelopment = () => env === 'development';
export const isProduction = () => env === 'production';

export default activeConfig;
```

## .vercelignore (Save as: frontend/.vercelignore)
```
**/.env
**/.env.local
**/.env.*.local
**/node_modules
**/.git
**/.gitignore
**/README.md
**/docs
**/.vscode
**/.idea
**/*.log
**/tmp
**/temp
```

---

# Root Level: Git Configuration

## .gitignore (Save as: PRAYAS2026/.gitignore)
```
# Environment Variables
.env
.env.local
.env.*.local
.env.production.local

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
[Ee]nv/
[Vv]env/
ENV/
env.bak/
venv.bak/
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
pip-wheel-metadata/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# IDE
.vscode/
.idea/
*.swp
*.swo
*~
.DS_Store
*.sublime-project
*.sublime-workspace

# Node (if applicable)
node_modules/
npm-debug.log
yarn-error.log
.next/

# Vercel
.vercel/
.vercel-build-output/

# Render
render.yaml.bak

# Database
*.db
*.sqlite
*.sqlite3
database/backups/

# Testing
.pytest_cache/
.coverage
htmlcov/
.tox/

# OS
.DS_Store
Thumbs.db
*.swp
*.swo
*~

# Logs
*.log
logs/

# Temporary
tmp/
temp/
*.tmp
*.bak
*.backup

# IDE Cache
*.sublime-project
*.sublime-workspace

# Misc
.cache/
.mypy_cache/
.dmypy.json
dmypy.json
```

## .github/workflows/deploy.yml (GitHub Actions - Optional)
```yaml
name: Deploy to Render and Vercel

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test-backend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Set up Python
        uses: actions/setup-python@v2
        with:
          python-version: 3.11
      
      - name: Install dependencies
        run: |
          cd backend
          pip install -r requirements.txt
      
      - name: Lint
        run: |
          cd backend
          pip install flake8
          flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics

  deploy-backend:
    needs: test-backend
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
      - uses: actions/checkout@v2
      
      - name: Deploy to Render
        run: |
          curl https://api.render.com/deploy/srv-${{ secrets.RENDER_SERVICE_ID }}?key=${{ secrets.RENDER_API_KEY }}

  deploy-frontend:
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
      - uses: actions/checkout@v2
      
      - name: Deploy to Vercel
        uses: vercel/action@master
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
          vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}
          working-directory: ./frontend
```

---

**Created**: February 6, 2026
**For**: PRAYAS 2026 Multi-Platform Deployment
**Platforms**: Render (Backend), Vercel (Frontend), Hostinger (Database & Domain)
