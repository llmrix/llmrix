#!/bin/bash
# =============================================================================
# Llmrix Devtool One-liner Installer (macOS / Linux)
# =============================================================================

set -e

# Color definitions
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}>>> 🚀 Preparing to install Llmrix Devtool...${NC}"

# 1. Check Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Error: Node.js not found.${NC}"
    echo -e "${YELLOW}Llmrix Devtool requires Node.js environment to run.${NC}"
    echo "Please visit https://nodejs.org/ to download and install (LTS version recommended)."
    exit 1
fi

NODE_VER=$(node -v)
echo -e "${GREEN}✅ Found Node.js: $NODE_VER${NC}"

# 2. Check npm
if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ Error: npm not found.${NC}"
    echo "Please ensure your Node.js installation is complete."
    exit 1
fi

# 3. Execute installation
echo -e "${BLUE}>>> 📦 Installing llmrix-devtool globally via npm...${NC}"
echo -e "${YELLOW}(This may take a while. If it fails due to permissions, try running with sudo manually)${NC}"

if npm install -g llmrix-devtool; then
    echo -e "\n${GREEN}==================================================${NC}"
    echo -e "${GREEN}🎉 Llmrix Devtool installed successfully!${NC}"
    echo -e "${GREEN}==================================================${NC}"
    echo -e "\nYou can run the following command to get started:"
    echo -e "  ${BLUE}llmrix-devtool --help${NC}"
    echo -e "\nOfficial Documentation: https://www.llmrix.com/apps/llmrix-devtool"
else
    echo -e "\n${RED}❌ Installation failed.${NC}"
    echo -e "Please check your network connection or permissions."
    echo -e "You can try running manually: ${YELLOW}sudo npm install -g llmrix-devtool${NC}"
    exit 1
fi
