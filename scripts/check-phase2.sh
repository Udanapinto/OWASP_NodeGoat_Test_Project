#!/usr/bin/env bash

set -u

echo "========================================="
echo " IE3142 - Phase 2 Docker Verification"
echo "========================================="
echo

FAIL=0

check_command() {

    if command -v "$1" >/dev/null 2>&1; then
        echo "[OK] $1 installed"
    else
        echo "[FAIL] $1 missing"
        FAIL=1
    fi
}

check_command docker

echo
echo "Docker Engine"
echo "-------------"

if docker --version >/dev/null 2>&1; then
    docker --version
else
    echo "[FAIL] Docker CLI unavailable"
    FAIL=1
fi

echo
echo "Docker daemon"
echo "-------------"

if docker info >/dev/null 2>&1; then
    echo "[OK] Docker daemon accessible"
else
    echo "[FAIL] Docker daemon unavailable or permission denied"
    FAIL=1
fi

echo
echo "Docker Compose"
echo "--------------"

if docker compose version >/dev/null 2>&1; then
    docker compose version
else
    echo "[FAIL] Docker Compose plugin unavailable"
    FAIL=1
fi

echo
echo "Docker Buildx"
echo "-------------"

if docker buildx version >/dev/null 2>&1; then
    docker buildx version
else
    echo "[FAIL] Docker Buildx unavailable"
    FAIL=1
fi

echo
echo "Docker group"
echo "------------"

if id -nG "$USER" | grep -qw docker; then
    echo "[OK] $USER belongs to docker group"
else
    echo "[WARNING] $USER is not currently in docker group"
fi

echo
echo "Docker service"
echo "--------------"

if systemctl is-active --quiet docker; then
    echo "[OK] Docker service active"
else
    echo "[FAIL] Docker service inactive"
    FAIL=1
fi

echo
echo "========================================="

if [ "$FAIL" -eq 0 ]; then
    echo "PHASE 2 CHECK: PASSED"
else
    echo "PHASE 2 CHECK: FAILED"
fi

echo "========================================="

exit "$FAIL"
