#!/usr/bin/env bash

echo "========================================"
echo " IE3142 Phase 1 Environment Check"
echo "========================================"
echo

check_command() {
    if command -v "$1" >/dev/null 2>&1; then
        echo "[OK] $1 found"
    else
        echo "[MISSING] $1"
    fi
}

check_command git
check_command curl
check_command wget
check_command jq
check_command gcc
check_command make
check_command tree
check_command code

echo
echo "Git identity"
echo "------------"

GIT_NAME=$(git config --global user.name)
GIT_EMAIL=$(git config --global user.email)

if [ -n "$GIT_NAME" ]; then
    echo "[OK] Git name: $GIT_NAME"
else
    echo "[MISSING] Git user.name"
fi

if [ -n "$GIT_EMAIL" ]; then
    echo "[OK] Git email configured"
else
    echo "[MISSING] Git user.email"
fi

echo
echo "Required project files"
echo "----------------------"

FILES=(
    "README.md"
    ".gitignore"
    ".env.example"
    ".vscode/settings.json"
    "docs/project/PROJECT_SCOPE.md"
    "docs/project/ETHICAL_BOUNDARIES.md"
    "docs/project/TECH_STACK.md"
    "docs/project/DEVELOPMENT_RULES.md"
)

for file in "${FILES[@]}"; do

    if [ -f "$file" ]; then
        echo "[OK] $file"
    else
        echo "[MISSING] $file"
    fi

done

echo
echo "========================================"
echo " Phase 1 check finished"
echo "========================================"
