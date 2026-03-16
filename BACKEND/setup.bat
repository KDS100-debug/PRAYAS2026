@echo off
REM Create PRAYAS2026 project structure

cd /d "c:\Users\SBENT\Downloads\PRAYAS2026"

REM Create frontend directories
mkdir frontend\pages 2>nul
mkdir frontend\css 2>nul
mkdir frontend\js 2>nul
mkdir frontend\images 2>nul

REM Create backend directories
mkdir backend\app 2>nul
mkdir backend\models 2>nul
mkdir backend\routes 2>nul
mkdir backend\utils 2>nul

REM Create database directories
mkdir database 2>nul

REM Create config directories
mkdir config 2>nul

echo ✓ Project structure created successfully!
pause
