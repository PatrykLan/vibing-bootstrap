#!/usr/bin/env bash
set -euo pipefail

GITHUB_USERNAME="${GITHUB_USERNAME:-PatrykLan}"
SETUP_REPO="setup"
SETUP_DIR="$HOME/Coding/setup"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo -e "${CYAN}╔═══════════════════════════════════════╗${NC}"
echo -e "${CYAN}║     Vibing Setup Bootstrap            ║${NC}"
echo -e "${CYAN}╚═══════════════════════════════════════╝${NC}"
echo ""

if [ "$GITHUB_USERNAME" = "YOUR_USERNAME" ]; then
    echo -e "${RED}Error: Update GITHUB_USERNAME in this script${NC}"
    exit 1
fi

section() {
    echo ""
    echo -e "${YELLOW}▶ $1${NC}"
}

section "1. Installing prerequisites"

sudo apt update
sudo apt install -y git curl wget

if ! command -v gh &> /dev/null; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install -y gh
fi

echo -e "${GREEN}✓${NC} Git and GitHub CLI installed"

section "2. GitHub Authentication"

if ! gh auth status &> /dev/null; then
    echo "Please authenticate with GitHub:"
    echo ""
    gh auth login
else
    echo -e "${GREEN}✓${NC} Already authenticated with GitHub"
fi

section "3. Cloning setup repo"

mkdir -p "$(dirname "$SETUP_DIR")"

if [ -d "$SETUP_DIR" ]; then
    echo "Setup directory exists, pulling latest..."
    cd "$SETUP_DIR"
    git pull
else
    gh repo clone "$GITHUB_USERNAME/$SETUP_REPO" "$SETUP_DIR"
fi

echo -e "${GREEN}✓${NC} Setup repo cloned to $SETUP_DIR"

section "4. Running full setup"

cd "$SETUP_DIR"
./scripts/setup-all.sh

section "5. Post-install authentication"

echo ""
echo -e "${YELLOW}═══════════════════════════════════════${NC}"
echo -e "${YELLOW}  Setup complete! Now authenticate:${NC}"
echo -e "${YELLOW}═══════════════════════════════════════${NC}"
echo ""
echo "1. Log out and back in (for docker + zsh)"
echo ""
echo "2. Then run these commands:"
echo ""
echo -e "   ${CYAN}source ~/.zshrc${NC}"
echo -e "   ${CYAN}opencode auth login${NC}"
echo -e "   ${CYAN}cpa-login-antigravity-batch 4${NC}"
echo -e "   ${CYAN}sudo zerotier-cli join YOUR_NETWORK_ID${NC}"
echo -e "   ${CYAN}cpa-up${NC}"
echo ""
echo "3. Start coding:"
echo -e "   ${CYAN}opencode${NC}"
echo ""
