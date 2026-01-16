@echo off
setlocal enabledelayedexpansion

:: 🌌 SVGA Nebula Deployer v3.1.0 (Auto-Fix Edition)
:: Developer: Dollar
:: Company: NovaDevo

echo.
echo ============================================================
echo           SVGA Nebula - Git Push Automator
echo ============================================================
echo.

:: Define the target repository
set REPO_URL=https://github.com/novadevomaster/SGVA-NEBULA.git

:: --- FIX IDENTITY ---
echo [+] Checking Git identity...
git config user.email >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [!] Git email not set. Setting local identity...
    git config --local user.email "dollar@novadevo.com"
)
git config user.name >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [!] Git name not set. Setting local identity...
    git config --local user.name "Dollar"
)

:: Check if .git directory exists
if not exist ".git" (
    echo [!] Initializing Git repository...
    git init
    git remote add origin %REPO_URL%
) else (
    git remote set-url origin %REPO_URL%
)

:: Add all files
echo [+] Adding files to staging...
git add .

:: Ask for commit message
set /p msg="Enter commit message [Default: 'v3.0.0 Release by Dollar - SVGA Nebula']: "
if "%msg%"=="" set msg=v3.0.0 Release by Dollar - SVGA Nebula

:: Commit changes
echo [+] Committing changes...
git commit -m "%msg%"

:: Force main branch name to be standard
git branch -M main

:: Push to GitHub
echo [+] Pushing to GitHub (main branch)...
git push -u origin main --force

if %ERRORLEVEL% equ 0 (
    echo.
    echo ============================================================
    echo           🚀 Success! SVGA Nebula is now live.
    echo ============================================================
) else (
    echo.
    echo [X] Error: Failed to push to GitHub. 
    echo [!] Possible reasons:
    echo     1. GitHub repository doesn't exist yet.
    echo     2. You don't have permission to push.
    echo     3. Credentials (login) required.
)

echo.
pause
