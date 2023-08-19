import UIKit

var greeting = "Hello, playground"

let animal = "dog"
let number = 2

if animal == "dog" && animal == "cat"{
    print("Common pet")
} else {
    print ("What is it?!")
}

if animal == "cat" {
    print ("It's a cat")
} else if number == 2{
    print ("Number 2!")
} else {
    print ("It's not a dog")
}

if #available(iOS 16.6, *){
    // SOlo para ese iOS
} else {
    // Codigo para SO anteriores
}

if #unavailable(iOS 15.0){
    // para SO anteriores
}

// OPERADOR TERNARIO

number == 2 ? print("It's a 2!") : print("some other number")

var value = number == 2 ? "It's a 2!" : "some other number"
print(value)

var value2 = number == 2 ? number : 4
