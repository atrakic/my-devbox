.PHONY: help shell test setup clean examples

help: ## Show this help message
	@echo "My Devbox - Available commands:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

shell: ## Start the Devbox shell
	devbox shell

test: ## Run environment tests
	devbox run test

setup: ## Set up the development environment
	devbox run setup

clean: ## Clean up build artifacts
	@echo "Cleaning up..."
	@find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	@find . -type f -name "*.pyc" -delete 2>/dev/null || true
	@find examples/typescript -name "*.js" -delete 2>/dev/null || true
	@find examples/go -type f -executable -delete 2>/dev/null || true
	@echo "✓ Clean complete"

examples: ## Run all example applications
	@echo "Running Python example..."
	@devbox run -- python examples/python/hello.py
	@echo ""
	@echo "Running Go example..."
	@devbox run -- go run examples/go/main.go
	@echo ""
	@echo "Running TypeScript example..."
	@devbox run -- node examples/typescript/hello.js

install-devbox: ## Install Devbox (if not already installed)
	@if ! command -v devbox &> /dev/null; then \
		echo "Installing Devbox..."; \
		curl -fsSL https://get.jetify.com/devbox | bash; \
	else \
		echo "Devbox is already installed"; \
	fi

.DEFAULT_GOAL := help
