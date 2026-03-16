# PRAYAS 2026 - STEP-BY-STEP FOLDER REORGANIZATION GUIDE

**Location**: `c:\Users\SBENT\Downloads\PRAYAS2026`

---

## 🎯 EXECUTION PLAN - DO THIS IN ORDER

### PHASE 1: Create Folder Structure (5 minutes)

#### Windows Command Prompt:
```batch
cd c:\Users\SBENT\Downloads\PRAYAS2026

:: Create BACKEND folders
mkdir backend
mkdir backend\routes
mkdir backend\models
mkdir backend\utils

:: Create FRONTEND folders
mkdir frontend
mkdir frontend\css
mkdir frontend\js
mkdir frontend\images

:: Create DATABASE folder
mkdir database
mkdir database\migrations
mkdir database\seeds

:: Create docs folder
mkdir docs

:: Create github workflows folder
mkdir .github\workflows
```

#### Linux/Mac Terminal:
```bash
cd ~/Downloads/PRAYAS2026

# Create BACKEND folders
mkdir -p backend/routes
mkdir -p backend/models
mkdir -p backend/utils

# Create FRONTEND folders
mkdir -p frontend/css
mkdir -p frontend/js
mkdir -p frontend/images

# Create DATABASE folder
mkdir -p database/migrations
mkdir -p database/seeds

# Create docs folder
mkdir -p docs

# Create github workflows folder
mkdir -p .github/workflows
```

---

## 📋 PHASE 2: Move Backend Files

### Move Main App File
```batch
:: From root to backend/
move app.py backend/
```

### Move Route Files to backend/routes/
```batch
move auth_routes.py backend\routes\
move student_routes.py backend\routes\
move payment_routes.py backend\routes\
move fee_routes.py backend\routes\
move book_routes.py backend\routes\
move publication_routes.py backend\routes\
move ranker_routes.py backend\routes\
move notification_routes.py backend\routes\
```

### Move Configuration Files to backend/
```batch
move requirements.txt backend\
move .env.example backend\
move Dockerfile backend\ (if exists, otherwise create)
move .dockerignore backend\ (if exists, otherwise create)
move render.yaml backend\ (if exists, otherwise create)
move Procfile backend\ (if exists, otherwise create)
```

---

## 📋 PHASE 3: Move Frontend Files

### Move HTML Files to frontend/
```batch
move index.html frontend\
move schools.html frontend\
move bookstore.html frontend\
move publication.html frontend\
move rankers.html frontend\
move about.html frontend\
move login.html frontend\
move admin1.html frontend\
move admin2.html frontend\
move admin3.html frontend\
move superadmin.html frontend\
move START_HERE.html frontend\
```

### Move CSS Files to frontend/css/
```batch
move style.css frontend\css\
move navbar.css frontend\css\
move admin.css frontend\css\
```

### Move JavaScript Files to frontend/js/
```batch
move carousel.js frontend\js\
move notifications.js frontend\js\
move auth.js frontend\js\
move schools.js frontend\js\
move bookstore.js frontend\js\
move publications.js frontend\js\
move rankers.js frontend\js\
move admin_functions.js frontend\js\
move superadmin.js frontend\js\
```

### Move Frontend Configuration Files
```batch
move vercel.json frontend\
move config.js frontend\
move .vercelignore frontend\
```

---

## 📋 PHASE 4: Move Database Files

### Move Schema Files
```batch
move database_schema.sql database\
move database\database_schema.sql database\schema.sql
```

---

## 📋 PHASE 5: Move Documentation

### Move All Docs to docs/ folder
```batch
move GITHUB_DEPLOYMENT_GUIDE.md docs\
move DEPLOYMENT_GUIDE.md docs\
move DEPLOYMENT_FILES.md docs\
move RESTRUCTURING_GUIDE.md docs\
move GITHUB_READY_SUMMARY.md docs\
move 00_START_HERE_DEPLOYMENT.txt docs\
move INDEX.md docs\
move INSTALLATION_GUIDE.md docs\
move API_REFERENCE.md docs\
move PROJECT_SUMMARY.md docs\
move FILE_LISTING.md docs\
move VERIFICATION.md docs\
move COMPLETION_SUMMARY.md docs\
move QUICK_START.txt docs\
```

---

## ✅ PHASE 6: Create Missing Files

### Create backend/.gitignore
```batch
echo. > backend\.gitignore
```

Then add this content:
```
__pycache__/
*.pyc
.Python
venv/
.env
*.log
.pytest_cache/
```

### Create backend/routes/__init__.py
```batch
echo. > backend\routes\__init__.py
```

Content:
```python
"""Routes package"""
```

### Create backend/models/__init__.py
```batch
echo. > backend\models\__init__.py
```

### Create backend/models/database.py
```batch
echo. > backend\models\database.py
```

Content:
```python
"""Database utilities"""
import MySQLdb
import os

class Database:
    def __init__(self):
        self.host = os.getenv('MYSQL_HOST')
        self.user = os.getenv('MYSQL_USER')
        self.password = os.getenv('MYSQL_PASSWORD')
        self.database = os.getenv('MYSQL_DB')
    
    def connect(self):
        return MySQLdb.connect(
            host=self.host,
            user=self.user,
            passwd=self.password,
            db=self.database
        )
```

### Create backend/utils/__init__.py
```batch
echo. > backend\utils\__init__.py
```

### Create backend/utils/auth.py
```batch
echo. > backend\utils\auth.py
```

Content:
```python
"""Authentication utilities"""
import jwt
import os
from datetime import datetime, timedelta
from werkzeug.security import generate_password_hash, check_password_hash

def hash_password(password):
    return generate_password_hash(password)

def verify_password(password_hash, password):
    return check_password_hash(password_hash, password)

def generate_token(data):
    return jwt.encode(
        {**data, 'exp': datetime.utcnow() + timedelta(hours=24)},
        os.getenv('SECRET_KEY'),
        algorithm='HS256'
    )
```

### Create backend/wsgi.py
```batch
echo. > backend\wsgi.py
```

Content:
```python
"""WSGI entry point for Render"""
from app import app

if __name__ == "__main__":
    app.run()
```

### Create frontend/.gitignore
```batch
echo. > frontend\.gitignore
```

Content:
```
.DS_Store
Thumbs.db
*.swp
*.swo
*~
.vscode/
.idea/
node_modules/
```

---

## ✅ PHASE 7: Verify Structure

After moving all files, verify with these commands:

### Windows:
```batch
:: Check backend structure
dir backend
dir backend\routes
dir backend\models
dir backend\utils

:: Check frontend structure
dir frontend
dir frontend\css
dir frontend\js
dir frontend\images

:: Check database
dir database

:: Check docs
dir docs
```

### Linux/Mac:
```bash
# Check all structures
tree backend/
tree frontend/
tree database/
tree docs/
```

---

## 📊 FINAL STRUCTURE AFTER REORGANIZATION

```
PRAYAS2026/
├── BACKEND/
│   ├── app.py
│   ├── requirements.txt
│   ├── Dockerfile
│   ├── .dockerignore
│   ├── render.yaml
│   ├── Procfile
│   ├── wsgi.py
│   ├── .env.example
│   ├── .gitignore
│   ├── routes/
│   │   ├── __init__.py
│   │   ├── auth_routes.py
│   │   ├── student_routes.py
│   │   ├── payment_routes.py
│   │   ├── fee_routes.py
│   │   ├── book_routes.py
│   │   ├── publication_routes.py
│   │   ├── ranker_routes.py
│   │   └── notification_routes.py
│   ├── models/
│   │   ├── __init__.py
│   │   └── database.py
│   └── utils/
│       ├── __init__.py
│       └── auth.py
│
├── FRONTEND/
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
│   ├── vercel.json
│   ├── config.js
│   ├── .vercelignore
│   ├── .env.example
│   ├── .gitignore
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
│   │   ├── admin_functions.js
│   │   └── superadmin.js
│   └── images/
│
├── DATABASE/
│   ├── schema.sql
│   ├── migrations/
│   └── seeds/
│
├── docs/
│   ├── GITHUB_DEPLOYMENT_GUIDE.md
│   ├── DEPLOYMENT_GUIDE.md
│   ├── DEPLOYMENT_FILES.md
│   ├── RESTRUCTURING_GUIDE.md
│   ├── GITHUB_READY_SUMMARY.md
│   ├── 00_START_HERE_DEPLOYMENT.txt
│   ├── INDEX.md
│   ├── INSTALLATION_GUIDE.md
│   ├── API_REFERENCE.md
│   ├── PROJECT_SUMMARY.md
│   ├── FILE_LISTING.md
│   ├── VERIFICATION.md
│   └── COMPLETION_SUMMARY.md
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── .gitignore
├── README.md
└── _DEPLOYMENT_COMPLETE.txt
```

---

## ⚙️ UPDATE JAVASCRIPT FILE IMPORTS

After moving, update JS files to reference the correct paths.

### In frontend/js/auth.js
```javascript
const API_URL = window.location.hostname === 'localhost' 
  ? 'http://localhost:5000'
  : 'https://prayas-backend.onrender.com';

// All API calls use API_URL
```

### In frontend/index.html (and other HTML files)
```html
<!-- Update script tags for new folder structure -->
<script src="js/carousel.js"></script>
<script src="js/notifications.js"></script>
<script src="js/auth.js"></script>

<!-- Update link tags for CSS -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/navbar.css">
```

---

## ✅ DEPLOYMENT READINESS CHECKLIST

### Backend (Render)
- [ ] All Python files in backend/
- [ ] requirements.txt in backend/
- [ ] Dockerfile in backend/
- [ ] render.yaml in backend/
- [ ] .env.example in backend/
- [ ] routes/ folder structure complete
- [ ] All imports updated

### Frontend (Vercel)
- [ ] All HTML files in frontend/
- [ ] CSS files in frontend/css/
- [ ] JS files in frontend/js/
- [ ] vercel.json in frontend/
- [ ] config.js in frontend/
- [ ] .env.example in frontend/
- [ ] All script paths updated

### Database (Hostinger)
- [ ] schema.sql in database/
- [ ] Backup copy of schema
- [ ] migrations folder created
- [ ] seeds folder created

### Git & GitHub
- [ ] .gitignore configured properly
- [ ] docs folder with all documentation
- [ ] .github/workflows folder (optional)
- [ ] README.md at root

---

## 🚀 WHAT'S NEXT

After reorganizing:

1. **Initialize Git**: `git init` in root directory
2. **Add Files**: `git add .`
3. **Commit**: `git commit -m "PRAYAS2026 - Folder restructuring for deployment"`
4. **Create GitHub Repository**: https://github.com/new
5. **Push**: Follow GITHUB_DEPLOYMENT_GUIDE.md

---

**Status**: Ready for reorganization
**Time Required**: 20-30 minutes
**Next Step**: Follow the phases above in order

