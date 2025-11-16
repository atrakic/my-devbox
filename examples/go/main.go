package main

import (
	"fmt"
	"runtime"
)

func main() {
	fmt.Println("Hello from Go!")
	fmt.Println("Go is working correctly!")
	fmt.Printf("Go version: %s\n", runtime.Version())
}
