# =============================================================================
# Llmrix Devtool One-liner Installer (Windows)
# =============================================================================

$ErrorActionPreference = "Stop"

Write-Host "`n>>> 🚀 Preparing to install Llmrix Devtool..." -ForegroundColor Cyan

# 1. Check Node.js
if (!(Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Error: Node.js not found." -ForegroundColor Red
    Write-Host "Llmrix Devtool requires Node.js environment to run." -ForegroundColor Yellow
    Write-Host "Please visit https://nodejs.org/ to download and install (LTS version recommended)."
    exit 1
}

$nodeVer = node -v
Write-Host "✅ Found Node.js: $nodeVer" -ForegroundColor Green

# 2. Check npm
if (!(Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Error: npm not found." -ForegroundColor Red
    Write-Host "Please ensure your Node.js installation is complete."
    exit 1
}

# 3. Execute installation
Write-Host ">>> 📦 Installing llmrix-devtool globally via npm..." -ForegroundColor Cyan
Write-Host "(This may take a while. Please keep your internet connection active)" -ForegroundColor Yellow

try {
    npm install -g llmrix-devtool
    
    Write-Host "`n==================================================" -ForegroundColor Green
    Write-Host "🎉 Llmrix Devtool installed successfully!" -ForegroundColor Green
    Write-Host "==================================================" -ForegroundColor Green
    Write-Host "`nYou can run the following command to get started:"
    Write-Host "  llmrix-devtool --help" -ForegroundColor Cyan
    Write-Host "`nOfficial Documentation: https://www.llmrix.com/apps/llmrix-devtool"
} catch {
    Write-Host "`n❌ Installation failed." -ForegroundColor Red
    Write-Host "Please check your network connection. If you encounter permission errors, try running PowerShell as Administrator."
    exit 1
}
