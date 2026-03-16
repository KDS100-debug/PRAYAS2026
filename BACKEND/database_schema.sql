-- PRAYAS 2026 Database Schema
-- Create database
CREATE DATABASE IF NOT EXISTS prayas2026;
USE prayas2026;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    father_name VARCHAR(255),
    current_roll_no VARCHAR(100) UNIQUE,
    current_class VARCHAR(50),
    phone VARCHAR(20),
    caste VARCHAR(50),
    school_name VARCHAR(255),
    role ENUM('student', 'admin', 'superadmin', 'public') DEFAULT 'student',
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Notification table
CREATE TABLE IF NOT EXISTS notification (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    link VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Fee structure table
CREATE TABLE IF NOT EXISTS fee_structure (
    id INT AUTO_INCREMENT PRIMARY KEY,
    class VARCHAR(50) NOT NULL,
    school_name VARCHAR(255) NOT NULL,
    fee_type ENUM('monthly', 'quarterly', 'yearly') NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_fee (class, school_name, fee_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Bookstore table
CREATE TABLE IF NOT EXISTS bookstore (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    author VARCHAR(255),
    price DECIMAL(10, 2),
    available TINYINT DEFAULT 1,
    cover_image_url VARCHAR(500),
    pdf_url_link VARCHAR(500),
    description LONGTEXT,
    category VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Orders table
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(100) UNIQUE,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    status ENUM('pending', 'approved', 'shipped', 'delivered') DEFAULT 'pending',
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES bookstore(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Payment receipts table
CREATE TABLE IF NOT EXISTS payment_receipts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    payment_id VARCHAR(100) UNIQUE NOT NULL,
    user_id INT NOT NULL,
    name VARCHAR(255),
    father_name VARCHAR(255),
    current_roll_no VARCHAR(100),
    current_class VARCHAR(50),
    school_name VARCHAR(255),
    fee_type ENUM('monthly', 'quarterly', 'yearly'),
    amount DECIMAL(10, 2),
    status ENUM('pending', 'completed', 'failed') DEFAULT 'pending',
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Rankers table
CREATE TABLE IF NOT EXISTS rankers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    school_name VARCHAR(255),
    rank INT,
    class VARCHAR(50),
    year INT,
    image VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Publication table
CREATE TABLE IF NOT EXISTS publication (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    author VARCHAR(255),
    category VARCHAR(100),
    abstract LONGTEXT,
    image_url VARCHAR(500),
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create indexes for faster queries
CREATE INDEX idx_user_school ON users(school_name);
CREATE INDEX idx_user_roll ON users(current_roll_no);
CREATE INDEX idx_payment_school ON payment_receipts(school_name);
CREATE INDEX idx_payment_user ON payment_receipts(user_id);
CREATE INDEX idx_ranker_year ON rankers(year);
CREATE INDEX idx_publication_status ON publication(status);
CREATE INDEX idx_order_user ON orders(user_id);
