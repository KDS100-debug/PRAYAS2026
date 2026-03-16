# PRAYAS 2026 - Educational Management System

## Overview
A comprehensive educational management system for multiple schools with features for student management, fee collection, bookstore, publication management, and ranker tracking.

## Features

### Public Features
- **Home Page**: Carousel of images, notifications display, user authentication
- **Schools**: Fee structure display, online payment processing
- **Bookstore**: Browse and purchase books with PDF downloads
- **Publications**: View approved publications and research papers
- **Rankers**: Display top-performing students with filters
- **User Authentication**: Login/Register for students, admins, and public users

### School Admin Features (admin1, admin2, admin3)
- Student management with advanced filtering
- Payment tracking and records
- Add payment records with automatic amount calculation
- School-specific data filtering

### Super Admin Features
- Complete student and payment management across all schools
- Notification management
- Fee structure configuration
- Ranker management and updates
- Publication approval/rejection workflow
- Book management and inventory
- Book order management with status tracking

## Project Structure

```
PRAYAS2026/
├── Frontend Files (HTML pages)
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
│   └── superadmin.html
│
├── Stylesheets
│   ├── style.css
│   ├── navbar.css
│   └── admin.css
│
├── JavaScript Files
│   ├── carousel.js
│   ├── notifications.js
│   ├── auth.js
│   ├── schools.js
│   ├── bookstore.js
│   ├── publications.js
│   ├── rankers.js
│   ├── admin_functions.js
│   └── superadmin.js
│
├── Backend (Python Flask)
│   ├── app.py (Main application)
│   ├── auth_routes.py
│   ├── student_routes.py
│   ├── payment_routes.py
│   ├── fee_routes.py
│   ├── book_routes.py
│   ├── publication_routes.py
│   ├── ranker_routes.py
│   └── notification_routes.py
│
├── Database
│   └── database_schema.sql
│
├── Configuration
│   ├── .env.example
│   ├── requirements.txt
│   ├── setup.bat (Windows)
│   └── setup.sh (Linux/Mac)
│
└── README.md
```

## Technologies Used

- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Backend**: Python Flask
- **Database**: MySQL (Hostinger compatible)
- **Authentication**: JWT Tokens
- **API**: RESTful API

## Database Tables

1. **users** - User accounts (students, admins, public)
2. **notification** - System notifications
3. **fee_structure** - School fee information
4. **bookstore** - Book inventory
5. **orders** - Book purchase orders
6. **payment_receipts** - Payment records
7. **rankers** - Top-performing students
8. **publication** - Research papers and publications

## Installation & Setup

### Prerequisites
- Python 3.8+
- MySQL Server
- Node.js (optional, for frontend tooling)

### Windows Setup

1. Clone or download the project
2. Open Command Prompt in the project directory
3. Run the setup script:
   ```bash
   setup.bat
   ```
4. Configure `.env` file with your database credentials:
   ```
   MYSQL_HOST=your_host
   MYSQL_USER=your_user
   MYSQL_PASSWORD=your_password
   MYSQL_DB=prayas2026
   ```
5. Create the database:
   ```bash
   mysql -u root -p < database_schema.sql
   ```
6. Start the Flask server:
   ```bash
   python app.py
   ```
7. Open `index.html` in a web browser

### Linux/Mac Setup

1. Clone or download the project
2. Open Terminal in the project directory
3. Run the setup script:
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```
4. Configure `.env` file with your database credentials
5. Create the database:
   ```bash
   mysql -u root -p < database_schema.sql
   ```
6. Start the Flask server:
   ```bash
   python app.py
   ```
7. Open `index.html` in a web browser

## API Endpoints

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration
- `POST /api/auth/validate-token` - Validate JWT token

### Students
- `GET /api/students` - Get all students (with filters)
- `GET /api/students/<id>` - Get specific student

### Payments
- `GET /api/payments` - Get all payments
- `POST /api/payments` - Create payment record
- `GET /api/payments/<id>` - Get specific payment

### Fee Structure
- `GET /api/fee-structure` - Get fee structure (with filters)
- `POST /api/fee-structure` - Create fee structure
- `PUT /api/fee-structure/<id>` - Update fee structure

### Books
- `GET /api/books` - Get all books
- `POST /api/books` - Add new book
- `PUT /api/books/<id>` - Update book

### Publications
- `GET /api/publications` - Get approved publications
- `POST /api/publications/<id>/approve` - Approve publication
- `POST /api/publications/<id>/reject` - Reject publication

### Rankers
- `GET /api/rankers` - Get rankers (with year filter)
- `POST /api/rankers` - Add ranker
- `PUT /api/rankers/<id>` - Update ranker

### Notifications
- `GET /api/notifications` - Get notifications
- `POST /api/notifications` - Add notification
- `DELETE /api/notifications/<id>` - Delete notification

## Default Login Credentials

| Username | Password | Role | Redirect |
|----------|----------|------|----------|
| Superadmin | Superadmin@1341 | Super Admin | superadmin.html |
| Schooladmin1 | Schooladmin@13 | School Admin 1 | admin1.html |
| Schooladmin2 | Schooladmin@93 | School Admin 2 | admin2.html |
| Schooladmin3 | Schooladmin@390 | School Admin 3 | admin3.html |

## Schools

1. **Bokakhat Jatiya Bidyalaya**
2. **Brahmaputra Jatiya Bidyalaya**
3. **Mohuramukh Jatiya Bidyalaya**

## Classes Supported

- Ankur, Kuhi, Hupan (Pre-school)
- I, II, III, IV, V, VI, VII, VIII, IX, X (Primary & Middle School)
- XI-Science, XI-Arts, XI-Commerce (11th Grade)
- XII-Science, XII-Arts, XII-Commerce (12th Grade)

## Hosting on Hostinger

1. Upload files to Hostinger via FTP/SFTP
2. Configure database in Hostinger control panel
3. Set up environment variables
4. Run database schema
5. Update `.env` with Hostinger database credentials
6. Deploy Flask backend (using Python support or Docker if available)

## API Response Format

### Success Response
```json
{
  "success": true,
  "data": { ... },
  "message": "Operation successful"
}
```

### Error Response
```json
{
  "success": false,
  "error": "Error message",
  "message": "Operation failed"
}
```

## Security Considerations

- All passwords are hashed using werkzeug
- JWT tokens with 24-hour expiration
- CORS enabled for safe cross-origin requests
- SQL injection protection using parameterized queries
- Environment variables for sensitive data
- Change SECRET_KEY in production

## Troubleshooting

### Database Connection Issues
- Verify MySQL is running
- Check database credentials in `.env`
- Ensure database schema is created

### Flask Server Issues
- Check if port 5000 is available
- Verify all dependencies are installed: `pip install -r requirements.txt`
- Check Flask logs for error messages

### Frontend Issues
- Clear browser cache
- Check browser console for JavaScript errors
- Verify API endpoints in JavaScript files

## Contributing

1. Create a new branch for features
2. Make changes following code style
3. Test thoroughly
4. Commit with clear messages
5. Push and create pull request

## License

This project is created for Prayas Adhyan Chakra. All rights reserved.

## Support

For issues, questions, or suggestions, please contact the project administrator.

## Updates & Maintenance

- Regular database backups recommended
- Monitor server logs for errors
- Update dependencies periodically
- Test new features thoroughly before deployment

---

**Last Updated**: 2026-02-06
**Version**: 1.0.0
