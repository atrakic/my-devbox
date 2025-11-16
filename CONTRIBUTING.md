# Contributing to My Devbox

Thank you for your interest in contributing! This document provides guidelines for contributing to this project.

## Development Setup

1. Install Devbox:
```bash
curl -fsSL https://get.jetify.com/devbox | bash
```

2. Clone the repository:
```bash
git clone https://github.com/atrakic/my-devbox.git
cd my-devbox
```

3. Start the development environment:
```bash
devbox shell
```

## Making Changes

### Adding New Languages/Tools

To add support for a new language or tool:

1. Edit `devbox.json` and add the package to the `packages` array:
```bash
devbox add <package-name>
```

2. Update the `init_hook` and `test` script in `devbox.json` to include the new tool.

3. Add example code in `examples/<language-name>/` directory.

4. Update the README.md with instructions for the new language.

5. Update `.github/workflows/ci.yml` to test the new tool.

### Adding Examples

1. Create a directory under `examples/` for your example.
2. Add sample code demonstrating the language/tool.
3. Update `examples/README.md` with usage instructions.

### Updating CI/CD

The GitHub Actions workflow is in `.github/workflows/ci.yml`. 

Key principles:
- Test all language runtimes in the `devbox-setup` job
- Add language-specific test jobs as needed
- Keep jobs focused and independent

## Testing Locally

Before submitting a PR, ensure:

1. All configurations are valid:
```bash
# Validate JSON files
python -m json.tool devbox.json > /dev/null
python -m json.tool examples/typescript/package.json > /dev/null

# Validate YAML files  
python -c "import yaml; yaml.safe_load(open('.github/workflows/ci.yml'))"
```

2. Test the devbox environment:
```bash
devbox shell
devbox run test
```

3. Test example code:
```bash
python examples/python/hello.py
go run examples/go/main.go
cd examples/typescript && tsc hello.ts && node hello.js
```

## Pull Request Process

1. Create a feature branch from `main`
2. Make your changes
3. Test locally using the steps above
4. Commit with clear, descriptive messages
5. Push to your fork
6. Open a Pull Request with:
   - Clear title describing the change
   - Description of what changed and why
   - Any testing performed

## Code Style

- **Python**: Follow PEP 8
- **Go**: Use `go fmt`
- **TypeScript**: Use standard TypeScript conventions
- **.NET**: Follow Microsoft's C# coding conventions
- **YAML/JSON**: Use 2-space indentation

## Questions?

Feel free to open an issue for:
- Bug reports
- Feature requests
- Questions about the project
- General discussions

## License

By contributing, you agree that your contributions will be licensed under the same license as the project (MIT License).
