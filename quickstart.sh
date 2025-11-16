#!/usr/bin/env bash
#
# Quick start script for My Devbox
# This script helps you get started with the development environment

set -e

echo "==================================="
echo "My Devbox - Quick Start"
echo "==================================="
echo ""

# Check if devbox is installed
if ! command -v devbox &> /dev/null; then
    echo "❌ Devbox is not installed."
    echo ""
    echo "Installing Devbox..."
    curl -fsSL https://get.jetify.com/devbox | bash
    echo ""
    echo "✅ Devbox installed successfully!"
    echo ""
    echo "Please restart your shell or run: source ~/.bashrc"
    echo "Then run this script again: ./quickstart.sh"
    exit 0
fi

echo "✅ Devbox is installed"
echo ""

# Initialize devbox if not already initialized
if [ ! -d ".devbox" ]; then
    echo "Initializing Devbox environment..."
    devbox shell --init-hook
fi

echo "Running environment tests..."
echo ""

# Run the test script
devbox run test

echo ""
echo "==================================="
echo "🎉 Environment is ready!"
echo "==================================="
echo ""
echo "Next steps:"
echo "  1. Start the devbox shell: devbox shell"
echo "  2. Try the examples:"
echo "     - Python:     python examples/python/hello.py"
echo "     - Go:         go run examples/go/main.go"
echo "     - TypeScript: cd examples/typescript && tsc hello.ts && node hello.js"
echo ""
echo "  3. Read the documentation: cat README.md"
echo ""
echo "Happy coding! 🚀"
