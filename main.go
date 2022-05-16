package main

import (
	"io/ioutil"
	"log"
)

func main() {
	data, _ := ioutil.ReadFile("version.txt")
	log.Printf("Hello from demo_app1: %s\n", string(data))
}
