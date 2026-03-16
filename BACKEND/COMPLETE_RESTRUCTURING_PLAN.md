# PRAYAS 2026 - Complete File Structure Analysis & Reorganization

## 📊 CURRENT FILES INVENTORY & CATEGORIZATION

### FRONTEND FILES (23 files)
```
HTML Pages (12):
├── index.html                    → frontend/
├── schools.html                  → frontend/
├── bookstore.html                → frontend/
├── publication.html              → frontend/
├── rankers.html                  → frontend/
├── about.html                    → frontend/
├── login.html                    → frontend/
├── admin1.html                   → frontend/
├── admin2.html                   → frontend/
├── admin3.html                   → frontend/
├── superadmin.html               → frontend/
└── START_HERE.html               → frontend/

CSS Stylesheets (3):
├── style.css                     → frontend/css/
├── navbar.css                    → frontend/css/
└── admin.css                     → frontend/css/

JavaScript Files (8):
├── carousel.js                   → frontend/js/
├── notifications.js              → frontend/js/
├── auth.js                       → frontend/js/
├── schools.js                    → frontend/js/
├── bookstore.js                  → frontend/js/
├── publications.js               → frontend/js/
├── rankers.js                    → frontend/js/
└── admin_functions.js            → frontend/js/
    (superadmin.js - if separate)
```

### BACKEND FILES (20 files)
```
Main Application:
└── app.py                        → backend/

Route Modules (8):
├── auth_routes.py                → backend/routes/
├── student_routes.py             → backend/routes/
├── payment_routes.py             → backend/routes/
├── fee_routes.py                 → backend/routes/
├── book_routes.py                → backend/routes/
├── publication_routes.py         → backend/routes/
├── ranker_routes.py              → backend/routes/
└── notification_routes.py        → backend/routes/

Configuration Files:
├── requirements.txt              → backend/
├── .env.example                  → backend/
├── Dockerfile                    → backend/
├── .dockerignore                 → backend/
├── render.yaml                   → backend/
├── Procfile                      → backend/
└── wsgi.py                       → backend/

Models/Utils (Optional - if created):
├── models/                       → backend/models/
└── utils/                        → backend/utils/
```

### DATABASE FILES (2 files)
```
Schema:
└── database_schema.sql           → database/
└── schema.sql                    → database/ (renamed copy)

Migrations (if any):
└── migrations/                   → database/migrations/

Seed Data (if any):
└── seeds/                        → database/seeds/
```

### CONFIGURATION FILES (7 files)
```
Root Level Config:
├── .gitignore                    → .gitignore (root)
├── README.md                     → README.md (root)

Frontend Config:
├── vercel.json                   → frontend/
├── config.js                     → frontend/
└── .vercelignore                 → frontend/

Backend Config:
├── render.yaml                   → backend/
└── requirements.txt              → backend/
```

### DOCUMENTATION FILES (15+ files)
```
Deployment Guides:
├── GITHUB_DEPLOYMENT_GUIDE.md    → docs/
├── DEPLOYMENT_GUIDE.md           → docs/
├── DEPLOYMENT_FILES.md           → docs/
├── RESTRUCTURING_GUIDE.md        → docs/
├── GITHUB_READY_SUMMARY.md       → docs/
├── 00_START_HERE_DEPLOYMENT.txt  → docs/
└── INDEX.md                      → docs/

Original Documentation:
├── README.md                     → docs/
├── INSTALLATION_GUIDE.md         → docs/
├── API_REFERENCE.md              → docs/
├── PROJECT_SUMMARY.md            → docs/
├── FILE_LISTING.md               → docs/
├── VERIFICATION.md               → docs/
├── COMPLETION_SUMMARY.md         → docs/
└── QUICK_START.txt               → docs/
```

================================================================================

## 📁 FINAL FOLDER STRUCTURE

```
PRAYAS2026/
│
├── BACKEND/ (Render Deployment)
│   ├── app.py                          [Main Flask application]
│   ├── requirements.txt                [Python dependencies]
│   ├── Dockerfile                      [Docker configuration]
│   ├── .dockerignore                   [Docker ignore file]
│   ├── render.yaml                     [Render deployment config]
│   ├── Procfile                        [Heroku/Render start]
│   ├── wsgi.py                         [WSGI entry point]
│   ├── .env.example                    [Environment template]
│   │
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
│   │
│   ├── models/
│   │   ├── __init__.py
│   │   └── database.py
│   │
│   ├── utils/
│   │   ├── __init__.py
│   │   ├── auth.py
│   │   └── helpers.py
│   │
│   └── .gitignore
│
├── FRONTEND/ (Vercel Deployment)
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
│   │
│   ├── css/
│   │   ├── style.css
│   │   ├── navbar.css
│   │   └── admin.css
│   │
│   ├── js/
│   │   ├── carousel.js
│   │   ├── notifications.js
│   │   ├── auth.js
│   │   ├── schools.js
│   │   ├── bookstore.js
│   │   ├── publications.js
│   │   ├── rankers.js
│   │   └── admin_functions.js
│   │
│   ├── images/
│   │   └── [image files]
│   │
│   ├── vercel.json                    [Vercel config]
│   ├── .vercelignore                  [Vercel ignore]
│   ├── config.js                      [Frontend config]
│   ├── .env.example                   [Environment template]
│   └── .gitignore
│
├── DATABASE/
│   ├── schema.sql                     [MySQL schema]
│   ├── database_schema.sql            [Copy of schema]
│   │
│   ├── migrations/
│   │   └── [migration files]
│   │
│   └── seeds/
│       └── [seed data files]
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
├── .gitignore                         [Git ignore - root level]
├── README.md                          [Project overview - root level]
├── LICENSE                            [Optional]
└── _DEPLOYMENT_COMPLETE.txt
```

================================================================================

## 🔄 FILE MOVEMENT MAPPING

### STEP 1: CREATE FOLDERS

```bash
# Create main folders
mkdir backend
mkdir backend\routes
mkdir backend\models
mkdir backend\utils

mkdir frontend
mkdir frontend\css
mkdir frontend\js
mkdir frontend\images

mkdir database
mkdir database\migrations
mkdir database\seeds

mkdir docs
mkdir .github\workflows
```

### STEP 2: MOVE BACKEND FILES

```
MOVE TO: backend/
├── app.py
├── requirements.txt
├── Dockerfile
├── .dockerignore
├── render.yaml
├── Procfile
├── wsgi.py (create new)
├── .env.example
└── .gitignore (create new)

MOVE TO: backend/routes/
├── auth_routes.py
├── student_routes.py
├── payment_routes.py
├── fee_routes.py
├── book_routes.py
├── publication_routes.py
├── ranker_routes.py
├── notification_routes.py
└── __init__.py (create new)

MOVE TO: backend/models/
├── __init__.py (create new)
└── database.py (create new)

MOVE TO: backend/utils/
├── __init__.py (create new)
├── auth.py (create new)
└── helpers.py (create new)
```

### STEP 3: MOVE FRONTEND FILES

```
MOVE TO: frontend/
├── index.html
├── schools.html
├── bookstore.html
├── publication.html
├── rankers.html
├── about.html
├── login.html
├── admin1.html
├── admin2.html
├── admin3.html
├── superadmin.html
├── START_HERE.html
├── vercel.json
├── config.js
├── .vercelignore
├── .env.example
└── .gitignore (create new)

MOVE TO: frontend/css/
├── style.css
├── navbar.css
└── admin.css

MOVE TO: frontend/js/
├── carousel.js
├── notifications.js
├── auth.js
├── schools.js
├── bookstore.js
├── publications.js
├── rankers.js
├── admin_functions.js
└── superadmin.js (if separate)

CREATE: frontend/images/
(Empty folder for image files)
```

### STEP 4: MOVE DATABASE FILES

```
MOVE TO: database/
├── database_schema.sql → rename to schema.sql
└── [keep copy as backup.sql]

CREATE: database/migrations/
(For future database updates)

CREATE: database/seeds/
(For initial test data)
```

### STEP 5: MOVE DOCUMENTATION

```
MOVE TO: docs/
├── GITHUB_DEPLOYMENT_GUIDE.md
├── DEPLOYMENT_GUIDE.md
├── DEPLOYMENT_FILES.md
├── RESTRUCTURING_GUIDE.md
├── GITHUB_READY_SUMMARY.md
├── 00_START_HERE_DEPLOYMENT.txt
├── INDEX.md
├── INSTALLATION_GUIDE.md
├── API_REFERENCE.md
├── PROJECT_SUMMARY.md
├── FILE_LISTING.md
├── VERIFICATION.md
├── COMPLETION_SUMMARY.md
└── QUICK_START.txt
```

### STEP 6: ROOT LEVEL FILES

```
KEEP AT ROOT:
├── .gitignore
├── README.md
├── _DEPLOYMENT_COMPLETE.txt
└── LICENSE (optional)

CREATE: .github/workflows/deploy.yml
(For GitHub Actions - optional)
```

================================================================================

## ✅ FILE-BY-FILE CHECKLIST

### FRONTEND - HTML PAGES (12 files)
- [ ] index.html → frontend/
- [ ] schools.html → frontend/
- [ ] bookstore.html → frontend/
- [ ] publication.html → frontend/
- [ ] rankers.html → frontend/
- [ ] about.html → frontend/
- [ ] login.html → frontend/
- [ ] admin1.html → frontend/
- [ ] admin2.html → frontend/
- [ ] admin3.html → frontend/
- [ ] superadmin.html → frontend/
- [ ] START_HERE.html → frontend/

### FRONTEND - CSS (3 files)
- [ ] style.css → frontend/css/
- [ ] navbar.css → frontend/css/
- [ ] admin.css → frontend/css/

### FRONTEND - JAVASCRIPT (8 files)
- [ ] carousel.js → frontend/js/
- [ ] notifications.js → frontend/js/
- [ ] auth.js → frontend/js/
- [ ] schools.js → frontend/js/
- [ ] bookstore.js → frontend/js/
- [ ] publications.js → frontend/js/
- [ ] rankers.js → frontend/js/
- [ ] admin_functions.js → frontend/js/
- [ ] superadmin.js → frontend/js/ (if separate)

### BACKEND - MAIN (1 file)
- [ ] app.py → backend/

### BACKEND - ROUTES (8 files)
- [ ] auth_routes.py → backend/routes/
- [ ] student_routes.py → backend/routes/
- [ ] payment_routes.py → backend/routes/
- [ ] fee_routes.py → backend/routes/
- [ ] book_routes.py → backend/routes/
- [ ] publication_routes.py → backend/routes/
- [ ] ranker_routes.py → backend/routes/
- [ ] notification_routes.py → backend/routes/

### BACKEND - CONFIG (6 files)
- [ ] requirements.txt → backend/
- [ ] Dockerfile → backend/
- [ ] .dockerignore → backend/
- [ ] render.yaml → backend/
- [ ] Procfile → backend/
- [ ] .env.example → backend/

### DATABASE (1 file)
- [ ] database_schema.sql → database/ (as schema.sql)

### DOCUMENTATION (13+ files)
- [ ] GITHUB_DEPLOYMENT_GUIDE.md → docs/
- [ ] DEPLOYMENT_GUIDE.md → docs/
- [ ] DEPLOYMENT_FILES.md → docs/
- [ ] RESTRUCTURING_GUIDE.md → docs/
- [ ] GITHUB_READY_SUMMARY.md → docs/
- [ ] 00_START_HERE_DEPLOYMENT.txt → docs/
- [ ] INDEX.md → docs/
- [ ] INSTALLATION_GUIDE.md → docs/
- [ ] API_REFERENCE.md → docs/
- [ ] PROJECT_SUMMARY.md → docs/
- [ ] FILE_LISTING.md → docs/
- [ ] VERIFICATION.md → docs/
- [ ] COMPLETION_SUMMARY.md → docs/
- [ ] QUICK_START.txt → docs/

### ROOT LEVEL
- [ ] .gitignore → root/
- [ ] README.md → root/
- [ ] _DEPLOYMENT_COMPLETE.txt → root/
- [ ] LICENSE → root/ (optional)

### CREATE NEW - BACKEND
- [ ] backend/.gitignore
- [ ] backend/routes/__init__.py
- [ ] backend/models/__init__.py
- [ ] backend/models/database.py
- [ ] backend/utils/__init__.py
- [ ] backend/utils/auth.py
- [ ] backend/utils/helpers.py
- [ ] backend/wsgi.py

### CREATE NEW - FRONTEND
- [ ] frontend/.gitignore
- [ ] frontend/images/ (folder)

================================================================================

## 📝 TOTAL FILE COUNT

After Reorganization:
├── Backend Files: 25 files
├── Frontend Files: 24 files
├── Database Files: 1 file
├── Documentation: 13 files
└── Configuration: 5 files

**TOTAL: ~70 files**

================================================================================

## 🔧 FILES TO CREATE (New)

### backend/wsgi.py
```python
"""WSGI entry point for Render deployment"""
import os
from app import app

if __name__ == "__main__":
    app.run()
```

### backend/.gitignore
```
__pycache__/
*.pyc
.Python
venv/
.env
*.log
```

### backend/routes/__init__.py
```python
"""Routes package"""
```

### backend/models/__init__.py
```python
"""Models package"""
```

### backend/models/database.py
```python
"""Database models and utilities"""
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

### backend/utils/__init__.py
```python
"""Utils package"""
```

### backend/utils/auth.py
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

def verify_token(token):
    try:
        return jwt.decode(token, os.getenv('SECRET_KEY'), algorithms=['HS256'])
    except:
        return None
```

### backend/utils/helpers.py
```python
"""Helper functions"""

def validate_email(email):
    import re
    return re.match(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$', email)

def validate_phone(phone):
    import re
    return re.match(r'^[0-9]{10}$', phone)

def validate_password(password):
    return len(password) >= 8

def is_valid_uuid(uuid_string):
    import uuid
    try:
        uuid.UUID(uuid_string)
        return True
    except ValueError:
        return False
```

### frontend/.gitignore
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

### frontend/images/ (empty folder for images)

================================================================================

Created: February 6, 2026
Status: Complete File Structure Analysis Ready
