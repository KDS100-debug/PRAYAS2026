# PRAYAS 2026 - Educational Management System

A comprehensive educational management system for multiple schools with features for student management, fee collection, book store, publication management, and ranker tracking.

## Project Structure

```
PRAYAS2026/
├── frontend/
│   ├── pages/          # HTML pages
│   ├── css/            # Stylesheets
│   ├── js/             # JavaScript files
│   └── images/         # Image assets
├── backend/
│   ├── app/            # Flask application
│   ├── models/         # Database models
│   ├── routes/         # API routes
│   └── utils/          # Utility functions
├── database/           # Database schemas and scripts
├── config/             # Configuration files
└── README.md
```

## Features

### Public Section
- Home page with notifications
- School information and fee payment
- Bookstore with publications
- Ranker showcase
- User authentication (Login/Register)

### School Admin (admin1, admin2, admin3)
- Student management with filters
- Payment tracking
- Payment record management

### Super Admin
- Complete student management
- Payment oversight
- Notification management
- Fee structure configuration
- Ranker management
- Publication approval/rejection
- Book management
- Book order tracking

## Database Tables
- USERS
- NOTIFICATION
- FEE_STRUCTURE
- BOOKSTORE
- ORDERS
- PAYMENT_RECEIPTS
- RANKERS
- PUBLICATION

## Technologies
- Frontend: HTML5, CSS3, JavaScript
- Backend: Python Flask
- Database: MySQL (Hostinger)
