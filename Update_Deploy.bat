@echo off
setlocal enabledelayedexpansion

:: 🌌 SVGA Nebula Deployer v3.2.0 (Direct Push Edition)
:: Developer: Dollar
:: Company: NovaDevo

echo.
echo ============================================================
echo           SVGA Nebula - Update ^& Deploy
echo ============================================================
echo.

:: Fix Identity if needed
git config user.email "dollar@novadevo.com"
git config user.name "Dollar"

:: Add, Commit, and Push
echo [+] Staging new updates...
git add .

set /p msg="Update Title (e.g. 'Fix Vercel'): "
if "%msg%"=="" set msg=Update SVGA Nebula - Premium v3.2.0

echo [+] Committing changes...
git commit -m "%msg%"

echo [+] Pushing to Cloud...
git push origin main --force

if %ERRORLEVEL% equ 0 (
    echo.
    echo ============================================================
    echo           🚀 Updates pushed! Check Vercel Dashboard.
    echo ============================================================
) else (
    echo.
    echo [X] Error: Push failed.
)

echo.
pause
