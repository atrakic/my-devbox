# Example Projects

This directory contains sample applications for each supported language in the Devbox environment.

## Python Example

Run the Python example:
```bash
devbox run -- python examples/python/hello.py
```

Install dependencies:
```bash
devbox run -- pip install -r examples/python/requirements.txt
```

## .NET Example

Run the .NET example:
```bash
cd examples/dotnet
devbox run -- dotnet run
```

Or compile and run:
```bash
cd examples/dotnet
devbox run -- csc Program.cs
devbox run -- mono Program.exe
```

## Go Example

Run the Go example:
```bash
cd examples/go
devbox run -- go run main.go
```

Build the binary:
```bash
cd examples/go
devbox run -- go build -o hello main.go
devbox run -- ./hello
```

## TypeScript Example

Run the TypeScript example:
```bash
cd examples/typescript
devbox run -- tsc hello.ts
devbox run -- node hello.js
```

Or use the package.json scripts:
```bash
cd examples/typescript
devbox run -- npm run build
devbox run -- npm start
```

## Testing the Examples

You can test all examples at once:
```bash
echo "Testing Python..."
devbox run -- python examples/python/hello.py

echo -e "\nTesting Go..."
devbox run -- go run examples/go/main.go

echo -e "\nTesting TypeScript..."
cd examples/typescript && devbox run -- tsc hello.ts && devbox run -- node hello.js
```
