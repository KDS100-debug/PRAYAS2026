# PRAYAS 2026 - Configuration & API Reference

## Database Configuration

### Connection String
```
Host: localhost (or your Hostinger host)
Username: root (or your username)
Password: [Your password]
Database: prayas2026
Port: 3306
```

### Environment Variables (.env)
```
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD=your_password
MYSQL_DB=prayas2026
FLASK_ENV=development
SECRET_KEY=your-secret-key-here
APP_PORT=5000
APP_HOST=0.0.0.0
JWT_EXPIRATION_HOURS=24
```

## Database Tables Schema

### 1. users
```sql
PRIMARY KEY: id (INT)
COLUMNS:
- id: AUTO_INCREMENT PRIMARY KEY
- name: VARCHAR(255) NOT NULL
- father_name: VARCHAR(255)
- current_roll_no: VARCHAR(100) UNIQUE
- current_class: VARCHAR(50)
- phone: VARCHAR(20)
- caste: VARCHAR(50)
- school_name: VARCHAR(255)
- role: ENUM('student', 'admin', 'superadmin', 'public')
- password: VARCHAR(255) NOT NULL
- created_at: TIMESTAMP
- updated_at: TIMESTAMP

INDEX: idx_user_school (school_name)
INDEX: idx_user_roll (current_roll_no)
```

### 2. notification
```sql
PRIMARY KEY: id (INT)
COLUMNS:
- id: AUTO_INCREMENT PRIMARY KEY
- date: DATE NOT NULL
- link: VARCHAR(500)
- created_at: TIMESTAMP
```

### 3. fee_structure
```sql
PRIMARY KEY: id (INT)
COLUMNS:
- id: AUTO_INCREMENT PRIMARY KEY
- class: VARCHAR(50) NOT NULL
- school_name: VARCHAR(255) NOT NULL
- fee_type: ENUM('monthly', 'quarterly', 'yearly')
- amount: DECIMAL(10, 2) NOT NULL
- created_at: TIMESTAMP
- updated_at: TIMESTAMP

UNIQUE KEY: unique_fee (class, school_name, fee_type)
```

### 4. bookstore
```sql
PRIMARY KEY: id (INT)
COLUMNS:
- id: AUTO_INCREMENT PRIMARY KEY
- title: VARCHAR(500) NOT NULL
- author: VARCHAR(255)
- price: DECIMAL(10, 2)
- available: TINYINT DEFAULT 1
- cover_image_url: VARCHAR(500)
- pdf_url_link: VARCHAR(500)
- description: LONGTEXT
- category: VARCHAR(100)
- created_at: TIMESTAMP
- updated_at: TIMESTAMP
```

### 5. orders
```sql
PRIMARY KEY: id (INT)
COLUMNS:
- id: AUTO_INCREMENT PRIMARY KEY
- order_id: VARCHAR(100) UNIQUE
- user_id: INT NOT NULL FOREIGN KEY (users.id)
- book_id: INT NOT NULL FOREIGN KEY (bookstore.id)
- status: ENUM('pending', 'approved', 'shipped', 'delivered')
- order_date: TIMESTAMP

INDEX: idx_order_user (user_id)
```

### 6. payment_receipts
```sql
PRIMARY KEY: id (INT)
COLUMNS:
- id: AUTO_INCREMENT PRIMARY KEY
- payment_id: VARCHAR(100) UNIQUE NOT NULL
- user_id: INT NOT NULL FOREIGN KEY (users.id)
- name: VARCHAR(255)
- father_name: VARCHAR(255)
- current_roll_no: VARCHAR(100)
- current_class: VARCHAR(50)
- school_name: VARCHAR(255)
- fee_type: ENUM('monthly', 'quarterly', 'yearly')
- amount: DECIMAL(10, 2)
- status: ENUM('pending', 'completed', 'failed')
- date_created: TIMESTAMP

INDEX: idx_payment_school (school_name)
INDEX: idx_payment_user (user_id)
```

### 7. rankers
```sql
PRIMARY KEY: id (INT)
COLUMNS:
- id: AUTO_INCREMENT PRIMARY KEY
- name: VARCHAR(255) NOT NULL
- school_name: VARCHAR(255)
- rank: INT
- class: VARCHAR(50)
- year: INT
- image: VARCHAR(500)
- created_at: TIMESTAMP
- updated_at: TIMESTAMP

INDEX: idx_ranker_year (year)
```

### 8. publication
```sql
PRIMARY KEY: id (INT)
COLUMNS:
- id: AUTO_INCREMENT PRIMARY KEY
- title: VARCHAR(500) NOT NULL
- author: VARCHAR(255)
- category: VARCHAR(100)
- abstract: LONGTEXT
- image_url: VARCHAR(500)
- status: ENUM('pending', 'approved', 'rejected')
- created_at: TIMESTAMP
- updated_at: TIMESTAMP

INDEX: idx_publication_status (status)
```

## API Endpoints Reference

### Authentication Routes
```
POST /api/auth/login
- Request: { username, password, loginType }
- Response: { success, token, redirect, message }

POST /api/auth/register
- Request: { fullName, fatherName, rollNumber, phone, caste, class, password, registerType }
- Response: { success, message }

POST /api/auth/validate-token
- Headers: Authorization: Bearer [token]
- Response: { valid }
```

### Student Routes
```
GET /api/students
- Query: ?school=[schoolName]
- Response: [{ id, name, rollNumber, class, caste, phone, schoolName }]

GET /api/students/<id>
- Response: { id, name, rollNumber, class, caste, phone, schoolName }
```

### Payment Routes
```
GET /api/payments
- Query: ?school=[schoolName]
- Response: [{ payment_id, name, rollNumber, class, amount, schoolName, date }]

POST /api/payments
- Request: { userId, name, fatherName, feeType, amount, class }
- Response: { success, paymentId }

GET /api/payments/<id>
- Response: { id, payment_id, name, amount, status }
```

### Fee Structure Routes
```
GET /api/fee-structure
- Query: ?school=[name]&class=[class]&type=[type]
- Response: [{ id, class, schoolName, feeType, amount }]

POST /api/fee-structure
- Request: { class, schoolName, feeType, amount }
- Response: { success }

PUT /api/fee-structure/<id>
- Request: { amount }
- Response: { success }
```

### Book Routes
```
GET /api/books
- Response: [{ id, title, author, price, available, coverImage, pdfUrl, description, category }]

POST /api/books
- Request: { title, author, price, category, available, coverImage, pdfUrl, description }
- Response: { success }

PUT /api/books/<id>
- Request: { price, available }
- Response: { success }
```

### Publication Routes
```
GET /api/publications
- Response: [{ id, title, author, category, abstract, image, status }]

POST /api/publications/<id>/approve
- Response: { success }

POST /api/publications/<id>/reject
- Response: { success }
```

### Ranker Routes
```
GET /api/rankers
- Query: ?year=[year]
- Response: [{ id, name, schoolName, rank, class, year, image }]

POST /api/rankers
- Request: { name, schoolName, rank, class, year, image }
- Response: { success }

PUT /api/rankers/<id>
- Request: { rank, image }
- Response: { success }
```

### Notification Routes
```
GET /api/notifications
- Response: [{ id, date, link }]

POST /api/notifications
- Request: { date, link }
- Response: { success }

DELETE /api/notifications/<id>
- Response: { success }
```

## JavaScript API Calls

### Authentication
```javascript
// Login
fetch('/api/auth/login', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ username, password, loginType })
});

// Register
fetch('/api/auth/register', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ fullName, fatherName, ... })
});
```

### Get Data with Token
```javascript
fetch('/api/students', {
    headers: { 'Authorization': 'Bearer ' + localStorage.getItem('token') }
});
```

## Environment-Specific Configuration

### Development
```
FLASK_ENV=development
FLASK_DEBUG=True
SECRET_KEY=dev-key-not-secure
MYSQL_HOST=localhost
```

### Production
```
FLASK_ENV=production
FLASK_DEBUG=False
SECRET_KEY=strong-random-key-here
MYSQL_HOST=production-host
MYSQL_PASSWORD=strong-password
```

## File Upload Configuration

### Allowed Extensions
- Images: jpg, jpeg, png
- Documents: pdf, doc, docx
- Maximum Size: 50MB (configurable)

### Upload Paths
- Cover Images: /uploads/books/covers/
- PDFs: /uploads/pdfs/
- Publication Images: /uploads/publications/
- Ranker Images: /uploads/rankers/

## Authentication Flow

1. User submits login form
2. Frontend sends POST to /api/auth/login
3. Backend validates credentials
4. Returns JWT token and redirect URL
5. Frontend stores token in localStorage
6. Token sent with subsequent API requests
7. Backend validates token before processing
8. Token expires after 24 hours (configurable)

## Error Handling

### Common HTTP Status Codes
- 200: Success
- 201: Created
- 400: Bad Request (missing/invalid fields)
- 401: Unauthorized (invalid credentials/token)
- 404: Not Found (resource doesn't exist)
- 500: Server Error

### Error Response Format
```json
{
    "success": false,
    "error": "Error message",
    "message": "Human readable message"
}
```

## CORS Configuration

### Allowed Origins (Production)
```
https://yourdomain.com
https://admin.yourdomain.com
https://www.yourdomain.com
```

### Allowed Methods
- GET
- POST
- PUT
- DELETE
- OPTIONS

## Performance Optimization

### Indexes Created
- users.school_name
- users.current_roll_no
- payment_receipts.school_name
- payment_receipts.user_id
- rankers.year
- publication.status
- orders.user_id

### Query Optimization Tips
- Use indexes for WHERE clauses
- Limit results with pagination
- Cache frequently accessed data
- Use prepared statements (already implemented)

## Security Best Practices

1. **Change Default Credentials**: Update all admin passwords in production
2. **Use HTTPS**: Enable SSL/TLS on production
3. **Secure Environment Variables**: Never commit .env to version control
4. **Regular Backups**: Backup database daily
5. **Monitor Logs**: Check error logs regularly
6. **Update Dependencies**: Keep packages up to date
7. **Validate Input**: All form inputs are validated
8. **SQL Injection Prevention**: Parameterized queries used throughout

## Deployment Checklist

- [ ] Update .env with production values
- [ ] Change SECRET_KEY
- [ ] Update MYSQL credentials
- [ ] Set FLASK_ENV=production
- [ ] Set FLASK_DEBUG=False
- [ ] Enable HTTPS
- [ ] Configure CORS for production domain
- [ ] Test all login credentials
- [ ] Test all API endpoints
- [ ] Set up database backups
- [ ] Monitor error logs
- [ ] Test on mobile devices
- [ ] Load test the application

---

Last Updated: February 6, 2026
Version: 1.0.0
