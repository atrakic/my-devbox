/**
 * Sample TypeScript application demonstrating the development environment.
 */

function greet(name: string): string {
    return `Hello, ${name}! Welcome to the Devbox environment.`;
}

function main(): void {
    console.log(greet("Developer"));
    console.log("TypeScript is working correctly!");
    console.log(`Node.js version: ${process.version}`);
}

main();
