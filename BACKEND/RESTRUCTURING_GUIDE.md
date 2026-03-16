# PRAYAS 2026 - Project Restructuring Guide for GitHub Deployment

## Current Status
✅ Full project created at: c:\Users\SBENT\Downloads\PRAYAS2026

## New Deployment-Ready Structure

### Required Folder Organization:
```
PRAYAS2026/
├── backend/                    ← Render deployment
│   ├── app.py
│   ├── requirements.txt
│   ├── auth_routes.py
│   ├── student_routes.py
│   ├── payment_routes.py
│   ├── fee_routes.py
│   ├── book_routes.py
│   ├── publication_routes.py
│   ├── ranker_routes.py
│   ├── notification_routes.py
│   ├── Dockerfile
│   ├── .dockerignore
│   ├── .env.example
│   ├── render.yaml
│   └── wsgi.py
│
├── frontend/                   ← Vercel deployment
│   ├── index.html
│   ├── schools.html
│   ├── bookstore.html
│   ├── publication.html
│   ├── rankers.html
│   ├── about.html
│   ├── login.html
│   ├── admin1.html
│   ├── admin2.html
│   ├── admin3.html
│   ├── superadmin.html
│   ├── START_HERE.html
│   ├── css/
│   │   ├── style.css
│   │   ├── navbar.css
│   │   └── admin.css
│   ├── js/
│   │   ├── carousel.js
│   │   ├── notifications.js
│   │   ├── auth.js
│   │   ├── schools.js
│   │   ├── bookstore.js
│   │   ├── publications.js
│   │   ├── rankers.js
│   │   └── admin_functions.js
│   ├── images/
│   ├── vercel.json
│   ├── .vercelignore
│   └── config.js
│
├── database/                   ← Hostinger
│   ├── schema.sql
│   ├── migrations/
│   └── seeds/
│
├── docs/
│   ├── DEPLOYMENT_GUIDE.md
│   ├── RENDER_SETUP.md
│   ├── VERCEL_SETUP.md
│   ├── HOSTINGER_SETUP.md
│   └── API_REFERENCE.md
│
├── .gitignore
├── .github/
│   └── workflows/
│       └── deploy.yml
├── README.md
└── package.json
```

## Step-by-Step Migration Instructions

### Step 1: Create Backend Folder Structure
1. Create folder: `/backend`
2. Move Python files (app.py, *_routes.py) to `/backend`
3. Move database_schema.sql to `/database`
4. Move requirements.txt to `/backend`

### Step 2: Create Frontend Folder Structure
1. Create folder: `/frontend`
2. Create subfolder: `/frontend/css`
3. Create subfolder: `/frontend/js`
4. Create subfolder: `/frontend/images`
5. Move all HTML files to `/frontend`
6. Move CSS files to `/frontend/css`
7. Move JS files to `/frontend/js`

### Step 3: Create Documentation Folder
1. Create folder: `/docs`
2. Move all .md documentation files to `/docs`

### Step 4: Root Level Files
1. .gitignore (at root)
2. README.md (at root)
3. LICENSE (optional)

## Files to Create

### 1. .gitignore (Root Level)
```
# Environment
.env
.env.local
.env.*.local

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
env/
venv/
ENV/
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
*.egg-info/
.installed.cfg
*.egg

# IDE
.vscode/
.idea/
*.swp
*.swo
*~
.DS_Store

# Node (if using)
node_modules/
npm-debug.log
yarn-error.log

# Vercel
.vercel/
.next/

# Testing
.pytest_cache/
.coverage
htmlcov/

# OS
.DS_Store
Thumbs.db

# Database
*.db
*.sqlite
*.sqlite3

# Logs
*.log
logs/

# Temporary
tmp/
temp/
*.tmp
```

### 2. Backend Deployment Files

#### render.yaml (Render Configuration)
```yaml
services:
  - type: web
    name: prayas2026-backend
    runtime: python
    buildCommand: "pip install -r requirements.txt"
    startCommand: "gunicorn -w 4 -b 0.0.0.0:10000 app:app"
    envVars:
      - key: FLASK_ENV
        value: production
      - key: FLASK_DEBUG
        value: "False"
      - key: MYSQL_HOST
        fromDatabase:
          name: prayas2026-db
          property: host
      - key: MYSQL_USER
        fromDatabase:
          name: prayas2026-db
          property: user
      - key: MYSQL_PASSWORD
        fromDatabase:
          name: prayas2026-db
          property: password
      - key: MYSQL_DB
        value: prayas2026
```

#### Procfile (Heroku compatibility)
```
web: gunicorn -w 4 -b 0.0.0.0:$PORT app:app
```

#### Dockerfile
```dockerfile
FROM python:3.11-slim
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev pkg-config && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 10000
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:10000", "app:app"]
```

### 3. Frontend Deployment Files

#### vercel.json (Vercel Configuration)
```json
{
  "buildCommand": "echo 'Static site'",
  "outputDirectory": ".",
  "rewrites": [
    {
      "source": "/(.*)",
      "destination": "/index.html"
    }
  ],
  "env": {
    "NEXT_PUBLIC_API_URL": "@api_url"
  },
  "headers": [
    {
      "source": "/api/:path*",
      "headers": [
        {
          "key": "Cache-Control",
          "value": "no-cache"
        }
      ]
    }
  ]
}
```

#### config.js (Frontend Configuration)
```javascript
// API Configuration for different environments
const config = {
  development: {
    API_URL: 'http://localhost:5000'
  },
  production: {
    API_URL: process.env.NEXT_PUBLIC_API_URL || 'https://prayas-backend.onrender.com'
  }
};

const env = process.env.NODE_ENV || 'development';
export default config[env];
```

## GitHub Setup Instructions

### 1. Initialize Git Repository
```bash
cd c:\Users\SBENT\Downloads\PRAYAS2026
git init
git config user.name "Your Name"
git config user.email "your-email@example.com"
```

### 2. Add Files
```bash
git add .
git commit -m "Initial PRAYAS2026 commit - Full stack deployment ready"
```

### 3. Create GitHub Repository
1. Go to https://github.com/new
2. Create repository: PRAYAS2026
3. Copy the remote URL

### 4. Push to GitHub
```bash
git remote add origin https://github.com/yourusername/PRAYAS2026.git
git branch -M main
git push -u origin main
```

## Platform-Specific Setup

### For Render Backend:
1. Go to https://render.com
2. New → Web Service
3. Connect GitHub
4. Select PRAYAS2026 repository
5. Select GitHub account
6. Settings:
   - Root Directory: `backend`
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `gunicorn -w 4 -b 0.0.0.0:10000 app:app`
7. Environment Variables (from Render dashboard):
   ```
   MYSQL_HOST=your-hostinger-host
   MYSQL_USER=your-user
   MYSQL_PASSWORD=your-password
   MYSQL_DB=prayas2026
   FLASK_ENV=production
   SECRET_KEY=your-secure-key
   CORS_ORIGINS=https://your-vercel-domain.vercel.app
   ```

### For Vercel Frontend:
1. Go to https://vercel.com
2. Import Project → GitHub
3. Select PRAYAS2026
4. Settings:
   - Framework: Other
   - Root Directory: `frontend`
   - Build Command: Leave empty
   - Output Directory: `.`
5. Environment Variables:
   ```
   NEXT_PUBLIC_API_URL=https://prayas-backend.onrender.com
   ```

### For Hostinger Database:
1. MySQL Database
   - Create: prayas2026
   - User: prayas_user
   - Note credentials
2. Import schema:
   ```bash
   mysql -h hostinger-host -u user -p prayas2026 < database/schema.sql
   ```
3. Whitelist Render IP in Hostinger firewall

## Domain Configuration (Hostinger)

### DNS Records:
```
Type    Name    Value
A       @       Vercel IP (from Vercel dashboard)
CNAME   www     yourdomain.com
CNAME   api     prayas-backend.onrender.com
TXT     @       Verification records
```

## After Restructuring Checklist

- [ ] Folders created and files organized
- [ ] All Python files in `/backend`
- [ ] All HTML/CSS/JS in `/frontend` with subfolders
- [ ] Database schema in `/database`
- [ ] Docs in `/docs`
- [ ] .gitignore created
- [ ] Deployment config files created
- [ ] Git repository initialized
- [ ] Pushed to GitHub
- [ ] Render configured and deployed
- [ ] Vercel configured and deployed
- [ ] Hostinger database created
- [ ] Domain pointing correctly

## Important Notes

1. **Environment Variables**: Never commit .env files
2. **Secrets**: Use platform-specific secret management
3. **Database**: Always backup before deployment
4. **CORS**: Update with actual frontend URL
5. **API URL**: Update frontend config.js after Render deployment
6. **Database Connection**: Test from Render before going live

---

Created: February 6, 2026
Ready for GitHub push and multi-platform deployment
