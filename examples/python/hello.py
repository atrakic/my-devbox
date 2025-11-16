#!/usr/bin/env python3
"""
Sample Python application demonstrating the development environment.
"""

def greet(name: str) -> str:
    """Return a greeting message."""
    return f"Hello, {name}! Welcome to the Devbox environment."

def main():
    """Main entry point."""
    print(greet("Developer"))
    print(f"Python is working correctly!")

if __name__ == "__main__":
    main()
