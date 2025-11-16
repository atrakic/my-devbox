# My Development Box

[![CI/CD Pipeline](https://github.com/atrakic/my-devbox/actions/workflows/ci.yml/badge.svg)](https://github.com/atrakic/my-devbox/actions/workflows/ci.yml)


Automated development environment using [Jetify Devbox](https://www.jetify.com/devbox) for multi-language development.

## Overview

This repository provides a reproducible development environment with support for:
- **Python** 3.11
- **.NET SDK** 8.0
- **Go** 1.21
- **Node.js** 20 with TypeScript

## Prerequisites

Install Devbox:
```bash
curl -fsSL https://get.jetify.com/devbox | bash
```

## Quick Start

1. Clone this repository:
```bash
git clone https://github.com/atrakic/my-devbox.git
cd my-devbox
```

2. Start the Devbox shell:
```bash
devbox shell
```

3. Run the test script to verify all tools:
```bash
devbox run test
```

## Usage

### Enter Development Shell
```bash
devbox shell
```

Once in the shell, you have access to all development tools:
- `python` - Python 3.11
- `dotnet` - .NET SDK 8.0
- `go` - Go 1.21
- `node` / `npm` - Node.js 20
- `tsc` - TypeScript compiler

### Run Scripts

Run the test script:
```bash
devbox run test
```

Run the setup script:
```bash
devbox run setup
```

### Run Commands Directly
```bash
devbox run -- python --version
devbox run -- dotnet --version
devbox run -- go version
devbox run -- node --version
devbox run -- tsc --version
```

## CI/CD

This repository includes a GitHub Actions workflow that:
- Tests the Devbox environment setup
- Verifies all language runtimes
- Runs tests for each language (when available)

The workflow runs on:
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop` branches
- Manual workflow dispatch

## Project Structure

```
.
├── .github/
│   └── workflows/
│       └── ci.yml          # CI/CD pipeline
├── devbox.json             # Devbox configuration
├── .gitignore              # Git ignore patterns
└── README.md               # This file
```

## Development Workflow

1. Make changes to your code
2. Test locally using `devbox shell`
3. Commit and push changes
4. GitHub Actions will automatically run CI/CD pipeline

## Adding Dependencies

Edit `devbox.json` to add more packages:
```bash
devbox add <package-name>
```

Example:
```bash
devbox add postgresql
devbox add redis
```

## Customization

### Shell Scripts

You can add custom scripts in `devbox.json` under `shell.scripts`:
```json
{
  "shell": {
    "scripts": {
      "my-script": ["echo 'Hello World'"]
    }
  }
}
```

Run with:
```bash
devbox run my-script
```

### Init Hooks

Customize the shell initialization in `devbox.json` under `shell.init_hook`.

## Troubleshooting

### Clear Devbox cache
```bash
devbox cache clear
```

### Update packages
```bash
devbox update
```

### Get help
```bash
devbox help
```

## Resources

- [Devbox Documentation](https://www.jetify.com/devbox/docs/)
- [Devbox GitHub](https://github.com/jetify-com/devbox)
- [Nixpkgs Search](https://search.nixos.org/packages)

## License

This project is open source and available under the MIT License.
